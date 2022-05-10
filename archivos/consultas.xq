(:CONSULTAS XML:)
(: Muestra la tabla liquidobasico para el nombre de liquido "Don Juan Reserva" con etiquetas :)
for $liquido in //liquidobasico[nombreLiquido='Don Juan Reserva']
return $liquido/node(),

(: Muestra la tabla liquidobasico sin etiquetas :)
for $liquido in //liquidobasico
return $liquido/node()/text(),

(: lista las categorias de aromas sin valores repetidos :)
for $categoria in distinct-values(//aroma/categoria)
return $categoria,

(: Según cada concentración de nicotina, muestra la media de dias de maceracion de los liquidos :)
for $maceracion in //maceracion
for $tmacerado in $maceracion/tmacerado
group by $nicotina := $maceracion/concentracionNicotina
return "para " || $nicotina || ", media de " || avg($tmacerado) || " días",

(: Nombres y códigos de aromas ordenados alfabeticamente:)
for $aroma in //aroma[categoria='frutal']
order by $aroma/aroma
return $aroma/aroma || " " || $aroma/codAroma,

(: Nombres y códigos de líquidos que utilicen aromas de la categoria frutal :)
let $aroma := //aroma[categoria='frutal']/codAroma
for $liquido in //liquidobasico[codAroma=$aroma]/nombreLiquido
for $liquidofinal in //liquidofinal[nombreLiquido=$liquido]
return $liquidofinal/nombreLiquido || " " || $liquidofinal/codLiquido,

(: Lista en forma de tabla html los aromas y las categoria a la que pertenecen, además de indicar el total de ellos :)
<html>
<table border="1" cellspacing="0">
  <tr>
    <th>Código aroma</th>
    <th>Aroma</th>
    <th>Categoría</th>
  </tr>
  {
  for $aroma in /database/aroma 
  
  return <tr>
    <td>{$aroma/aroma/text()} </td>
    <td>{$aroma/categoria/text()} </td>
  </tr>
  }
  {
  let $total := count (/database/aroma)
  return <tr>
    <td colspan="2">TOTAL</td>
    <td >{$total}</td>
  </tr>
  }
</table>
</html>
  
  
  