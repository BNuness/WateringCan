// ignore_for_file: prefer_const_constructors, file_names

import 'package:flutter/material.dart';
import 'package:flutter_application_3/telaUser.dart';


class Historico extends StatelessWidget {
  const Historico ({Key? key}) : super(key: key);

  //const ({ Key? key }) : super(key: key);

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
              width: 10,
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
            /*SizedBox(
              height: 60,
            ),*/
            SizedBox(
              height: 20, //50
            ),
            Container(
              height: 100,
              alignment: Alignment.topLeft,
              child: TextButton(
                style: TextButton.styleFrom(
                  padding: const EdgeInsets.all(16.0),
                  textStyle: const TextStyle(fontSize: 36),
                ),
                onPressed: () {},
                child: const Text(
                  'Histórico',
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
              height: 10,
            ),
            Container(
              height: 100,
              alignment: Alignment.center,
              child:Table(
            border: TableBorder.all(width:1, color:Colors.black45), //table border
            children: [
              

              TableRow(
                   children: [
                      TableCell(child: Text("Sensor:")),
                      TableCell(child: Text("Data:")),
                      TableCell(child: Text("Hora Liga:")),
                      TableCell(child: Text("Umidade:")),
                      //TableCell(child: Text("Hora:")),
                     // TableCell(child: Text("Umidade:")),
                   ]
                 ),

                 TableRow(
                   children: [
                      TableCell(child: Text("1.")),
                      TableCell(child: Text("Krishna Karki")),
                      TableCell(child: Text("Nepal, Kathmandu")),
                      TableCell(child: Text("Nepal"))
                   ]
                 ),
                 
                 TableRow(
                   children: [
                      TableCell(child: Text("2.")),
                      TableCell(child: Text("John Wick")),
                      TableCell(child: Text("New York, USA")),
                      TableCell(child: Text("USA"))
                   ]
                 ),

                 TableRow(
                   children: [
                      TableCell(child: Text("3.")),
                      TableCell(child: Text("Fedrick May")),
                      TableCell(child: Text("Berlin, Germany")),
                      TableCell(child: Text("Germany"))
                   ]
                 ),

            ],),


              





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
