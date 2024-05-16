class User {
  String name;
  String surname;
  String email;
  String? profilePictureUrl;

  User({
    required this.name,
    required this.surname,
    required this.email,
    this.profilePictureUrl,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      name: json['user']['name'],
      surname: json['user']['surname'],
      email: json['user']['email'],
      profilePictureUrl: json['user']['profilePictureUrl'],
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
