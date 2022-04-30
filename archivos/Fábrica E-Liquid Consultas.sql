/*###########################################
    Consulta simple sobre una tabla
    --------------------------------------
    Cuales son los códigos de los líquidos que emplean el color (0,30,81,11)
  ###########################################*/
SELECT codLiquido 'Código de Líquido' FROM colores
WHERE color LIKE '0,30,81,11';

  /*###########################################
    Consulta sobre dos tablas creada sin join
    --------------------------------------
    Nombres y codigos de los líquidos que tienen un tiempo de macerado mayor a 1 semana
  ###########################################*/
SELECT liquidoFinal.nombreLiquido 'Nombre de Líquido', liquidoFinal.codLiquido 'Código' FROM liquidoFinal, maceracion
WHERE liquidoFinal.nombreLiquido = maceracion.nombreLiquido
AND maceracion.tmacerado > '14';

  /*###########################################
    Consulta sobre dos tablas creada con join
    --------------------------------------
    Distintas proporciones en la base en las que se elabora el líquido Don Juan Reserva
  ###########################################*/


  /*###########################################
    Consulta de más de dos tablas creada con join
    --------------------------------------
    Codigos de líquidos que utilicen aromas de la categoria frutal
  ###########################################*/


  /*###########################################
    Consulta con cálculos sobre agrupación de filas
    --------------------------------------
    Media de dias de maceracion según la concentracion de nicotina en los líquidos
  ###########################################*/


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