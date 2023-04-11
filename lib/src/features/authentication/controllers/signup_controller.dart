
import 'package:coolstuff_market/src/repository/authentication/authentication_repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';


class SignUpController extends GetxController {

  static SignUpController get instance =>Get.find();
  final email = TextEditingController();
  final password = TextEditingController();
  final fullname = TextEditingController();
  final phoneNo = TextEditingController();
  final dob = TextEditingController();
  final address = TextEditingController();
  final city = TextEditingController();


  void registerUser(String email, String password){
    AuthenticationRepository.instance.createUserWithEmailAndPassword(email, password);

  }
}

