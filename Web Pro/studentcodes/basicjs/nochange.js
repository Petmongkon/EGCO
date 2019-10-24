// nochange.js
//   This script illustrates using the focus event
//   to prevent the user from changing a text field

// The event handler function to compute the cost

function computeCost() {
//add your code here
var french = document.getElementById("french").value;
var hazlenut = document.getElementById("hazlenut").value;
var columbian = document.getElementById("columbian").value;
// Compute the cost
  totalCost = (3.49*french)+(3.95*hazlenut)+(4.59*columbian);
  document.getElementById("cost").value = "$"+totalCost;
 
}  //* end of computeCost
