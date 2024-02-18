// To parse this JSON data, do
//
//     final validateModel = validateModelFromJson(jsonString);

import 'dart:convert';

ValidateModel validateModelFromJson(String str) =>
    ValidateModel.fromJson(json.decode(str));

String validateModelToJson(ValidateModel data) => json.encode(data.toJson());

class ValidateModel {
  String? message;
  bool? valid;
  bool? exists;

  ValidateModel({
    this.message,
    this.valid,
    this.exists,
  });

  ValidateModel copyWith({
    String? message,
    bool? valid,
    bool? exists,
  }) =>
      ValidateModel(
        message: message ?? this.message,
        valid: valid ?? this.valid,
        exists: exists ?? this.exists,
      );

  factory ValidateModel.fromJson(Map<String, dynamic> json) => ValidateModel(
        message: json["message"],
        valid: json["valid"],
        exists: json["exists"],
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "valid": valid,
        "exists": exists,
      };
}
