import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:sommelio/config/app-colors.dart';
import 'package:sommelio/config/app_fonts.dart';
import 'package:sommelio/config/app_icons.dart';

class Btn extends StatelessWidget {
  final String text;
  final Color colorBtn;
  final double width;
  final double height;
  final Function()? onPressed;

  Btn(
      {super.key,
      required this.text,
      required this.colorBtn,
      required this.width,
      required this.height,
      this.onPressed});

  Future<bool> _doesAssetExist(String assetPath) async {
    try {
      await rootBundle.load(assetPath);
      return true;
    } catch (_) {
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    String assetPath = 'assets/other/NOIR/$text.png';

    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.black),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 5,
            blurRadius: 7,
            offset: const Offset(0, 3), // changes position of shadow
          ),
        ],
        color: colorBtn,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Center(
        child: Column(
          children: [
            Text(
              text,
              style: TextStyle(
                  color: colorBtn == AppColors.white
                      ? AppColors.black
                      : AppColors.white,
                  fontSize: 16,
                  fontFamily: AppFonts.avenirRegular),
            ),
            FutureBuilder<bool>(
              future: _doesAssetExist(assetPath),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const CircularProgressIndicator(); // Ou n'importe quel widget de chargement
                } else if (snapshot.hasData && snapshot.data == true) {
                  return Image.asset(assetPath, width: 50, height: 50);
                } else {
                  return Container(); // Ne rien afficher si l'image n'existe pas
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
