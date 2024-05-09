import 'package:flutter/material.dart';
import 'package:sommelio/routes/app_routes.dart';

class OpenPage extends StatelessWidget {
  const OpenPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const Spacer(flex: 2),
          const Center(child: Text('sommelio (introduire logo ici)')),
          const Spacer(flex: 1),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.8,
            child: ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, AppRoutes.login);
              },
              child: const Text('Login'),
            ),
          ),
          const Spacer(flex: 1),
        ],
      ),
    );
  }
}
