import 'package:taro_leaf_blight/features/detection/models/detection_model.dart';
import 'package:taro_leaf_blight/packages/packages.dart';

// lets are not tampering with our service!
class DetectionService {
  DetectionService({this.imageUrl});

  final BackendService _apiService = BackendService(Dio());
  String? imageUrl;

  DetectionService copyWith({String? imageUrl}) {
    return DetectionService(imageUrl: imageUrl ?? this.imageUrl);
  }

  Future<ResponseModel<SingleDetectionResponseModel>> detectOneImage({
    required String? imageUrl,
  }) async {
    Response response = await _apiService.runCall(
      _apiService.dio.post(
        '${AppEndpoints.baseUrl}/detection',
        data: {"image_url": imageUrl},
      ),
    );

    final int statusCode = response.statusCode ?? 000;

    if (statusCode >= 200 && statusCode <= 300) {
      return ResponseModel<SingleDetectionResponseModel>(
        valid: true,
        statusCode: statusCode,
        message: response.statusMessage,
        data: SingleDetectionResponseModel.fromJson(response.data),
      );
    }

    return ResponseModel(
      error: ErrorModel.fromJson(response.data),
      statusCode: statusCode,
      message: response.data['message'],
    );
  }

  Future<ResponseModel<SingleDetectionResponseModel>> getDetectionById({required String? detectionId}) async {
    Response response = await _apiService.runCall(
      _apiService.dio.get('${AppEndpoints.baseUrl}/detection/$detectionId'),
    );

    final int statusCode = response.statusCode ?? 000;

    if (statusCode >= 200 && statusCode <= 300) {
      return ResponseModel<SingleDetectionResponseModel>(
        valid: true,
        statusCode: statusCode,
        message: response.statusMessage,
        data: SingleDetectionResponseModel.fromJson(response.data),
      );
    }
    return ResponseModel(
      error: ErrorModel.fromJson(response.data),
      statusCode: statusCode,
      message: response.data['message'],
    );
  }

  Future<ResponseModel<MultipleDetectionResponseModel>> getAllDetections() async {
    Response response = await _apiService.runCall(
      _apiService.dio.get('${AppEndpoints.baseUrl}/detection'),
    );

    final int statusCode = response.statusCode ?? 000;

    if (statusCode >= 200 && statusCode <= 300) {
      return ResponseModel<MultipleDetectionResponseModel>(
        valid: true,
        statusCode: statusCode,
        message: response.statusMessage,
        data: MultipleDetectionResponseModel.fromJson(response.data),
      );
    }
    if (statusCode == 401) {
      // Dialogs.confirmDialog()
      // we need an removable dialog that has a button
      // yeah this part will render as an error in the recents body , we will get the message from here and throw it as an execption so we can catch it in the when()
      // show error snackbar "Your session has expired, login again , click button logs you out,takes you to login screen"
    }
    return ResponseModel(
      error: ErrorModel.fromJson(response.data),
      statusCode: statusCode,
      message: response.data['message'],
    );
  }
}

var detectionService = DetectionService();
