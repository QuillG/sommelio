import 'package:flutter/material.dart';
import 'package:sommelio/models/user.dart';
import 'package:sommelio/template/base_page.dart';

class ProfilePage extends StatelessWidget {
  final User user;

  ProfilePage({required this.user});

  @override
  Widget build(BuildContext context) {
    return BasePage(
      user: user,
      body: Scaffold(
        body: const Center(
          child: Text('Profile Page'),
        ),
      ),
    );
  }
}
