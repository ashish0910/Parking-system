import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:parkingsystem/models/vehicle.dart';
import 'dart:async';

String state,middle,number,date;
List<String> list;
class Historypage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new HistoryPageState();
  }
}


class HistoryPageState extends State<Historypage>{
 
 final CollectionReference collectionReference = Firestore.instance.collection("System");
  
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("History"),
      ),
      body: new StreamBuilder<QuerySnapshot>(
        stream: collectionReference.snapshots(),
        builder: (BuildContext context,AsyncSnapshot<QuerySnapshot> snapshot){
          if(!snapshot.hasData){
            return new Center(
              child: new Text("NO HISTORY"),
            );
          }
          final int count = snapshot.data.documents.length;
          return new ListView.builder(
            itemCount: count,
            itemBuilder: (_,index){
              final DocumentSnapshot document = snapshot.data.documents[count-index-1];
              bool _exit;
              int fare;
              String no = "NO";
              document['exittime']==null ? _exit=false : _exit=true ;
                var diffrence = DateTime.now().difference(document['time']).inHours;
                              if(document['fare']!=null){
                                fare=document['fare'];
                              }
                               else if(diffrence<=1){
                                fare=50;
                              }else if(diffrence>1&&diffrence<=2){
                                fare=75;
                              }else if(diffrence>2){
                                fare=75+((diffrence-2)*50);
                              }
                                  
              return new Card(
                child: new ListTile(
                  title: new Text("${document['state']} ${document['middle']} ${document['number']} \n"),
                  subtitle: new Text("Entry:${document['time']}\nExit:${_exit?document['exittime']:no}\nDuration(Hours):${_exit?document['duration']:diffrence}\nFare:RS$fare"),
                  trailing: _exit? new Icon(Icons.sentiment_very_satisfied,color: Colors.green,): new Icon(Icons.sentiment_dissatisfied,color: Colors.red,),
                  onTap: (){
                    if(_exit==false){
                      showDialog(context: context, builder: (BuildContext context){
                       return new AlertDialog(
                         title: new Text("Alert"),
                      content: new Text("Exit vehicle?\nFare:Rs$fare"),
                      actions: <Widget>[
                        new RaisedButton(
                          child: new Text("Cancel"),
                          onPressed: (){
                            Navigator.pop(context);
                          },
                        ),
                        new RaisedButton(
                          child: new Text("Yes"),
                          onPressed: (){
                            
                              Map<String,dynamic> data = <String,dynamic>{
                                   "middle" : document['middle'],
                                   "number" : document['number'],
                                   "state" : document['state'],
                                   "time" : document['time'] ,
                                   "exit" : 1 ,
                                   "exittime" : DateTime.now(),
                                   "duration" : diffrence,
                                   "fare" : fare
                                  };
                                  
                                  collectionReference.document(document.documentID).updateData(data).whenComplete((){
                                  print("Updated exit time");
                                  });
                                  
                            Navigator.pop(context);
                          },
                        )
                      ],
                       );
                    });
                    }
                  },
                   isThreeLine: true,
                )
              );
            },
          );
        },
      )
    );
  }

}