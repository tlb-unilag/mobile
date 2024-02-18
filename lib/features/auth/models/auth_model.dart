// To parse this JSON data, do
//
//     final loginModel = loginModelFromJson(jsonString);

import 'dart:convert';

AuthResponseModel loginModelFromJson(String str) =>
    AuthResponseModel.fromJson(json.decode(str));

// String loginModelToJson(LoginResponseModel data) => json.encode(data.toJson());

class AuthResponseModel {
  String? accessToken;
  String? tokenType;

  AuthResponseModel({
    required this.accessToken,
    required this.tokenType,
  });

  AuthResponseModel copyWith({
    String? accessToken,
    String? user,
  }) =>
      AuthResponseModel(
        accessToken: accessToken ?? this.accessToken,
        tokenType: tokenType ?? this.tokenType,
      );

  factory AuthResponseModel.fromJson(Map<String, dynamic> json) => AuthResponseModel(
        accessToken: json["access_token"],
        tokenType: json["token_type"],
      );

  // Map<String, dynamic> toJson() => {
  //       "accessToken": access_token,
  //       "token_type": token_type,
  
  //     };
}



