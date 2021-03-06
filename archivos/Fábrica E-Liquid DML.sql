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
CREATE TRIGGER maceracion
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
