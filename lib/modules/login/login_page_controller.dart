import 'package:flutter/material.dart';
import 'package:sommelio/dataBase/database_helper.dart';
import 'package:sommelio/models/particular.dart';
import 'package:sommelio/models/professional.dart';
import 'package:sommelio/models/user.dart';
import 'package:sommelio/modules/services/authentication_service.dart';
import 'package:sommelio/modules/services/event_service.dart';
import 'package:sommelio/modules/services/wine_search_service.dart';
import 'package:sommelio/repository/repository.dart';

class LoginPageController {
  late DatabaseHelper db = DatabaseHelper.instance;
  late Repository repository = Repository(AuthenticationService(), WineSearchService(), EventsService());
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  Future<User?> login(String username, String password) async {
    User? user = await repository.login(username, password);
    print('User: $user');
    print('coucou');
    // if (user != null) {
    //   await saveUser(user);
    // }
    return user;
  }

  Future<Professional?> registerProfessional(String name, String surname, String username, String password) async {
    Professional user = await repository.registerProfessional(name, surname, username, password);
    print('User: $user');
    // if (user != null) {
    //   await saveUser(user);
    // }
    return user;
  }

  Future<Particular?> registerParticular(String name, String surname, String email, String password) async {
    Particular user = await repository.registerParticular(name, surname, email, password);
    print('User: $user');
    // if (user != null) {
    //   await saveUser(user);
    // }
    return user;
  }

  Future<bool> saveUser(User user) async {
    int response = await db.deleteAllUsers();
    print(response);
    print('utilsateurs supprimés');
    bool isUserSaved = await db.saveUser(user);
    if (isUserSaved) {
      print('Utilisateur enregistré.');
      return true;
    } else {
      print('Erreur lors de l\'enregistrement de l\'utilisateur.');
      return false;
    }
  }

  Future<User?> getUser() async {
    User? user = await db.getUser();
    if (user != null) {
      print('Utilisateur: $user');
    } else {
      print('Aucun utilisateur trouvé.');
    }
    return user;
  }
}
