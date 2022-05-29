// matching various patterns for kinds of data
// ignore_for_file: curly_braces_in_flow_control_structures

import 'dart:ffi';

import 'package:get/get.dart';

class Validator {
  Validator();

  String? email(String? value) {
    String pattern = r'^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+';
    RegExp regex = RegExp(pattern);
    if (!regex.hasMatch(value!))
      return 'Netinkamas el.pašto formatas'.tr;
    else
      return null;
  }

  String? password(String? value) {
    String pattern = r'^.{8,}$';
    RegExp regex = RegExp(pattern);
    if (!regex.hasMatch(value!))
      return 'Netinkamas slaptažodžio formatas'.tr;
    else
      return null;
  }

  String? name(String? value) {
    String pattern = r"^[a-zA-Z]+(([',. -][a-zA-Z ])?[a-zA-Z]*)*$";
    RegExp regex = RegExp(pattern);
    if (!regex.hasMatch(value!))
      return 'validator.name'.tr;
    else
      return null;
  }

  String? number(String? value) {
    String pattern = r'^\D?(\d{3})\D?\D?(\d{3})\D?(\d{4})$';
    RegExp regex = RegExp(pattern);
    if (!regex.hasMatch(value!))
      return 'validator.number'.tr;
    else
      return null;
  }

  String? amount(String? value) {
    String pattern = r'^\d+$';
    RegExp regex = RegExp(pattern);
    if (!regex.hasMatch(value!))
      return 'validator.amount'.tr;
    else
      return null;
  }

  String? notEmpty(String? value) {
    String pattern = r'^\S+$';
    RegExp regex = RegExp(pattern);
    if (!regex.hasMatch(value!))
      return 'Laukas negali būti tuščias'.tr;
    else
      return null;
  }

  ///Metodai for controllers
    emailControl(String? value) {
    String pattern = r'^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+';
    RegExp regex = RegExp(pattern);
    if (!regex.hasMatch(value!))
      return false ;
    else
      return true;
  }
}
