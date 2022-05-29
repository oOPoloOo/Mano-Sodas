import 'package:flutter/material.dart';
import 'package:mano_sodas_final/constants/constants.dart';
import 'package:get/get.dart' as getx;

class TipsScreen extends StatelessWidget {
  // const Tips({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Patarimai'),
        // leading: GestureDetector(
        //   onTap: () {
        //     context.goNamed(homeRouteName);
        //   },
        //   child: const Icon(Icons.backspace),
        // ),
      ),
    );
  }
}