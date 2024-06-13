import 'dart:math';
import 'package:flutter/material.dart';
import 'package:sommelio/config/app-colors.dart';
import 'package:sommelio/config/app_fonts.dart';
import 'package:sommelio/config/app_icons.dart';
import 'package:sommelio/models/delicacies.dart';
import 'package:sommelio/models/user.dart';
import 'package:sommelio/modules/home/met&vin_controller.dart';
import 'package:sommelio/widget/btn.dart';

class MetVinPage2 extends StatefulWidget {
  final User user;
  final Delicacies mainDelicacy;
  final Function(Delicacies)? btnDelicaciesClicked;

  const MetVinPage2(
      {required this.user,
      required this.mainDelicacy,
      required this.btnDelicaciesClicked,
      Key? key})
      : super(key: key);

  @override
  State<MetVinPage2> createState() => _MetVinState();
}

class _MetVinState extends State<MetVinPage2> {
  late MetVinController controller = MetVinController();

  @override
  Widget build(BuildContext context) {
    Future<List<Delicacies>> btnSubDelicaciesFuture =
        controller.btnSubDelicaces(widget.mainDelicacy.id);

    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 30.0),
          const Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "Plus qu’un clic pour découvrir la bouteille",
                style: TextStyle(
                  fontFamily: AppFonts.avenirRegular,
                  color: AppColors.black,
                  fontSize: 16,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "qui te convient avec ",
                    style: TextStyle(
                      fontFamily: AppFonts.avenirRegular,
                      color: AppColors.black,
                      fontSize: 16,
                    ),
                  ),
                  Text(
                    "SOMMELIO !",
                    style: TextStyle(
                      fontFamily: AppFonts.avenirHeavy,
                      color: AppColors.black,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ],
          ),
          // espace responsive ici
          SizedBox(height: MediaQuery.of(context).size.height * 0.1),
          Text(
            "Types de viandes - ${widget.mainDelicacy.name}",
            style: const TextStyle(
              fontFamily: AppFonts.avenirHeavy,
              fontSize: 20,
            ),
          ),
          const SizedBox(height: 12.0),
          FutureBuilder<List<Delicacies>>(
            future: btnSubDelicaciesFuture,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const CircularProgressIndicator();
              } else if (snapshot.hasError) {
                return Text('Erreur : ${snapshot.error}');
              } else if (snapshot.hasData) {
                return Center(
                  // Ajoutez ce Center
                  child: Wrap(
                    spacing: 8.0,
                    runSpacing: 8.0,
                    alignment: WrapAlignment.center, // Ajoutez cette ligne
                    children: snapshot.data!
                        .map((delicacy) => Btn(
                              text: delicacy.name,
                              imgName: delicacy.imgName,
                              colorBtn: Color(int.parse(delicacy.colorBtn)),
                              width: 150,
                              height: 150,
                              onPressed: () {
                                widget.btnDelicaciesClicked!(delicacy);
                              },
                            ))
                        .toList(),
                  ),
                );
              } else {
                return const Text('Aucun mets disponible');
              }
            },
          ),

          const SizedBox(height: 60.0),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    '"Chez nous on fait ',
                    style: TextStyle(
                      fontFamily: AppFonts.avenirHeavy,
                      color: AppColors.black,
                      fontSize: 20,
                    ),
                  ),
                  Image.asset(
                    AppIcons.tchinGreen,
                    width: MediaQuery.of(context).size.width * 0.2,
                  ),
                  Text("  "),
                  Image.asset(
                    AppIcons.tchin,
                    width: MediaQuery.of(context).size.width * 0.2,
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'et pas  ',
                    style: TextStyle(
                      fontFamily: AppFonts.avenirHeavy,
                      color: AppColors.black,
                      fontSize: 20,
                    ),
                  ),
                  Image.asset(
                    AppIcons.blingPink,
                    width: MediaQuery.of(context).size.width * 0.2,
                  ),
                  Text("  "),
                  Image.asset(
                    AppIcons.bling,
                    width: MediaQuery.of(context).size.width * 0.2,
                  ),
                  const Text(
                    ' "',
                    style: TextStyle(
                      fontFamily: AppFonts.avenirHeavy,
                      color: AppColors.black,
                      fontSize: 20,
                    ),
                  ),
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}
