import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:sommelio/config/app-colors.dart';
import 'package:sommelio/config/app_fonts.dart';
import 'package:sommelio/config/app_icons.dart';
import 'package:sommelio/config/app_picture.dart';
import 'package:sommelio/models/user.dart';

class ProfilePage extends StatelessWidget {
  final User user;

  ProfilePage({required this.user});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(
          top: 40.0,
          left: 20.0,
          right: 20.0,
          bottom: 20.0,
        ),
        child: Column(
          children: [
            Container(
              height: 250.0, // Taille définie pour le Stack
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Positioned(
                    top: 0,
                    child: Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: AppColors.black,
                            width: 2,
                          ),
                        ),
                        child: CircleAvatar(
                          backgroundImage: user.profilePictureUrl == null
                              ? Image.asset(AppPicture.photoProfil).image
                              : Image.asset(user.profilePictureUrl!).image,
                        )),
                  ),
                  Positioned(
                    top: 2,
                    left: 0,
                    right: 0,
                    child: Container(
                      margin: EdgeInsets.only(top: 50.0),
                      padding: EdgeInsets.all(16.0),
                      decoration: BoxDecoration(
                        color: AppColors.yellow,
                        borderRadius: BorderRadius.circular(16.0),
                        border: Border.all(
                          color: AppColors.black,
                          width: 2,
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              SizedBox(height: 50.0), // Space for the circle
                              Text(
                                user.name + ' ' + user.surname,
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(height: 4),
                              Text(
                                '20/02/2023',
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.grey[800],
                                ),
                              ),
                              SizedBox(height: 4),
                              Text(
                                '120 bouteilles testées',
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.grey[800],
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: List.generate(3, (index) {
                              return const Icon(
                                Icons.star,
                                color: AppColors.red,
                              );
                            }),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    top: 2,
                    child: Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: AppColors.yellow,
                          width: 12.5,
                        ),
                      ),
                      child: CircleAvatar(
                        radius: 50,
                        backgroundImage:
                            Image.asset(user.profilePictureUrl!).image,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
                height: 10.0), // Espace entre le contenu principal et le bouton
            SizedBox(
              height: 53,
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor:
                      Colors.white, // Couleur de fond du bouton (blanc)
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16.0),
                    side: const BorderSide(
                      color: AppColors.black,
                      width: 2.0,
                    ), // Bordure du bouton
                  ),
                ),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Icon(Icons.qr_code, color: AppColors.black),
                    Text(
                      'QR CODE DE FIDELITE',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        fontFamily: AppFonts.avenirHeavy,
                        color: AppColors.black,
                      ),
                    ),
                    Icon(Icons.qr_code, color: AppColors.black),
                  ],
                ),
              ),
            ),
            Stack(
              children: [
                Column(children: [
                  const SizedBox(
                      height: 20.0), // Espace entre le bouton et le texte
                  const Text(
                    'MAGNUM',
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      fontFamily: AppFonts.avenirHeavy,
                    ),
                  ),
                  const SizedBox(height: 2.0),
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(16.0),
                    decoration: BoxDecoration(
                      color: AppColors.blue,
                      borderRadius: BorderRadius.circular(16.0),
                      border: Border.all(
                        color: AppColors.black,
                        width: 2,
                      ),
                    ),
                    child: Column(
                      children: [
                        Text(
                          'Continue à déguster et à découvrir',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.grey[800],
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 4.0),
                  //barre de progression de 0 a 150 avec une valeur qui determine la progression
                  LinearProgressIndicator(
                    borderRadius: BorderRadius.circular(16.0),
                    minHeight: 28,
                    value: 100 / 150,
                    backgroundColor: AppColors.grey,
                    valueColor: AlwaysStoppedAnimation<Color>(AppColors.black),
                  ),
                  const SizedBox(height: 4.0),
                  // affiche coombien/combien
                  Text(
                    '100/150',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey[800],
                    ),
                  ),
                  const SizedBox(height: 20.0),
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(16.0),
                    decoration: BoxDecoration(
                      color: AppColors.pink,
                      borderRadius: BorderRadius.circular(16.0),
                      border: Border.all(
                        color: AppColors.black,
                        width: 2,
                      ),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Tes avis',
                              style: TextStyle(
                                fontSize: 16,
                                fontFamily: AppFonts.avenirHeavy,
                                color: AppColors.black,
                              ),
                            ),
                            Row(
                              children: List.generate(3, (index) {
                                return const Icon(
                                  Icons.star,
                                  color: AppColors.red,
                                );
                              }),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ]),
              ],
            ),
          ],
        ));
  }
}
