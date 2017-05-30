/*
Pseudo Code - Reverse

Take new word or phrase
starting at the first letter till end is reached
  put letter at the front of the array.
When Finish return new word


*/


function reverseWord(word)  {
  word = word.split("")
  let length = word.length;
  let newWord = []
  for (var i = 0; i < length; i++ ){
    newWord.unshift(word[i])
  }
  return newWord.join("");
}

/*****************Driver********************/
let driverWord = "Hello"
let newDriverWord = reverseWord(driverWord)

if (driverWord != newDriverWord){
  console.log(newDriverWord)
  console.log(driverWord)
}