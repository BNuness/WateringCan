import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_application_3/telaHistorico.dart';
import 'package:flutter_application_3/telaSensor.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final keyApplicationId = 'KFCvwGfsqOY4FcEqwfoHZrraw94mZpPCKnsCCiPq';
  final keyClientKey = 'GUPCMIHLimKOKsJtJDGbBBqHPGdEKJnYWrabAfsk';
  final keyParseServerUrl = 'https://parseapi.back4app.com';

  await Parse().initialize(keyApplicationId, keyParseServerUrl,
      clientKey: keyClientKey, debug: true);

  runApp(MaterialApp(
    home: teste(),
  ));
}

class teste extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<teste> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  ParseUser? currentUser;

  Future<ParseUser?> getUser() async {
    currentUser = await ParseUser.currentUser() as ParseUser?;
    return currentUser;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/imagens/icon2.png',
                alignment: Alignment.topCenter,
                fit: BoxFit.contain,
                height: 55,
              ),
              Container(
                padding: const EdgeInsets.all(8.0),
                child: Text("Histórico",
                    style: TextStyle(
                        fontSize: 50,
                        color: Color.fromARGB(255, 0, 0, 0),
                        //fontWeight: FontWeight.bold,
                        //fontStyle: FontStyle.italic,
                        fontFamily: 'Rancho')),
              )
            ],
          ),
          backgroundColor: Color.fromARGB(255, 255, 255, 255),
          centerTitle: true,
        ),
        key: _scaffoldKey,
        body: FutureBuilder<List<ParseObject>>(
            future: doHistorico(),
            builder: (context, snapshot) {
              switch (snapshot.connectionState) {
                case ConnectionState.none:
                case ConnectionState.waiting:
                  return Center(
                    child: Container(
                        width: 100,
                        height: 100,
                        child: CircularProgressIndicator()),
                  );
                default:
                  if (snapshot.hasError) {
                    return Center(
                      child: Text("Error...: ${snapshot.error.toString()}"),
                    );
                  } else {
                    if (snapshot.data!.isEmpty) {
                      return Center(
                        child: Text('None user found'),
                      );
                    }

                    return ListView.builder(
                        padding: EdgeInsets.only(top: 10.0),
                        itemCount: snapshot.data!.length,
                        itemBuilder: (context, index) {
                          ParseObject? sensor;
                          final Historico1 = snapshot.data![index];

                          final sensorident =
                              Historico1.get<ParseObject>('sensorId')!;
                          final nome = Historico1.get<String>('nome')!;
                          final data = Historico1.get<DateTime>('createdAt')!;

                          return Row(
                            children: [
                              Text(
                                  "ID: " +
                                      '${sensorident.objectId}' +
                                      '\n' +
                                      "Nome: " +
                                      nome.toString() +
                                      '\n' +
                                      'Data / Hora: ' +
                                      data.toString() +
                                      '\n',
                                  style: TextStyle(
                                      fontSize: 30,
                                      //fontWeight: FontWeight.bold,
                                      //fontStyle: FontStyle.italic,
                                      fontFamily: 'Rancho')),
                            ],
                          );
                        });
                  }
              }
            }));
  }

  Future<List<ParseObject>> doHistorico() async {
    print('TRESTERSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSS');

    final currentUser = await getUser();
    //final usuario  = currentUser!.get<ParseUser>('objectId')!;

    print(currentUser);

    final QueryBuilder<ParseObject> sensorQuery =
        QueryBuilder<ParseObject>(ParseObject('Sensor'));

    //sensorQuery.whereContains('nome', 'Sensor1');
    sensorQuery.whereContains('user', (currentUser?.objectId).toString());

    final ParseResponse sensorReponse = await sensorQuery.query();

    ParseObject? sensor;

    if (sensorReponse.success && sensorReponse.results != null) {
      sensor = sensorReponse.results!.first as ParseObject;
      print('22222222222222222222222222222222222222222222222222');
      for (var o in sensorReponse.results!) {
        print((o as ParseObject).toString());
      }
    }

    if (sensor == null) {
      print('333333333333333333333333333333333333333333333333333');
      return [];
    }

    QueryBuilder<ParseObject> queryHistorico =
        QueryBuilder<ParseObject>(ParseObject('Historico'))
          ..whereMatchesQuery('sensorId', sensorQuery)
          ..orderByAscending('nome')
          ..orderByDescending('createdAt');

    final ParseResponse apiResponse = await queryHistorico.query();

    if (apiResponse.success && apiResponse.results != null) {
      print(
          'Aeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee111111111111111111');

      for (var o in apiResponse.results!) {
        print((o as ParseObject).toString());
      }

      //return apiResponse.results as List<ParseObject>;
      return apiResponse.results as List<ParseObject>;
      /*print(
          'Aeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee222222222222222222');*/
      //return [];
    } else {
      print('111111111111111111111111111111111111111111111111111');
      //print(sensor.objectId);
      return [];
    }
  }
}

  
  //https://www.back4app.com/docs/flutter/parse-sdk/users/flutter-query-users

