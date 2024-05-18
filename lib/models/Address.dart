class Address {
  final String? street;
  final String? city;
  final String? state;
  final String? zip;

  Address({this.street, this.city, this.state, this.zip});

  factory Address.fromJson(Map<String, dynamic> json) {
    return Address(
      street: json['street'],
      city: json['city'],
      state: json['state'],
      zip: json['zip'],
    );
  }
}