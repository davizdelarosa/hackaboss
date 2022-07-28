"use strict";

const people = {
  Maria: 20,
  Ana: 14,
  Luis: 16,
  Pepe: 35,
  Manuel: 50,
  Teresa: 12,
  Daniel: 27,
  Irene: 23,
  Alex: 10,
};

let peopleArr = Object.keys(people)

for(let i = 0; i < peopleArr.length; i++){
  
  let key = peopleArr[i]

  if((people[key]) > 18){

    console.log(key + " es mayor de edad.")
  } else{
    
    console.log(key + " es menor de edad.")
  }
}
