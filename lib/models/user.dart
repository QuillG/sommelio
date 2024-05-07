class User {
  String name;
  String email;
  String surname;
  String? profilePictureUrl;

  User({
    required this.name,
    required this.email,
    required this.surname,
    this.profilePictureUrl,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      name: json['name'],
      surname: json['surname'],
      email: json['email'],
      profilePictureUrl: json['profilePictureUrl'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'surname': surname,
      'email': email,
      'profilePictureUrl': profilePictureUrl,
    };
  }

  bool SaveUser() {
    // Save user to database
    
    return true;
  }
}