import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:flutter/services.dart';
import 'package:mano_sodas_final/repository/home.bindings.dart';
import 'package:mano_sodas_final/repository/user.repository.dart';

// import 'model/user.register.request.dart';
import 'controllers/auth.controller.dart';
import 'controllers/plants.controller.dart';
import 'router/routes.dart';
import 'package:get_storage/get_storage.dart';

void main() async {
  // await Firebase.initializeApp();
  //await GetStorage.init();

  WidgetsFlutterBinding.ensureInitialized();
  Get.lazyPut(() => UserRepository(), fenix: true);
  Get.lazyPut(() => PlantsController(), fenix: true);
  Get.lazyPut(() => AuthController(), fenix: true);
  await GetStorage.init();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // class MyApp extends StatelessWidget { // ne del to snack bar nepasirdo
  //final AuthController authController = AuthController.to;

// Nustato telefono ekrano padeti
  @override
  void initState() {
    super.initState();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    final AuthController authController = AuthController.to;    
  }

//iseinant is programeles ja atstato
  @override
  dispose() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    //Prisijungia auto, jei neatsijunges

    //uzkrauna paveiksliuka is anksto
    precacheImage(const AssetImage("Images/appleTree.jpg"), context);
    return GetMaterialApp(
      // home: Home(),
      //initialBinding: HomeBinding(),
      theme: ThemeData(
        accentColor: Colors.purpleAccent,
        primaryColor: Colors.purple,
      ),
      getPages: AppRoutes.routes,
      initialRoute: '/home',
    );
  }
}
