// ignore_for_file: prefer_const_constructors, file_names

import 'dart:html';

import 'package:flutter/material.dart';
import 'package:flutter_application_3/telaUser.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';

void Sensores() async {
  WidgetsFlutterBinding.ensureInitialized();

  final keyApplicationId = 'KFCvwGfsqOY4FcEqwfoHZrraw94mZpPCKnsCCiPq';
  final keyClientKey = 'GUPCMIHLimKOKsJtJDGbBBqHPGdEKJnYWrabAfsk';
  final keyParseServerUrl = 'https://parseapi.back4app.com';

  await Parse().initialize(keyApplicationId, keyParseServerUrl,
      clientKey: keyClientKey, debug: true);
      runApp(sensor());
}

class sensor extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}


class _HomePageState extends State<sensor> {
  //const Sensor({Key? key}) : super(key: key);

  //const ({ Key? key }) : super(key: key);

  ParseUser? currentUser;

  final controllerSensorname = TextEditingController();
  final controllerEndmac = TextEditingController();
  //final controllerIduser = TextEditingController();

  Future<ParseUser?> getUser() async {
    currentUser = await ParseUser.currentUser() as ParseUser?;
    return currentUser;
  }

  Future<void> doCreateData() async {
    //final sensor1 = ParseObject("User");

    final currentUser = await getUser();
    final sensorteste = ParseObject('Sensor');

    if (controllerSensorname.text.isEmpty ||
        controllerEndmac.text.isEmpty) {
      camposVazios();
    } else {

    sensorteste.set("nome", controllerSensorname.text.trim());
    sensorteste.set("endMac", controllerEndmac.text.trim());
    sensorteste.set('user', currentUser?.toPointer());

    
      // Save the Object
      final response = await sensorteste.save();
      print('Object saved ${response.toString()}');
    if (response.success) {
        showSuccess();
        limpaCampos();
      } else {
        showError(response.error!.message);
      }
  }}

  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        //color: Colors.amber,
        padding: EdgeInsets.only(
          top: 10,
          left: 40,
          right: 40,
        ),
        color: Colors.white,

        child: ListView(
          children: <Widget>[
            SizedBox(
              width: 90, //antes 128
              height: 90,

              child: Image.asset(
                'assets/imagens/icon2.png',
                alignment: Alignment.topCenter,
              ),
            ),
            SizedBox(
              width: 50,
            ),
            Text(
              "WateringCan",
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  //fontStyle: FontStyle.italic,
                  fontFamily: 'Rancho'),
            ),
            SizedBox(
              height: 60,
            ),
            SizedBox(
              height: 60,
            ),
            TextFormField(
              controller: controllerSensorname,
              autofocus: true,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                  labelText: "Nome do Sensor",
                  border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black)),
                  labelStyle: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w400,
                    fontSize: 30,
                  )),
              style: TextStyle(fontSize: 25),
            ),
            SizedBox(
              height: 25,
            ),
            TextFormField(
              controller: controllerEndmac,
              autofocus: true,
              keyboardType: TextInputType.text,
              obscureText: false,
              decoration: InputDecoration(
                  labelText: "End MAC",
                  border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black)),
                  labelStyle: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w400,
                    fontSize: 30,
                  )),
              style: TextStyle(fontSize: 25),
            ),
            SizedBox(
              height: 50,
            ),
            SizedBox(
              height: 50,
            ),
            Container(
              height: 100,
              alignment: Alignment.center,
              child: TextButton(
                style: TextButton.styleFrom(
                  padding: const EdgeInsets.all(16.0),
                  textStyle: const TextStyle(fontSize: 36),
                ),
                onPressed: () {
                  doCreateData();
                },
                child: const Text(
                  'Salvar',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color.fromARGB(255, 5, 61, 7),
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.italic,
                    fontFamily: 'Rancho',
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 50,
            ),
            Container(
              height: 100,
              alignment: Alignment.center,
              child: TextButton(
                style: TextButton.styleFrom(
                  padding: const EdgeInsets.all(16.0),
                  textStyle: const TextStyle(fontSize: 28),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => user()),
                  );
                },
                child: const Text(
                  'Voltar',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color.fromARGB(255, 0, 0, 0),
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.italic,
                    fontFamily: 'Rancho',
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

//
//Verificação de campos e erro ao salvar
//

  void showSuccess() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Successo!"),
          titleTextStyle: TextStyle(
            color: Color.fromARGB(255, 0, 0, 0),
            fontWeight: FontWeight.bold,
            fontStyle: FontStyle.italic,
            fontFamily: 'Rancho',
            fontSize: 30,
          ),
          content: const Text("Sensor Criado com Sucesso!"),
          contentTextStyle: TextStyle(
            color: Color.fromARGB(255, 0, 0, 0),
            fontWeight: FontWeight.bold,
            fontStyle: FontStyle.italic,
            fontFamily: 'Rancho',
            fontSize: 25,
          ),
          actions: <Widget>[
            new TextButton(
              child: const Text(
                "OK",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color.fromARGB(255, 0, 0, 0),
                  fontWeight: FontWeight.bold,
                  fontStyle: FontStyle.italic,
                  fontFamily: 'Rancho',
                  fontSize: 20,
                ),
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  void showError(String errorMessage) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Error!"),
          titleTextStyle: TextStyle(
            color: Color.fromARGB(255, 0, 0, 0),
            fontWeight: FontWeight.bold,
            fontStyle: FontStyle.italic,
            fontFamily: 'Rancho',
            fontSize: 30,
          ),
          content: Text(errorMessage),
          contentTextStyle: TextStyle(
            color: Color.fromARGB(255, 0, 0, 0),
            fontWeight: FontWeight.bold,
            fontStyle: FontStyle.italic,
            fontFamily: 'Rancho',
            fontSize: 25,
          ),
          actions: <Widget>[
            new TextButton(
              child: const Text(
                "OK",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color.fromARGB(255, 0, 0, 0),
                  fontWeight: FontWeight.bold,
                  fontStyle: FontStyle.italic,
                  fontFamily: 'Rancho',
                  fontSize: 20,
                ),
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

 

  void camposVazios() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Erro!"),
          titleTextStyle: TextStyle(
            color: Color.fromARGB(255, 0, 0, 0),
            fontWeight: FontWeight.bold,
            fontStyle: FontStyle.italic,
            fontFamily: 'Rancho',
            fontSize: 30,
          ),
          content: Text("Preencha todos os campos!"),
          contentTextStyle: TextStyle(
            color: Color.fromARGB(255, 0, 0, 0),
            fontWeight: FontWeight.bold,
            fontStyle: FontStyle.italic,
            fontFamily: 'Rancho',
            fontSize: 25,
          ),
          actions: <Widget>[
            new TextButton(
              child: const Text(
                "OK",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color.fromARGB(255, 0, 0, 0),
                  fontWeight: FontWeight.bold,
                  fontStyle: FontStyle.italic,
                  fontFamily: 'Rancho',
                  fontSize: 20,
                ),
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  void limpaCampos() {
    controllerSensorname.text = "";
    controllerEndmac.text = "";
    
  }

}
