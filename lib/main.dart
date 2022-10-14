import 'package:flutter/material.dart';

import 'package:flutter_application_3/home.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';


void main() async{
  //runApp(const MyApp());
    WidgetsFlutterBinding.ensureInitialized();

  final keyApplicationId = 'KFCvwGfsqOY4FcEqwfoHZrraw94mZpPCKnsCCiPq';
  final keyClientKey = 'GUPCMIHLimKOKsJtJDGbBBqHPGdEKJnYWrabAfsk';
  final keyParseServerUrl = 'https://parseapi.back4app.com';

  await Parse().initialize(keyApplicationId, keyParseServerUrl,
  clientKey: keyClientKey, debug: true);

  runApp(MyApp());
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
