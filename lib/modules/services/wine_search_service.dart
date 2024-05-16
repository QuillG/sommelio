import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:sommelio/models/delicacies.dart';
import 'package:sommelio/models/user.dart';
import 'dart:convert' as convert;

import 'package:sommelio/models/wine_type.dart';

class WineSearchService {
final String baseUrl = 'localhost:44335';

  Future<List<WineType>> getWineTypes() async {
    var url = Uri.https(baseUrl, '/WineType');
    print(url);
    try {
      var response = await http.get(
        url,
        headers: {'Content-Type': 'application/json'}, // Set Content-Type
      );

      if (response.statusCode == 200) {
        var jsonResponse = convert.jsonDecode(response.body);
        List<WineType> wineTypes = [];
        for (var wineType in jsonResponse) {
          wineTypes.add(WineType.fromJson(wineType));
        }
        return wineTypes;
      } else {
        return Future.error('Échec');
      }
    } catch (e) {
      // Gérer les erreurs ici
      throw Exception(e.toString());
    }
  }

  Future<List<Delicacies>> getPrincipalDelicacies() async {
    var url = Uri.https(baseUrl, '/Delicacies/Principal');
    print(url);
    try {
      var response = await http.get(
        url,
        headers: {'Content-Type': 'application/json'}, // Set Content-Type
      );

      if (response.statusCode == 200) {
        var jsonResponse = convert.jsonDecode(response.body);
        List<Delicacies> delicacies = [];
        for (var delicacy in jsonResponse) {
          delicacies.add(Delicacies.fromJson(delicacy));
        }
        return delicacies;
      } else {
        return Future.error('Échec');
      }
    } catch (e) {
      // Gérer les erreurs ici
      throw Exception(e.toString());
    }
  }
}