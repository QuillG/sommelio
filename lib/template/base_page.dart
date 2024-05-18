import 'package:flutter/material.dart';
import 'package:sommelio/config/app_icons.dart';
import 'package:sommelio/template/custom_header.dart';
import 'package:sommelio/models/user.dart';

class BasePage extends StatefulWidget {
  final Widget body;

  BasePage({required this.body});  // Add 'required this.user'

  @override
  _BasePageState createState() => _BasePageState();
}

class _BasePageState extends State<BasePage> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(120.0),
        child: CustomHeader(),
      ),
      body: widget.body,  // Corrected to match the parameter name
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
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
