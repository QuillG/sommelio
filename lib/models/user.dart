class User {
  int id;
  String name;
  String surname;
  String email;
  String userType;
  String? profilePictureUrl;
  int fidelityPoints;
  String fidelityGrade;
  String? qrCode;
  String? inscriptionDate;


  User({
    required this.id,
    required this.name,
    required this.surname,
    required this.email,
    required this.userType,
    required this.fidelityPoints,
    required this.fidelityGrade,
    this.inscriptionDate,
    this.profilePictureUrl,
    this.qrCode,
  });

  factory User.fromJson1(Map<String, dynamic> json) {
    return User(
      id: json['user']['id'],
      name: json['user']['name'],
      surname: json['user']['surname'],
      email: json['user']['email'],
      profilePictureUrl: json['user']['profilePictureUrl'],
      userType: json['user']['userType'],
      fidelityPoints: json['user']['fidelityPoints'],
      fidelityGrade: json['user']['fidelityGrade'],
      inscriptionDate: json['user']['inscriptionDate'],
      qrCode: json['user']['qrCode'],
    );
  }
  factory User.fromJson2(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      name: json['name'],
      surname: json['surname'],
      email: json['email'],
      profilePictureUrl: json['profilePictureUrl'],
      userType: json['userType'],
      fidelityPoints: json['fidelityPoints'],
      fidelityGrade: json['fidelityGrade'],
      inscriptionDate: json['inscriptionDate'],
      qrCode: json['qrCode'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'surname': surname,
      'email': email,
      'profilePictureUrl': profilePictureUrl,
      'userType': userType,
      'fidelityPoints': fidelityPoints,
      'fidelityGrade': fidelityGrade,
      'inscriptionDate': inscriptionDate,
      'qrCode': qrCode,
    };
  }

  bool SaveUser() {
    // Save user to database

    return true;
  }
}
