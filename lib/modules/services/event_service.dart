import 'package:http/http.dart' as http;
import 'package:sommelio/models/resumeevent.dart';
import 'dart:convert' as convert;

class EventsService {
final String baseUrl = 'localhost:44335';


  Future<List<ResumeEvent>> getAllResumeEvents() async {
    var url = Uri.https(baseUrl, '/Event/ResumeEvents');
    print(url);
    try {
      var response = await http.get(
        url,
        headers: {'Content-Type': 'application/json'}, // Set Content-Type
      );
      if (response.statusCode == 200) {
        // Authentification réussie
        var jsonResponse = convert.jsonDecode(response.body);
        List<ResumeEvent> events = [];
        for (var event in jsonResponse) {
          ResumeEvent tmpEvent = ResumeEvent.fromJson(event);
          events.add(tmpEvent);
        }
        return events;
      } else {
        // Échec de l'authentification
        return Future.error('Échec de la récupération des événements');
      }
    } catch (e) {
      // Gérer les erreurs ici
      throw Exception(e.toString());
    }
  }
}
