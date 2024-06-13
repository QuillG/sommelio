import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sommelio/models/delicacies.dart';
import 'package:sommelio/models/resumeEvent.dart';
import 'package:sommelio/models/wine_type.dart';
import 'package:sommelio/services/authentication_service.dart';
import 'package:sommelio/services/event_service.dart';
import 'package:sommelio/services/wine_search_service.dart';
import 'package:sommelio/repository/repository.dart';
import 'package:sommelio/widget/btn.dart';
import 'package:sommelio/widget/resumeEventCase.dart';

class HomePageController {
  late Repository repository =
      Repository(AuthenticationService(), WineSearchService(), EventsService());

  Future<List<WineType>> getWineTypes() async {
    return await repository.getWineTypes();
  }

  Future<List<Delicacies>> getMainDelicacies() async {
    return await repository.getMainDelicacies();
  }

  Future<List<Delicacies>> getSubDelicacies(int mainId) async {
    return await repository.getSubDelicacies(mainId);
  }

  Future<List<Btn>> btnWineTypes() async {
    List<Btn> btns = [];
    List<WineType> WineTypes = await getWineTypes();
    for (var wineType in WineTypes) {
      // construire des boutton
      btns.add(Btn(
        text: wineType.name,
        imgName: wineType.imgName,
        colorBtn: Color(int.parse(wineType.colorBtn)),
        width: 100,
        height: 100,
      ));
    }
    return btns;
  }

  Future<List<Delicacies>> btnPrincipalDelicaces() async {
    List<Delicacies> delicacies = await getMainDelicacies();
    return delicacies;
  }

  Future<List<ResumeEventCase>> getResumeEventCases() async {
    List<ResumeEventCase> resumeEventCases = [];
    List<ResumeEvent> resumeEvents = await repository.getEvents();
    for (var resumeEvent in resumeEvents) {
      var index = resumeEvents.indexOf(resumeEvent);
      resumeEventCases.add(ResumeEventCase(resumeEvent: resumeEvent, index: index));
    }
    return resumeEventCases;
  }
}
