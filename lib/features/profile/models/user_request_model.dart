// To parse this JSON data, do
//
//     final UserRequestModel = UserRequestModelFromJson(jsonString);

import 'dart:convert';

UserRequestModel loginModelFromJson(String str) =>
    UserRequestModel.fromJson(json.decode(str));

// String loginModelToJson(LoginRequestModel data) => json.encode(data.toJson());

class UserRequestModel {
  String? email;
  String? country;
  String? state;

  UserRequestModel({
   required this.email,
   required this.country,
   required this.state
  });

  UserRequestModel copyWith({
    String? email,
    String? country,
    String? state,
  }) =>
      UserRequestModel(
        email: email ?? this.email,
        country: country ?? this.country,
        state: state ?? this.state
      );

  factory UserRequestModel.fromJson(Map<String, dynamic> json) =>
      UserRequestModel(
        email: json["email"],
        country: json["country"],
        state: json["state"]
      );
  // Map<String, dynamic> toJson() => {
  //       "accessToken": access_token,
  //       "token_type": token_type,

  //     };
}
