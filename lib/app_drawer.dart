import 'package:flutter/material.dart';
import 'constants.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: Colors.lightBlueAccent,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 80),
            Center(
              child: Column(
                children: [
                  InkWell(
                    child: CircleAvatar(
                      radius: 50,
                      backgroundColor: Colors.amber[50],
                    ),
                    onTap: () {},
                  ),
                  SizedBox(height: 30),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      // GetUserName(uid, 18),
                      Text(
                        'Yash S',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 28,
                            fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            Container(
              height: 1,
              width: 150,
              color: black,
            ),
            SizedBox(height: 20),
            Text(
              'City',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 28,
                  fontWeight: FontWeight.w500),
            ),
          ],
        ),
      ),
    );
  }
}
