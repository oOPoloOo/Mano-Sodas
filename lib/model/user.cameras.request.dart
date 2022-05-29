// To parse this JSON data, do
//
//     final userCamerasRequest = userCamerasRequestFromJson(jsonString);

import 'dart:convert';

UserCamerasRequest userCamerasRequestFromJson(String str) => UserCamerasRequest.fromJson(json.decode(str));

String userCamerasRequestToJson(UserCamerasRequest data) => json.encode(data.toJson());

class UserCamerasRequest {
    UserCamerasRequest({
       required this.serialNumber,
    });

    String serialNumber;

    factory UserCamerasRequest.fromJson(Map<String, dynamic> json) => UserCamerasRequest(
        serialNumber: json["serialNumber"],
    );

    Map<String, dynamic> toJson() => {
        "serialNumber": serialNumber,
    };
}
