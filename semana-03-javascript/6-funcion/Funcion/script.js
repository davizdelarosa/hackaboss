"use strict";


function randomNum(){
    return Math.round(Math.random() * 100)
}

let num = randomNum()
console.log(num)


const numUser = +prompt("Introduce un número del 0 al 100:")

for(let i = 0; i <= 5; i++)

if(num == numUser){
    console.log("¡Enhorabuena, has ganado!")

    if(num < numUser){

        let menor = +prompt("El número es menor, prueba otra vez:")
    }
    
    if(num > numUser) {
        let mayor = +prompt("El número es mayor, prueba otra vez:")
    }
    
}