import 'package:flutter/material.dart';

class Vehicle {
  String _number ;
  String _state ;
  String _middle ;
  bool _exit ;
  DateTime _dateTime;
  set number(String n) => _number=n ;
  set state(String s) => _state=s;
  set middle(String s) => _middle=s;
  set dateTime(DateTime d) => _dateTime=d;
  set exit(bool b) => _exit=b;
  String get number => _number;
  String get state => _state;
  String get middle => _middle;
  bool get exit => _exit;
}