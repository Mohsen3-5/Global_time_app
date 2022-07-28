import 'package:flutter/material.dart';
class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Map data = {};
  @override
  Widget build(BuildContext context) {
    //getting the data from loading page
    data =data.isNotEmpty?data:ModalRoute.of(context)?.settings.arguments as Map;
    //selecte background image up to time (day or night)
    String bgImage = data['IsDayTime']?'day.png':'night.png';
    Color? bgColor=data['IsDayTime']? Colors.blue:Colors.indigo[700];
    return Scaffold(
      backgroundColor:bgColor,
      body:SafeArea(
        child:Container(
          decoration:BoxDecoration(
            image:DecorationImage(
              image: AssetImage('images/$bgImage'),
              fit: BoxFit.cover,
            )
          ),
          child: Padding(
            padding: const EdgeInsets.all(120.0),
            child: Column(
              children:<Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children:<Widget>[
                    Text(
                      data['location'],
                      style: TextStyle(
                        fontSize:28.0,
                        letterSpacing:2.0,
                      ),
                    )
                  ],
                ),
                SizedBox(height:20.0),
                Text(
                  data['time'],
                  style: TextStyle(
                    fontSize:40.0,
                  ),
                ),
                SizedBox(height:50.0),
                ElevatedButton.icon(
                    onPressed:()async{
                      dynamic result=await Navigator.pushNamed(context, '/location');
                      setState(() {
                        data ={
                          'time':result['time'],
                          'location':result['location'],
                          'IsDayTime':result['IsDayTime'],
                          'flag':result['flag']
                        };
                      });
                    },
                    label: Text('Edit location')
                ,icon:Icon(
                    Icons.edit_location
                ),),

              ],
            ),
          ),
        ),

      ),//save area it's keep the elements under mobile bar


    );
  }
}
