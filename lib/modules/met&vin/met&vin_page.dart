import 'dart:math';

import 'package:flutter/material.dart';
import 'package:sommelio/config/app-colors.dart';
import 'package:sommelio/config/app_fonts.dart';
import 'package:sommelio/config/app_icons.dart';
import 'package:sommelio/models/delicacies.dart';
import 'package:sommelio/models/user.dart';
import 'package:sommelio/modules/met&vin/met&vin_controller.dart';
import 'package:sommelio/widget/btn.dart';
import 'package:sommelio/widget/resumeEventCase.dart';

class MetVinPage extends StatefulWidget {
  final User user;
  final Delicacies mainDelicacy;

  const MetVinPage({required this.user, required this.mainDelicacy, Key? key}) : super(key: key);

  @override
  State<MetVinPage> createState() => _MetVinState();
}

class _MetVinState extends State<MetVinPage> {
  late MetVinController controller = MetVinController();

  @override
  Widget build(BuildContext context) {
    Future<List<Btn>> btnSubDelicaciesFuture = controller.btnSubDelicaces(widget.mainDelicacy.id);

    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(
          horizontal: 20.0), // Ajout du padding global à gauche et à droite
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
              height: 20.0), // Ajout d'un espace avant le texte "Bonjour"
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Column(
                crossAxisAlignment:
                    CrossAxisAlignment.start, // Alignement du texte à gauche
                children: [
                  Text(
                    'Accord,', // Texte d'accueil
                    style: TextStyle(
                      fontFamily: AppFonts.avenirRegular, // Police de caractère
                      color: AppColors.black, // Couleur du texte
                      fontSize: 24, // Taille du texte
                    ),
                  ),
                  Text(
                    'Mets & Vins', // Nom de l'utilisateur connecté fourni par l'objet User
                    style: TextStyle(
                      color: AppColors.black,
                      fontFamily: AppFonts.heavitas,
                      fontSize: 48,
                    ),
                  ),
                ],
              ),
              Transform.rotate(
                angle: -90 * pi / 180, // Convert degrees to radians
                child: Image.asset(
                  AppIcons.fromage,
                  width: MediaQuery.of(context).size.width * 0.2,
                ),
              )
            ],
          ),
          const SizedBox(height: 20.0), // Espacement après le texte d'accueil
          Text(
            "Catégories de ${widget.mainDelicacy}",
            style: const TextStyle(
              fontFamily: AppFonts.avenirHeavy,
              fontSize: 20,
            ),
          ),
          const SizedBox(height: 12.0),
          FutureBuilder<List<Btn>>(
            future: btnSubDelicaciesFuture,
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
                return const Text('Aucun mets disponible');
              }
            },
          ),
          // You can add more UI components here as needed
        ],
      ),
    );
  }
}
