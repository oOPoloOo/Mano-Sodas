// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:mano_sodas_final/controllers/controllers.dart';
import 'package:mano_sodas_final/constants/constants.dart';
import 'package:get/get.dart' as getx;

import '../page_interceptors/pages.interceptor.dart';

class NavDrawer extends StatelessWidget {
  final AuthController authController = AuthController.to;
  final  GoTo go = new GoTo();
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            // ignore: sort_child_properties_last
            child: Text(
              'Side menu',
              style: TextStyle(color: Colors.white, fontSize: 25),
            ),
            decoration: BoxDecoration(
              color: Colors.blue,
              //Neranda paveikslelio
              // image: DecorationImage(
              //     fit: BoxFit.fill,
              //     image: AssetImage('assets/images/cover.jpg'))
            ),
          ),
          ListTile(
            leading: Icon(Icons.photo_camera),
            title: Text('Augalai'),
            onTap: () => go.Plants(),
          ),
          ListTile(
            leading: Icon(Icons.verified_user),
            title: Text('Patarimai'),
            onTap: () => getx.Get.toNamed(tipsRouteName),
          ),
          ListTile(
            leading: Icon(Icons.calendar_today),
            title: Text('Kalendorius'),
            onTap: () => getx.Get.toNamed(calendarRouteName),
          ),
          ListTile(
            leading: Icon(Icons.border_color),
            title: Text('Istorija'),
            onTap: () => getx.Get.toNamed(historyRouteName),
          ),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text('Nustatymai'),
            onTap: () => getx.Get.toNamed(settingsRouteName),
          ),
          ListTile(
            leading: Icon(Icons.exit_to_app),
            title: Text('Atsijungti'),
            onTap: () => {
              // saveLogoutState(context)
              authController.signOut()
              //print('tapped sign out')
            },
          ),
        ],
      ),
    );
  }

  // void saveLogoutState(BuildContext context) {
  // Provider.of<LoginState>(context, listen: false).loggedIn = false;
  // }
}
