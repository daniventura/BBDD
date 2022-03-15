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
  concentracionNicotina CHAR(8) NOT NULL,
  tmacerado TINYINT NOT NULL,
  CONSTRAINT Pkmaceracion PRIMARY KEY (nombreLiquido,concentracionNicotina),
  CONSTRAINT CkconcentracionNicotina CHECK (concentracionNicotina='0,3mg/mL' OR concentracionNicotina='0,6mg/mL' OR concentracionNicotina='1,2mg/mL'),
  CONSTRAINT Cktmaceracion CHECK (5<=tmacerado<=30)
);
CREATE TABLE liquidoFinal (
  codLiquido VARCHAR(4) PRIMARY KEY,
  nombreLiquido VARCHAR(20) NOT NULL,
  concentracionNicotina CHAR(8) NOT NULL,
  CONSTRAINT UkliquidoFinal UNIQUE KEY (nombreLiquido,concentracionNicotina),
  CONSTRAINT CkconcentracionNicotina CHECK (concentracionNicotina='0,3mg/mL' OR concentracionNicotina='0,6mg/mL' OR concentracionNicotina='1,2mg/mL')
);
CREATE TABLE aroma (
  codAroma VARCHAR(4) PRIMARY KEY,
  aroma VARCHAR(20) NOT NULL UNIQUE KEY,
  categoria VARCHAR(10),
  CONSTRAINT Ckcategoria CHECK (categoria='frutal' OR categoria='postre' OR categoria='tabaquil' OR categoria='artificial')
);
CREATE TABLE base (
  codBase VARCHAR(4) PRIMARY KEY,
  proporcion VARCHAR(6) NOT NULL,
  CONSTRAINT Ckproporcion CHECK (proporcion REGEXP '(100|[0-9]{2})%VG')
);
CREATE TABLE moleculas (
  molecula VARCHAR(17),
  codBase VARCHAR(4),
  CONSTRAINT Pkmoleculas PRIMARY KEY (molecula,codBase),
  CONSTRAINT Ckmolecula CHECK (molecula='frescor' OR molecula='golpe de garganta')
);
CREATE TABLE mezclaAromas (
  aroma VARCHAR(4),
  aromaCompuesto VARCHAR(4),
  CONSTRAINT PkmezclaAromas PRIMARY KEY (aroma,aromaCompuesto)
);
CREATE TABLE recipiente (
  codRecipiente VARCHAR(4) PRIMARY KEY,
  volumen VARCHAR(5) NOT NULL,
  tipo VARCHAR(7) NOT NULL DEFAULT 'chubby',
  CONSTRAINT Ukrecipiente UNIQUE KEY (volumen,tipo),
  CONSTRAINT Ckvolumen CHECK (volumen='5mL' OR volumen='10mL' OR volumen='50nL' OR volumen='100mL'),
  CONSTRAINT Cktipo CHECK (tipo='chubby' OR tipo='cristal')
);
CREATE TABLE envasado (
  codLiquido VARCHAR(4),
  codRecipiente VARCHAR(4),
  diseño BINARY NOT NULL,
  CONSTRAINT Pkenvasado PRIMARY KEY (codLiquido,codRecipiente)
);
CREATE TABLE colores (
  color VARCHAR(15),
  codLiquido VARCHAR(4),
  codRecipiente VARCHAR(4),
  CONSTRAINT Pkcolores PRIMARY KEY (color,codLiquido,codRecipiente),
  CONSTRAINT Ckcolor CHECK (color REGEXP '((100)|([0-9]{2}),)((100)|([0-9]{2}),)((100)|([0-9]{2}),)((100)|([0-9]{2}))')
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