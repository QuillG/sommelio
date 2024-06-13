
import 'package:sommelio/models/Wines.dart';
import 'package:sommelio/models/delicacies.dart';
import 'package:sommelio/models/resumeEvent.dart';
import 'package:sommelio/models/user.dart';
import 'package:sommelio/models/wine_type.dart';
import 'package:sommelio/services/authentication_service.dart';
import 'package:sommelio/services/event_service.dart';
import 'package:sommelio/services/wine_search_service.dart';

class Repository {
  final AuthenticationService authService;
  final WineSearchService wineSearchService;
  final EventsService eventService;
  Repository(this.authService, this.wineSearchService, this.eventService);

  Future<User> login(String username, String password) async {
    return authService.login(username, password);
  }

  Future<User> register(String name, String surname, String email, String password, String userType) async {
    return authService.registerUser(name, surname, email, password, userType);
  }

  Future<List<WineType>> getWineTypes() async {
    return wineSearchService.getWineTypes();
  }

  Future<List<Delicacies>> getMainDelicacies() async {
    return wineSearchService.getMainDelicacies();
  }

  Future<List<Delicacies>> getSubDelicacies(int mainId) async {
    return wineSearchService.getSubDelicacies(mainId);
  }

  Future<List<ResumeEvent>> getEvents() async {
    return eventService.getAllResumeEvents() ;
  }

  Future<List<Wines>> getWinesDelicacies(int mainId) async {
    return wineSearchService.getWinesDelicacies(mainId);
  }

  Future<List<Wines>> getWinesByString(String search) async {
    return wineSearchService.getWinesByString(search);
  }

  Future<List<Wines>> getAllWines() async {
    return wineSearchService.getAllWines();
  }

  Future<bool> addWineToFavorite(int userId, int wineId) async {
    return wineSearchService.AddWineToFavorite(userId, wineId);
  }

  Future<List<Wines>> getFavoriteWine(int userId) async {
    return wineSearchService.getFavoriteWine(userId);
  }


}