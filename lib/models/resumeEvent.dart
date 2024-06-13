class ResumeEvent {
  final int id;
  final String description;
  final String date;
  final String location;
  final String? pictureUrl;
  final String companyName;

  ResumeEvent(
      {required this.id,
      required this.description,
      required this.date,
      required this.location,
      this.pictureUrl,
      required this.companyName});

  factory ResumeEvent.fromJson(Map<String, dynamic> json) {
    return ResumeEvent(
      id: json['id'],
      description: json['description'],
      date: json['date'],
      location: json['location'],
      pictureUrl: json['pictureUrl'],
      companyName: json['companyName'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'description': description,
      'date': date,
      'location': location,
      'pictureUrl': pictureUrl,
      'compamyName': companyName,
    };
  }
}
