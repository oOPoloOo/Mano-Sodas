import 'package:mano_sodas_final/page_interceptors/pages.interceptor.dart';

import '../constants/constants.dart';
import '../controllers/controllers.dart';
import '../helpers/validator.dart';
import 'package:get/get.dart';

class Go {
  final pCont = PlantsController.to;
   final  GoTo go = new GoTo();
  
    Future<void> plantsAndSetCamActive(String camSerial) async {
   
        await pCont.setCameraActive(camSerial);
        go.Plants();
    }

  }

