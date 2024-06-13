import 'package:sommelio/models/Wines.dart';
import 'package:sommelio/services/authentication_service.dart';
import 'package:sommelio/services/event_service.dart';
import 'package:sommelio/services/wine_search_service.dart';
import 'package:sommelio/repository/repository.dart';

class ResultController {
  late Repository repository =
      Repository(AuthenticationService(), WineSearchService(), EventsService());


  Future<List<Wines>> getWinesByString(String search) async {
    return await repository.getWinesByString(search);
  }

  Future<List<Wines>> getAllWines() async {
    return await repository.getAllWines();
  }

  Future<List<Wines>> getWinesByDelicacy(int? mainId) async {
    return await repository.getWinesDelicacies(mainId!);
  }
}
