// ignore_for_file: prefer_const_constructors, dead_code

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../constants/constants.dart';


//Returns list tile
class InactiveCamerasListTile extends StatelessWidget {  

  //Konstruktorius priskiria ivesties argumenta  vietiniam kintamajam
  InactiveCamerasListTile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  ListTile(
                // ignore: prefer_const_literals_to_create_immutables
                title: Column(children: [
                  Text("Nepriskirtos kameros", style: TextStyle(fontSize: 24)),
                ]),
                tileColor: Colors.grey,
              );
  }
}
