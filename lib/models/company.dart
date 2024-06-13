import 'package:sommelio/models/Address.dart';
import 'package:sommelio/models/user.dart';

class Company {
final User user;
final Address address;
final String name;
final String pictureUrl;


  Company({
    required this.user,
    required this.address,
    required this.name,
    required this.pictureUrl
  });


  factory Company.fromJson(Map<String, dynamic> json) {
    return Company(
      name: json['name'],
      pictureUrl: json['pictureUrl'],
      user: User.fromJson1(json['user']),
      address: Address.fromJson(json['address']),
      
    );
  }
}