import 'package:flutter/material.dart';
import 'package:sommelio/models/user.dart';
import 'package:sommelio/modules/Profile/profile_page.dart';
import 'package:sommelio/modules/home/home_page.dart';
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
    // make a dev config for redirect directly on profile page
    // final User user = User(
    //   name: 'John',
    //   email: 'JohnDoe@gmail.com',
    //   surname: 'Doe',
    //   profilePictureUrl: 'assets/Photos/PhotoProfil.webp',
    //   fidelityGrade: 'Newbie',
    //   fidelityPoints: 0,
    //   userType: 'Particular',
    // );

    // return MaterialApp(
    //   title: 'Navigation',
    //   initialRoute: '/basePage',
    //   routes: {
    //     '/basePage': (context) => BasePage(user : user),
    //   },
    // );

    return MaterialApp(
      title: 'Navigation',
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
              return BasePage(user : user);
            },
          );
        }
      },
    );
  }
}
