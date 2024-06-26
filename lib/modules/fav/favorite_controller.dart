import 'package:sommelio/models/Wines.dart';
import 'package:sommelio/models/delicacies.dart';
import 'package:sommelio/services/authentication_service.dart';
import 'package:sommelio/services/event_service.dart';
import 'package:sommelio/services/wine_search_service.dart';
import 'package:sommelio/repository/repository.dart';

class FavoriteController {
  late Repository repository =
      Repository(AuthenticationService(), WineSearchService(), EventsService());

  Future<List<Wines>> getFavoriteWine(int userId) async {
    return await repository.getFavoriteWine(userId);
  }

}
