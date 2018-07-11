import 'package:flutter/material.dart';
import 'dart:async';
import 'package:parkingsystem/pages/Entry_page.dart';
import 'package:parkingsystem/pages/Exit_page.dart';
import 'package:parkingsystem/pages/History_page.dart';


Future<Null>main() async { 
  runApp(new MyApp());}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Parking System',
      theme: new ThemeData(
        primarySwatch: Colors.red,
      ),
      debugShowCheckedModeBanner: false,
      home: new MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {

  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  

  @override
  Widget build(BuildContext context) {
   
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Parking System"),
      ),
      body: ListView(
        padding: const EdgeInsets.all(20.0),
        children: <Widget>[
         new Padding(
            padding: const EdgeInsets.only(top: 20.0),
          ), 
          new Padding(
            padding: const EdgeInsets.only(top: 20.0),
           ),
          new MaterialButton(
            child: new Text("History",style: new TextStyle(color: Colors.white,fontSize: 30.0)),
            onPressed: (){
              Navigator.of(context).push(new MaterialPageRoute(
                builder: (BuildContext context) => new Historypage()
              ));
            },
            color: Colors.red,
            height: 75.0,
          ),
          // new Padding(
          //   padding: const EdgeInsets.only(top: 20.0),
          // ),
          // new MaterialButton(
          //   child: new Text("Exit",style: new TextStyle(color: Colors.white,fontSize: 30.0)),
          //   onPressed: (){
          //     Navigator.of(context).push(new MaterialPageRoute(
          //       builder: (BuildContext context) => new Exitpage()
          //     ));
          //   },
          //   color: Colors.red,
          //   height: 75.0,
            
          // ),
          new Padding(
            padding: const EdgeInsets.only(top: 20.0),
          ),
          new MaterialButton(
            child: new Text("Entry",style: new TextStyle(color: Colors.white,fontSize: 30.0)),
            onPressed: () { 
              Navigator.of(context).push(new MaterialPageRoute(
                builder: (BuildContext context) => new Entrypage()
                )); 
                },
            color: Colors.red,
            height: 75.0,
          ),
        ],
      ),
    );
  }
}
