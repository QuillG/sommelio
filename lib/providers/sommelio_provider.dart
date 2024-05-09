import 'package:dio/dio.dart';
import 'package:sommelio/models/token_model.dart';
import 'dart:convert' as convert;
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:sommelio/models/user.dart';
import 'package:sommelio/modules/services/authentication_service.dart';
import 'package:sommelio/repository/repository.dart';
import 'package:sommelio/modules/home/home_page.dart';
class SommelioProvider {

  //IMPORTER LE DIO DE MON AUTHENTICATION SERVICE
  final AuthenticationService _authenticationService = AuthenticationService();
  



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

  Future<User> login(String username, String password) async {
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
        return User.fromJson(jsonResponse);
        
      } else {
        return Future.error('Request failed with status: ${response.statusCode}.');
        
      }
    } catch (e) {
      return Future.error(e.toString());
      // Optionally, handle specific error codes here.
    }
  }


  // Future<bool> login(String username, String password) async {
  //   try {
  //     final response = await http.post(
  //       '/User/Login',
  //       data: {
  //         'email': username,
  //         'password': password,
  //       },
  //     );
  //     if (response.statusCode == 200) {
  //       return true;
  //     } else {
  //       return false;
  //     }
  //   } on DioError catch (e) {
  //     if (e.response?.statusCode == 401) {
  //       return Future.error('Invalid credentials');
  //     } else {
  //       return Future.error('Internal server error');
  //     }
  //   } catch (e) {
  //     return Future.error(e.toString());
  //   }
  // }
}