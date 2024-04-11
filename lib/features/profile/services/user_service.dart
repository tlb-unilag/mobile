import 'package:taro_leaf_blight/core/services/local_data/local_data.dart';
import 'package:taro_leaf_blight/features/auth/presentation/login.dart';
import 'package:taro_leaf_blight/features/profile/models/user_response_model.dart';
import 'package:taro_leaf_blight/packages/packages.dart';

class UserService {
  UserService();
  Future<void> updateUser(
      {required String? email,
      required String? country,
      required String? countryState}) async {
    Dialogs.showLoadingDialog();
    final res = await userRepo.updateUser(
        email: email!, country: country!, countryState: countryState!);
    pop();
    if (res.valid) {
      if (email != LocalData.email) {
        pushToAndClearStack(const LoginScreen());
      }
      LocalData.setEmail(email);
      LocalData.setCountry(country);
      LocalData.setCountryState(countryState);
      Dialogs.showSuccessSnackbar(message: "Data Updated successfuly");
    } else {
      // }
      Dialogs.showErrorSnackbar(message: res.error!.data["data"]["detail"]);
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
      _apiService.dio.put('${AppEndpoints.baseUrl}/user',
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
