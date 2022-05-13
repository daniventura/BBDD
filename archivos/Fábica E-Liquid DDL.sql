DROP DATABASE IF EXISTS fabricaEliquid;
/*###########################################
    Crear y seleccionar base de datos
  ###########################################*/
CREATE DATABASE fabricaELiquid;
USE fabricaELiquid;

/*###########################################
    Crear tablas
  ###########################################*/
CREATE TABLE liquidoBasico (
  nombreLiquido VARCHAR(20) PRIMARY KEY,
  codBase VARCHAR(4) NOT NULL,
  codAroma VARCHAR(4)  NOT NULL
);
CREATE TABLE maceracion (
  nombreLiquido VARCHAR(20) ,
  concentracionNicotina ENUM('0,3mg/mL', '0,6mg/mL', '1.2mg/mL') NOT NULL,
  tmacerado TINYINT NOT NULL,
  CONSTRAINT Pkmaceracion PRIMARY KEY (nombreLiquido,concentracionNicotina),
  CONSTRAINT Cktmaceracion CHECK (5<=tmacerado<=30)
);
CREATE TABLE liquidoFinal (
  codLiquido VARCHAR(4) PRIMARY KEY,
  nombreLiquido VARCHAR(20) NOT NULL,
  concentracionNicotina ENUM('0,3mg/mL', '0,6mg/mL', '1.2mg/mL') NOT NULL,
  CONSTRAINT UkliquidoFinal UNIQUE KEY (nombreLiquido,concentracionNicotina)
);
CREATE TABLE aroma (
  codAroma VARCHAR(4) PRIMARY KEY,
  aroma VARCHAR(20) NOT NULL UNIQUE KEY,
  categoria ENUM('frutal', 'postre', 'tabaquil', 'artificial')
);
CREATE TABLE base (
  codBase VARCHAR(4) PRIMARY KEY,
  proporcion VARCHAR(6) NOT NULL,
  CONSTRAINT Ckproporcion CHECK (proporcion REGEXP '(100|[0-9]{2})%VG')
);
CREATE TABLE moleculas (
  molecula ENUM('frescor', 'golpe de garganta'),
  codBase VARCHAR(4),
  CONSTRAINT Pkmoleculas PRIMARY KEY (molecula,codBase)
);
CREATE TABLE mezclaAromas (
  aroma VARCHAR(4),
  aromaCompuesto VARCHAR(4),
  CONSTRAINT PkmezclaAromas PRIMARY KEY (aroma,aromaCompuesto)
);
CREATE TABLE recipiente (
  codRecipiente TINYINT AUTO_INCREMENT,
  volumen ENUM('5mL', '10mL', '50mL', '100mL') NOT NULL,
  tipo ENUM('chubby', 'cristal') DEFAULT 'chubby',
  CONSTRAINT Ukrecipiente UNIQUE KEY (volumen,tipo),
  CONSTRAINT Pkrecipiente PRIMARY KEY (codRecipiente)
);
CREATE TABLE envasado (
  codLiquido VARCHAR(4),
  codRecipiente TINYINT,
  diseño BINARY NOT NULL,
  CONSTRAINT Pkenvasado PRIMARY KEY (codLiquido,codRecipiente)
);
CREATE TABLE colores (
  color VARCHAR(15),
  codLiquido VARCHAR(4),
  codRecipiente TINYINT,
  CONSTRAINT Pkcolores PRIMARY KEY (color,codLiquido,codRecipiente),
  CONSTRAINT Ckcolor CHECK (color REGEXP '((100)|([0-9]{2})),((100)|([0-9]{2})),((100)|([0-9]{2})),((100)|([0-9]{2}))')
);

/*###########################################
    Crear relaciones de tablas // Claves foráneas
  ###########################################*/
ALTER TABLE moleculas ADD CONSTRAINT FkbaseMoleculas FOREIGN KEY (codBase) REFERENCES base(codBase);
ALTER TABLE liquidoBasico ADD CONSTRAINT FkbaseLiquidoBasico FOREIGN KEY (codBase) REFERENCES base(codBase);
ALTER TABLE liquidoBasico ADD CONSTRAINT FkaromaLiquidoBasico FOREIGN KEY (codAroma) REFERENCES aroma(codAroma);
ALTER TABLE mezclaAromas ADD CONSTRAINT Fkmezclaaroma1 FOREIGN KEY (aroma) REFERENCES aroma(codAroma);
ALTER TABLE mezclaAromas ADD CONSTRAINT Fkmezclaaroma2 FOREIGN KEY (aromaCompuesto) REFERENCES aroma(codAroma);
ALTER TABLE liquidoFinal ADD CONSTRAINT FknliquidoLiquidoFinal FOREIGN KEY (nombreLiquido) REFERENCES liquidoBasico(nombreLiquido);
ALTER TABLE maceracion ADD CONSTRAINT FknliquidoMaceracion FOREIGN KEY (nombreLiquido) REFERENCES liquidoBasico(nombreLiquido);
CREATE INDEX IndexconcentracionNicotina ON maceracion(concentracionNicotina);
ALTER TABLE liquidoFinal ADD CONSTRAINT FknicotinaLiquidoFin FOREIGN KEY (concentracionNicotina) REFERENCES maceracion(concentracionNicotina);
ALTER TABLE envasado ADD CONSTRAINT FkrecipienteEnvasado FOREIGN KEY (codRecipiente) REFERENCES recipiente(codRecipiente);
ALTER TABLE colores ADD CONSTRAINT FkrecipienteColores FOREIGN KEY (codRecipiente) REFERENCES recipiente(codRecipiente);
ALTER TABLE envasado ADD CONSTRAINT FkliquidoEnvasado FOREIGN KEY (codLiquido) REFERENCES liquidoFinal(codLiquido);
ALTER TABLE colores ADD CONSTRAINT FkliquidoColores FOREIGN KEY (codLiquido) REFERENCES liquidoFinal(codLiquido);