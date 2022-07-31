"use strict"

/* let nombre = "David";
let edad = 29;

if(edad < 12){

    console.log("A " + nombre + " le corresponde el descuento infantil (menores de 12).")

} else if(edad < 30){

    console.log("A " + nombre + " le corresponde el descuento juvenil (menores de 30).")

} else if(edad > 60){

    console.log("A " + nombre + " le corresponde el descuento de jubilados (mayores de 60).")

} else {

    console.log("A " + nombre + " no le corresponde ningún descuento.")
} */


function descuento(nombre, edad){
    if(edad < 12){

        console.log("A " + nombre + " le corresponde el descuento infantil (menores de 12).")
    
    } else if(edad < 30){
    
        console.log("A " + nombre + " le corresponde el descuento juvenil (menores de 30).")
    
    } else if(edad > 60){
    
        console.log("A " + nombre + " le corresponde el descuento de jubilados (mayores de 60).")
    
    } else {
    
        console.log("A " + nombre + " no le corresponde ningún descuento.")
    }
}

descuento("Juan", 34)
descuento("Lucia", 15 )
descuento("Raúl", 7)
descuento("Pedro", 71)