import 'package:flutter/material.dart';
import 'package:world_time/servises/world_time.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
class loading extends StatefulWidget {
  const loading({Key? key}) : super(key: key);

  @override
  State<loading> createState() => _loadingState();
}

class _loadingState extends State<loading> {
void setupWorldTime() async {
  worldTime instance=worldTime('Europe/london','london','Turkey.png');
  await instance.getTime();
  Navigator.of(context).pushReplacementNamed('/home',arguments: {
    'location':instance.location,
    'flag':instance.flag,
    'time':instance.time,
    'IsDayTime':instance.IsDayTime,
  });
}
  @override
  void initState() {
    super.initState();
    setupWorldTime();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:Colors.blueGrey[500],
      body:Center(
        child:SpinKitWave(
          color: Colors.white,
          size: 50.0,
        ),
      )
    );
  }
}
