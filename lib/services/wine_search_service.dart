
import 'package:http/http.dart' as http;
import 'package:sommelio/models/Wines.dart';
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

  Future<List<Wines>> getWinesDelicacies(int mainId) async {
    var url = BaseUrl.getWinesDelicacies(mainId);
    print(url);
    try {
      var response = await http.get(
        url,
        headers: {'Content-Type': 'application/json'}, // Set Content-Type
      );

      if (response.statusCode == 200) {
        var jsonResponse = convert.jsonDecode(response.body);
        List<Wines> wines = [];
        for (var wine in jsonResponse) {
          wines.add(Wines.fromJson(wine));
        }
        return wines;
      } else {
        return Future.error('Échec');
      }
    } catch (e) {
      // Gérer les erreurs ici
      throw Exception(e.toString());
    }
  }

  Future<List<Wines>> getWinesByString(String search) async {
    var url = BaseUrl.getWinesByString(search);
    print(url);
    try {
      var response = await http.get(
        url,
        headers: {'Content-Type': 'application/json'}, // Set Content-Type
      );

      if (response.statusCode == 200) {
        var jsonResponse = convert.jsonDecode(response.body);
        List<Wines> wines = [];
        for (var wine in jsonResponse) {
          wines.add(Wines.fromJson(wine));
        }
        return wines;
      } else {
        return Future.error('Échec');
      }
    } catch (e) {
      // Gérer les erreurs ici
      throw Exception(e.toString());
    }
  }

  Future<List<Wines>> getAllWines() async {
    var url = BaseUrl.getAllWines();
    print(url);
    try {
      var response = await http.get(
        url,
        headers: {'Content-Type': 'application/json'}, // Set Content-Type
      );

      if (response.statusCode == 200) {
        var jsonResponse = convert.jsonDecode(response.body);
        List<Wines> wines = [];
        for (var wine in jsonResponse) {
          wines.add(Wines.fromJson(wine));
        }
        return wines;
      } else {
        return Future.error('Échec');
      }
    } catch (e) {
      // Gérer les erreurs ici
      throw Exception(e.toString());
    }
  }

  Future<bool> AddWineToFavorite(int userId, int wineId) async {
    var url = BaseUrl.AddWineToFavorite(userId, wineId);
    print(url);
    try {
      var response = await http.post(
        url,
        headers: {'Content-Type': 'application/json'}, // Set Content-Type
        body: convert.jsonEncode({
          'wineId': wineId,
          'userId': userId,
        }),
      );

      if (response.statusCode == 200) {
        return true;
      } else {
        Future.error('Échec');
        return false;
        
      }
    } catch (e) {
      // Gérer les erreurs ici
      throw Exception(e.toString());
    }
  }

  Future<List<Wines>> getFavoriteWine(int userId) async {
    var url = BaseUrl.getFavoriteWine(userId);
    print(url);
    try {
      var response = await http.get(
        url,
        headers: {'Content-Type': 'application/json'}, // Set Content-Type
      );

      if (response.statusCode == 200) {
        var jsonResponse = convert.jsonDecode(response.body);
        List<Wines> wines = [];
        for (var wine in jsonResponse) {
          wines.add(Wines.fromJson(wine));
        }
        return wines;
      } else {
        return Future.error('Échec');
      }
    } catch (e) {
      // Gérer les erreurs ici
      throw Exception(e.toString());
    }
  }
}