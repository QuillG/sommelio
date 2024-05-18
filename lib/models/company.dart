import 'package:sommelio/models/Address.dart';
import 'package:sommelio/models/professional.dart';

class Company {
final Professional professional;
final Address address;
final String name;
final String pictureUrl;


  Company({
    required this.professional,
    required this.address,
    required this.name,
    required this.pictureUrl
  });


  factory Company.fromJson(Map<String, dynamic> json) {
    return Company(
      name: json['name'],
      pictureUrl: json['pictureUrl'],
      professional: Professional.fromJson(json['professional']),
      address: Address.fromJson(json['address']),
      
    );
  }
}