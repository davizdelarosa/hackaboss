"use strict";

const names = [
  "A-Jay",
  "Manuel",
  "Manuel",
  "Eddie",
  "A-Jay",
  "Su",
  "Reean",
  "Manuel",
  "A-Jay",
  "Zacharie",
  "Zacharie",
  "Tyra",
  "Rishi",
  "Arun",
  "Kenton",
];

/* const namesArr = new Set(names);

let newNames =[...namesArr];

console.log(newNames); */

function deleteRep(repArr){

  const newArr = new Set(repArr);

  let cleanArr =[...newArr];

  console.log(cleanArr);
}

deleteRep(names)

const pets = [
  "dog",
  "cat",
  "snake",
  "cat",
];

deleteRep(pets)