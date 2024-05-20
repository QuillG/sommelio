// import 'package:sommelio/models/user.dart';

// class Professional extends User {
//   String professionalType;

//   Professional({
//     required this.professionalType,
//     required String name,
//     required String surname,
//     required String email,
//     String? profilePictureUrl,
//   }) : super(
//           name: name,
//           surname: surname,
//           email: email,
//           profilePictureUrl: profilePictureUrl,
//         );

//   factory Professional.fromJson(Map<String, dynamic> json) {
//     return Professional(
//       professionalType: json['professionalType'],
//       name: json['name'],
//       surname: json['surname'],
//       email: json['email'],
//       profilePictureUrl: json['profilePictureUrl'],
//     );
//   }

//   Map<String, dynamic> toJson() {
//     return {
//       'proffesionalType': professionalType,
//       'name': name,
//       'surname': surname,
//       'email': email,
//       'profilePictureUrl': profilePictureUrl,
//     };
//   }


// }