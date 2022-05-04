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
    Nombres de líquidos que utilicen aromas de la categoria frutal
  ###########################################*/
SELECT DISTINCT liquidoFinal.nombreLiquido 'Nombre de líquido' FROM liquidoFinal
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