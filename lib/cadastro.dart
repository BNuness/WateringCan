// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_application_3/main.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';

import 'home.dart';

void cadastrar() async {
  WidgetsFlutterBinding.ensureInitialized();

  final keyApplicationId = 'KFCvwGfsqOY4FcEqwfoHZrraw94mZpPCKnsCCiPq';
  final keyClientKey = 'GUPCMIHLimKOKsJtJDGbBBqHPGdEKJnYWrabAfsk';
  final keyParseServerUrl = 'https://parseapi.back4app.com';

  await Parse().initialize(keyApplicationId, keyParseServerUrl,
      clientKey: keyClientKey, debug: true);

  runApp(cadastro());
}

class cadastro extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<cadastro> {
  final controllerUsername = TextEditingController(text: "");
  final controllerPassword = TextEditingController(text: "");
  final controllerEmail = TextEditingController(text: "");
  //final controllerTel = TextEditingController();

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
              "WateringCan Cadastro",
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
            TextFormField(
              controller: controllerUsername,
              autofocus: true,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                  labelText: "Usuário",
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
            /*TextFormField(
              controller: controllerTel,
              autofocus: true,
              keyboardType: TextInputType.text,
              obscureText: true,
              decoration: InputDecoration(
                  labelText: "Telefone",
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
            ),*/
            TextFormField(
              controller: controllerEmail,
              autofocus: true,
              keyboardType: TextInputType.text,
              obscureText: false,
              decoration: InputDecoration(
                  labelText: "E-mail",
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
              controller: controllerPassword,
              autofocus: true,
              keyboardType: TextInputType.text,
              obscureText: true,
              decoration: InputDecoration(
                  labelText: "Senha",
                  border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black)),
                  labelStyle: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w400,
                    fontSize: 30,
                  )),
              style: TextStyle(fontSize: 25),
            ),
            /*SizedBox(
              height: 25,
            ),
            TextFormField(
              autofocus: true,
              keyboardType: TextInputType.text,
              obscureText: true,
              decoration: InputDecoration(
                  labelText: "Confirmar senha",
                  border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black)),
                  labelStyle: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w400,
                    fontSize: 30,
                  )),
              style: TextStyle(fontSize: 25),
            ),*/
            SizedBox(
              height: 50,
            ),
            Container(
              height: 100,
              alignment: Alignment.center,
              child: TextButton(
                style: TextButton.styleFrom(
                  padding: const EdgeInsets.all(16.0),
                  textStyle: const TextStyle(fontSize: 39),
                ),
                onPressed: () => doUserRegistration(),
                child: const Text(
                  'Cadastrar',
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
                    MaterialPageRoute(builder: (context) => home()),
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
          content: const Text("Usuário Criado com Sucesso!"),
          contentTextStyle: TextStyle(
            color: Color.fromARGB(255, 0, 0, 0),
            fontWeight: FontWeight.bold,
            fontStyle: FontStyle.italic,
            fontFamily: 'Rancho',
            fontSize: 25,
          ),
          actions: <Widget>[
            new TextButton(
              child: const Text("OK",
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

  void doUserRegistration() async {
    final username = controllerUsername.text.trim();
    final email = controllerEmail.text.trim();
    final password = controllerPassword.text.trim();
    //final phone = controllerPassword.text.trim();

    if (controllerUsername.text.isEmpty ||
        controllerEmail.text.isEmpty ||
        controllerPassword.text.isEmpty) {
      camposVazios();
    } else {
      final user = ParseUser.createUser(username, password, email);

      var response = await user.signUp();

      if (response.success) {
        showSuccess();
        limpaCampos();
      } else {
        showError(response.error!.message);
      }
    }
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
    controllerEmail.text = "";
    controllerPassword.text = "";
    controllerUsername.text = "";
  }
}
