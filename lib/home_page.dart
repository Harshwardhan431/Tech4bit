import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:pict_vit/app_drawer.dart';
import 'package:pict_vit/model/grid_container.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  ScrollController _scrollViewController = new ScrollController();
  bool _showAppbar = true;
  bool isScrollingDown = false;

  @override
  void initState() {
    super.initState();
    _scrollViewController = new ScrollController();
    _scrollViewController.addListener(() {
      if (_scrollViewController.position.userScrollDirection ==
          ScrollDirection.reverse) {
        if (!isScrollingDown) {
          isScrollingDown = true;
          _showAppbar = false;
          setState(() {});
        }
      }

      if (_scrollViewController.position.userScrollDirection ==
          ScrollDirection.forward) {
        if (isScrollingDown) {
          isScrollingDown = false;
          _showAppbar = true;
          setState(() {});
        }
      }
    });
  }

  @override
  void dispose() {
    _scrollViewController.dispose();
    _scrollViewController.removeListener(() {});
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final deviceWidth = MediaQuery.of(context).size.width;
    final deviceHeight = MediaQuery.of(context).size.height;

    return SafeArea(
      child: Scaffold(
          drawer: AppDrawer(),
          body: Builder(
            builder: (context) => Container(
              width: deviceWidth,
              height: deviceHeight,
              child: Stack(
                children: [
                  SingleChildScrollView(
                    physics: BouncingScrollPhysics(),
                    controller: _scrollViewController,
                    child: Column(
                      children: [
                        SizedBox(height: _showAppbar ? 90 : 150),
                        Container(
                          margin: EdgeInsets.all(15),
                          width: deviceWidth,
                          height: 300,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(25),
                              color: Colors.lightBlue),
                        ),
                        SizedBox(height: 35),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                'Explore Recent Calamities',
                                style: TextStyle(
                                    color: Colors.black, fontSize: 25),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 35),
                        Container(
                          margin: EdgeInsets.symmetric(horizontal: 16),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  GridContainer(
                                      name: 'Earthquake',
                                      img: 'images/app_logo.jpg'),
                                  GridContainer(
                                      name: 'Earthquake',
                                      img: 'images/app_logo.jpg')
                                ],
                              ),
                              SizedBox(height: 30),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  GridContainer(
                                      name: 'Earthquake',
                                      img: 'images/app_logo.jpg'),
                                  GridContainer(
                                      name: 'Earthquake',
                                      img: 'images/app_logo.jpg')
                                ],
                              ),
                              SizedBox(height: 30),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  GridContainer(
                                      name: 'Earthquake',
                                      img: 'images/app_logo.jpg'),
                                  GridContainer(
                                      name: 'Earthquake',
                                      img: 'images/app_logo.jpg')
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: _showAppbar ? 90 : 55,
                    width: deviceWidth,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(30),
                        bottomRight: Radius.circular(30),
                      ),
                      color: Colors.lightBlueAccent,
                    ),
                    child: Column(
                      children: [
                        SizedBox(height: 20),
                        Visibility(
                          visible: _showAppbar,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  SizedBox(width: 16),
                                  InkWell(
                                    onTap: () {
                                      Scaffold.of(context).openDrawer();
                                      print("Pressed");
                                    },
                                    child: Container(
                                      padding:
                                          EdgeInsets.all(deviceWidth * 0.025),
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        shape: BoxShape.circle,
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.black,
                                            offset: Offset(0, 10),
                                            blurRadius: 7,
                                          ),
                                        ],
                                      ),
                                      child: Icon(
                                        Icons.notes,
                                        size: deviceWidth * 0.05,
                                        color: Colors.lightBlueAccent,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(width: deviceWidth * .2),
                              Text(
                                "Disaster Tech4Bit",
                                style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.white,
                                  wordSpacing: 2,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          )),
    );
  }
}
