// To parse this JSON data, do
//
//     final userCamerasResponse = userCamerasResponseFromJson(jsonString);

import 'dart:convert';

UserCamerasResponse userCamerasResponseFromJson(String str) => UserCamerasResponse.fromJson(json.decode(str));

String userCamerasResponseToJson(UserCamerasResponse data) => json.encode(data.toJson());

class UserCamerasResponse {
    UserCamerasResponse({
        this.serialNumber,
        this.cameras,
        this.deviceId,
    });

    String? serialNumber;
    List<Camera>? cameras;
    String? deviceId;
    //Cia turi tik viena elemen elementa M11C1,  toliau neskaito, nes razinami tik Camera formato duom
    factory UserCamerasResponse.fromJson(Map<String, dynamic> json) => UserCamerasResponse(
        serialNumber: json["serialNumber"],
        cameras: List<Camera>.from(json["cameras"].map((x) => Camera.fromJson(x))),
        deviceId: json["device_Id"],
    );

    Map<String, dynamic> toJson() => {
        "serialNumber": serialNumber,
        "cameras": List<dynamic>.from(cameras!.map((x) => x.toJson())),
        "device_Id": deviceId,
    };
}

class Camera {
    Camera({
        this.camSerialNumber,
        this.id,
        this.assigned,
    });

    String? camSerialNumber;
    String? id;
    bool? assigned;

    factory Camera.fromJson(Map<String, dynamic> json) => Camera(
        camSerialNumber: json["camSerialNumber"],
        id: json["id"],
        assigned: json["assigned"],
    );

    Map<String, dynamic> toJson() => {
        "camSerialNumber": camSerialNumber,
        "id": id,
        "assigned": assigned,
    };
}
