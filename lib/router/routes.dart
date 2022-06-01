import 'package:flutter/material.dart';
// import 'package:go_router/go_router.dart';
// import '../ui/create_account.dart';
// // import '../ui/error_page.dart';
// import '../ui/home_screen.dart';
// import '../constants.dart';
// import '../login_state.dart';
// import '../ui/login.dart';
// import '../ui/plants_screen.dart';
// import '../ui/calendar_screen.dart';
// import '../ui/history_screen.dart';
// import '../ui/settings_screen.dart';
// import '../ui/tips_screen.dart';

import 'package:get/get.dart';
import 'package:mano_sodas_final/screens/ui.dart';
import 'package:mano_sodas_final/screens/auth/auth.dart';
import 'package:mano_sodas_final/constants/constants.dart';
import '../middleware/login.state.dart';
import '../middleware/relogin.action.dart';

class AppRoutes {
  AppRoutes._(); //this is to prevent anyone from instantiating this object
  static final routes = [
    //Custom middleware neveikia
    GetPage(name: loginRouteName, page: () => LoginView()/*, middlewares: [ReloginMiddleware()]*/),
    GetPage(name: createAccountRouteName, page: () => RegisterView()/*,middlewares: [ReloginMiddleware()]*/),
    GetPage(name: plantsRouteName, page: () => PlantsScreen()),
    GetPage(name: calendarRouteName, page: () => CalendarScreen()),
    GetPage(name: historyRouteName, page: () => HistoryScreen()),
    GetPage(name: settingsRouteName, page: () => SettingsScreen()),
    GetPage(name: addPlantRouteName, page: () => AddPlantScreen()),
    GetPage(name: tipsRouteName, page: () => TipsScreen()),


    GetPage(
        name: homeRouteName,
        page: () => HomeScreen(),
        middlewares: [AuthMiddleware()], // visada kai bus kvieciams home, pries tai bus iskviesta authMid
        ),

    
  ];
}


