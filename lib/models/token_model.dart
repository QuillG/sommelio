import "dart:convert";

tokenModel tokenModelFromJson(String str) => tokenModel.fromJson(json.decode(str));

String tokenModelToJson(tokenModel data) => json.encode(data.toJson());

class tokenModel {
  String accessToken;
  String tokenType;

  tokenModel({
    required this.accessToken,
    required this.tokenType,
  });

  factory tokenModel.fromJson(Map<String, dynamic> json) => tokenModel(
    accessToken: json["AccessToken"],
    tokenType: json["RefreshToken"],
  );

  Map<String, dynamic> toJson() => {
    "AccessToken": accessToken,
    "RefreshToken": tokenType,
  };


}