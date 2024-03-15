import 'package:taro_leaf_blight/features/auth/providers/auth_provider.dart';
import 'package:taro_leaf_blight/features/detection/models/detection_model.dart';
import 'package:taro_leaf_blight/packages/packages.dart';
import 'package:taro_leaf_blight/widgets/dialog_parameters_widget.dart';

// lets are not tampering with our service!

class DetectionService {
  final AuthNotifier notifier;

  DetectionService(this.notifier, {this.imageUrl});

  String? imageUrl;
  final BackendService _apiService = BackendService(Dio());

  DetectionService copyWith({String? imageUrl}) {
    return DetectionService(notifier, imageUrl: imageUrl);
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

  Future<ResponseModel<SingleDetectionResponseModel>> getDetectionById({required String detectionId}) async {
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
          Dialogs.showAlertDialog(
           DialogParameters(
        title: const Text(
          "Permission Denied",
          style: CustomTextStyle.labelLXBold,
        ),
        contentText:
            'Your session has expired. Kindly login again ',
        enableButtonText: 'Ok',
        onEnablePressed:notifier.logout(),
        // onDisablePressed: ,
      ));
    }
    return ResponseModel(
      error: ErrorModel.fromJson(response.data),
      statusCode: statusCode,
      message: response.data['message'],
    );
  }
}

final notifier = AuthNotifier();

var detectionService = DetectionService(notifier);
