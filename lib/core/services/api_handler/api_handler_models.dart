class ResponseModel<T> {
  late int? statusCode;
  late ErrorModel? error;
  late bool valid = false;
  late String? message = '';
  late String token;
  late T? data;
  late String? detail;

  ResponseModel({valid, message, statusCode, this.data, error, token}) {
    this.valid = valid ?? false;
    this.message = message ?? '';
    this.statusCode = statusCode ?? 000;
    this.token = token ?? '';
    this.error = error ?? ErrorModel();
  }
}

class ErrorModel {
  String? errorCode;
  String? message;
  dynamic errorField;
  dynamic data;
  ErrorModel({this.errorCode, this.message, this.errorField, this.data });

  @override
  String toString() {
    return '{errorCode: $errorCode, message: $message, detail: $data}';
  }

  factory ErrorModel.fromJson(dynamic data) {
    return ErrorModel(
        errorCode: data['errorCode'] ?? '',
        message: data['message'] ?? '',
        errorField: data['errorField'] ?? '',
        data: data 
      );
  }
}

class ErrorData {
  final dynamic data;

  ErrorData({required this.data});

  factory ErrorData.fromJson(Map<String, dynamic> json) {
    return ErrorData(
      data: json['detail'] ?? '',
    );
  }
}

