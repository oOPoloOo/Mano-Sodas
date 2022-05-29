// ignore_for_file: deprecated_member_use, prefer_const_constructors

import 'package:flutter/material.dart';
import 'dart:core';

import "package:mano_sodas_final/helpers/helpers.dart";
import 'package:mano_sodas_final/screens/auth/register.view.dart';

import '../../controllers/auth.controller.dart';
import 'package:get/get.dart' as getx;
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoginView extends StatelessWidget {
  final AuthController aCon = AuthController.to;


  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  // Widget _buildName() {
  //   return TextFormField(
  //     decoration: InputDecoration(labelText: 'Name'),
  //     maxLength: 10,
  //     validator: Validator().name,
  //     onSaved:(value)  => authController.nameController.text = value!,
  //   );
  // }

  Widget _buildEmail() {
    return TextFormField(
      decoration: InputDecoration(labelText: 'Paštas'),
      validator: Validator().email,     
      controller: aCon.emailController,
    );
  }

  Widget _buildPassword() {
    return TextFormField(
      decoration: InputDecoration(labelText: 'Slaptažodis'),
      keyboardType: TextInputType.visiblePassword,
      validator: Validator().password,      
      controller: aCon.passwordController,
    );
  }

  static showSnackBarLogin(String guiMsg, String error) {
    getx.Get.snackbar(
      guiMsg,
      error,
      snackPosition: getx.SnackPosition.BOTTOM,
      duration: const Duration(seconds: 6)
    );
  }

  static showPassRetrievalDialog() {
    getx.Get.defaultDialog(
      title: '',
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(              
              keyboardType: TextInputType.text,
              maxLines: 1,
              decoration: InputDecoration(
                  labelText: 'El. paštas',
                  hintMaxLines: 1,
                  border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.green, width: 4.0))),
            ),
            SizedBox(
              height: 30.0,
            ),
            RaisedButton(
                  child: Text(
                    'Priminti',
                    style: TextStyle(color: Colors.blue, fontSize: 16),
                  ),
                  onPressed: () {}
                ),
          ],
        ),
        radius: 10.0);

  }
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Prisijungimas")),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.all(24),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SizedBox(height: 100.0),
                _buildEmail(),
                _buildPassword(),
                SizedBox(height: 50),
                RaisedButton(
                  child: Text(
                    'Prisijungti',
                    style: TextStyle(color: Colors.blue, fontSize: 16),
                  ),
                  onPressed: () => 
                  {aCon.loginUser(aCon.emailController.text,aCon.passwordController.text)}
                ),
                Row(
                  // ignore: sort_child_properties_last
                  children: <Widget>[
                    const Text('Nori užsiregistruoti?'),
                    TextButton(
                        child: const Text(
                          'Registracija',
                          style: TextStyle(fontSize: 20),
                        ),
                        onPressed: () =>
                            getx.Get.off(RegisterView()) // i register
                        ),
                  ],
                  mainAxisAlignment: MainAxisAlignment.center,
                ),
                 Row(
                  // ignore: sort_child_properties_last
                  children: <Widget>[
                    const Text('Pamiršai slaptažodį?'),
                    TextButton(
                        child: const Text(
                          'Priminti',
                          style: TextStyle(fontSize: 20),
                        ),
                        onPressed: () => showPassRetrievalDialog()
                        ),
                  ],
                  mainAxisAlignment: MainAxisAlignment.center,
                ),
                SizedBox(height: 100.0), //tarpas
                getx.Obx(() => Visibility(
                      // ignore: sort_child_properties_last
                      child: SpinKitFadingCube(
                        size: 100,
                        color: Colors.blueGrey,
                      ),
                      visible: aCon.loadingVisible.value,
                    )),
              ],
              
            ),
          ),
        ),
      ),
    );
  }
}
