import 'dart:convert';

ValidateModel validateModelFromJson(String str) =>
    ValidateModel.fromJson(json.decode(str));

String validateModelToJson(ValidateModel data) => json.encode(data.toJson());

class ValidateModel {
  String? detail;

  ValidateModel({
    this.detail,
  });

  ValidateModel copyWith({
    String? detail,
  }) =>
      ValidateModel(
        detail: detail ?? this.detail,
      );

  factory ValidateModel.fromJson(Map<String, dynamic> json) => ValidateModel(
        detail: json["detail"],
      );

  Map<String, dynamic> toJson() => {
        "detail": detail,
      };
}



// ): This is the response here : {"message":"Something went wrong. Please try
// again later","errorCode":"000","errorField":"null","data":{"detail":"User not found"}}