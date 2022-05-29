// ignore_for_file: unused_local_variable, dead_code

import 'dart:io';
import "../model/user.cameras.request.dart";
import 'package:dio/dio.dart';

Future<Response> login(Dio dio, Map<String, dynamic> data) {
  return dio.post("auth/login", data: data);
}

Future<Response> register(Dio dio, Map<String, dynamic> data) {
  print("Services: Inside register ");
  return dio.post("users/create", data: data);
}

// Future<Response> getUserCameras(Dio dio) {
//   return dio.post("device/camera/all/user");
// }

Future<Response> getUserCameras(Dio dio, String camSerialNumber) async {
  // return dio.post("device/camera/all/user", data: camSerialNumber); 


//Variantas 2
  Response response = await dio.post("device/camera/all/user",
    options: Options(headers: {
      HttpHeaders.contentTypeHeader: "application/json",
    }),
    data: {'serialNumber': camSerialNumber}
  );
  return response;
  // luzo: unexpected token M at json poziition 0 ? 
}


// Future<Response> fetchAll(Dio dio) {
//   return dio.get("/data/frameworks");
// }

// Future<Response> fetch(Dio dio, String objectId) {
//   return dio.get("/data/frameworks/$objectId");
// }

// Future<Response> add(Dio dio, Map<String, dynamic> data) {
//   return dio.post("/data/frameworks", data: data);
// }

// Future<Response> delete(Dio dio, String objectId) {
//   return dio.delete("/data/frameworks/$objectId");
// }

// Future<Response> update(Dio dio, String objectId, Map<String, dynamic> data) {
//   return dio.put("/data/frameworks/$objectId", data: data);
// }

// Future<Response> postImage(Dio dio, String path, String fileName) {
// // https://api.backendless.com/<application-id><REST-api-key>/files/<path>/<filename>?overwrite=true
//   return dio.post("/files/$path/$fileName?overwrite=true");
// }

//Gets data from API