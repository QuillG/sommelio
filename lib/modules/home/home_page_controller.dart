import 'package:flutter/services.dart';
import 'package:sommelio/models/delicacies.dart';
import 'package:sommelio/models/wine_type.dart';
import 'package:sommelio/modules/services/authentication_service.dart';
import 'package:sommelio/modules/services/wine_search_service.dart';
import 'package:sommelio/repository/repository.dart';
import 'package:sommelio/widget/btn.dart';

class HomePageController {
  late Repository repository =
      Repository(AuthenticationService(), WineSearchService());

  Future<List<WineType>> getWineTypes() async {
    return await repository.getWineTypes();
  }

  Future<List<Delicacies>> getPrincipalDelicacies() async {
    return await repository.getPrincipalDelicacies();
  }

  Future<List<Btn>> btnWineTypes() async {
    List<Btn> btns = [];
    List<WineType> WineTypes = await getWineTypes();
    for (var wineType in WineTypes) {
      // construire des boutton
      btns.add(Btn(
        text: wineType.name,
        colorBtn: Color(int.parse(wineType.colorBtn)),
        width: 100,
        height: 100,
      ));
    }
    return btns;
  }

  Future<List<Btn>> btnPrincipalDelicaces() async {
    List<Btn> btns = [];
    List<Delicacies> delicacies = await getPrincipalDelicacies();
    for (var delicacy in delicacies) {
      // construire des boutton
      btns.add(Btn(
        text: delicacy.name,
        colorBtn: Color(int.parse(delicacy.colorBtn)),
        width: 100,
        height: 100,
      ));
    }
    return btns;
  }
}
