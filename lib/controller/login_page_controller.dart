import 'package:flutter/material.dart';
import 'package:sommelio/repository/repository.dart';

class LoginPageController {
  final Repository repository;
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  LoginPageController({required this.repository});

  void login(String username, String password, context) {
    Navigator.pushNamed(context, '/home');
  }
}