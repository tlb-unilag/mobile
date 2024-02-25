import 'package:taro_leaf_blight/core/core.dart';
import 'package:taro_leaf_blight/core/utils/string_exception.dart';
import 'package:taro_leaf_blight/features/detection/service/detection_service.dart';
import 'package:taro_leaf_blight/packages/global_packages.dart';




final detectOneImageProvider =
    FutureProvider.family((ref, String? imageUrl) async {
  ResponseModel res = await detectionService.detectOneImage(imageUrl: imageUrl);
  if (!res.valid) {
    throw StringException(res.message ?? 'Something went wrong');
  }
  return res;
});

final getDetectionByIdProvider = FutureProvider.family((ref, String? id) async {
  ResponseModel res = await detectionService.getDetectionById(detectionId: id);
  if (!res.valid) {
    throw StringException(res.message ?? 'Something went wrong');
  } else {
    return res;
  }
});

final getAllDetectionsProvider = FutureProvider((ref) async {
  var res = await Future.delayed(const Duration(seconds: 5))
      .then((value) => detectionService.getAllDetections());
  if (!res.valid) {
    throw StringException(res.message ?? 'Something went wrong');
  } else {
    return res;
  }
});
