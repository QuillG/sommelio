import 'package:flutter/material.dart';
import 'package:sommelio/models/Wines.dart';
import 'package:sommelio/models/delicacies.dart';
import 'package:sommelio/models/user.dart';
import 'package:sommelio/modules/home/home_1st_pages.dart';
import 'package:sommelio/modules/home/met&vin_page1.dart';
import 'package:sommelio/modules/home/met&vin_page2.dart';
import 'package:sommelio/modules/home/wine_page.dart';
import 'package:sommelio/modules/resultPage/result_page.dart';
import 'home_page_controller.dart';

class HomePage extends StatefulWidget {
  final User user;
  final Function(Delicacies)? btnDelicaciesClicked;

  const HomePage({required this.user, this.btnDelicaciesClicked, Key? key})
      : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late HomePageController controller = HomePageController();
  late Delicacies? mainDelicacy;
  late Wines? wine;
  late String? search;
  PageController _pageController = PageController();

  @override
  void initState() {
    super.initState();
    wine = null;
    mainDelicacy = null;
    search = null; // Initialisez mainDelicacy à null
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
                btnDelicaciesClicked: (Delicacies delicacy) {
                  setState(() {
                    mainDelicacy = delicacy;
                  });
                  _navigateToPage(2); // Navigate to the second page
                },
              );
            }
          },
        ),
        Builder(
          builder: (context) {
            if (mainDelicacy == null) {
              return Center(child: CircularProgressIndicator());
            } else {
              return MetVinPage2(
                user: widget.user,
                mainDelicacy: mainDelicacy!,
                btnDelicaciesClicked: (Delicacies delicacy) {
                  setState(() {
                    mainDelicacy = delicacy;
                  });
                  _navigateToPage(3); // Navigate to the first page
                },
              );
            }
          },
        ),
        Builder(
          builder: (context) {
            if (mainDelicacy == null) {
              return Center(child: CircularProgressIndicator());
            } else {
              return ResultPage(
                user: widget.user,
                mainDelicacy: mainDelicacy,
                search: search,
                btnWineClicked: (Wines wine) {
                  setState(() {
                    this.wine = wine;
                  });
                  _navigateToPage(4);
                },
              );
            }
          },
        ),
        Builder(
          builder: (context) {
            if (mainDelicacy == null) {
              return Center(child: CircularProgressIndicator());
            } else {
              return WinePage(
                user: widget.user,
                wine: wine!,
              );
            }
          },
        ),
        
      ],
    );
  }
}
