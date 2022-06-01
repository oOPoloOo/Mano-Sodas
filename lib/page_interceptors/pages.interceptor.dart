import '../constants/constants.dart';
import '../controllers/controllers.dart';
import '../helpers/validator.dart';
import 'package:get/get.dart';

class GoTo {
  final plantsController = PlantsController.to;
  final authController = AuthController.to;

  Future<void> Plants() async {
   
    var email = authController.localStorage.read("emailAddress").toString();
    var password = authController.localStorage.read("password").toString();
    var deviceSerial =
        authController.localStorage.read("deviceSerial").toString();
    //var goToPage = false;

    if (Validator().emailControl(email) &&
        password.isNotEmpty &&
        (deviceSerial.isEmpty)) {
      //dev serial future<dynamic> nera dev serial
      var devSerial = await plantsController.findDeviceSerialByUserEmail(email);

      //Atnaujinu deviceSerial reiksme saugykloj
      authController.localStorage.write("deviceSerial", devSerial);
      //Nuskaitau atnaujinta reiksme
      deviceSerial =
          authController.localStorage.read("deviceSerial").toString();
    }
    //Atnaujina duomenis kiekviena kart
    if (deviceSerial.isNotEmpty) {
      await plantsController.getUserCamerasBySerial(deviceSerial);
      //goToPage = true;
    }

    //Gaves duomenis nukreipiu i puslapi
    Get.toNamed(plantsRouteName);
  }
}
