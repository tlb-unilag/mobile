
import 'dart:convert';

ImageUploadResponseModel loginModelFromJson(String str) =>
    ImageUploadResponseModel.fromJson(json.decode(str));

// String lImageUploadResponseModelToJson(LoginResponseModel data) => json.encode(data.toJson());

class ImageUploadResponseModel {
  String? imageUrl;

  ImageUploadResponseModel({
    required this.imageUrl,
  });

  ImageUploadResponseModel copyWith({
    String? imageUrl,
    String? tokenType,
  }) =>
      ImageUploadResponseModel(
        imageUrl: imageUrl ?? this.imageUrl,
      );

  factory ImageUploadResponseModel.fromJson(Map<String, dynamic> json) =>
      ImageUploadResponseModel(
        imageUrl: json["url"],
      );

  // Map<String, dynamic> toJson() => {
  //       "imageUrl": imageUrl,

  //     };
}
