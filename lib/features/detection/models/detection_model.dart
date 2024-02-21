class SingleDetectionResponseModel {
  String detectionId;
  String imageUrl;
  int taroLate;
  int taroMid;
  int taroEarly;
  String userId;
  DateTime createdAt;

  SingleDetectionResponseModel({
    required this.detectionId,
    required this.imageUrl,
    required this.taroLate,
    required this.taroMid,
    required this.taroEarly,
    required this.userId,
    required this.createdAt,
  });

  factory SingleDetectionResponseModel.fromJson(Map<String, dynamic> json) {
    return SingleDetectionResponseModel(
      detectionId: json['detection_id'],
      imageUrl: json['image_url'],
      taroLate: json['taro_late'],
      taroMid: json['taro_mid'],
      taroEarly: json['taro_early'],
      userId: json['user_id'],
      createdAt: DateTime.parse(json['created_at']),
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['detection_id'] = detectionId;
    data['image_url'] = imageUrl;
    data['taro_late'] = taroLate;
    data['taro_mid'] = taroMid;
    data['taro_early'] = taroEarly;
    data['user_id'] = userId;
    data['created_at'] = createdAt.toIso8601String();
    return data;
  }
}

class MultipleDetectionResponseModel {
  List<SingleDetectionResponseModel> detections;

  MultipleDetectionResponseModel({required this.detections});

  factory MultipleDetectionResponseModel.fromJson(Map<String, dynamic> json) {
    List<SingleDetectionResponseModel> detectionsList = [];
    if (json['detections'] != null) {
      json['detections'].forEach((v) {
        detectionsList.add(SingleDetectionResponseModel.fromJson(v));
      });
    }
    return MultipleDetectionResponseModel(detections: detectionsList);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['detections'] = detections.map((v) => v.toJson()).toList();
    return data;
  }
}
