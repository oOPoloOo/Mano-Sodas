// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:mano_sodas_final/constants/constants.dart';
import 'package:get/get.dart' as getx;

class SettingsScreen extends StatelessWidget {
  // const Settings({ Key? key }) : super(key: key);

    final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  Widget _buildOldPasword() {
    return TextFormField(
      decoration: InputDecoration(labelText: 'Senas slaptažodis'),
      ///validator: Validator().email,
      //controller: authController.emailController,
    );
  }

  Widget _buildNewPassword() {
    return TextFormField(
      decoration: InputDecoration(labelText: 'Naujas slaptažodis'),
      keyboardType: TextInputType.visiblePassword,
     // validator: Validator().password,
      //controller: authController.passwordController,
    );
  }

  Widget _buildRepeatPassword() {
    return TextFormField(
      decoration: InputDecoration(labelText: 'Pakartoti naują slaptažodį'),
      maxLength: 10,
      //validator: Validator().notEmpty,
      //controller: authController.cityController,
    );
  }

  Widget _buildState() {
    return TextFormField(
      decoration: InputDecoration(labelText: 'Sodo: Valstybė'),
      maxLength: 10,
      //validator: Validator().notEmpty,
     // controller: authController.stateController,
    );
  }

  Widget _buildCity() {
    return TextFormField(
      decoration: InputDecoration(labelText: 'Sodo: Miestas'),
      maxLength: 10,
     // validator: Validator().notEmpty,
      //Taip neveik
      // onSaved:(value)  => authController.streetAddressController.text = value!,
      //controller: authController.streetAddressController,
    );
  }

  Widget _buildStreetAddress() {
    return TextFormField(
      decoration: InputDecoration(labelText: 'Sodo: Gatvės adresas'),
      maxLength: 10,
     // validator: Validator().notEmpty,
      //Taip neveik
      // onSaved:(value)  => authController.streetAddressController.text = value!,
      //controller: authController.streetAddressController,
    );
  }

  

  // Widget _builURL() {
  //   return TextFormField(
  //     decoration: InputDecoration(labelText: 'Url'),
  //     keyboardType: TextInputType.url,
  //     validator: ,
  //     onSaved: (String value) {
  //       _url = value;
  //     },
  //   );
  // }

  // Widget _buildPhoneNumber() {
  //   return TextFormField(
  //     decoration: InputDecoration(labelText: 'Phone number'),
  //     keyboardType: TextInputType.phone,
  //     validator: ,
  //     onSaved: (String value) {
  //       _url = value;
  //     },
  //   );
  // }

  // Widget _buildCalories() {
  //   return TextFormField(
  //     decoration: InputDecoration(labelText: 'Calories'),
  //     keyboardType: TextInputType.number,
  //     validator: ,
  //     onSaved: (String value) {
  //       _calories = value;
  //     },
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
        title: const Text('Nustatymai'),
        // leading: GestureDetector(
        //   onTap: () {
        //     context.goNamed(homeRouteName);
        //   },
        //   child: const Icon(Icons.backspace),
        // ),
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.all(24),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                _buildOldPasword(),
                _buildNewPassword(),
                _buildRepeatPassword(),
                // _buildCity(),
                // _buildStreetAddress(),
                SizedBox(height: 20),
                RaisedButton(
                  child: Text(
                    'Keisti slaptažodį',
                    style: TextStyle(color: Colors.blue, fontSize: 16),
                  ),
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                     // authController.createAccount(); // debug
                    }

                    _formKey.currentState!.save();

                    // print(_name);
                    // print(_email);
                    // print(_phoneNumber);
                    // print(_url);
                    // print(_password);
                    // print(_calories);

                    //Send to API
                  },
                ),               
                 SizedBox(height: 50.0), //tarpas
               _buildState(),
                _buildCity(),
                _buildStreetAddress(),
                // _buildCity(),
                // _buildStreetAddress(),
                SizedBox(height: 20),
                RaisedButton(
                  child: Text(
                    'Keisti sodo adresą',
                    style: TextStyle(color: Colors.blue, fontSize: 16),
                  ),
                  onPressed: () {}
                ),
                   
              ],
            ),
          ),
        ),
      ),
    );
  }
}