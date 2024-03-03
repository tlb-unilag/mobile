import 'package:taro_leaf_blight/core/utils/string_exception.dart';
import 'package:taro_leaf_blight/features/detection/models/detection_model.dart';
import 'package:taro_leaf_blight/features/detection/service/detection_service.dart';
import 'package:taro_leaf_blight/features/info/presentation/info.dart';
import 'package:taro_leaf_blight/packages/packages.dart';
import 'package:taro_leaf_blight/widgets/dialog_parameters_widget.dart';

// the only reason for wanting it be a futurebuilder is that it will overlay the screen and wwe'll also be able to reload manually
// change this to a service (remember a futureProvider is basically a provider and a futureBuidler - theres nothing we want to build lol)

// we are passing the detection id to the page so the request will be made again , why don't we pass the object ?

// problem - it wouldn't be an AsyncValue - then convert it to one so we can consume it that way , not today

Future<ResponseModel<SingleDetectionResponseModel>> detectOneImage(
    // String? imageUrl
    BuildContext context) async {
  Dialogs.showLoadingDialog(
      child: SizedBox(
          height: 100.h,
          child: Column(
                children: [
          const CircularProgressIndicator(),
          15.gap,
           Text("Uploading Image", style: CustomTextStyle.labelMedium.copyWith(color: Colors.white))
              ],
           ),
        )
  );
  ResponseModel<SingleDetectionResponseModel> res =
      // will change it from hardcoded
      await detectionService.detectOneImage(
          imageUrl:
              'http://res.cloudinary.com/ogbanugot/image/upload/v1706998424/22b74606-d3df-4724-b2b1-fa7069f96f6c.png');
  var detectionId = res.data?.detectionId;
  pop();
  if (res.valid) {
    pushTo(DetectionInfoScreen(detectionId: detectionId!));
  }
  if (!res.valid) {
    Dialogs.showAlertDialog(
        DialogParameters(contentText: res.message!, enableButtonText: 'Retry'));
  }
  return res;
}

final getDetectionByIdProvider = FutureProvider.family((ref, String? id) async {
  ResponseModel res = await Future.delayed(Duration(seconds: 10))
      .then((value) => detectionService.getDetectionById(detectionId: id));
  if (!res.valid) {
    throw StringException(res.message ?? 'Something went wrong');
  } else {
    return res;
  }
});

final getAllDetectionsProvider = FutureProvider((ref) async {
  ResponseModel res = await detectionService.getAllDetections();
  if (!res.valid) {
    throw StringException(res.message ?? 'Something went wrong');
  } else {
    return res;
  }
});
