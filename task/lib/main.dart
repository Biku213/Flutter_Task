import 'package:flutter/material.dart';
import 'package:task/apidemo.dart';
import 'package:task/demopage.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Task',
      home: DemoPage()
      
    );
  }
}
