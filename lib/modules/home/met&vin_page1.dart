import 'dart:math';
import 'package:flutter/material.dart';
import 'package:sommelio/config/app-colors.dart';
import 'package:sommelio/config/app_fonts.dart';
import 'package:sommelio/models/delicacies.dart';
import 'package:sommelio/models/user.dart';
import 'package:sommelio/modules/home/met&vin_controller.dart';
import 'package:sommelio/widget/btn.dart';

class MetVinPage extends StatefulWidget {
  final User user;
  final Delicacies mainDelicacy;
    final Function(Delicacies)? btnDelicaciesClicked;

  const MetVinPage({required this.user, required this.mainDelicacy, required this.btnDelicaciesClicked, Key? key})
      : super(key: key);

  @override
  State<MetVinPage> createState() => _MetVinState();
}

class _MetVinState extends State<MetVinPage> {
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
          const SizedBox(height: 20.0),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Accords,',
                    style: TextStyle(
                      fontFamily: AppFonts.avenirRegular,
                      color: AppColors.black,
                      fontSize: 24,
                    ),
                  ),
                  Text(
                    'Mets & Vins',
                    style: TextStyle(
                      color: AppColors.black,
                      fontFamily: AppFonts.heavitas,
                      fontSize: 42,
                    ),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 20.0),
          Text(
            "Catégories de ${widget.mainDelicacy.name}",
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
                return Wrap(
                  spacing: 8.0,
                  runSpacing: 8.0,
                  children: snapshot.data!
                      .map((delicacy) => Btn(
                            text: delicacy.name,
                            imgName: delicacy.imgName,
                            colorBtn: Color(int.parse(delicacy.colorBtn)),
                            width: 140,
                            height: 200,
                            onPressed: () {
                              print('Delicacy ${delicacy.name} clicked');
                              widget.btnDelicaciesClicked?.call(delicacy);
                            },
                          ))
                      .toList(),
                );
              } else {
                return const Text('Aucun mets disponible');
              }
            },
          ),
        ],
      ),
    );
  }
}
