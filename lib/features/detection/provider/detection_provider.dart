import 'package:flutter/foundation.dart';
import 'package:taro_leaf_blight/core/utils/string_exception.dart';
import 'package:taro_leaf_blight/features/detection/models/detection_model.dart';
import 'package:taro_leaf_blight/features/detection/service/detection_service.dart';
import 'package:taro_leaf_blight/features/info/presentation/info.dart';
import 'package:taro_leaf_blight/packages/packages.dart';


Future<ResponseModel<SingleDetectionResponseModel>> detectOneImage(
  String? imageUrl,
) async {
  Dialogs.showLoadingDialog(
      child: SizedBox(
    height: 100.h,
    child: Column(
      children: [
        const CircularProgressIndicator(),
        15.gap,
        Text("Detecting Image.....",
            style: CustomTextStyle.labelMedium.copyWith(color: Colors.white))
      ],
    ),
  ));
  ResponseModel<SingleDetectionResponseModel> res = await detectionService.detectOneImage(imageUrl: imageUrl);
  pop();
  var detectionId = res.data?.detectionId;
  if (res.valid) {
    pushTo(DetectionInfoScreen(
      detectionId: detectionId!,
    ));
  }
  if (!res.valid) {
    Dialogs.showErrorSnackbar(
        duration: const Duration(seconds: 8),
        message: res.message!,
        action: SnackBarAction(
            textColor: Colors.white,
            label: "Retry",
            onPressed: () {
              detectOneImage(imageUrl);
            }));
  }
  return res;
}

final getDetectionByIdProvider = FutureProvider.family((ref, String id) async {
  ResponseModel<SingleDetectionResponseModel> res =
      await detectionService.getDetectionById(detectionId: id);
  if (!res.valid) {
    throw StringException(res.message ?? 'Something went wrong');
  } else {
    if (kDebugMode) {
      print(res);
    }
    return res;
  }
});

final getAllDetectionsProvider = FutureProvider((ref) async {
  ResponseModel<MultipleDetectionResponseModel> res =
      await detectionService.getAllDetections();
  if (!res.valid) {
    throw StringException(res.message ?? 'Something went wrong');
  } else {
    return res;
  }
});
