
import 'dart:convert';

import 'package:coolstuff_market/src/dto/user.dart';
import 'package:coolstuff_market/src/repository/authentication/authentication_repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;


class SignUpController extends GetxController {

  static SignUpController get instance =>Get.find();
  final email = TextEditingController();
  final password = TextEditingController();
  final fullname = TextEditingController();
  final phoneNo = TextEditingController();
  final dob = TextEditingController();
  final address = TextEditingController();
  final city = TextEditingController();


  Future<bool> registerUser(String email, String password, UserApp user) async {
    String? error =AuthenticationRepository.instance.createUserWithEmailAndPassword(email, password) as String?;




    if(error != null){
      Get.showSnackbar(GetSnackBar(message: error.toString()));
      return true;
    }else{
      return false;
    }

  }

  void phoneAuthentication(String phoneNo) {
    AuthenticationRepository.instance.phoneAuthentication(phoneNo);
  }


}

