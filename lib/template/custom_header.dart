import 'package:flutter/material.dart';

class CustomHeader extends StatefulWidget {
  const CustomHeader({Key? key}) : super(key: key);

  @override
  State<CustomHeader> createState() => _CustomHeaderState();
}

class _CustomHeaderState extends State<CustomHeader> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      width: double.infinity,
      color: Colors.blue,
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Sommelio',
            style: TextStyle(
              color: Colors.white,
              fontSize: 24,
            ),
          ),
          //regroupe les deux boutton dans un composant
          Row(
            children: [
              ElevatedButton(
                onPressed: null,
                child: Icon(Icons.search),
              ),
              ElevatedButton(
                onPressed: null,
                // Ajoutez une icone de qr code ici
                child: Icon(Icons.qr_code),
              ),
            ])
        ],
      ),
    );
  }
}