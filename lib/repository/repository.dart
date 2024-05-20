
import 'package:sommelio/models/delicacies.dart';
import 'package:sommelio/models/particular.dart';
import 'package:sommelio/models/professional.dart';
import 'package:sommelio/models/resumeevent.dart';
import 'package:sommelio/models/user.dart';
import 'package:sommelio/models/wine_type.dart';
import 'package:sommelio/modules/services/authentication_service.dart';
import 'package:sommelio/modules/services/event_service.dart';
import 'package:sommelio/modules/services/wine_search_service.dart';

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

  Future<List<Delicacies>> getPrincipalDelicacies() async {
    return wineSearchService.getPrincipalDelicacies();
  }

  Future<List<ResumeEvent>> getEvents() async {
    return eventService.getAllResumeEvents() ;
  }
}