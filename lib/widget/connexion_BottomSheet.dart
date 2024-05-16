import 'package:flutter/material.dart';
import 'package:sommelio/models/user.dart';
import 'package:sommelio/modules/home/home_page.dart';
import 'package:sommelio/modules/login/login_page_controller.dart';

class CustomLoginWidget extends StatelessWidget {
  final LoginPageController controller;

  const CustomLoginWidget({
    required this.controller,
  });

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
            padding: EdgeInsets.all(16),
            height: MediaQuery.of(context)
                .size
                .height, // Prend toute la hauteur de l'écran
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(
                  0.7), // Ajoutez une certaine transparence pour voir le WavePage en dessous
              borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  controller: controller.usernameController,
                  decoration: InputDecoration(
                    labelText: 'Username',
                  ),
                  onChanged: (value) {},
                ),
                SizedBox(height: 12),
                TextField(
                  controller: controller.passwordController,
                  decoration: InputDecoration(
                    labelText: 'Password',
                  ),
                  onChanged: (value) {},
                ),
                SizedBox(height: 12),
                ElevatedButton(
                  onPressed: () async {
                    if (controller.usernameController.text.isNotEmpty &&
                        controller.passwordController.text.isNotEmpty) {
                      User? isUserAuthenticated = await controller.login(
                          controller.usernameController.text,
                          controller.passwordController.text);
                      print(isUserAuthenticated);
                      if (isUserAuthenticated != null) {
                        //ajouter user a la page home
                        Navigator.pushNamed(
                          context,
                          '/home',
                          arguments: isUserAuthenticated,
                        );
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Invalid username or password'),
                          ),
                        );
                      }
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Please enter username and password'),
                        ),
                      );
                    }
                  },
                  child: const Text('Connexion'),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
