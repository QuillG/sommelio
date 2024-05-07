import 'package:dio/dio.dart';
import 'package:sommelio/models/token_model.dart';
import 'dart:convert' as convert;
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:sommelio/models/user.dart';
import 'package:sommelio/repository/repository.dart';
import 'package:sommelio/screen/home_page.dart';
class SommelioProvider {

  final Dio _dio = Dio(
    BaseOptions(
      baseUrl: 'https://120.0.0.1:localhost:44335',
      connectTimeout: const Duration(seconds: 6000),
      receiveTimeout: const Duration(seconds: 6000),
      responseType: ResponseType.json,
      contentType: "application/json"
    ),
  );



  //login
  // Future<tokenModel> login(Map<String, dynamic> map) async {
  //   try {
  //     final response = await _dio.post('/User/Login', data: map);
  //     return tokenModel.fromJson(response.data);
  //   } on DioException catch (e) {
  //     if (e.response?.statusCode == 401) {
  //       return Future.error('Invalid credentials');
  //     } else {
  //       return Future.error('Internal server error');
  //     }
  //   } catch (e) {
  //     return Future.error(e.toString());
  //   }
  // }

  Future<void> login(String username, String password, context) async {
    var url = Uri.https('localhost:44335', '/User/Login');
    try {
      var response = await http.post(
        url,
        headers: {'Content-Type': 'application/json'}, // Set Content-Type
        body: convert.jsonEncode({'email': username, 'password': password}),
      );

      if (response.statusCode == 200) {
        var jsonResponse = convert.jsonDecode(response.body);
        print('Response: $jsonResponse');
        User user = User.fromJson(jsonResponse['user']);
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => HomePage(user: user)));
      } else {
        print('Request failed with status: ${response.statusCode}.');
        showModalBottomSheet(
          context: context,
          builder: (BuildContext context) {
            return Container(
              padding: EdgeInsets.all(16),
              child: const Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'Mot de passe ou nom d\'utilisateur incorrects. Veuillez réessayer.',
                    style: TextStyle(
                      color: Colors.red,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            );
          },
        );
      }
    } catch (e) {
      print('Request failed with error: $e.');
      // Optionally, handle specific error codes here.
    }
  }
}