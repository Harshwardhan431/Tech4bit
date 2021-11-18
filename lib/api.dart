import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;
import 'package:flutter/cupertino.dart';

import 'dropDown.dart';

var dispkkkl;
var location=[],city=[];
var measurement;
var selectedLocation=location[0];
var tmpName;

Map<int,List> paramap={};
Map<int,List> valMap={};
Map<int,List> lastupdateMap={};
Map<int,List> avgPeriodMap={};

var parameter=[];
var value=[];
var avgPeriodValue=[];
var lastUpdate=[];

const aikey='edac6c29d689a6cbe1698537097795c7';
const airQualityUrl='https://u50g7n0cbj.execute-api.us-east-1.a'
    'mazonaws.com/v1/latest?limit=100&page=1&offset=0&sort=desc&'
    'radius=1000&order_by=lastUpdated&dumpRaw=false#';

class AirQuaApi extends StatefulWidget {
  const AirQuaApi({Key? key}) : super(key: key);

  @override
  _AirQuaApiState createState() => _AirQuaApiState();
}

class _AirQuaApiState extends State<AirQuaApi> {

  List<DropdownMenuItem<String>> getDropDownList() {
    List<DropdownMenuItem<String>> dropdownItiems= [];
    for (int i = 0; i < location.length; i++) {
      String current = location[i];
      var neItiem = DropdownMenuItem(
        child: Text(current),
        value: current,
      );
      dropdownItiems.add(neItiem);
    }
    return dropdownItiems;
  }

  Future AirQuaFetch() async {

    var d=Uri.parse(airQualityUrl);
    http.Response response = await http.get(d);
    if (response.statusCode == 200){
      print('start');
      var data = response.body;
       dispkkkl = convert.jsonDecode(data)['results'];
       location.clear();
       city.clear();
       avgPeriodValue.clear();
       parameter.clear();
       value.clear();
       lastUpdate.clear();
       for(int i=0;i<dispkkkl.length;i++){
         parameter.clear();
         value.clear();
         avgPeriodValue.clear();
         lastUpdate.clear();
         location.add(dispkkkl[i]['location']);
         city.add(dispkkkl[i]['city']);
         measurement=dispkkkl[i]['measurements'];
        // print(measurement.length);
         for(int j=0;j<measurement.length;j++){
           parameter.add(dispkkkl[i]['measurements'][j]['parameter']);
           value.add(dispkkkl[i]['measurements'][j]['value']);
           avgPeriodValue.add(dispkkkl[i]['measurements'][j]['averagingPeriod']['value']);
           lastUpdate.add(dispkkkl[i]['measurements'][j]['lastUpdated']);
         }
         paramap[i]=parameter;
         valMap[i]=value;
         lastupdateMap[i]=lastUpdate;
         avgPeriodMap[i]=avgPeriodValue;
       }
    }
    return 1;
  }

  @override
  Widget build(BuildContext context) {
    double height=MediaQuery.of(context).size.height;
    double width=MediaQuery.of(context).size.width;
    return Scaffold(
      body: FutureBuilder(
        future: AirQuaFetch(),
        builder: (BuildContext context, AsyncSnapshot<void> snapshot) {
          if (snapshot.connectionState == ConnectionState.done){
            if (snapshot.hasData){
              return Center(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: 500,
                    width: 700,
                    decoration: BoxDecoration(
                      color: Colors.orangeAccent,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text('Select Location',style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                        ),),
                        Container(
                          height: 200,
                          width: 300,
                          color: Colors.red,
                          child: Center(
                           child: DropdownButton<String>(
                              value: location[0],
                              items: getDropDownList(),
                              onChanged: (value) {
                                setState(() {
                                  selectedLocation = value.toString();
                                  tmpName=selectedLocation;
                                });
                              },
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context){
                              return FinalDisplay();
                            }));
                          },
                          child: Container(
                            height: 100,
                            width: 100,
                            color: Colors.red,
                            child: Center(child: const Text('Submit',style: TextStyle(fontSize: 20),)),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              );
            }
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },

      ),
    );
  }
}
