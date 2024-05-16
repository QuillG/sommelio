
import 'package:sommelio/models/delicacies.dart';
import 'package:sommelio/models/user.dart';
import 'package:sommelio/models/wine_type.dart';
import 'package:sommelio/modules/services/authentication_service.dart';
import 'package:sommelio/modules/services/wine_search_service.dart';

class Repository {
  final AuthenticationService authService;
  final WineSearchService wineSearchService;
  Repository(this.authService, this.wineSearchService);

  Future<User> login(String username, String password) async {
    return authService.login(username, password);
  }

  Future<List<WineType>> getWineTypes() async {
    return wineSearchService.getWineTypes();
  }

  Future<List<Delicacies>> getPrincipalDelicacies() async {
    return wineSearchService.getPrincipalDelicacies();
  }
}