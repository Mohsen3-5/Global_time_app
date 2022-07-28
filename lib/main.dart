
import 'package:flutter/material.dart';
import 'package:world_time/Pages/home.dart';
import 'package:world_time/Pages/loading.dart';
import 'package:world_time/Pages/choose_location.dart';

void main() {
  runApp(MaterialApp(
    initialRoute:'/',
    routes:{
      '/':(context)=>loading(),
      '/home':(context)=>Home(),
      '/location':(context)=>choose_location(),}
  ));
}











/*

stateful widgets have those functions
setState() triggers the bulid function
initState() called only once when widget created
bulid() bulids the widget tree, a build is run every time we use setState()

Disoise() run when widget object is removed.
*/

