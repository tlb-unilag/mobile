// To parse this JSON data, do
//
//     final UserResponseModel = UserResponseModelFromJson(jsonString);

import 'dart:convert';

UserResponseModel loginModelFromJson(String str) =>
    UserResponseModel.fromJson(json.decode(str));

// String loginModelToJson(LoginResponseModel data) => json.encode(data.toJson());

class UserResponseModel {
  String userId;
  String? email;
  String? country;
  String? state;
  String? createdAt;
  String? updatedAt;
  UserResponseModel(
      {required this.userId,
      required this.email,
      required this.country,
      required this.state, required this.updatedAt, required this.createdAt});

  UserResponseModel copyWith({
    String? userId,
    String? email,
    String? country,
    String? state,
    String? createdAt,
    String? updatedAt,
  }) =>
      UserResponseModel(
          userId: userId ?? this.userId,
          email: email ?? this.email,
          country: country ?? this.country,
          state: state ?? this.state,
          createdAt: createdAt ?? this.createdAt,
          updatedAt:updatedAt ?? this.updatedAt
        );

  factory UserResponseModel.fromJson(Map<String, dynamic> json) =>
      UserResponseModel(
          userId: json["user_id"],
          email: json["email"],
          country: json["country"],
          state: json["state"],
          createdAt: json["created_at"],
          updatedAt: json["updated_at"],
        );
  // Map<String, dynamic> toJson() => {
  //       "accessToken": access_token,
  //       "token_type": token_type,

  //     };
}


