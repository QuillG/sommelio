import 'package:sommelio/models/user.dart';

class Particular extends User {
  int fidelityPoints;
  String fidelityGrade; // Change to lowercase
  String? qrCode; // Change to lowercase

  Particular({
    required this.fidelityPoints,
    required this.fidelityGrade, // Update to lowercase
    this.qrCode, // Update to lowercase
    required String name,
    required String surname,
    required String email,
    String? profilePictureUrl,
  }) : super(
          name: name,
          surname: surname,
          email: email,
          profilePictureUrl: profilePictureUrl,
        );

  factory Particular.fromJson(Map<String, dynamic> json) {
    return Particular(
      fidelityPoints: json['fidelityPoints'],
      fidelityGrade: json['fidelityGrade'], // Update to lowercase
      qrCode: json['qrCode'], // Update to lowercase
      name: json['name'],
      surname: json['surname'],
      email: json['email'],
      profilePictureUrl: json['profilePictureUrl'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'fidelityPoints': fidelityPoints,
      'fidelityGrade': fidelityGrade, // Update to lowercase
      'qrCode': qrCode, // Update to lowercase
      'name': name,
      'surname': surname,
      'email': email,
      'profilePictureUrl': profilePictureUrl,
    };
  }
}
