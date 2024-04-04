import 'package:flutter/foundation.dart';
import 'package:taro_leaf_blight/features/profile/models/user_request_model.dart';
import 'package:taro_leaf_blight/packages/packages.dart';

class UserService {
  UserService();
  Future<ResponseModel> getUser(
      {required String? email, required String? password}) async {
    Dialogs.showLoadingDialog();
    ResponseModel res = await userRepo.getUser();
    pop();
    if (res.valid) {
      return res;
    } else {
      Dialogs.showErrorSnackbar(message: res.error!.message!);
    }
    return res;
  }

  Future<void> updateUser(
      {required String? email,
      required String? country,
      required String? countryState}) async {
    Dialogs.showLoadingDialog();
    final res = await userRepo.updateUser(
        email: email!, country: country!, countryState: countryState!);
    pop();
    if (res.valid) {
      Dialogs.showSuccessSnackbar(message: "Data Updated successfuly");
    } else {
      print(res);
      // if (kDebugMode) {
      print(res.message);
      // }
      Dialogs.showErrorSnackbar(message: res.error!.message!);
    }
  }
}

var userService = UserService();

class UserRepo {
  // UserRepo({required this.country, required this.email, required this.state});

  // String? email;
  // String? country;
  // String? state;
  final BackendService _apiService = BackendService(Dio());

  // UserRepo copyWith({String? email, String? country, String? state}) {
  //   return UserRepo(country: country, email: email, state: state);
  // }

  Future<ResponseModel<UserResponseModel>> getUser() async {
    Response response = await _apiService.runCall(
      _apiService.dio.get('${AppEndpoints.baseUrl}/user'),
    );

    final int statusCode = response.statusCode ?? 000;

    if (statusCode >= 200 && statusCode <= 300) {
      return ResponseModel<UserResponseModel>(
        valid: true,
        statusCode: statusCode,
        message: response.statusMessage,
        data: UserResponseModel.fromJson(response.data),
      );
    }

    return ResponseModel(
      error: ErrorModel.fromJson(response.data),
      statusCode: statusCode,
      message: response.data['message'],
    );
  }

  Future<ResponseModel<UserResponseModel>> updateUser({
    required String email,
    required String country,
    required String countryState,
  }) async {
    Response response = await _apiService.runCall(
      _apiService.dio.put('${AppEndpoints.baseUrl}/user/',
          data: {"email": email, "country": country, "state": countryState}),
    );

    final int statusCode = response.statusCode ?? 000;

    if (statusCode >= 200 && statusCode <= 300) {
      return ResponseModel<UserResponseModel>(
        valid: true,
        statusCode: statusCode,
        message: response.statusMessage,
        data: UserResponseModel.fromJson(response.data),
      );
    }
    return ResponseModel(
      error: ErrorModel.fromJson(response.data),
      statusCode: statusCode,
      message: response.data['message'],
    );
  }
}

var userRepo = UserRepo();
