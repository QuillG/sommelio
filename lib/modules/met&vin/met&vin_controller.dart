import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sommelio/models/delicacies.dart';
import 'package:sommelio/services/authentication_service.dart';
import 'package:sommelio/services/event_service.dart';
import 'package:sommelio/services/wine_search_service.dart';
import 'package:sommelio/repository/repository.dart';
import 'package:sommelio/widget/btn.dart';

class MetVinController {
  late Repository repository =
      Repository(AuthenticationService(), WineSearchService(), EventsService());

  Future<List<Delicacies>> getSubDelicacies(int mainId) async {
    return await repository.getSubDelicacies(mainId);
  }


  Future<List<Btn>> btnSubDelicaces(int mainId) async {
    List<Btn> btns = [];
    List<Delicacies> delicacies = await getSubDelicacies(mainId);
    for (var delicacy in delicacies) {
      // construire des boutton
      btns.add(Btn(
        text: delicacy.name,
        colorBtn: Color(int.parse(delicacy.colorBtn)),
        width: 200,
        height: 300,
      ));
    }
    return btns;
  }

}
