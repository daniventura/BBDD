INSERT INTO `recipiente` (`codRecipiente`, `volumen`, `tipo`) 
VALUES 
('0001', '5mL', 'chubby'), 
('0002', '10mL', 'chubby'), 
('0003', '50mL', 'chubby'), 
('0004', '100mL', 'chubby'), 
('0005', '5mL', 'cristal'),  
('0006', '10mL', 'cristal'), 
('0007', '50mL', 'cristal'), 
('0008', '100mL', 'cristal');

INSERT INTO `base` (`codBase`, `proporcion`) 
VALUES
('0001', '00%VG'), 
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