import 'dart:convert' as convert;
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:sommelio/controller/login_page_controller.dart';
import 'package:sommelio/models/user.dart';
import 'package:sommelio/repository/repository.dart';
import 'package:sommelio/screen/home_page.dart';

class LoginPage extends StatefulWidget {
  final LoginPageController controller;
  bool isVisible = false;
  // User? user;

  LoginPage({required this.controller, super.key});

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // Add state variables for username and password (optional)
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const SizedBox(height: 50),
          const Center(child: Text('Sommelio (introduire logo ici)')),
          const Spacer(flex: 1),
          Image.asset(
            'assets/images/bottle-and-wine-glass.jpg',
            width: MediaQuery.of(context).size.width * 0.8,
          ),
          const Spacer(flex: 1),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.8,
            child: ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/home');
              },
              child: const Text('Google Sign-In'),
            ),
          ),
          const SizedBox(height: 16),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.8,
            child: ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/home');
              },
              child: const Text('Facebook Sign-In'),
            ),
          ),
          const SizedBox(height: 16),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.8,
            child: ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/home');
              },
              child: const Text('Apple Sign-In'),
            ),
          ),
          const Spacer(flex: 1), // Takes up 1/3 of the available space
          ElevatedButton(
            onPressed: () {
              showModalBottomSheet(
                context: context,
                builder: (BuildContext context) {
                  return Container(
                    padding: EdgeInsets.all(16),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        TextField(
                          controller: usernameController,
                          decoration: const InputDecoration(
                            labelText: 'Username',
                          ),
                          onChanged: (value) {},
                        ),
                        const SizedBox(height: 12),
                        TextField(
                          controller: passwordController,
                          decoration: const InputDecoration(
                            labelText: 'Password',
                          ),
                          onChanged: (value) {},
                        ),
                        const SizedBox(height: 12),
                        ElevatedButton(
                          onPressed: () {
                            widget.controller.login(usernameController.text,
                                passwordController.text, context);
                          },
                          child: const Text('Login'),
                        ),
                      ],
                    ),
                  );
                },
              );
            },
            child: const Text('Login'),
          ),
          const Spacer(flex: 1),
        ],
      ),
    );
  }
}
