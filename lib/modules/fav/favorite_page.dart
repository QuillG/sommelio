import 'package:flutter/material.dart';

class FavoritePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Favorite Page'),
      ),
      body: Center(
        child: Text(
          'This is the favorite page.',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}