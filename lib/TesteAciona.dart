import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_application_3/telaUser.dart';
import 'package:flutter_application_3/teste.dart';

import 'Acionamento.dart';

class AcionaTeste extends StatefulWidget {
@override
_HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<AcionaTeste> {
bool value = false;



    
bool isCheckedSeg = false;
bool isCheckedTer = false;
bool isCheckedQua = false;
bool isCheckedQui = false;
bool isCheckedSex = false;
bool isCheckedSab = false;
bool isCheckedDom = false;

  //const home({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Color getColor(Set<MaterialState> states) {
      const Set<MaterialState> interactiveStates = <MaterialState>{
        MaterialState.pressed,
        MaterialState.hovered,
        MaterialState.focused,
      };
      if (states.any(interactiveStates.contains)) {
        return Colors.green;
      }
      return Colors.green;
    }






    // ignore: todo
    // TODO: implement build
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
              "Acionamento",
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  //fontStyle: FontStyle.italic,
                  fontFamily: 'Rancho'),
            ),
            SizedBox(
              height: 30,
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
                    MaterialPageRoute(builder: (context) => acionamento()),
                  );
                },
                child: const Text(
                  'Dia da Semana Para Acionar',
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    color: Color.fromARGB(255, 0, 0, 0),
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.italic,
                    fontFamily: 'Rancho',
                  ),
                ),
              ),
            ),
            Row(
              //mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 136,
                ),
                Transform.scale(
                  scale: 1.2,
                  child: Checkbox(
                  fillColor: MaterialStateProperty.resolveWith(getColor),  
                  value: isCheckedSeg,
                  onChanged: (bool? value) {
                    setState(()
                    {
                      isCheckedSeg = value!;

                    }
                    );


                  }, 
                ),

                  
                ),
                Text('Segunda', style: TextStyle(
                  fontSize: 22,
                  //fontWeight: FontWeight.bold,
                  //fontStyle: FontStyle.italic,
                  fontFamily: 'Rancho'),),
                
                SizedBox(
                  width: 50,
                ),

                Transform.scale(
                  scale: 1.2,
                  child: Checkbox(
                  fillColor: MaterialStateProperty.resolveWith(getColor), 
                  value: isCheckedTer,
                  onChanged: (bool? value) {
                    setState(()
                    {
                      isCheckedTer = value!;

                    }
                    );



                  }, 
                ),
   
                ),
                Text('Terça', style: TextStyle(
                  fontSize: 22,
                  //fontWeight: FontWeight.bold,
                  //fontStyle: FontStyle.italic,
                  fontFamily: 'Rancho'),),
              ],
            ),
            Row(
              //mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 136,
                ),
                Transform.scale(
                  scale: 1.2,
                  child: Checkbox(
                  fillColor: MaterialStateProperty.resolveWith(getColor), 
                  value: isCheckedQua,
                  onChanged: (bool? value) {
                    setState(()
                    {
                      isCheckedQua = value!;

                    }
                    );
                  }, 
                ),

                  
                ),
                Text('Quarta', style: TextStyle(
                  fontSize: 22,
                  //fontWeight: FontWeight.bold,
                  //fontStyle: FontStyle.italic,
                  fontFamily: 'Rancho'),),
                SizedBox(
                  width: 62,
                ),
                Transform.scale(
                  scale: 1.2,
                  child: Checkbox(
                  fillColor: MaterialStateProperty.resolveWith(getColor), 
                  value: isCheckedQui,
                  onChanged: (bool? value) {
                    setState(()
                    {
                      isCheckedQui = value!;

                    }
                    );
                  }, 
                ),

                  
                ),
                Text('Quinta', style: TextStyle(
                  fontSize: 22,
                  //fontWeight: FontWeight.bold,
                  //fontStyle: FontStyle.italic,
                  fontFamily: 'Rancho'),),
              ],
            ),
            Row(
              //mainAxisAlignment: MainAxisAlignment.center,
              
              children: [
                SizedBox(
                  width: 136,
                ),
                Transform.scale(
                  scale: 1.2,
                  child: Checkbox(
                  fillColor: MaterialStateProperty.resolveWith(getColor), 
                  value: isCheckedSex,
                  onChanged: (bool? value) {
                    setState(()
                    {
                      isCheckedSex = value!;

                    }
                    );
                  }, 
                ),

                  
                ),
                Text('Sexta', style: TextStyle(
                  fontSize: 22,
                  //fontWeight: FontWeight.bold,
                  //fontStyle: FontStyle.italic,
                  fontFamily: 'Rancho'),),
                SizedBox(
                  width: 71,
                ),
                Transform.scale(
                  scale: 1.2,
                  child: Checkbox(
                  fillColor: MaterialStateProperty.resolveWith(getColor), 
                  value: isCheckedSab,
                  onChanged: (bool? value) {
                    setState(()
                    {
                      isCheckedSab = value!;

                    }
                    );
                  }, 
                ),

                  
                ),
                Text('Sábado', style: TextStyle(
                  fontSize: 22,
                  //fontWeight: FontWeight.bold,
                  //fontStyle: FontStyle.italic,
                  fontFamily: 'Rancho'),),
              ],
            ),
            Row(
              
              children: [
                SizedBox(
                  width: 137,
                ),
                Transform.scale(
                  scale: 1.2,
                  child: Checkbox(
                  fillColor: MaterialStateProperty.resolveWith(getColor), 
                  value: isCheckedDom,
                  onChanged: (bool? value) {
                    setState(()
                    {
                      isCheckedDom = value!;

                    }
                    );
                  }, 
                ),

                  
                ),
                Text('Domingo', style: TextStyle(
                  fontSize: 22,
                  //fontWeight: FontWeight.bold,
                  //fontStyle: FontStyle.italic,
                  fontFamily: 'Rancho'),),
              ],
            ),
            SizedBox(
              height: 30,
            ),
            Container(
              height: 55,
              alignment: Alignment.center,
              child: TextButton(
                style: TextButton.styleFrom(
                  padding: const EdgeInsets.all(16.0),
                  textStyle: const TextStyle(fontSize: 28),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => acionamento()),
                  );
                },
                child: const Text(
                  'Umidade Aciona',
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


            SizedBox(
            width: 0,


            child: TextFormField(
              //controller: controllerUsername,
            
              
              autofocus: true,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.fromLTRB(12, 0, 12, 0),
                  labelText: "",
                  border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black)),
                  labelStyle: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w400,
                    fontSize: 30,
                  )),
              style: TextStyle(fontSize: 25),
            ),),
            SizedBox(
              height: 20, //150
            ),

            Container(
              height: 55,
              alignment: Alignment.center,
              child: TextButton(
                style: TextButton.styleFrom(
                  padding: const EdgeInsets.all(16.0),
                  textStyle: const TextStyle(fontSize: 28),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => acionamento()),
                  );
                },
                child: const Text(
                  'Umidade Desligar',
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


            SizedBox(
            width: 0,


            child: TextFormField(
              //controller: controllerUsername,
            
              
              autofocus: true,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.fromLTRB(12, 0, 12, 0),
                  labelText: "",
                  border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black)),
                  labelStyle: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w400,
                    fontSize: 30,
                  )),
              style: TextStyle(fontSize: 25),
            ),),
            SizedBox(
              height: 20, //150
            ),



            
            Container(
              height: 55,
              alignment: Alignment.center,
              child: TextButton(
                style: TextButton.styleFrom(
                  padding: const EdgeInsets.all(16.0),
                  textStyle: const TextStyle(fontSize: 28),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => teste()),
                  );
                },
                child: const Text(
                  'Salvar',
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

  
  }
