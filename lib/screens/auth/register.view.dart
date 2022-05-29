// ignore_for_file: deprecated_member_use, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart' as getx;
import 'package:mano_sodas_final/controllers/controllers.dart';
import 'dart:core';

import "package:mano_sodas_final/helpers/helpers.dart";
import 'package:mano_sodas_final/screens/auth/login.view.dart';

// import '../../controllers/auth.controller.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class RegisterView extends StatelessWidget {

  TextEditingController sharedDeviceSerialController = TextEditingController();
  final AuthController authController = AuthController.to;
  final PlantsController plantController = PlantsController.to;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  Widget _buildEmail() {
    return TextFormField(
      decoration: InputDecoration(labelText: 'Paštas'),
      validator: Validator().email,
      controller: authController.emailController,
    );
  }

  Widget _buildPassword() {
    return TextFormField(
      decoration: InputDecoration(labelText: 'Slaptažodis'),
      keyboardType: TextInputType.visiblePassword,
      validator: Validator().password,
      controller: authController.passwordController,
    );
  }

// Neigyvendintas
  Widget _buildDeviceID() {
    return TextFormField(
      decoration: InputDecoration(labelText: 'Prietaiso numeris'),
      maxLength: 8,
      validator: Validator().notEmpty,
      //controller: authController.deviceSerialController,
      controller: sharedDeviceSerialController
    );
  }

  Widget _buildCity() {
    return TextFormField(
      decoration: InputDecoration(labelText: 'Sodo: Miestas'),
      maxLength: 10,
      validator: Validator().notEmpty,
      controller: authController.cityController,
    );
  }

  Widget _buildState() {
    return TextFormField(
      decoration: InputDecoration(labelText: 'Sodo: Valstybe'),
      maxLength: 10,
      validator: Validator().notEmpty,
      controller: authController.stateController,
    );
  }

  Widget _buildStreetAddress() {
    return TextFormField(
      decoration: InputDecoration(labelText: 'Sodo: Gatves adresas'),
      maxLength: 20,
      //validator: Validator().notEmpty,
      //Taip neveik
      // onSaved:(value)  => authController.streetAddressController.text = value!,
      controller: authController.streetAddressController,
    );
  }

  static showSnackBarRegister(String guiMsg, String error) {
    getx.Get.snackbar(
      guiMsg,
      error,
      snackPosition: getx.SnackPosition.BOTTOM,
       duration: const Duration(seconds: 6) 
      // animationDuration: Duration(seconds: 10)// lagina ir nevisada islenda iki galo
    );
  }  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Registracija"),
        // leading: IconButton(onPressed: () => getx.Get.toNamed("/login"), icon: Icon(Icon)),
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.all(24),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                _buildEmail(),
                _buildPassword(),
                _buildDeviceID(),
                _buildState(),
                _buildCity(),
                _buildStreetAddress(),
                SizedBox(height: 10),
                RaisedButton(
                  child: Text(
                    'Registruotis',
                    style: TextStyle(color: Colors.blue, fontSize: 16),
                  ),
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                       _formKey.currentState!.save();

                      //Pakeiciau
                       authController.deviceSerialController.text = sharedDeviceSerialController.text;
                       plantController.deviceSerialController.text = sharedDeviceSerialController.text;

                      authController.createAccount(); // debug
                    }

                   

                    // print(_name);
                    // print(_email);
                    // print(_phoneNumber);
                    // print(_url);
                    // print(_password);
                    // print(_calories);

                    //Send to API
                  },
                ),
                Row(
                  // ignore: sort_child_properties_last
                  children: <Widget>[
                    const Text('Esi užsiregistravęs?'),
                    TextButton(
                        child: const Text(
                          'Prisijungti',
                          style: TextStyle(fontSize: 20),
                        ),
                        onPressed: () => getx.Get.off(LoginView()) // i login
                        )
                  ],
                  mainAxisAlignment: MainAxisAlignment.center,
                ),
                SizedBox(height: 30.0), //tarpas
                getx.Obx(() => Visibility(
                      // ignore: sort_child_properties_last
                      child: SpinKitFadingCube(
                        // Loading item
                        size: 80,
                        color: Colors.blueGrey,
                      ),
                       visible: authController.loadingVisible.value,                     
                    )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
