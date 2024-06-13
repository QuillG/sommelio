import 'dart:math';
import 'package:flutter/material.dart';
import 'package:sommelio/config/app-colors.dart';
import 'package:sommelio/config/app_fonts.dart';
import 'package:sommelio/models/Wines.dart';
import 'package:sommelio/models/delicacies.dart';
import 'package:sommelio/models/user.dart';
import 'package:sommelio/modules/fav/favorite_controller.dart';
import 'package:sommelio/modules/home/met&vin_controller.dart';
import 'package:sommelio/modules/home/wine_page.dart';
import 'package:sommelio/template/btn.dart';
import 'package:sommelio/template/btnWine.dart';

class FavoritePage extends StatefulWidget {
  final User user;

  FavoritePage({required this.user, Key? key}) : super(key: key);

  @override
  State<FavoritePage> createState() => _FavoriteState();
}

class _FavoriteState extends State<FavoritePage> {
  late FavoriteController controller = FavoriteController();

  @override
  Widget build(BuildContext context) {
    Future<List<Wines>> wines = controller.getFavoriteWine(widget.user.id);

    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Image.asset(
                'assets/other/NOIR/TireBouchon.png',
                width: MediaQuery.of(context).size.width * 0.1,
              ),
            ],
          ),
          const SizedBox(height: 12.0),
          FutureBuilder<List<Wines>>(
            future: wines,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const CircularProgressIndicator();
              } else if (snapshot.hasError) {
                return Text('Erreur : ${snapshot.error}');
              } else if (snapshot.hasData) {
                List<Widget> wineWidgets = snapshot.data!.map((wine) {
                  int index = snapshot.data!.indexOf(wine);
                  return BtnWine(
                    isFavorite: true,
                    name: wine.name,
                    cepage: wine.cepage,
                    year: wine.year,
                    imgName: wine.pictureUrl,
                    colorBtn: index,
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => WinePage(
                            user: widget.user,
                            wine: wine,
                          ),
                        ),
                      );
                    },
                  );
                }).toList();

                return Wrap(
                  spacing: 8.0,
                  runSpacing: 8.0,
                  children: wineWidgets,
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
