/* Pseudo Code
 Seach through array
  check the length of word and compare to the longest word so far
  if longer replace index of longest and value of longest word
*/
function findLongestPhrase(arrayOfWords) {
  let length = arrayOfWords.length;
  let indexOfLongest = null;
  let valueOfLongest = null;
  for (let i = 0; i < length; i++)  {
    if (arrayOfWords[i].length > valueOfLongest) {
      valueOfLongest = arrayOfWords[i].length;
      indexOfLongest = i;
    }
  }
  return arrayOfWords[indexOfLongest];
}

/* Pseudo Code
  For each key in first object
    check if key value in 2nd object
    return true if value matches
  if none found return false
*/
function compareObjects(object1,object2){
  for (let keys of Object.keys(object1)){
    if (object1[keys] == object2[keys])
      return true;
  }
    return false;
}

/* Pseudo Code
  For Number Specified
    make a word by getting length by random number
    use random letter for each letter
  push this in to array
*/
function generateRandomArrayOfWords(number){
  let arrayOfWords = [];
  const ALPHABET = "abcdefghijklmnopqrstuvwxyz ";
  for (let i = 0; i < number; i++){
    let length = Math.floor(Math.random() * 30);
    let newWord = "";
    for (let letter = 0; letter < length ; letter ++){
      index = Math.floor(Math.random() * 1000) % 27;
      newWord += ALPHABET.charAt(index);
    }
    arrayOfWords.push(newWord);
  }
  return arrayOfWords;
}

/********************Drive Code***********************/
/* for Release 0 Testing
let testArray = ["long phrase","longest phrase","longer phrase", "not" ," this", "word"];
test1 = findLongestPhrase(testArray);
console.log(test1);
*/
/*  for Compare Object Testing for Release 1
let testObject1 = {name: "Steven", age: 54};
let testObject2 = {name: "Tamir", age: 54};
let testObject3 = {animal: "Dog", legs: 4};
let testObject4 = {animal: "Dog", legs: 3};
test2 = compareObjects(testObject1,testObject2)
test3 = compareObjects(testObject2,testObject3)
test4 = compareObjects(testObject3,testObject4)
test5 = compareObjects(testObject1,testObject3)
test6 = compareObjects(testObject1,testObject4)
test7 = compareObjects(testObject2,testObject4)
console.log(test2);
console.log(test3);
console.log(test4);
console.log(test5);
console.log(test6);
console.log(test7);
*/
for (var i = 0; i < 10; i++){
  console.log(`For Test number ${i+1}`)
  testArray = generateRandomArrayOfWords(10);
  console.log(testArray)
  testWord = findLongestPhrase(testArray);
  console.log(`The longest word is ${testWord}`);
  console.log(`****************************************`)
}