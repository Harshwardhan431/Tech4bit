
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:tech4bit/api.dart';
import 'package:lottie/lottie.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

var tmpIndex=0;
var sum=0;
bool mask=false;
class FinalDisplay extends StatefulWidget {
  const FinalDisplay({Key? key}) : super(key: key);

  @override
  _FinalDisplayState createState() => _FinalDisplayState();
}

class _FinalDisplayState extends State<FinalDisplay> {

   void Location(){
    for(int i=0;i<location.length;i++){
      if (location[i]==tmpName) {
        tmpIndex = i;
      }
    }
    if (tmpIndex>=13 && tmpIndex<=25){
      mask=true;
      print('toggle');
    }
    print('tmpName '+ '$tmpIndex');
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Location();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF3E5F5),
      appBar: AppBar(
        backgroundColor: Color(0xFFD1C4E9),
        title: Text(tmpName,style: TextStyle(
            color: Color(0xFF1A237E),
            fontWeight: FontWeight.bold,
            fontSize: 20,
            ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(0.0),
        child: Container(
          width: double.infinity,
          height: double.infinity,
          child: Column(
            children: [
              SizedBox(height: 15,),
              Expanded(
                flex: 1,
                  child: mask==true?TypewriterAnimatedTextKit(
                text: ['Air Pollution'],
                textStyle: TextStyle(
                  color: Color(0xFFAB47BC),
                  fontSize: 30.0,
                  fontWeight: FontWeight.w600,
                ),
              ):TypewriterAnimatedTextKit(
                text: ['No Air Pollution'],
                textStyle: TextStyle(
                  color: Color(0xFFAB47BC),
                  fontSize: 30.0,
                  fontWeight: FontWeight.w600,
                ),
              )),
              Expanded(
                flex: 3,
                  child: mask==true?Container(
                height: 150,
                child: Lottie.asset('assets/wear_mask.json'),
              ):Container(height: 150,
              child: Lottie.asset('assets/safe_city.json'),)),
              Padding(
                padding: const EdgeInsets.all(19.0),
                child: Divider(
                  height: 10,
                  color: Color(0xFF4A148C),
                  thickness: 1.5,
                ),
              ),
              Expanded(
                flex: 6,
                child: ListView.builder(
                  physics: BouncingScrollPhysics(),
                  itemCount: paramap[tmpIndex]!.length,
                    itemBuilder: (BuildContext context,int index){
                    return Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Center(
                        child: Container(
                          height: 150,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            gradient: // LinearGradient(colors: [Color(0xFF4b6cb7), Color(0xFF182848)])),
                            LinearGradient(
                                begin: Alignment.centerRight,
                                end: Alignment.centerLeft,
                                colors: [
                                  Color(0xFFF3E5F5),
                                  //Color(0xFFCE93D8),
                                  Color(0xFFAB47BC),
                                  Color(0xFF8E24AA),
                                  Color(0xFF4A148C),
                                ]),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                                 Padding(
                                   padding: const EdgeInsets.only(left: 20,top: 20),
                                   child: Text('Particle                   '+paramap[tmpIndex]![index] , style: TextStyle(color: Colors.white,fontSize: 17,fontWeight: FontWeight.bold),),
                                 ),

                                  Padding(
                                    padding: const EdgeInsets.only(left: 20, top: 5),
                                    child: Text('Amount                  '+valMap[tmpIndex]![index].toString()+'µg/m³', style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,
                                        fontSize: 17),),
                                  ),

                              Padding(
                                padding: const EdgeInsets.only(left: 20,top: 5),
                                child: Text('Avg Period              '+avgPeriodMap[tmpIndex]![index].toString()+' seconds', style: TextStyle(color: Colors.white,fontSize: 17,fontWeight: FontWeight.bold),),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 20,top: 5,bottom: 5),
                                child: Text('Last Updated          '+lastupdateMap[tmpIndex]![index].toString(), style: TextStyle(color: Colors.white,fontSize: 17,fontWeight: FontWeight.bold),),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


