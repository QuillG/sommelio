class WineType {
  final String name;
  final String colorBtn;

  WineType({required this.name, required this.colorBtn});

  factory WineType.fromJson(Map<String, dynamic> json) {
    return WineType(
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