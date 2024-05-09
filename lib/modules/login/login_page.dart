import 'dart:convert' as convert;
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:http/http.dart' as http;
import 'package:sommelio/modules/login/login_page_controller.dart';
import 'package:sommelio/models/user.dart';
import 'package:sommelio/repository/repository.dart';
import 'package:sommelio/modules/home/home_page.dart';

class LoginPage extends StatefulWidget {
  late LoginPageController controller = LoginPageController();

  LoginPage({super.key});

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const SizedBox(height: 50),
          //introduire logo ici
          Center(
            child: Image.asset(
              'assets/logo/logotypo.png',
              width: MediaQuery.of(context).size.width * 0.8,
            ),
          ),
          const Spacer(flex: 1),
          Text('À LA'),
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
                          controller: widget.controller.usernameController,
                          decoration: const InputDecoration(
                            labelText: 'Username',
                          ),
                          onChanged: (value) {},
                        ),
                        const SizedBox(height: 12),
                        TextField(
                          controller: widget.controller.passwordController,
                          decoration: const InputDecoration(
                            labelText: 'Password',
                          ),
                          onChanged: (value) {},
                        ),
                        const SizedBox(height: 12),
                        ElevatedButton(
                          onPressed: () async {
                            if (widget.controller.usernameController.text
                                    .isNotEmpty &&
                                widget.controller.passwordController.text
                                    .isNotEmpty) {
                              User isUserAuthenticated = await widget.controller
                                  .login(
                                      widget.controller.usernameController.text,
                                      widget
                                          .controller.passwordController.text);
                              print(isUserAuthenticated);
                              if (mounted) {
                                if (isUserAuthenticated != null) {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => HomePage(
                                        user: isUserAuthenticated,
                                      ),
                                    ),
                                  );
                                } else {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                      content:
                                          Text('Invalid username or password'),
                                    ),
                                  );
                                }
                              }
                            } else {
                              if (mounted) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content: Text(
                                        'Please enter username and password'),
                                  ),
                                );
                              }
                            }
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
