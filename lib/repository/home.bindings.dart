import 'package:get/get.dart';
import 'package:mano_sodas_final/controllers/controllers.dart';
import 'package:mano_sodas_final/repository/user.repository.dart';

class HomeBinding implements Bindings {
  @override
  void dependencies() {
    // Get.put<AuthController>(AuthController());
    // Get.put<PlantsController>(PlantsController());
    Get.lazyPut(() => UserRepository(), fenix: true);
    Get.lazyPut(() => PlantsController(), fenix: true);
    Get.lazyPut(() => AuthController(), fenix: true);

  }
}
