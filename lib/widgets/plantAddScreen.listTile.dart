// ignore_for_file: prefer_const_constructors, dead_code

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../constants/constants.dart';
import '../model/user.cameras.response.dart';


//Returns list tile
class PlantAddScreenListTile extends StatelessWidget {  

 

  List<Camera> observablePlants;
  int index;

  //Konstruktorius priskiria ivesties argumenta  vietiniam kintamajam
  PlantAddScreenListTile(this.observablePlants, this.index, {Key? key}) : super(key: key);


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
                title: Column(children: [
                  Text(cameraSerial!, style: TextStyle(fontSize: 20)),
                ]),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Text("Stebimas vaizdas", style: TextStyle(fontSize: 17)),
                    IconButton(
                      // Pasalinimo mygtukas
                      icon: Icon(Icons.arrow_forward_ios),
                      onPressed: () => {},
                    ),
                  ],
                ),
              )
              : ListTile(); 
}
}
