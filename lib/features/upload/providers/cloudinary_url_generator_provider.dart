import 'package:cloudinary_flutter/cloudinary_object.dart';
import 'package:cloudinary_url_gen/transformation/resize/resize.dart';
import 'package:cloudinary_url_gen/transformation/transformation.dart';
import 'package:taro_leaf_blight/core/utils/constants/credentials.dart';
import 'package:taro_leaf_blight/features/capture/providers/image_picker_provider.dart';
import 'package:taro_leaf_blight/features/upload/models/cloudinary_url_gen_model.dart';
import 'package:taro_leaf_blight/packages/packages.dart';



// class UrlGenService {
//   Future<String> _uploadImage() async {
    
//   }
// } 


class UrlGenRepo {
  final BackendService _apiService = BackendService(Dio());
  final url = '${AppEndpoints.cloudinaryUrl}${ApiCredentials.CL_NAME}/upload';

  Future<ResponseModel> uploadImage({required File file}) async {

    String fileName = file.path.split('/').last;
     FormData formData = FormData.fromMap({
        "file": await MultipartFile.fromFile(file.path, filename:fileName),
    });
    Response response = await _apiService.runCall(
      _apiService.dio.post(
        url,
        data: formData
      ),
    );

    final int statusCode = response.statusCode ?? 000;

    if (statusCode >= 200 && statusCode <= 300) {
      return ResponseModel<ImageUploadResponseModel>(
        valid: true,
        statusCode: statusCode,
        message: response.statusMessage,
        data: ImageUploadResponseModel.fromJson(response.data),
      );
    }

    return ResponseModel(
      error: ErrorModel.fromJson(response.data),
      statusCode: statusCode,
      message: response.data['error']['message'],
    );
  }
}



// we can display 
//  CldImageWidget(
//   publidId: 'sample',
//   transformation:Transformation()
//   ..resize(Resize.scale()..width(500)),
// ),
