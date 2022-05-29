// ignore_for_file: prefer_const_constructors
import 'package:get/get.dart' as getx;
import 'package:flutter/material.dart';
import 'package:mano_sodas_final/constants/constants.dart';

class HistoryScreen extends StatelessWidget {
  // const History({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Istorija'),
        // leading: GestureDetector(
        //   onTap: () {
        //     context.goNamed(homeRouteName);
        //   },
        //   child: const Icon(Icons.backspace),
        // ),
      ),
      body: Container(
        //Test container size
        // width: double.infinity,
        // height: double.infinity,
        //  color: Colors.red,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            // ignore: prefer_const_literals_to_create_immutables
            children: [
              ListTile(
                // ignore: prefer_const_literals_to_create_immutables
                title: Container(
                   alignment: FractionalOffset.center,
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    // ignore: prefer_const_literals_to_create_immutables
                    children: [
                    Text("Šalna"),
                    Text(" |2024-04-12"),
                  ]),
                ),
                tileColor: Colors.grey,
                leading: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    IconButton(
                      // Pasalinimo mygtukas
                      icon: Icon(Icons.ac_unit),
                      onPressed: () => {},
                    ),
                  ],
                ),
              ),
              ListTile(
                // ignore: prefer_const_literals_to_create_immutables
                title: Container(
                  alignment: FractionalOffset.center,
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      // ignore: prefer_const_literals_to_create_immutables
                      children: [
                        Text("Temp: 15, drėgm: 50% "),
                        Text("|2024-04-12"),
                      ]),
                ),
                leading: Row(
                  mainAxisSize: MainAxisSize.min,
                  // ignore: prefer_const_literals_to_create_immutables
                  children: <Widget>[
                    IconButton(
                      icon: Icon(Icons.thermostat),
                      onPressed: () => {},
                    ),                  
                  ],
                ),
              ),
            ListTile(
                // ignore: prefer_const_literals_to_create_immutables
                title: Container(
                  alignment: FractionalOffset.center,
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      // ignore: prefer_const_literals_to_create_immutables
                      children: [
                        Text("Temp: 17, drėgm: 45% "),
                        Text("|2024-04-13"),
                      ]),
                ),
                leading: Row(
                  mainAxisSize: MainAxisSize.min,
                  // ignore: prefer_const_literals_to_create_immutables
                  children: <Widget>[
                    IconButton(
                      icon: Icon(Icons.thermostat),
                      onPressed: () => {},
                    ),                  
                  ],
                ),
              ),
              ListTile(
                // ignore: prefer_const_literals_to_create_immutables
                title: Container(
                  alignment: FractionalOffset.center,
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      // ignore: prefer_const_literals_to_create_immutables
                      children: [
                        Text("Temp: 18, drėgm: 40% "),
                        Text("|2024-04-14"),
                      ]),
                ),
                leading: Row(
                  mainAxisSize: MainAxisSize.min,
                  // ignore: prefer_const_literals_to_create_immutables
                  children: <Widget>[
                    IconButton(
                      icon: Icon(Icons.thermostat),
                      onPressed: () => {},
                    ),                  
                  ],
                ),
              ),
             
            ],
          ),
        ),
      ),
    );
  }
}
