class Delicacies {
  final String name;
  final String colorBtn;

  Delicacies({required this.name, required this.colorBtn});

  factory Delicacies.fromJson(Map<String, dynamic> json) {
    return Delicacies(
      name: json['name'],
      colorBtn: json['color'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'color': colorBtn,
    };
  }
}
