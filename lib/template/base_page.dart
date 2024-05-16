import 'package:flutter/material.dart';
import 'package:sommelio/config/app_icons.dart';
import 'package:sommelio/template/custom_header.dart';

class BasePage extends StatefulWidget {
  final Widget body;

  BasePage({required this.body});

  @override
  _BasePageState createState() => _BasePageState();
}

class _BasePageState extends State<BasePage> {
  @override
   Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(100.0),
        child: CustomHeader(),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Image.asset(
              AppIcons.bottomBarHome,
              width: 24,
              height: 24,
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              AppIcons.bottomBarHeart,
              width: 30,
              height: 30,
            ),
            label: 'Heart',
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              AppIcons.bottomBarMap,
              width: 24,
              height: 24,
            ),
            label: 'Nav',
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              AppIcons.bottomBarProfile,
              width: 30,
              height: 30,
            ),
            label: 'Profil',
          ),
        ],
        currentIndex: 0,
        onTap: null,
        showSelectedLabels:
            false, // Ne montre pas le label de l'item sélectionné
        showUnselectedLabels:
            false, // Ne montre pas le label des items non-sélectionnés
      ),
      body: Padding(
        padding: const EdgeInsets.all(
            16.0), // Change this value to adjust the padding
        child: widget.body,
      ),
    );
  }
}