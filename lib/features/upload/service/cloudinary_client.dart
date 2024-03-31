import 'package:dio_smart_retry/dio_smart_retry.dart';
import 'package:taro_leaf_blight/features/upload/models/cloudinary_resource_type.dart';
import 'package:taro_leaf_blight/features/upload/models/cloudinary_response.dart';
import 'package:taro_leaf_blight/features/upload/service/cloudinary_api.dart';
import 'package:taro_leaf_blight/packages/packages.dart';

class CloudinaryClient extends CloudinaryApi {
  static const _signedRequestAssertMessage = 'This endpoint requires an '
      'authorized request, check the Cloudinary constructor you are using and '
      'make sure you are using a valid `apiKey`, `apiSecret` and `cloudName`.';

  final String apiKey;
  final String apiSecret;
  final String cloudName;

  CloudinaryClient({
    String? apiUrl,
    required this.apiKey,
    required this.apiSecret,
    required this.cloudName,
  }) : super(
          // url: apiUrl,
          apiKey: apiKey,
          apiSecret: apiSecret,
        );

  bool get isBasic => apiKey.isEmpty || apiSecret.isEmpty || cloudName.isEmpty;

  Future<ResponseModel<CloudinaryResponseModel>> uploadResource({
    String? filePath,
    List<int>? fileBytes,
    String? publicId,
    String? fileName,
    String? folder,
    CloudinaryResourceType? resourceType,
    Map<String, dynamic>? optParams,
    ProgressCallback? progressCallback,
  }) async {
    assert(!isBasic, _signedRequestAssertMessage);

    if (filePath == null && fileBytes == null) {
      throw Exception('One of filePath or fileBytes must not be null');
    }

    int timeStamp = DateTime.now().millisecondsSinceEpoch;
    resourceType ??= CloudinaryResourceType.auto;

    Map<String, dynamic> params = {};

    if (publicId != null || fileName != null) {
      params['public_id'] = publicId ?? fileName;
    }
    if (folder != null) params['folder'] = folder;

    /// Setting the optParams... this would override the public_id and folder if specified by user.
    if (optParams != null) params.addAll(optParams);
    params['api_key'] = apiKey;
    params['file'] = fileBytes != null
        ? MultipartFileRecreatable.fromBytes(fileBytes,
            filename:
                fileName ?? DateTime.now().millisecondsSinceEpoch.toString())
        : MultipartFileRecreatable.fromFileSync(filePath!);
    params['timestamp'] = timeStamp;
    params['signature'] =
        getSignature(secret: apiSecret, timeStamp: timeStamp, params: params);

    FormData formData = FormData.fromMap(params);

    ResponseModel<CloudinaryResponseModel> cloudinaryResponse;

    Response response = await apiService.runCall(
      postImage(
        '$cloudName/${resourceType.name}/upload',
        data: formData,
        onSendProgress: progressCallback,
      ),
    );

    final int statusCode = response.statusCode ?? 000;

    if (statusCode >= 200 && statusCode <= 300) {
      return ResponseModel<CloudinaryResponseModel>(
        valid: true,
        statusCode: statusCode,
        message: response.statusMessage,
        data: CloudinaryResponseModel.fromJson(response.data),
      );
    }

    cloudinaryResponse = ResponseModel(
      error: ErrorModel.fromJson(response.data),
      statusCode: statusCode,
      message: response.data['message'],
    );

    return cloudinaryResponse;
  }

  String? getSignature(
      {String? secret, int? timeStamp, Map<String, dynamic>? params}) {
    timeStamp ??= DateTime.now().millisecondsSinceEpoch;
    String? signature;
    try {
      Map<String, dynamic> signatureParams = {}..addAll(params ?? {});
      signatureParams['timestamp'] = timeStamp;

      //Removing unwanted params
      signatureParams.remove('api_key');
      signatureParams.remove('cloud_name');
      signatureParams.remove('file');
      signatureParams.remove('resource_type');

      //Merging key and value with '='
      List<String> paramsList = [];
      signatureParams.forEach((key, value) => paramsList.add('$key=$value'));

      //Sorting params alphabetically
      paramsList.sort();

      //Merging params with '&'
      StringBuffer stringParams = StringBuffer();
      if (paramsList.isNotEmpty) stringParams.write(paramsList[0]);
      for (int i = 1; i < paramsList.length; ++i) {
        stringParams.write('&${paramsList[i]}');
      }

      //Adding API Secret to the params
      stringParams.write(secret);

      //Generating signatureHash
      var bytes = utf8.encode(stringParams.toString().trim());
      signature = sha1.convert(bytes).toString();
    } catch (e) {
      print(e);
    }
    return signature;
  }
}

var cloudinaryClient = CloudinaryClient(
    apiKey: dotenv.env['CL_API_KEY']!,
    apiSecret: dotenv.env['CL_SECRET']!,
    cloudName: dotenv.env['CL_NAME']!);

