class Wines {
  final int id;
  final String name;
  final String description;
  final int year;
  final String cepage;
  final String domaine  ;
  final String pictureUrl;

  Wines({required this.id, required this.name, required this.description, required this.year, required this.cepage, required this.domaine, required this.pictureUrl});

  factory Wines.fromJson(Map<String, dynamic> json) {
    return Wines(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      year: json['year'],
      cepage: json['cepage'],
      domaine: json['domaine'],
      pictureUrl: json['pictureUrl'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'year': year,
      'cepage': cepage,
      'domaine': domaine,
      'pictureUrl': pictureUrl,
    };
  }

}