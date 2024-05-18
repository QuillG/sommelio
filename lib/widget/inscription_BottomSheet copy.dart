import 'package:flutter/material.dart';
import 'package:sommelio/config/app-colors.dart';
import 'package:sommelio/config/app_fonts.dart';
import 'package:sommelio/models/particular.dart';
import 'package:sommelio/models/professional.dart';
import 'package:sommelio/modules/login/login_page_controller.dart';

class RegistrationWidget extends StatefulWidget {
  final LoginPageController controller;

  const RegistrationWidget({required this.controller});

  @override
  _RegistrationWidgetState createState() => _RegistrationWidgetState();
}

class _RegistrationWidgetState extends State<RegistrationWidget> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController surnameController = TextEditingController();
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  String? errorMessage;
  String userType = 'particulier';

  Future<void> _register() async {
    if (nameController.text.isNotEmpty &&
        surnameController.text.isNotEmpty &&
        usernameController.text.isNotEmpty &&
        passwordController.text.isNotEmpty &&
        confirmPasswordController.text.isNotEmpty) {
      if (passwordController.text != confirmPasswordController.text) {
        setState(() {
          errorMessage = 'Les mots de passe ne correspondent pas';
        });
        return;
      }

      // Afficher l'indicateur de chargement
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return Center(child: CircularProgressIndicator());
        },
      );

      try {
        // Logique pour enregistrer l'utilisateur (à implémenter dans le controller)
        Particular? isUserParticularRegistered;
        Professional? isUserProfessionalRegistered;
        if (userType == 'particulier') {
          isUserParticularRegistered = await widget.controller.registerParticular(
            nameController.text,
            surnameController.text,
            usernameController.text,
            passwordController.text,
          );
        } else {
          isUserProfessionalRegistered = await widget.controller.registerProfessional(
            nameController.text,
            surnameController.text,
            usernameController.text,
            passwordController.text,
          );
        }

        Navigator.pop(context); // Masquer l'indicateur de chargement

        if (isUserParticularRegistered != null || isUserProfessionalRegistered != null) {
          // Naviguer vers la page d'accueil si l'inscription est réussie
          Navigator.pushNamed(
            context,
            '/home',
            arguments: isUserParticularRegistered ?? isUserProfessionalRegistered,
          );
        } else {
          setState(() {
            errorMessage = 'Échec de l\'inscription. Veuillez réessayer.';
          });
        }
      } catch (e) {
        Navigator.pop(context); // Masquer l'indicateur de chargement
        setState(() {
          errorMessage = 'Une erreur est survenue : $e';
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
        Positioned.fill(
          child: Image.asset(
            'assets/other/WavePage.png',
            fit: BoxFit.cover,
          ),
        ),
        SingleChildScrollView(
          child: Container(
            padding:
                const EdgeInsets.only(top: 126, left: 16, right: 16, bottom: 16),
            height: MediaQuery.of(context).size.height,
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.7),
              borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text('Inscription',
                    style: TextStyle(fontSize: 35, fontFamily: AppFonts.heavitas)),
                SizedBox(height: 52),
                TextField(
                  controller: nameController,
                  decoration: const InputDecoration(
                    labelText: 'Nom',
                  ),
                ),
                SizedBox(height: 12),
                TextField(
                  controller: surnameController,
                  decoration: const InputDecoration(
                    labelText: 'Prénom',
                  ),
                ),
                SizedBox(height: 12),
                TextField(
                  controller: usernameController,
                  decoration: const InputDecoration(
                    labelText: 'Email',
                  ),
                ),
                SizedBox(height: 12),
                TextField(
                  controller: passwordController,
                  decoration: const InputDecoration(
                    labelText: 'Mot de passe',
                  ),
                  obscureText: true,
                ),
                SizedBox(height: 12),
                TextField(
                  controller: confirmPasswordController,
                  decoration: const InputDecoration(
                    labelText: 'Confirmer le mot de passe',
                  ),
                  obscureText: true,
                ),
                SizedBox(height: 12),
                Row(
                  children: [
                    Expanded(
                      child: ListTile(
                        title: const Text('Particulier'),
                        leading: Radio<String>(
                          value: 'particulier',
                          groupValue: userType,
                          onChanged: (String? value) {
                            setState(() {
                              userType = value!;
                            });
                          },
                          activeColor: AppColors.green, // Couleur verte pour Particulier
                        ),
                      ),
                    ),
                    Expanded(
                      child: ListTile(
                        title: const Text('Professionnel'),
                        leading: Radio<String>(
                          value: 'professionnel',
                          groupValue: userType,
                          onChanged: (String? value) {
                            setState(() {
                              userType = value!;
                            });
                          },
                          activeColor: AppColors.yellow, // Couleur jaune pour Professionnel
                        ),
                      ),
                    ),
                  ],
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
                  onPressed: _register,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.blue,
                    padding: const EdgeInsets.symmetric(horizontal: 32.0, vertical: 16.0),
                    textStyle: const TextStyle(
                      fontSize: 20.0,
                      fontFamily: AppFonts.avenirHeavy,
                      color: AppColors.white,
                    ),
                  ),
                  child: const Text(
                    'S\'inscrire',
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
