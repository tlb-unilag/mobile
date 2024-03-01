import 'package:taro_leaf_blight/packages/packages.dart';

class CloudinaryApiService {
  final BackendService apiService;
   final String apiUrl;

   CloudinaryApiService ({String? url, String? apiKey, String? apiSecret})
      : apiUrl = (url?.isEmpty ?? true) ? url = AppEndpoints.cloudinaryUrl : url!,
        apiService = BackendService(Dio(
          BaseOptions(
          baseUrl: '$url/',
        )
        ));

  Future<Response<T>> postImage<T>(
    String path, {
    data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) => apiService.dio.post(path,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress);
}

final urlGenService = CloudinaryApiService();
