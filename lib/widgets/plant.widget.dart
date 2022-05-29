// ignore_for_file: prefer_const_constructors, dead_code

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../model/user.cameras.response.dart';

//Returns list tile
class Plant extends StatelessWidget {
  //final, kad nesikeis po priskyrymo
  // final String observedPlantType;
  List<Camera> observablePlants;
  int index;

  //Konstruktorius priskiria ivesties argumenta  vietiniam kintamajam
  Plant(this.observablePlants, this.index, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
 
    String? cameraSerial; 


    if(observablePlants.isNotEmpty)
    {
       cameraSerial = observablePlants[index].camSerialNumber;
    }else cameraSerial='';
    
  

    return 
    observablePlants.isNotEmpty?
     ListTile(
          // ignore: prefer_const_literals_to_create_immutables
          title:  Text(cameraSerial!, style: TextStyle(fontSize: 25)),
          
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              IconButton(
                // Pasalinimo mygtukas
                icon: Icon(Icons.edit),
                onPressed: () => {},
              ),
              IconButton(
                // Pasalinimo mygtukas
                icon: Icon(Icons.delete),
                onPressed: () => {},
              ),
            ],
          ),
        ) 
        : ListTile(); 
    
  }
}


  // Container(
  //     //Conteiner issiplecia per visa ekrana, todel .center textas buna centre
  //     width: double.infinity,
  //     margin: EdgeInsets.all(10),
  //     child: Obx(
  //       () => ListTile(
  //         // ignore: prefer_const_literals_to_create_immutables
  //         title: Column(children: [
  //           Text(cameraSerial!, style: TextStyle(fontSize: 25)),
  //         ]),
  //         trailing: Row(
  //           mainAxisSize: MainAxisSize.min,
  //           children: <Widget>[
  //             IconButton(
  //               // Pasalinimo mygtukas
  //               icon: Icon(Icons.edit),
  //               onPressed: () => {},
  //             ),
  //             IconButton(
  //               // Pasalinimo mygtukas
  //               icon: Icon(Icons.delete),
  //               onPressed: () => {},
  //             ),
  //           ],
  //         ),
  //       ),
  //     ),
  //   );