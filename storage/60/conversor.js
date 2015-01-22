var unidades={
  Milimetro:{Centimetro:0.10000,Metro:0.0010,Pie:0.0033,Yarda:0.0011,Pulgada:0.0394},
  Centimetro:{Milimetro:10.000,Metro:0.0100,Pie:0.0328,Yarda:0.0109,Pulgada:0.3937},
  Metro:{Milimetro:1000,Pie:3.2808,Yarda:1.0936,Pulgada:39.3701,Centimetro:100.0000},
  Pulgada:{Milimetro:25.4000,Pie:0.0833,Yarda:0.0278,Metro:0.0254,Centimetro:2.5400},
  Pie:{Milimetro:304.8000,Pulgada:12.0000,Yarda:0.3333,Metro:0.3048,Centimetro:30.4800},
  Yarda:{Milimetro:914.4000,Pulgada:36.0000,Pie:3.0000,Metro:0.9144,Centimetro:91.4400}
  
}  





function conversor () {

  var x=document.getElementById('valor').value;
  var primero= document.getElementById('primero').value;
  var segundo= document.getElementById('segundo').value;

  if( primero==segundo || x==""){ document.getElementById('resultado').innerHTML="Selecciona a que quieres Convertir";} else {
   var resultado = unidades[primero][segundo] * x ;
   
   document.getElementById('resultado').innerHTML=resultado;}
 }
