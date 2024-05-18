import 'package:flutter/material.dart';
import 'package:sommelio/config/app-colors.dart';
import 'package:sommelio/config/app_fonts.dart';
import 'package:sommelio/models/user.dart';
import 'package:sommelio/modules/home/home_page.dart';
import 'package:sommelio/modules/login/login_page_controller.dart';

class CustomLoginWidget extends StatefulWidget {
  final LoginPageController controller;

  const CustomLoginWidget({
    required this.controller,
  });

  @override
  _CustomLoginWidgetState createState() => _CustomLoginWidgetState();
}

class _CustomLoginWidgetState extends State<CustomLoginWidget> {
  String? errorMessage;

  Future<void> _login() async {
    if (widget.controller.usernameController.text.isNotEmpty &&
        widget.controller.passwordController.text.isNotEmpty) {
      // Afficher l'indicateur de chargement
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return Center(child: CircularProgressIndicator());
        },
      );

      try {
        // Tenter d'authentifier l'utilisateur
        User? isUserAuthenticated = await widget.controller.login(
          widget.controller.usernameController.text,
          widget.controller.passwordController.text,
        );

        Navigator.pop(context); // Masquer l'indicateur de chargement

        if (isUserAuthenticated != null) {
          // Naviguer vers la page d'accueil si l'authentification est réussie
          Navigator.pushNamed(
            context,
            '/home',
            arguments: isUserAuthenticated,
          );
        } else {
          setState(() {
            errorMessage = 'Email ou mot de passe incorrect';
          });
        }
      } catch (e) {
        Navigator.pop(context); // Masquer l'indicateur de chargement
        setState(() {
          errorMessage = 'Erreur : $e';
        });
      }
    } else {
      setState(() {
        errorMessage = 'Veuillez remplir tous les champs';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Utilisez Image.asset pour charger votre image wavepage
        Positioned.fill(
          child: Image.asset(
            'assets/other/WavePage.png',
            fit: BoxFit.cover,
          ),
        ),
        SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.only(top: 126, left: 16, right: 16, bottom: 16),
            height: MediaQuery.of(context).size.height, // Prend toute la hauteur de l'écran
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.7), // Ajoutez une certaine transparence pour voir le WavePage en dessous
              borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text('Connexion', style: TextStyle(fontSize: 35, fontFamily: AppFonts.heavitas)),
                SizedBox(height: 52),
                TextField(
                  controller: widget.controller.usernameController,
                  decoration: const InputDecoration(
                    labelText: 'Email',
                  ),
                ),
                SizedBox(height: 12),
                TextField(
                  controller: widget.controller.passwordController,
                  decoration: InputDecoration(
                    labelText: 'Mot de passe',
                  ),
                  obscureText: true,
                ),
                if (errorMessage != null) ...[
                  SizedBox(height: 16.0),
                  Text(
                    errorMessage!,
                    style: TextStyle(color: Colors.red),
                  ),
                ],
                SizedBox(height: 32),
                ElevatedButton(
                  onPressed: _login,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.blue, // Couleur de fond
                    padding: const EdgeInsets.symmetric(horizontal: 32.0, vertical: 16.0), // Padding du bouton
                    textStyle: const TextStyle(
                      fontSize: 20.0,
                      fontFamily: AppFonts.avenirHeavy,
                      color: AppColors.white,
                    ), // Style du texte
                  ),
                  child: const Text(
                    'Entrer',
                    style: TextStyle(
                      color: AppColors.white,
                      fontFamily: AppFonts.avenirHeavy,
                      fontSize: 20,
                    ),
                  ),
                ),
                const Spacer(flex: 1),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
