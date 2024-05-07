import 'package:flutter/material.dart';
import 'package:sommelio/models/user.dart';
import 'package:sommelio/template/custom_header.dart';

class HomePage extends StatefulWidget {
  final User user;
  const HomePage({required this.user, Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(kToolbarHeight),
        child: CustomHeader(),
      ),
      body: Padding(
        padding: const EdgeInsets.all(
            16.0), // Change this value to adjust the padding
        child: Column(
          children: [
            Row(
              children: [
                Column(
                  children: [
                    const Text('Bonjour,',
                        style: TextStyle(
                          
                            fontSize: 24, fontWeight: FontWeight.bold)),
                    // Display the user's name
                    Text(widget.user.name,
                        style: const TextStyle(
                            fontSize: 24, fontWeight: FontWeight.bold)),
                  ],
                ),
                IconButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/login');
                  },
                  icon: const Icon(Icons.circle_rounded),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
