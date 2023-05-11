
import 'dart:convert';

import 'package:coolstuff_market/src/dto/user.dart';
import 'package:coolstuff_market/src/repository/authentication/authentication_repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;


class ProfileUpdateController extends GetxController {

  static ProfileUpdateController get instance =>Get.find();

  var fullname = TextEditingController();
  final phoneNo = TextEditingController();
  final dob = TextEditingController();
  final address = TextEditingController();
  final city = TextEditingController();
  final photo = TextEditingController();
  final email = TextEditingController();
  final comment = TextEditingController();


}

