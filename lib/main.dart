import 'package:flutter/material.dart';
import 'package:sommelio/models/user.dart';
import 'package:sommelio/modules/home/home_pages.dart';
import 'package:sommelio/modules/login/login_page.dart';
import 'package:sommelio/modules/openingPage/open_page.dart';
import 'package:sommelio/template/base_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Navigation',
      theme: ThemeData(
        // Définir la couleur de fond ici
        scaffoldBackgroundColor: Colors.white, // Fond blanc #FFFFFF
        // Si nécessaire, définissez d'autres propriétés de thème ici
        // Par exemple, la couleur du texte, la police, etc.
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => OpenPage(),
        '/login': (context) => LoginPage(),
      },
      onGenerateRoute: (RouteSettings settings) {
        if (settings.name == '/home') {
          final user = settings.arguments as User;
          return MaterialPageRoute(
            builder: (context) {
              return HomePage(user: user);
            },
          );
        }
        if (settings.name == '/basePage') {
          final user = settings.arguments as User;
          return MaterialPageRoute(
            builder: (context) {
              return BasePage(user: user);
            },
          );
        }
      },
    );
  }
}
