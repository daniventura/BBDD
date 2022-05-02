/*###########################################
    Inserción de datos
  ###########################################*/

INSERT INTO `recipiente` (`codRecipiente`, `volumen`, `tipo`) 
VALUES ('0001', '5mL', 'chubby'), 
('0002', '10mL', 'chubby'), 
('0003', '50mL', 'chubby'), 
('0004', '100mL', 'chubby'), 
('0005', '5mL', 'cristal'),  
('0006', '10mL', 'cristal'), 
('0007', '50mL', 'cristal'), 
('0008', '100mL', 'cristal');

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
/*--  --*/


/*--  --*/


/*###########################################
    Eliminación de datos
  ###########################################*/
/*--  --*/


/*--  --*/


/*###########################################
    Construcción de triggers de inserción
  ###########################################*/
/*--  --*/


/*--  --*/


/*###########################################
    Construcción de triggers de actualización
  ###########################################*/
/*--  --*/


/*--  --*/


/*###########################################
    Construcción de vistas
  ###########################################*/
/*--  --*/


/*--  --*/

