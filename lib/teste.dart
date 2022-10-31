import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_application_3/telaHistorico.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  final keyApplicationId = 'KFCvwGfsqOY4FcEqwfoHZrraw94mZpPCKnsCCiPq';
  final keyClientKey = 'GUPCMIHLimKOKsJtJDGbBBqHPGdEKJnYWrabAfsk';
  final keyParseServerUrl = 'https://parseapi.back4app.com';

  await Parse().initialize(keyApplicationId, keyParseServerUrl,
      clientKey: keyClientKey, debug: true);

  runApp(MaterialApp(
    home:teste(),
  ));
}

class teste extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<teste> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Parse Query Users"),
          backgroundColor: Colors.blueAccent,
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
                          final historico = snapshot.data![index];
                          final horaA = historico.get<String>('horaAciona')!;
                          final horaD = historico.get<String>('horaDesliga')!;
                          final dataSensor = historico.get<DateTime>('data')!;
                          final umidadeA = historico.get<String>('umidadeAciona')!;
                          final umidadeD = historico.get<String>('umidadeDesliga')!;
                          //final idSensor = historico.get<String>('idSensor')!;
                          //final userVerified = user.emailVerified ?? false;
                          
                          return ListTile(
                            title: Text(
                                umidadeA.toString(),),
                            subtitle: Text(dataSensor.toString()),
                            
                            trailing: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Text(horaA),
                                    ],


                            ),



                          );
                          
                        });
                  }
              }
            }));
  }

  Future<List<ParseObject>> doHistorico() async {
        QueryBuilder<ParseObject> queryHistorico =
        QueryBuilder<ParseObject>(ParseObject('Historico'));
    final ParseResponse apiResponse = await queryHistorico.query();

    if (apiResponse.success && apiResponse.results != null) {
      return apiResponse.results as List<ParseObject>;
    } else {
      return [];
    }
  }
}

  
  //https://www.back4app.com/docs/flutter/parse-sdk/users/flutter-query-users

