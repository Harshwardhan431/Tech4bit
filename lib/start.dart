import 'package:flutter/material.dart';
import 'package:tech4bit/api.dart';

class Start extends StatefulWidget {
  const Start({Key? key}) : super(key: key);

  @override
  _StartState createState() => _StartState();
}

class _StartState extends State<Start> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          height: 100,
          width: 100,
          color: Colors.red,
          child: Center(
            child: RaisedButton(
              onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context){
                  return AirQuaApi();
                }));
              },
            ),
          ),
        ),
      ),
    );
  }
}
