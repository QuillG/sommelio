class Delicacies {
  final int id;
  final String name;
  final String colorBtn;

  Delicacies({required this.id, required this.name, required this.colorBtn});

  factory Delicacies.fromJson(Map<String, dynamic> json) {
    return Delicacies(
      id: json['id'],
      name: json['name'],
      colorBtn: json['color'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'color': colorBtn,
    };
  }
}
