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
AND maceracion.tmacerado > '7';

  /*###########################################
    Consulta sobre dos tablas creada con join
    --------------------------------------
    Distintas proporciones en la base en las que se las que se proporciona cada líquido
  ###########################################*/


  /*###########################################
    Consulta de más de dos tablas creada con join
    --------------------------------------
    
  ###########################################*/


  /*###########################################
    Consulta con cálculos sobre agrupación de filas
    --------------------------------------
    
  ###########################################*/


  /*###########################################
    Consulta con subconsultas
    --------------------------------------
    
  ###########################################*/