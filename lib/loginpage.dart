// ignore_for_file: prefer_const_constructors, file_names



import 'package:flutter/material.dart';
import 'package:flutter_application_3/home.dart';
import 'package:flutter_application_3/telaUsuario.dart';

class login extends StatelessWidget {
  var user1 = "teste"; // campo de comparação
  var senha = "123"; // campo de comparação
  var usuario = TextEditingController();
  var passwd = TextEditingController();

  //const ({ Key? key }) : super(key: key);

  void limpar() {
    usuario.text = '';
    passwd.text = '';
  }

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
            TextFormField(
              controller: usuario,
              autofocus: true,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                  labelText: "Login",
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
              controller: passwd,
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
                  if (usuario.text.isNotEmpty && passwd.text.isNotEmpty) {
                    if (usuario.text == user1 && passwd.text == senha) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => user(),
                        ),
                      );
                    } else {
                      showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          title: Text("Erro!!!"),
                          content: Text(
                            "Usuário e/ou senha inválidos!!!",
                            style: TextStyle(
                              color: Color.fromARGB(255, 0, 0, 0),
                              fontWeight: FontWeight.bold,
                              fontStyle: FontStyle.italic,
                              fontFamily: 'Rancho',
                            ),
                          ),
                          actions: [
                            ElevatedButton(
                                onPressed: () {
                                  Navigator.pop(
                                    context,
                                  );
                                  limpar();
                                },
                                child: Text("OK")),
                          ],
                        ),
                      );
                    }
                  } else {
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        title: Text("Erro!!!"),
                        content: Text(
                          "Usuário e/ou senha inválidos!!!",
                          style: TextStyle(
                            color: Color.fromARGB(255, 0, 0, 0),
                            fontWeight: FontWeight.bold,
                            fontStyle: FontStyle.italic,
                            fontFamily: 'Rancho',
                          ),
                        ),
                        actions: [
                          ElevatedButton(
                              onPressed: () {
                                Navigator.pop(
                                  context,
                                );
                                //limpar();
                              },
                              child: Text("OK"))
                        ],
                      ),
                    );
                  }

                  /*Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => user()),
                  );*/
                },
                child: const Text(
                  'Acessar',
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
}
