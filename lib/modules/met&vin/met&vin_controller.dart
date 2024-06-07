import 'package:sommelio/models/delicacies.dart';
import 'package:sommelio/services/authentication_service.dart';
import 'package:sommelio/services/event_service.dart';
import 'package:sommelio/services/wine_search_service.dart';
import 'package:sommelio/repository/repository.dart';

class MetVinController {
  late Repository repository =
      Repository(AuthenticationService(), WineSearchService(), EventsService());

  Future<List<Delicacies>> getSubDelicacies(int mainId) async {
    return await repository.getSubDelicacies(mainId);
  }


  Future<List<Delicacies>> btnSubDelicaces(int mainId) async {
    List<Delicacies> delicacies = await getSubDelicacies(mainId);
    return delicacies;
  }

}
