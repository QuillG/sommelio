
import 'package:http/http.dart' as http;
import 'package:sommelio/models/delicacies.dart';
import 'dart:convert' as convert;
import 'package:sommelio/models/wine_type.dart';
import 'package:sommelio/services/base_url.dart';

class WineSearchService {

  Future<List<WineType>> getWineTypes() async {
    var url = BaseUrl.getWineTypes();
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

  Future<List<Delicacies>> getMainDelicacies() async {
    var url = BaseUrl.getMainDelicacies();
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

  Future<List<Delicacies>> getSubDelicacies(int mainId) async {
    var url = BaseUrl.getSubDelicacies(mainId);
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