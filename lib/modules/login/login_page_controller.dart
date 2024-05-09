import 'package:flutter/material.dart';
import 'package:sommelio/models/user.dart';
import 'package:sommelio/providers/sommelio_provider.dart';
import 'package:sommelio/repository/repository.dart';

class LoginPageController {
  late Repository repository = Repository(SommelioProvider());
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  

  Future<User> login(String username, String password) {
    return repository.login(username, password);
  }
}