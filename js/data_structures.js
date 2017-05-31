horseColor = ["gray","black","green","calico"];
horseName = ["abe","fido","ed","charley"];

horseColor.push("white");
horseName.push("rhinestone");

function horseCreator(horseName,horseColor){
  var horse = {}
  for (i=0; i<horseName.length; i++){
    horse[horseName[i]] = horseColor[i];
  }
return horse;

}

console.log(horseCreator(horseName,horseColor));


function Cars(model,make,color,maxSpeed){
  this.model = model;
  this.make = make;
  this.color = color;
  this.maxSpeed = maxSpeed;

  this.drive = function() {
    console.log("This car is driving at " + maxSpeed + ".");
  }

}

var joesCar = new Cars("Outback","Subaru","Silver",90);
console.log(joesCar);
joesCar.drive();