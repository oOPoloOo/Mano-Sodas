// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import '../widgets/side_menu.dart';
import 'package:get/get.dart' as getx;

// ignore: use_key_in_widget_constructors
class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  final appleTree = AssetImage("Images/appleTree.jpg");
 
  /// uzkraunu is anksto
  @override
  void didChangeDependencies() {    
    precacheImage(appleTree, context);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavDrawer(), // Pridedu side meniu
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.lightBlue,
        title: const Text(
          'Mano Sodas',
          style: TextStyle(
              fontSize: 20, fontWeight: FontWeight.w500, color: Colors.white),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.doorbell_rounded, size: 40),
            onPressed: () => {},
          )
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: Container(
                  // reik det i container
                  child: Image(image: appleTree),
                ),
              ),
            ],
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    color: Colors.red,
                    // height: 500,
                    child: Center(
                        child: Text('Temperatūra: 15 °C',
                            style: TextStyle(fontSize: 18))),
                  ),
                ),
                Expanded(
                  child: Container(
                    color: Colors.blue,
                    // height: 500,
                    child: Center(
                        child: Text('Drėgmė: 50 %',
                            style: TextStyle(fontSize: 18))),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
