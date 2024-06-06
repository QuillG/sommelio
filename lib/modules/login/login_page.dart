import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:sommelio/config/app-colors.dart';
import 'package:sommelio/config/app_fonts.dart';
import 'package:sommelio/config/app_icons.dart';
import 'package:sommelio/models/user.dart';
import 'package:sommelio/modules/login/login_page_controller.dart';
import 'package:sommelio/modules/login/connexion_BottomSheet.dart';
import 'package:sommelio/modules/login/inscription_BottomSheet%20copy.dart';

class LoginPage extends StatefulWidget {
  LoginPage({super.key});

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late LoginPageController controller = LoginPageController();
  @override
  void initState() {
    super.initState();
    checkUser();
  }

  void checkUser() async {
    User? user = await controller.getUser();
    if (user != null) {
      // Si l'utilisateur est déjà connecté, naviguez vers la page d'accueil
          Navigator.pushReplacementNamed(
            context,
            '/basePage',
            arguments: user,
          );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Column(
        children: [
          const SizedBox(height: 50),
          //introduire logo ici
          Center(
            child: Image.asset(
              AppIcons.sommelioIcon,
              width: MediaQuery.of(context).size.width * 0.8,
            ),
          ),
          const Spacer(flex: 1),
          const Text('À LA',
              style: TextStyle(
                fontFamily: AppFonts.avenirLight,
                fontSize: 45,
              )),
          const Text('TIENNE !',
              style: TextStyle(
                fontFamily: AppFonts.heavitas,
                fontSize: 45,
              )),
          const Spacer(flex: 1),
          Image.asset(
            AppIcons.handGlasses,
            width: MediaQuery.of(context).size.width * 0.4,
          ),
          const Spacer(flex: 1),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.8,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.yellow,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
              onPressed: () {
                showModalBottomSheet(
                  context: context,
                  isScrollControlled:
                      true, // Pour la prise en compte du clavier
                  builder: (BuildContext context) {
                    return CustomLoginWidget(controller: controller);
                  },
                );
              },
              child: const Text(
                'Se connecter avec un e-mail',
                style: TextStyle(
                  color: Colors.black,
                  fontFamily: AppFonts.avenirRegular,
                  fontSize: 16,
                ),
              ),
            ),
          ),
          const SizedBox(height: 16),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.8,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.pink,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
              onPressed: () {
                Navigator.pushNamed(context, '/home');
              },
              child: const Text(
                'Se connecter avec Google',
                style: TextStyle(
                  color: Colors.black,
                  fontFamily: AppFonts.avenirRegular,
                  fontSize: 16,
                ),
              ),
            ),
          ),
          const SizedBox(height: 16),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.8,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.blue,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
              onPressed: () {
                showModalBottomSheet(
                  context: context,
                  isScrollControlled:
                      true, // Pour la prise en compte du clavier
                  builder: (BuildContext context) {
                    return RegistrationWidget(controller: controller);
                  },
                );
              },
              child: const Text(
                'Je m\'inscris',
                style: TextStyle(
                  color: Colors.black,
                  fontFamily: AppFonts.avenirRegular,
                  fontSize: 16,
                ),
              ),
            ),
          ),
          const Spacer(flex: 1),
        ],
      ),
    );
  }
}
