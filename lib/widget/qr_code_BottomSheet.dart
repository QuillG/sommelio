import 'package:flutter/material.dart';

class QrCodeBottomSheet {
  static void show(BuildContext context, String qrCode) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          padding: EdgeInsets.only(left: 20, right: 20, top: 40, bottom: 20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text('Scan the QR code below to connect to the device'),
              SizedBox(height: 20),
              Image.network(
                'https://api.qrserver.com/v1/create-qr-code/?size=150x150&data=$qrCode',
              ),
              SizedBox(height: 20),
              Text('QR Code: $qrCode'),
            ],
          ),
        );
      },
    );
  }
}