import 'package:taro_leaf_blight/core/utils/string_exception.dart';
import 'package:taro_leaf_blight/features/upload/models/cloudinary_resource_type.dart';
import 'package:taro_leaf_blight/features/upload/models/cloudinary_response.dart';
import 'package:taro_leaf_blight/features/upload/service/cloudinary_client.dart';
import 'package:taro_leaf_blight/packages/packages.dart';

// make a repo out of this and adapt ids
class CloudinaryApiService {
  Future<ResponseModel<CloudinaryResponseModel>> uploadImage(
    File file,
  ) async {
    Dialogs.showLoadingDialog(
        child: SizedBox(
      height: 100.h,
      child: Column(
        children: [
          const CircularProgressIndicator(),
          15.gap,
          Text("Uploading Image",
              style: CustomTextStyle.labelMedium.copyWith(color: Colors.white))
        ],
      ),
    ));

    var res = await cloudinaryClient.uploadResource(
      filePath: file.path,
      fileBytes: file.readAsBytesSync(),
      resourceType: CloudinaryResourceType.image,
      progressCallback: (count, total) {},
    );
    pop();
    if (!res.valid) {
      Dialogs.showErrorSnackbar(
        message: res.message!,
      );
    }
    return res;
  }
}

var cloudinaryService = CloudinaryApiService();
