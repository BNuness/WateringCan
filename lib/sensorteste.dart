// ignore_for_file: prefer_const_constructors, file_names

import 'package:flutter/material.dart';
import 'package:flutter_application_3/telaSensor.dart';
import 'package:flutter_application_3/telaUser.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';

void Sensoresteste() async {
  WidgetsFlutterBinding.ensureInitialized();

  final keyApplicationId = 'KFCvwGfsqOY4FcEqwfoHZrraw94mZpPCKnsCCiPq';
  final keyClientKey = 'GUPCMIHLimKOKsJtJDGbBBqHPGdEKJnYWrabAfsk';
  final keyParseServerUrl = 'https://parseapi.back4app.com';

  await Parse().initialize(keyApplicationId, keyParseServerUrl,
      clientKey: keyClientKey, debug: true);

      

  
}

var textoid;

class sensorteste extends StatelessWidget {
  //const Sensor({Key? key}) : super(key: key);
  ParseUser? currentUser;
  //late ParseUser currentUser;

    Future<ParseUser?> getUser() async {
    currentUser = await ParseUser.currentUser() as ParseUser?;
    //currentUser = currentUser.objectId;
    
    return currentUser;
    
    
    
  }

 

  final controllerSensorname = TextEditingController();
  final controllerEndmac = TextEditingController();
  final controllerIduser = TextEditingController();
  

  Future<void> doCreateData() async {

    var sensor1 = ParseObject("User");
    //var sensor2 = ParseUser("username","password","emailAddress");
    sensor1.objectId = textoid;
    

    

    
    
    var sensorteste = ParseObject('Sensor');


    
    
      //controllerIduser.value = getUser() as TextEditingValue;
      
      
      sensorteste.set("nome", controllerSensorname.text.trim());
      sensorteste.set("endMac", controllerEndmac.text.trim());
      //sensorteste.set("idUsuario", controllerIduser.text.trim());
      //sensorteste.set("idUsuario", sensor1);
      //sensorteste.set("endMac", controllerIduser.text.trim());
      //sensorteste.set('IdUsuario', ParseObject('Sensor')..objectId = sensor1.toString());
      /*sensorteste.set(
          'IdUsuario',
          (ParseObject('Sensor')..objectId = sensor1.objectId)
              .toString());*/
              

      //sensorteste.set("idUsuario", (ParseObject('User').objectId = controllerIduser.text.trim()).toPointer());

      //sensorteste.set("idUsuario", 'BC29SByTzt');
      //sensorteste.set("idUsuario", (ParseObject((textoid).toString().trim()).toPointer()));
      //sensorteste.set("idUsuario", (ParseObject(controllerIduser.text.trim()).toPointer()));
      /*sensorteste.set('idUsuario',
          (ParseObject('User')..objectId = (textoid.toString()).toPointer());*/



      
      
    try{
    // Save the Object
    await sensorteste.save();
    print('Object saved');
  } catch (e){
    print(e);
  }

  }

/*void doCreateData() async {
  
  

  
      var sensorteste = ParseObject('Sensor');
      //controllerIduser.value = getUser() as TextEditingValue;
      
      
      sensorteste.set("nome", controllerSensorname.text.trim());
      sensorteste.set("endMac", controllerEndmac.text.trim());
      //sensorteste.set("endMac", controllerIduser.text.trim());
      sensorteste.set(
          'publisher',
          (ParseObject('Publisher')..objectId = textoid.objectId)
              .toPointer());
              

      //sensorteste.set("idUsuario", (ParseObject('User').objectId = controllerIduser.text.trim()).toPointer());

      sensorteste.set("idUsuario", 'BC29SByTzt');
      //sensorteste.set("idUsuario", (ParseObject((textoid).toString().trim()).toPointer()));
      //sensorteste.set("idUsuario", (ParseObject(controllerIduser.text.trim()).toPointer()));
      /*sensorteste.set('idUsuario',
          (ParseObject('User')..objectId = (textoid.toString()).toPointer());*/



      
      
    try{
    // Save the Object
    await sensorteste.save();
    print('Object saved');
  } catch (e){
    print(e);
  }
       
      }*/



  //const ({ Key? key }) : super(key: key);

@override
  Widget build(BuildContext context) {

    return Scaffold(
        /*appBar: AppBar(
          title: Text('User logged in - Current User'),
        ),*/
        body: FutureBuilder<ParseUser?>(
            future: getUser(),
            
            
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
                
                  return Container(
         
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
            textoid = Text('${snapshot.data!.objectId}'),
            //textoid = getUser();
            


            SizedBox(
              height: 25,
            ),
            
            TextFormField (
              controller: controllerIduser,
              
              //initialValue:Text('${snapshot.data!.objectId}').toString(),
              
              autofocus: true,
              keyboardType: TextInputType.text,
              obscureText: false,
              decoration: InputDecoration(
                  labelText: "IdUser",
                  
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
        
        
      );
      



              }
            }));
            
  }
  
}
