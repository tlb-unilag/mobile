import 'package:intl/intl.dart';
import 'package:taro_leaf_blight/core/utils/extensions/date_extensions.dart';

class SingleDetectionResponseModel {
  String detectionId;
  String imageUrl;
  int taroEarly;
  int taroNotEarly;
  int taroHealthy;
  String? userId;
  String createdAt;
  String solution;
  
  SingleDetectionResponseModel({
    required this.detectionId,
    required this.imageUrl,
    required this.taroEarly,
    required this.taroNotEarly,
    required this.taroHealthy,
    this.userId,
    required this.solution,
    required this.createdAt,
  });

  factory SingleDetectionResponseModel.fromJson(Map<String, dynamic> json) {
    return SingleDetectionResponseModel(
      detectionId: json['detection_id'],
      imageUrl: json['image_url'],
      taroEarly: json['early'],
      taroNotEarly: json['not_early'],
      taroHealthy: json['healthy'],
      userId: json['user_id'],
      solution: json['solution'],
      createdAt: DateFormat('yyyy-MM-dd HH:mm:ss')
          .format(DateTime.parse(json['created_at'])),
    );
  }
// .format(parsedDateTime);
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['detection_id'] = detectionId;
    data['image_url'] = imageUrl;
    data['early'] = taroEarly;
    data['not_early'] = taroNotEarly;
    data['healthy'] = taroHealthy;
    data['user_id'] = userId;
    data['solution'] = solution;
    data['created_at'] = createdAt;
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
