import 'package:flutter/material.dart';
import 'package:sommelio/config/app-colors.dart';
import 'package:sommelio/config/app_fonts.dart';
import 'package:sommelio/config/app_icons.dart';
import 'package:sommelio/models/delicacies.dart';
import 'package:sommelio/models/user.dart';
import 'package:sommelio/modules/home/home_page_controller.dart';
import 'package:sommelio/template/btn.dart';
import 'package:sommelio/template/resumeEventCase.dart';

class Home1stPage extends StatefulWidget {
  final User user;
  final Function(Delicacies)? btnDelicaciesClicked;

  const Home1stPage({required this.user, this.btnDelicaciesClicked, Key? key}) : super(key: key);

  @override
  State<Home1stPage> createState() => _Home1stPageState();
}

class _Home1stPageState extends State<Home1stPage> {
  late HomePageController controller = HomePageController();

  @override
  Widget build(BuildContext context) {
    Future<List<ResumeEventCase>> eventsFuture = controller.getResumeEventCases();
    Future<List<Btn>> btnWineTypesFuture = controller.btnWineTypes();
    Future<List<Delicacies>> btnPrincipalDelicaciesFuture = controller.btnPrincipalDelicaces();

    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(horizontal: 20.0), // Ajout du padding global à gauche et à droite
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 20.0), // Ajout d'un espace avant le texte "Bonjour"
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start, // Alignement du texte à gauche
                children: [
                  const Text(
                    'Bonjour,', // Texte d'accueil
                    style: TextStyle(
                      fontFamily: AppFonts.avenirRegular, // Police de caractère
                      color: AppColors.black, // Couleur du texte
                      fontSize: 24, // Taille du texte
                    ),
                  ),
                  Text(
                    widget.user.surname, // Nom de l'utilisateur connecté fourni par l'objet User
                    style: const TextStyle(
                      color: AppColors.black,
                      fontFamily: AppFonts.heavitas,
                      fontSize: 48,
                    ),
                  ),
                ],
              ),
              Image.asset(
                AppIcons.glasses,
                width: MediaQuery.of(context).size.width * 0.2,
              ),
            ],
          ),
          const SizedBox(height: 20.0), // Espacement après le texte d'accueil
          const Text(
            "Types de vins ",
            style: TextStyle(
              fontFamily: AppFonts.avenirHeavy,
              fontSize: 20,
            ),
          ),
          const SizedBox(height: 12.0),
          FutureBuilder<List<Btn>>(
            future: btnWineTypesFuture,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const CircularProgressIndicator();
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
                return const Text('Aucun type de vin disponible');
              }
            },
          ),
          const SizedBox(height: 50.0),
          const Text(
            "Accords Mets & Vins ",
            style: TextStyle(
              fontFamily: AppFonts.avenirHeavy,
              fontSize: 20,
            ),
          ),
          const SizedBox(height: 12.0),
          FutureBuilder<List<Delicacies>>(
            future: btnPrincipalDelicaciesFuture,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const CircularProgressIndicator();
              } else if (snapshot.hasError) {
                return Text('Erreur : ${snapshot.error}');
              } else if (snapshot.hasData) {
                return SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: snapshot.data!
                        .map((delicacy) => Padding(
                              padding: const EdgeInsets.only(right: 8.0),
                              child: Btn(
                                text: delicacy.name,
                                imgName: delicacy.imgName,
                                colorBtn: Color(int.parse(delicacy.colorBtn)),
                                width: 100,
                                height: 100,
                                onPressed: () {
                                  print('Delicacy ${delicacy.name} clicked');
                                  widget.btnDelicaciesClicked?.call(delicacy);
                                },
                              ),
                            ))
                        .toList(),
                  ),
                );
              } else {
                return const Text('Aucun mets disponible');
              }
            },
          ),
          const SizedBox(height: 50.0),
          const Text(
            'Événements du mois',
            style: TextStyle(
              fontFamily: AppFonts.avenirHeavy,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 12.0),
          FutureBuilder<List<ResumeEventCase>>(
            future: eventsFuture,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const CircularProgressIndicator();
              } else if (snapshot.hasError) {
                return Text('Erreur : ${snapshot.error}');
              } else if (snapshot.hasData) {
                return Container(
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: AppColors.white,
                    border: Border.all(color: AppColors.black),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 5,
                        blurRadius: 7,
                        offset: const Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Column(
                    children: snapshot.data!.map((resumeEventCase) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: resumeEventCase,
                      );
                    }).toList(),
                  ),
                );
              } else {
                return const Text('Aucun événement disponible');
              }
            },
          ),
        ],
      ),
    );
  }
}
