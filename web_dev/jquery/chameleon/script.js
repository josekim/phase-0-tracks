console.log("The script is running!");
var addLine= $("<li> PICAKABOO!</li>");

$(document).ready(function(){

$("ul").on("mouseenter",function(event){
  $(this).append(addLine);
});

$("ul").on("mouseleave",function(event){
  $(this).find("li").last().remove();
});


});