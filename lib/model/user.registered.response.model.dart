// To parse this JSON data, do
//
//     final userRegisteredResponse = userRegisteredResponseFromJson(jsonString);

import 'dart:convert';

UserRegisteredResponse userRegisteredResponseFromJson(String str) => UserRegisteredResponse.fromJson(json.decode(str));

String userRegisteredResponseToJson(UserRegisteredResponse data) => json.encode(data.toJson());

class UserRegisteredResponse {
    UserRegisteredResponse({
        this.emailAddress,
        this.password,
        this.user,
        this.id,
    });

    String? emailAddress;
    String? password;
    User? user;
    String? id;

    factory UserRegisteredResponse.fromJson(Map<String, dynamic> json) => UserRegisteredResponse(
        emailAddress: json["emailAddress"],
        password: json["password"],
        user: User.fromJson(json["user"]),
        id: json["id"],
    );

    Map<String, dynamic> toJson() => {
        "emailAddress": emailAddress,
        "password": password,
        "user": user!.toJson(),
        "id": id,
    };
}

class User {
    User({
        this.state,
        this.city,
        this.streetAddress,
        this.mainDevice,
        this.id,
    });

    String? state;
    String? city;
    String? streetAddress;
    MainDevice? mainDevice;
    String? id;

    factory User.fromJson(Map<String, dynamic> json) => User(
        state: json["state"],
        city: json["city"],
        streetAddress: json["streetAddress"],
        mainDevice: MainDevice.fromJson(json["mainDevice"]),
        id: json["id"],
    );

    Map<String, dynamic> toJson() => {
        "state": state,
        "city": city,
        "streetAddress": streetAddress,
        "mainDevice": mainDevice!.toJson(),
        "id": id,
    };
}

class MainDevice {
    MainDevice({
        this.deviceId,
        this.serialNumber,
    });

    String? deviceId;
    String? serialNumber;

    factory MainDevice.fromJson(Map<String, dynamic> json) => MainDevice(
        deviceId: json["device_Id"],
        serialNumber: json["serialNumber"],
    );

    Map<String, dynamic> toJson() => {
        "device_Id": deviceId,
        "serialNumber": serialNumber,
    };
}
