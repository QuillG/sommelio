import 'package:flutter/material.dart';
import 'package:sommelio/config/app_icons.dart';
import 'package:sommelio/modules/Maps/maps_page.dart';
import 'package:sommelio/modules/Profile/profie_page.dart';
import 'package:sommelio/modules/fav/favorite_page.dart';
import 'package:sommelio/modules/home/home_page.dart';
import 'package:sommelio/template/custom_header.dart';
import 'package:sommelio/models/user.dart';

class BasePage extends StatefulWidget {
  final User user;  // Add this line

  BasePage({required this.user});  // Add 'required this.user'

  @override
  _BasePageState createState() => _BasePageState();
}

class _BasePageState extends State<BasePage> {
  int _currentIndex = 0;

  setcurrentIndex(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(120.0),
        child: CustomHeader(),
      ),
      body: [
        HomePage(user: widget.user),
        FavoritePage(),
        MapPage(),
        ProfilePage(user: widget.user)
      ].elementAt(_currentIndex),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) => setcurrentIndex(index),
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Image.asset(
              _currentIndex == 0
                  ? AppIcons.bottomBarHomeActive
                  : AppIcons.bottomBarHome,
              width: 24,
              height: 24,
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              _currentIndex == 1
                  ? AppIcons.bottomBarHeartActive
                  : AppIcons.bottomBarHeart,
              width: 24,
              height: 24,
            ),
            label: 'Heart',
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              _currentIndex == 2
                  ? AppIcons.bottomBarMapActive
                  : AppIcons.bottomBarMap,
              width: 24,
              height: 24,
            ),
            label: 'Maps',
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              _currentIndex == 3
                  ? AppIcons.bottomBarProfileActive
                  : AppIcons.bottomBarProfile,
              width: 24,
              height: 24,
            ),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
