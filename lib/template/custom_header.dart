import 'package:flutter/material.dart';
import 'package:sommelio/config/app-colors.dart';
import 'package:sommelio/config/app_icons.dart';

class CustomHeader extends AppBar {

  @override
  State<CustomHeader> createState() => _CustomHeaderState();
}

class _CustomHeaderState extends State<CustomHeader> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 30.0),
      child: Padding(
        padding: const EdgeInsets.only(left: 10.0, right: 10.0),
        child: Container(
          width: double.infinity,
          color: AppColors.white,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.asset(
                AppIcons.sommelioIcon,
                width: MediaQuery.of(context).size.width * 0.35,
                fit: BoxFit.fill,
              ),
              //regroupe les deux boutton dans un composant
              const Row(children: [
                IconButton(
                    onPressed: null,
                    icon: Icon(Icons.search, color: AppColors.black, size: 35.0)), // Change the color and size here
                IconButton(
                    onPressed: null,
                    icon: Icon(Icons.qr_code, color: AppColors.black, size: 35.0)), // Change the color and size here
              ])
            ],
          ),
        ),
      ),
    );
  }
}
