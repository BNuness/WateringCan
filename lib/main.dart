import 'package:flutter/material.dart';

import 'package:flutter_application_3/home.dart';



void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'WateringCan',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'Rancho',
      ),
      //home: const login_page(title: 'Flutter Demo Home Page'),
      home: home(),
    );
  }
}
