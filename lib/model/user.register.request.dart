// To parse this JSON data, do
//
//     final userData = userDataFromJson(jsonString);

import 'dart:convert';

UserRegistrationReq userDataFromJson(String str) =>
    UserRegistrationReq.fromJson(json.decode(str));

String userDataToJson(UserRegistrationReq data) => json.encode(data.toJson());

class UserRegistrationReq {
  UserRegistrationReq({
    // Original

    required this.emailAddress,
    required this.password,
    required this.deviceSerial,
    required this.city,
    required this.state,
    required this.streetAddress,
  });

  // UserRegistrationReq({
  //   this.emailAddress = "",
  //   this.password = "",
  //   this.city = "",
  //   this.state = "",
  //   this.streetAddress = "",
  // });

  String emailAddress;
  String password;
  String deviceSerial;
  String city;
  String state;
  String streetAddress;

  factory UserRegistrationReq.fromJson(Map<String, dynamic> json) =>
      UserRegistrationReq(
        emailAddress: json["emailAddress"],
        password: json["password"],
        deviceSerial: json["serialNumber"],
        city: json["city"],
        state: json["state"],
        streetAddress: json["streetAddress"],
      );

  Map<String, dynamic> toJson() => {
        "emailAddress": emailAddress,
        "password": password,
        "city": city,
        "serialNumber": deviceSerial,
        "state": state,
        "streetAddress": streetAddress,
      };
}
