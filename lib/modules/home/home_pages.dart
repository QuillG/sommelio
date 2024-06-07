import 'package:flutter/material.dart';
import 'package:sommelio/models/delicacies.dart';
import 'package:sommelio/models/user.dart';
import 'package:sommelio/modules/home/home_1st_pages.dart';
import 'package:sommelio/modules/met&vin/met&vin_page.dart';
import 'home_page_controller.dart';

class HomePage extends StatefulWidget {
  final User user;
  final Function(Delicacies)? btnDelicaciesClicked;

  const HomePage({required this.user, this.btnDelicaciesClicked, Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late HomePageController controller = HomePageController();
  late Delicacies? mainDelicacy;
  PageController _pageController = PageController();

  @override
  void initState() {
    super.initState();
    mainDelicacy = null;  // Initialisez mainDelicacy à null
  }

  void _navigateToPage(int pageIndex) {
    _pageController.animateToPage(
      pageIndex,
      duration: Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: _pageController,
      children: [
        Home1stPage(
          user: widget.user,
          btnDelicaciesClicked: (Delicacies delicacy) {
            setState(() {
              mainDelicacy = delicacy;
            });
            _navigateToPage(1); // Navigate to the second page
          },
        ),
        Builder(
          builder: (context) {
            if (mainDelicacy == null) {
              return Center(child: CircularProgressIndicator());
            } else {
              return MetVinPage(
                user: widget.user,
                mainDelicacy: mainDelicacy!,
              );
            }
          },
        ),
      ],
    );
  }
}
