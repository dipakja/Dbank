import Debug "mo:base/Debug";
import Nat "mo:base/Nat";
import Int "mo:base/Int";
import Time "mo:base/Time";
import Float "mo:base/Float";


actor DBank{

stable var currentValue: Float = 300;

currentValue:=300;      //for canister

 Debug.print(debug_show(currentValue));    //for canister



let id = 2355566433321232343;

stable var startTime = Time.now();

startTime:=Time.now();  //for canister
// 
Debug.print(debug_show(startTime));






Debug.print(debug_show(id));


 public func topUp(amount:Float) {


currentValue += amount;
Debug.print(debug_show(currentValue));


};

 public func withdraw(amount:Float){

let tempValue : Float = currentValue-amount;

if(tempValue>=0){

currentValue-=amount;
Debug.print(debug_show(currentValue));

}else
{

 Debug.print("Amount is too large, we are getting negative values.");

}

 };


public query func checkBalance(): async Float{

return currentValue;

};


public func compound() {

let currentTime = Time.now();
let timeElapsedNS = currentTime - startTime; // in nano second

// different

let timeElapseds = timeElapsedNS/1000000000; //in second


currentValue := currentValue * (1.01 **  Float.fromInt(timeElapseds) );

startTime := currentTime;

};


// topUp();
// CurrentTime();


}