import 'package:flutter/material.dart';
import 'package:sommelio/config/app_fonts.dart';
import 'package:sommelio/config/app_icons.dart';
import 'package:sommelio/models/user.dart';
import 'package:sommelio/modules/home/home_page_controller.dart';
import 'package:sommelio/template/base_page.dart';
import 'package:sommelio/widget/btn.dart';

class HomePage extends StatefulWidget {
  final User user;

  const HomePage({required this.user, Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late HomePageController controller = HomePageController();

  @override
  Widget build(BuildContext context) {
    return BasePage(
      body: Column(
        children: [
          Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Bonjour,',
                      style: TextStyle(
                          fontFamily: AppFonts.avenirRegular, fontSize: 24)),
                  Text(widget.user!.name,
                      style: const TextStyle(
                          fontFamily: AppFonts.avenirHeavy, fontSize: 48, fontWeight: FontWeight.bold)),
                ],
              ),
              Image.asset(
                AppIcons.glasses,
                width: MediaQuery.of(context).size.width * 0.2,
              ),
            ],
          ),
          const Row(
            children: [
              Text(
                "Types de vins ",
                style: TextStyle(
                  fontFamily: AppFonts.avenirHeavy,
                  fontSize: 20,
                ),
              ),
              SizedBox(width: 6.0),
              Icon(Icons.arrow_right_alt_outlined,
                  color: Colors.black, size: 24.0)
            ],
          ),
          const SizedBox(height: 12.0),
          FutureBuilder<List<Btn>>(
            future: controller.btnWineTypes(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return CircularProgressIndicator();
              } else if (snapshot.hasError) {
                return Text('Erreur : ${snapshot.error}');
              } else if (snapshot.hasData) {
                return SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: snapshot.data!
                        .map((btn) => Padding(
                              padding: const EdgeInsets.only(right: 8.0),
                              child: btn,
                            ))
                        .toList(),
                  ),
                );
              } else {
                return Text('Aucun type de vin disponible');
              }
            },
          ),
          const SizedBox(height: 50.0),
          const Row(
            children: [
              Text(
                "Accords Mets & Vins ",
                style: TextStyle(
                  fontFamily: AppFonts.avenirHeavy,
                  fontSize: 20,
                ),
              ),
              SizedBox(width: 6.0),
              Icon(Icons.arrow_right_alt_outlined,
                  color: Colors.black, size: 24.0)
            ],
          ),
          const SizedBox(height: 12.0),
          FutureBuilder<List<Btn>>(
            future: controller.btnPrincipalDelicaces(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return CircularProgressIndicator();
              } else if (snapshot.hasError) {
                return Text('Erreur : ${snapshot.error}');
              } else if (snapshot.hasData) {
                return SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: snapshot.data!
                        .map((btn) => Padding(
                              padding: const EdgeInsets.only(right: 8.0),
                              child: btn,
                            ))
                        .toList(),
                  ),
                );
              } else {
                return Text('Aucun type de vin disponible');
              }
            },
          ),
        ],
      ),
    );
  }
}
