import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:sommelio/models/particular.dart';
import 'package:sommelio/models/professional.dart';
import 'package:sommelio/models/user.dart';
import 'dart:convert' as convert;

class AuthenticationService {
final String baseUrl = 'localhost:44335';


  Future<User> login(String username, String password) async {
    var url = Uri.https(baseUrl, '/User/Login');
    print(url);
    try {
      var response = await http.post(
        url,
        headers: {'Content-Type': 'application/json'}, // Set Content-Type
        body: jsonEncode({'email': username, 'password': password}),
      );

      if (response.statusCode == 200) {
        // Authentification réussie
        var jsonResponse = convert.jsonDecode(response.body);
        return User.fromJson(jsonResponse);
      } else {
        // Échec de l'authentification
        return Future.error('Échec de l\'authentification');
      }
    } catch (e) {
      // Gérer les erreurs ici
      throw Exception(e.toString());
    }
  }
  
  Future<User> registerUser (String name, String surname, String email, String password, String userType) async {
    var url = Uri.https(baseUrl, '/User/AddUser');
    print(url);
    try {
      var response = await http.post(
        url,
        headers: {'Content-Type': 'application/json'}, // Set Content-Type
        body: jsonEncode({'name': name, 'surname': surname, 'email': email, 'password': password, 'userType': userType}),
      );

      if (response.statusCode == 200) {
        // Authentification réussie
        var jsonResponse = convert.jsonDecode(response.body);
        return User.fromJson(jsonResponse);
      } else {
        // Échec de l'authentification
        return Future.error('Échec de l\'authentification');
      }
    } catch (e) {
      // Gérer les erreurs ici
      throw Exception(e.toString());
    }
  }

  // Future<Professional> registerProfessional (String name, String surname, String email, String password) async {
  //   var url = Uri.https(baseUrl, '/User/AddProfessional');
  //   print(url);
  //   try {
  //     var response = await http.post(
  //       url,
  //       headers: {'Content-Type': 'application/json'}, // Set Content-Type
  //       body: jsonEncode({'name': name, 'surname': surname, 'email': email, 'password': password, 'professionalType': 'Caviste'}),
  //     );

  //     if (response.statusCode == 200) {
  //       // Authentification réussie
  //       var jsonResponse = convert.jsonDecode(response.body);
  //       return Professional.fromJson(jsonResponse);
  //     } else {
  //       // Échec de l'authentification
  //       return Future.error('Échec de l\'authentification');
  //     }
  //   } catch (e) {
  //     // Gérer les erreurs ici
  //     throw Exception(e.toString());
  //   }
  // }
}