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

/*###########################################
    Inserción de datos
  ###########################################*/

INSERT INTO `recipiente` (`volumen`, `tipo`) 
VALUES ('5mL', 'chubby'), 
('10mL', 'chubby'), 
('50mL', 'chubby'), 
('100mL', 'chubby'), 
('5mL', 'cristal'),  
('10mL', 'cristal'), 
('50mL', 'cristal'), 
('100mL', 'cristal');

INSERT INTO `base` (`codBase`, `proporcion`) 
VALUES ('0001', '00%VG'), 
('0002', '00%VG'), 
('0003', '30%VG'), 
('0004', '30%VG'), 
('0005', '50%VG'), 
('0006', '50%VG'), 
('0007', '80%VG'), 
('0008', '80%VG'), 
('0009', '100%VG'), 
('0010', '100%VG'),
('0011', '00%VG'), 
('0012', '30%VG'), 
('0013', '50%VG'), 
('0014', '80%VG'), 
('0015', '100%VG');

INSERT INTO `moleculas` (`molecula`, `codBase`) 
VALUES ('frescor', '0001'), 
('golpe de garganta', '0002'), 
('frescor', '0003'), 
('golpe de garganta', '0004'), 
('frescor', '0005'), 
('golpe de garganta', '0006'), 
('frescor', '0007'), 
('golpe de garganta', '0008'), 
('frescor', '0009'), 
('golpe de garganta', '0010'), 
('frescor', '0011'), 
('golpe de garganta', '0011'), 
('frescor', '0012'), 
('golpe de garganta', '0012'), 
('frescor', '0013'), 
('golpe de garganta', '0013'), 
('frescor', '0014'), 
('golpe de garganta', '0014'), 
('frescor', '0015'), 
('golpe de garganta', '0015');

INSERT INTO `aroma` (`codAroma`, `aroma`, `categoria`) 
VALUES ('0001', 'manzana', 'frutal'), 
('0002', 'melón', 'frutal'), 
('0003', 'coco', 'frutal'), 
('0004', 'mango', 'frutal'), 
('0005', 'kiwi', 'frutal'), 
('0006', 'nata', 'postre'), 
('0007', 'galleta', 'postre'), 
('0008', 'vainilla', 'postre'), 
('0009', 'tabaco rubio', 'tabaquil'), 
('0010', 'ron', 'artificial'), 
('0011', 'cacao', 'postre'), 
('0012', 'leche', 'postre'), 
('0013', 'chocolate', 'postre'), 
('0014', 'reserva', 'artificial'), 
('0015', 'tutti frutti', 'frutal'), 
('0016', 'oreo', 'postre');

INSERT INTO `mezclaaromas` (`aroma`, `aromaCompuesto`) 
VALUES ('0013', '0016'), 
('0006', '0016'), 
('0007', '0016'), 
('0009', '0014'), 
('0003', '0014'), 
('0008', '0014'), 
('0013', '0014'), 
('0011', '0013'), 
('0012', '0013'), 
('0001', '0015'), 
('0002', '0015'), 
('0004', '0015'), 
('0005', '0015'), 
('0010', '0014');

INSERT INTO `liquidobasico` (`nombreLiquido`, `codBase`, `codAroma`) 
VALUES ('Don Juan Reserva', '0008', '0014'), 
('Fruit Garden', '0005', '0015'), 
('Cookies & Crème', '0004', '0016'), 
('Apple Punch', '0014', '0001');

INSERT INTO `maceracion` (`nombreLiquido`, `concentracionNicotina`, `tmacerado`) 
VALUES ('Apple Punch', '0,3mg/mL', '6'), 
('Apple Punch', '0,6mg/mL', '8'), 
('Apple Punch', '1.2mg/mL', '10'), 
('Cookies & Crème', '0,3mg/mL', '16'), 
('Cookies & Crème', '0,6mg/mL', '18'), 
('Cookies & Crème', '1.2mg/mL', '20'), 
('Don Juan Reserva', '0,3mg/mL', '15'), 
('Don Juan Reserva', '0,6mg/mL', '20'), 
('Don Juan Reserva', '1.2mg/mL', '28'), 
('Fruit Garden', '0,3mg/mL', '10'), 
('Fruit Garden', '0,6mg/mL', '12'), 
('Fruit Garden', '1.2mg/mL', '15');

INSERT INTO `liquidofinal` (`codLiquido`, `nombreLiquido`, `concentracionNicotina`) 
VALUES ('0001', 'Apple Punch', '0,3mg/mL'), 
('0002', 'Apple Punch', '0,6mg/mL'), 
('0003', 'Apple Punch', '1.2mg/mL'), 
('0004', 'Cookies & Crème', '0,3mg/mL'), 
('0005', 'Cookies & Crème', '0,6mg/mL'), 
('0006', 'Cookies & Crème', '1.2mg/mL'), 
('0007', 'Don Juan Reserva', '0,3mg/mL'), 
('0008', 'Don Juan Reserva', '0,6mg/mL'), 
('0009', 'Don Juan Reserva', '1.2mg/mL'), 
('0010', 'Fruit Garden', '0,3mg/mL'), 
('0011', 'Fruit Garden', '0,6mg/mL'), 
('0012', 'Fruit Garden', '1.2mg/mL');

INSERT INTO `colores` (`color`, `codLiquido`, `codRecipiente`) 
VALUES ('00,30,81,11', '0009', '0001'), 
('00,30,81,11', '0008', '0001'), 
('00,30,81,11', '0007', '0001'), 
('00,30,81,11', '0001', '0001'), 
('00,30,81,11', '0002', '0001'), 
('00,30,81,11', '0003', '0001');

/*###########################################
    Actualización de datos
  ###########################################*/
/*-- El liquido Apple Punch ahora utilizá la base 0015 --*/
UPDATE liquidoBasico
SET codBase = '0015'
WHERE nombreLiquido = 'Apple Punch';

/*-- El aroma ron pasa a llamarse whisky según nuestro proveedor, así que replicamos el cambio para consistencia --*/
UPDATE aroma
SET aroma = 'whisky'
WHERE aroma = 'ron';

/*###########################################
    Eliminación de datos
  ###########################################*/
/*-- Eliminamos todos los valores de la columna categoría en aromas al cambiar de proveedor (reañadimos los datos para que las consultas funcionen) --*/

/*-- Un líquido ("Fruit Garden") no cumple las expectativas comerciales y va a dejar de fabricarse, borrariamos su registro de las tablas donde aparezca --*/

/*###########################################
    Construcción de triggers de inserción
  ###########################################*/
/*-- Al añadir un nuevo volumen de recipiente, crear una variante en cristal, en esta fábrica todos los líquidos tienen su versión en envasado más premium, de este modo aceleramos la insersión de datos, para esto antes necesitamos modificar la columna volumen ya que tiene restricción ENUM --*/

CREATE TRIGGER recipienteAI 
AFTER INSERT 
ON recipiente FOR EACH ROW
  INSERT INTO recipiente (volumen, tipo)
  VALUES (NEW.volumen, 'cristal');

/*-- Si el tiempo de macerado en un líquido que se elabore con un aroma de categoría postre es inferior a 15 días, este se establecerá con un valor de 15, puesto que este tipo de aromas necesita mucho más tiempo de maceración como norma --*/
delimiter ::
CREATE TRIGGER maceracionBI
BEFORE INSERT
ON maceracion FOR EACH ROW
BEGIN
  IF (SELECT nombreLiquido FROM maceracion) IN (
    SELECT liquidoBasico.nombreLiquido FROM liquidoBasico
    JOIN aroma ON liquidoBasico.codAroma = aroma.codAroma
    WHERE aroma.categoria = 'postre'
  )
  AND NEW.tmacerado < 15 THEN
  set NEW.tmacerado = 15;
  END IF;
END::
delimiter ;


/*###########################################
    Construcción de triggers de actualización
  ###########################################*/
/*-- Para hacer un seguimiento en las pruebas del macerado de los líquidos crearemos un disparador que se ocupe de guardar los tiempos de macerado que hayan sido probados y la fecha en la que se alteró el valor del tiempo de macerado, para ello, además del trigger creamos la tabla de respaldo en la que guardaremos los datos antiguos --*/
CREATE TABLE testmacerado (
  nombreLiquido VARCHAR(20),
  concentracionNicotina ENUM('0,3mg/mL', '0,6mg/mL', '1.2mg/mL'),
  anteriorTmacerado TINYINT,
  nuevoTmacerado TINYINT,
  modificado DATE
);

CREATE TRIGGER testmaceradoBU 
BEFORE UPDATE 
ON maceracion FOR EACH ROW
  INSERT INTO testmacerado (concentracionNicotina, nombreLiquido, anteriorTmacerado, nuevoTmacerado, modificado)
  VALUES (OLD.concentracionNicotina, OLD.nombreLiquido, OLD.tmacerado, NEW.tmacerado, NOW());

/*-- El mismo caso del trigger al insertar el tiempo de macerado para líquidos con aromas tipo postre pero previniendo la actualización de datos --*/
delimiter ::
CREATE TRIGGER maceracionBU
BEFORE UPDATE
ON maceracion FOR EACH ROW
BEGIN
  IF (SELECT nombreLiquido FROM maceracion) IN (
    SELECT liquidoBasico.nombreLiquido FROM liquidoBasico
    JOIN aroma ON liquidoBasico.codAroma = aroma.codAroma
    WHERE aroma.categoria = 'postre'
  )
  AND NEW.tmacerado < 15 THEN
  set NEW.tmacerado = 15;
  END IF;
END::
delimiter ;

/*###########################################
    Construcción de vistas
  ###########################################*/
/*-- Vista para definición de los líquidos de forma comercial, mostrando el nombre del liquido, el nombre del aroma y la proporcion de base con la que se elavoran cada uno. Esta vista sería util a la hora de elaborar documentación para catálogos o para pasar información de los productos a las tiendas clientes ahorrandonos los datos técnicos de nuestra BBDD --*/
CREATE VIEW liquidoscomercial AS SELECT liquidoBasico.nombreLiquido, aroma.aroma, base.proporcion FROM liquidoBasico
JOIN aroma ON liquidoBasico.codAroma = aroma.codAroma
JOIN base on liquidoBasico.codBase = base.codBase;

/*-- Vista unicamente de los códigos de base, su código y molecula; esta información es la única relevante para el etiquetado en los laboratorios donde se preparan las bases, ya que no necesitan información comercial, con esta vista tienen un acceso rápido y sencillo --*/
CREATE VIEW baseslaboratorio AS SELECT base.codBase, base.proporcion, moleculas.molecula FROM base
JOIN moleculas ON base.codBase = moleculas.codBase;


/* seleccionamos la base de datos*/
USE fabricaeliquidExportada;

/*###########################################
    Consulta simple sobre una tabla
    --------------------------------------
    Cuales son los códigos de los líquidos que emplean el color 00,30,81,11
  ###########################################*/
SELECT codLiquido 'Código de Líquido' FROM colores
WHERE color LIKE '00,30,81,11';

/*###########################################
  Consulta sobre dos tablas creada sin join
  --------------------------------------
  Códigos de los líquidos que tienen un tiempo de macerado mayor a 3 semanas, ordenados de mayor tiempo a menor, mostrando este también
###########################################*/
SELECT liquidoFinal.codLiquido 'Código de líquido', CONCAT(maceracion.tmacerado, ' ', 'días') 'Tiempo de macerado' FROM liquidoFinal, maceracion
WHERE liquidoFinal.nombreLiquido = maceracion.nombreLiquido
AND maceracion.tmacerado > '21'
ORDER BY maceracion.tmacerado;

/*###########################################
  Consulta sobre dos tablas creada con join
  --------------------------------------
  Proporción en la base con la que se elabora el líquido Don Juan Reserva
  ###########################################*/
SELECT base.proporcion 'Proporción de Base' FROM base
JOIN liquidoBasico ON base.codBase = liquidoBasico.codBase
WHERE liquidoBasico.nombreLiquido = 'Don Juan Reserva';

/*###########################################
  Consulta de más de dos tablas creada con join
  --------------------------------------
  Nombres de líquidos y códigos que utilicen aromas de la categoria frutal
  ###########################################*/
SELECT DISTINCT liquidoFinal.nombreLiquido 'Nombre de líquido', liquidoFinal.codLiquido 'Código' FROM liquidoFinal
JOIN liquidoBasico ON liquidoFinal.nombreLiquido = liquidoBasico.nombreLiquido
JOIN aroma on liquidoBasico.codAroma = aroma.codAroma
WHERE aroma.categoria = 'frutal';

/*###########################################
  Consulta con cálculos sobre agrupación de filas
  --------------------------------------
  Media de dias, redondeados a números enteros, de maceración según la concentracion de nicotina en los líquidos
  ###########################################*/
SELECT concentracionNicotina 'Concentración de nicotina', CONCAT(ROUND(AVG(tmacerado), 0), ' ', 'días') 'Días de maceración' FROM maceracion
GROUP BY concentracionNicotina;

/*###########################################
  Consulta con subconsultas
  --------------------------------------
  Enumera los códigos de base las cuales poseen tanto la molécula de 'frescor' como la de 'golpe de garganta'
  ###########################################*/
SELECT DISTINCT codBase 'Código de Base' FROM moleculas
WHERE codBase IN
    (SELECT codBase FROM moleculas
    WHERE molecula = 'frescor')
AND codBase IN 
    (SELECT codBase FROM moleculas
    WHERE molecula = 'golpe de garganta');