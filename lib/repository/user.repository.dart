import 'package:mano_sodas_final/model/user.cameras.response.dart';
import 'package:mano_sodas_final/model/user.register.request.dart';
import 'package:mano_sodas_final/model/userdata.login.request.dart';
// import '../api/client.dart' as client;
import '../services/user.service.dart';
import '../model/user.registered.response.model.dart';
import 'package:dio/dio.dart';
import 'package:mano_sodas_final/api/client.dart';


class UserRepository {
  //kas yra late
  late Dio apiClient;
  //arba db
  //arba sharedpreferences
 
  UserRepository() {
    apiClient = client();
    //Cia nurodyt kitus saltinius jei butu
  }

  //Future - kai naudoji await async
  Future loginUser(UserData userData) async {
    Response response = await login(apiClient, userData.toJson());
    //sekmingai prisijungus grazina: 201
    return response;
  }

  //Gaunami  userRegistered itraukia ir  user duomenis
  //Future<UserRegistered> - kai grazinamas json objektas, kuri reikia mappint
  Future registerUser(UserRegistrationReq userRegistered) async {
    
    Response response = await register(apiClient, userRegistered.toJson());  
    return response;
    // model maps json response data to data class and otherwise
    // return UserRegisteredResponse.fromJson(response.data);
  }


  Future<List<Camera>> getAllUserCameras(String devSerial) async {
    Response response = await getUserCameras(apiClient, devSerial);
    
    ///DERBU!!!!!!!!!!!!!!!!!
 logger.d(response);
  //Meta klaida nes grazina tik kameras (Camera), o bandau priskirt ir irangini (UserCamerasResponse)
  //bet kazkuriuo metu pasidaro prieinama inirenginio info : id, serial
    return List<Camera>.from(
      (response.data).map((json) => Camera.fromJson(json)),
    );
  }

  // Future<List<Framework>> fetchAllFrameworks() async {
  //   Response response = await fetchAll(apiClient);
  //   return List<Framework>.from(
  //     (response.data).map((json) => Framework.fromJson(json)),
  //   );
  // }

  // Future<List<Framework>> fetchFramework(String objectId) async {
  //   Response response = await fetch(apiClient, objectId);
  //   return List<Framework>.from(
  //     (response.data).map((json) => Framework.fromJson(json)),
  //   );
  // }

  // Future<Framework> addFramework(Framework framework) async {
  //   Response response = await add(apiClient, framework.toJson());
  //   return Framework.fromJson(response.data);
  // }

  // Future<Response> deleteFramework(String objectId) async {
  //   return await delete(apiClient, objectId);
  // }

  // Future<Response> updateFramework(String objectId, Framework framework) async {
  //   return await update(apiClient, objectId, framework.toJson());
  // }

  // Future<Response> uploadImage(String path, String fileName) async {
  //   return await postImage(apiClient, path, fileName);
  // }
}

// Decides where data is coming from (API, Shared preferences, database)
// Now getting from one source