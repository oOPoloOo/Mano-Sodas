// To parse this JSON data, do
//
//     final userData = userDataFromJson(jsonString);

import 'dart:convert';

UserData userDataFromJson(String str) => UserData.fromJson(json.decode(str));

String userDataToJson(UserData data) => json.encode(data.toJson());

class UserData {
    // UserData({ // Original
    //   required  this.emailAddress,
    //   required  this.password,
    // });

    UserData({
        this.emailAddress = "",
        this.password = "",
    });

    String emailAddress;
    String password;

    factory UserData.fromJson(Map<String, dynamic> json) => UserData(
        emailAddress: json["emailAddress"],
        password: json["password"],
    );

    Map<String, dynamic> toJson() => {
        "emailAddress": emailAddress,
        "password": password,
    };
}