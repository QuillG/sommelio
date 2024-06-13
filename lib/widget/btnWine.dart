import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:sommelio/config/app-colors.dart';
import 'package:sommelio/config/app_fonts.dart';

class BtnWine extends StatelessWidget {
  final String name;
  final String cepage;
  final int year;
  final String imgName;
  final int colorBtn;
  bool isFavorite;
  final Function()? onPressed;

  BtnWine({
    super.key,
    required this.name,
    required this.cepage,
    required this.year,
    required this.imgName,
    required this.colorBtn,
    required this.isFavorite,
    this.onPressed,
  });

  Future<bool> _doesAssetExist(String assetPath) async {
    try {
      await rootBundle.load(assetPath);
      return true;
    } catch (_) {
      return false;
    }
  }

  Color randomColor() {
    int idColor = colorBtn;
    if (idColor > 4) {
      idColor = idColor % 4;
    }
    switch (idColor) {
      case 0:
        return AppColors.green;
      case 1:
        return AppColors.pink;
      case 2:
        return AppColors.yellow;
      case 3:
        return AppColors.red;
      case 4:
        return AppColors.blue;
      default:
        return AppColors.white;
    }
  }

  @override
  Widget build(BuildContext context) {
    String assetPath = 'assets/Photos/$imgName.png';

    return InkWell(
      onTap: onPressed,
      child: Stack(
        children: [
          Container(
            width: MediaQuery.of(context).size.width * 0.9,
            margin: const EdgeInsets.symmetric(vertical: 20),
            decoration: BoxDecoration(
              border: Border.all(color: AppColors.black),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: const Offset(0, 3),
                ),
              ],
              color: randomColor(),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Row(
              children: [
                Container(
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    image: DecorationImage(
                      image: AssetImage(assetPath),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 9, bottom: 9, left: 40),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        name,
                        style: TextStyle(
                          color: AppColors.black,
                          fontSize: 16,
                          fontFamily: AppFonts.avenirHeavy,
                        ),
                      ),
                      Text(
                        cepage,
                        style: TextStyle(
                          color: AppColors.black,
                          fontSize: 16,
                          fontFamily: AppFonts.avenirRegular,
                        ),
                      ),
                      Text(
                        year.toString(),
                        style: TextStyle(
                          color: AppColors.black,
                          fontSize: 16,
                          fontFamily: AppFonts.avenirRegular,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            right: 10,
            bottom: 10,
            child: Visibility(
              visible: isFavorite,
              child: IconButton(
                icon: Icon(
                  isFavorite ? Icons.favorite : Icons.favorite_border,
                  color: AppColors.red,
                ),
                onPressed: () {
                  // Trigger the callback and update the state in the parent widget
                  if (onPressed != null) {
                    onPressed!();
                  }
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
