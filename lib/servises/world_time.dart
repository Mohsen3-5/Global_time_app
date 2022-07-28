import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';


class worldTime {
  String location='';
  String time='';
  String flag='';//url to an assets flag icon
  String url='';//locatioon url
  bool IsDayTime=true;
  worldTime(url,location,flag){
    this.location=location;
    this.flag=flag;
    this.url=url;
  }
  Future<void> getTime()async{//Future is allow to use await in loading screen
    try {
      print('object');
      Uri uri = Uri.parse('http://worldtimeapi.org/api/timezone/$url');
      Response response = await get(uri);
      Map data = jsonDecode(response.body);
      String dateTime = data['datetime'];
      String offset = data['utc_offset'].substring(1, 3);
      // print(dateTime);
      // print(offset);
      DateTime now = DateTime.parse(dateTime);
      now = now.add(Duration(hours: int.parse(offset)));
      IsDayTime=now.hour > 6 && now.hour<20 ?true:false;
      //set the time propority
      time = DateFormat.jm().format(now);//formating time using intl packge
    }catch(e){
      print('caught error: $e');
      time='could not get time data';
    }
  }
}