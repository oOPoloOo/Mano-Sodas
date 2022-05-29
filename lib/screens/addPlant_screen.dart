// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart' as getx;
import 'package:mano_sodas_final/constants/constants.dart';

class AddPlantScreen extends StatelessWidget {
  // const Plants({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pridėti augalą'),
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
                title: Column(children: [
                  Text("Nepriskirtos kameros", style: TextStyle(fontSize: 24)),
                ]),
                tileColor: Colors.grey,
              ),
              ListTile(
                // ignore: prefer_const_literals_to_create_immutables
                title: Column(children: [
                  Text("Kamera 1", style: TextStyle(fontSize: 20)),
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
              ),
              ListTile(
                // ignore: prefer_const_literals_to_create_immutables
                title: Column(children: [
                  Text("Kamera 2", style: TextStyle(fontSize: 20)),
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
              ),
              ListTile(
                // ignore: prefer_const_literals_to_create_immutables
                title: Column(children: [
                  Text("Kamera 3", style: TextStyle(fontSize: 20)),
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
              ),
              ListTile(
                // ignore: prefer_const_literals_to_create_immutables
                title: Column(children: [
                  Text("Kamera 4", style: TextStyle(fontSize: 20)),
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
              ),
              SizedBox(height: 70.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: Container(
                      // color: Colors.black,
                      //height: 500,

                      child: const Center(
                        child:
                            //Nuo mano sodas folderio
                            Image(image: AssetImage('Images/appleTreeCroped.jpg'), height: 300,width: 300,),
                        // Image.asset( 'Images/appleTree.jpg'),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
