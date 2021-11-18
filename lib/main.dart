import 'package:flutter/material.dart';
import 'package:tech4bit/api.dart';
import 'package:tech4bit/start.dart';

void main() {
  runApp(const MyApp());
}
//2nd commit
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Start(),
    );
  }
}
