import 'dart:ffi';
import 'package:flutter/material.dart';
import 'package:world_time/servises/world_time.dart';
class choose_location extends StatefulWidget {
  const choose_location({Key? key}) : super(key: key);

  @override
  State<choose_location> createState() => _choose_locationState();
}

class _choose_locationState extends State<choose_location> {
  List<worldTime> locations = [
    worldTime('Europe/London','London','uk.png'),
    worldTime('Europe/Berlin','Athens','greece.png'),
    worldTime('Africa/Cairo','Cairo','egypt.png'),
    worldTime('Africa/Nairobi','Nairobi','kenya.png'),
    worldTime('America/Chicago','Chicago','usa.png'),
    worldTime('America/New_York','New York','usa.png'),
    worldTime('Asia/Seoul','Seoul','south_korea.png'),
    worldTime('Asia/Jakarta','Jakarta','indonesia.png'),
  ];

  void updateTime(index)async{
    worldTime instance = locations[index];
    await instance.getTime();
    Navigator.pop(context,{
    'location':instance.location,
    'flag':instance.flag,
    'time':instance.time,
    'IsDayTime':instance.IsDayTime,
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:Colors.grey[200],
      appBar:AppBar(
        backgroundColor:Colors.blue[900],
        title:Text('choose your loaction!'),
        centerTitle:true,
        elevation:0,
      ),
      body:ListView.builder(
          itemCount: locations.length,
      itemBuilder:(context,index){
            return Card(
              child:ListTile(
                onTap:()=>{
                  updateTime(index)
                },
                title:Text(
                  locations[index].location
                ),
              ),
            );
      }),

    );
  }
}
