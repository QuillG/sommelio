class WineType {
  final int id;
  final String name;
  final String imgName;
  final String colorBtn;

  WineType({required this.name, required this.colorBtn, required this.id, required this.imgName});

  factory WineType.fromJson(Map<String, dynamic> json) {
    return WineType(
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