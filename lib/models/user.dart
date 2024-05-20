class User {
  String name;
  String surname;
  String email;
  String userType;
  String? profilePictureUrl;
  int fidelityPoints;
  String fidelityGrade; // Change to lowercase
  String? qrCode;


  User({
    required this.name,
    required this.surname,
    required this.email,
    required this.userType,
    required this.fidelityPoints,
    required this.fidelityGrade,
    this.profilePictureUrl,
    this.qrCode,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      name: json['user']['name'],
      surname: json['user']['surname'],
      email: json['user']['email'],
      profilePictureUrl: json['user']['profilePictureUrl'],
      userType: json['user']['userType'],
      fidelityPoints: json['user']['fidelityPoints'],
      fidelityGrade: json['user']['fidelityGrade'],
      qrCode: json['user']['qrCode'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'surname': surname,
      'email': email,
      'profilePictureUrl': profilePictureUrl,
      'userType': userType,
      'fidelityPoints': fidelityPoints,
      'fidelityGrade': fidelityGrade,
      'qrCode': qrCode,
    };
  }

  bool SaveUser() {
    // Save user to database

    return true;
  }
}
