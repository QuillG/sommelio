import 'package:flutter/material.dart';
import 'package:sommelio/models/user.dart';
import 'package:sommelio/modules/Profile/profile_page.dart';
import 'package:sommelio/modules/home/home_pages.dart';

class MyPageController extends ChangeNotifier {
  int _currentIndex = 0;
  final User _user;

  MyPageController(this._user);

  int get currentIndex => _currentIndex;
  User get user => _user;

  void setPageIndex(int index) {
    _currentIndex = index;
    notifyListeners();
  }

  Widget get currentPage {
    switch (_currentIndex) {
      case 0:
        return HomePage(user: _user);
      case 1:
        return ProfilePage(user: _user);
      default:
        return HomePage(user: _user);
    }
  }
}
