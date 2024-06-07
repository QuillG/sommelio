class Delicacies {
  final int id;
  final String name;
  final String imgName;
  final String colorBtn;

  Delicacies({required this.id, required this.name, required this.colorBtn, required this.imgName});

  factory Delicacies.fromJson(Map<String, dynamic> json) {
    return Delicacies(
      id: json['id'],
      name: json['name'],
      imgName: json['imgName'],
      colorBtn: json['color'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'imgName': imgName,
      'color': colorBtn,
    };
  }
}
