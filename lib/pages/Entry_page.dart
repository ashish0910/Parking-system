import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:parkingsystem/models/vehicle.dart';
import 'package:intl/intl.dart';


class Entrypage extends StatefulWidget{
  
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new EntrypageState();
  }

}

class EntrypageState extends State<Entrypage>{
  final TextEditingController _number = new TextEditingController();
  final TextEditingController _middle = new TextEditingController();
  final TextEditingController _state = new TextEditingController();
  
  String state,middle,number;
  Vehicle newVehicle = new Vehicle();
  final DocumentReference reference = Firestore.instance.collection("System").document() ;
  
  
    void _add(String n,String s,String s2,DateTime d){
    
    Map<String,dynamic> data = <String,dynamic>{
      "middle" : s,
      "number" : n,
      "state" : s2,
      "time" : d ,
      "exit" : 0 ,
      "exittime" : null,
      "duration" : null,
      "fare" : null,
    };
    
    reference.setData(data).whenComplete((){
      print("Document Added");
    });
  }
  
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar:  new AppBar(
        title: new Text("Enter Vehicle Details"),
      ),
      body: new ListView(
        padding: const EdgeInsets.all(20.0),
        children: <Widget>[
          
            new Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                TextField(
                   decoration: new InputDecoration(
                     hintText: "eg DL,HR",
                     labelText: "Car State:",
                     labelStyle: new TextStyle(color: Colors.black,fontSize: 20.0,fontWeight: FontWeight.w500), 
                   ),
                   controller: _state,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20.0),
                ),
                TextField(
                   decoration: new InputDecoration(
                     hintText: "4 digit Number",
                     labelText: "Car Number:",
                     labelStyle: new TextStyle(color: Colors.black,fontSize: 20.0,fontWeight: FontWeight.w500),
                      
                   ),
                   controller: _number,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20.0),
                ),
                TextField(
                   decoration: new InputDecoration(
                     hintText: "Digits btw. State and 4 digit number",
                     labelText: "Middle Digits:",
                     labelStyle: new TextStyle(color: Colors.black,fontSize: 20.0,fontWeight: FontWeight.w500), 
                   ),
                   controller: _middle, 
                ),                
                Padding(
                  padding: const EdgeInsets.only(top: 30.0),
                ),
                RaisedButton(
                  onPressed: () {
                    if(_middle.text.isNotEmpty && _number.text.isNotEmpty && _state.text.isNotEmpty){
                      DateTime d = DateTime.now();
                      // newVehicle.number=_number.text;
                      newVehicle.middle=_middle.text;
                      newVehicle.state=_state.text;
                      newVehicle.number=_number.text;
                      _add(newVehicle.number,newVehicle.middle , newVehicle.state, d);
                      Navigator.pop(context);
                    }
              },
              child: new Text("Submit"),
                ),
              ],
            ),
        ],
      ),
    );
  }

}