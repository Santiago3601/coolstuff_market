
import 'package:coolstuff_market/src/repository/authentication/authentication_repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';


class LoginController extends GetxController {

  static LoginController get instance =>Get.find();
  final email = TextEditingController();
  final password = TextEditingController();


  void loginWithEmailAndPassword(String email, String password){
    AuthenticationRepository.instance.signInWithEmailAndPassword(email, password) ;

  }
  void logout(){
    AuthenticationRepository.instance.logout();

  }
}

