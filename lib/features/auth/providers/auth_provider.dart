import 'package:flutter/foundation.dart';
import 'package:taro_leaf_blight/core/services/local_data/local_data.dart';
import 'package:taro_leaf_blight/features/auth/models/auth_model.dart';
import 'package:taro_leaf_blight/features/auth/models/validate_model.dart';
import 'package:taro_leaf_blight/features/auth/presentation/login.dart';
import 'package:taro_leaf_blight/features/auth/presentation/reset_password.dart';
import 'package:taro_leaf_blight/features/home/presentation/home.dart';
import 'package:taro_leaf_blight/features/onboarding/presentation/onboarding.dart';
import 'package:taro_leaf_blight/packages/packages.dart';

final authProvider = NotifierProvider<AuthNotifier, AuthRepo>(AuthNotifier.new);

class AuthNotifier extends Notifier<AuthRepo> {
  @override
  build() {
    return AuthRepo();
  }

  logout([BuildContext? context]) {
    LocalData.removeToken();
    pushToAndClearStack(const OnboardingScreen());
  }

  addChanges({required AuthRepo repo}) {
    state = state.copyWith(
      email: repo.email,
      password: repo.password,
    );
  }

// for incorrect login details it says something went wrong please try again later which is wrong
  Future<void> loginUser(
      {required String? email, required String? password}) async {
    Dialogs.showLoadingDialog();
    ResponseModel res = await state.loginWithEmailAndPassword(
        email: email!, password: password!);
    pop();
    if (res.valid) {
      LocalData.setToken(res.data!.accessToken!);
      pushToAndClearStack(const HomeScreen());
    } else {
      Dialogs.showErrorSnackbar(message: res.error!.message!);
    }
  }

  Future<void> registerUser(
      {required String? email,
      required String? password,
      required String? country,
      required String? countryState}) async {
    Dialogs.showLoadingDialog();
    final res = await state.registerWithEmailAndPassword(
        email: email!,
        password: password!,
        country: country!,
        countryState: countryState!);
    pop();
    if (res.valid) {
      LocalData.setToken(res.data!.accessToken!);
      LocalData.setEmail(email);
      LocalData.setCountry(country);
      LocalData.setCountryState(countryState);
      pushToAndClearStack(const HomeScreen());
    } else {
      if (kDebugMode) {
        print(res.message);
      }
      Dialogs.showErrorSnackbar(message: res.error!.message!);
    }
  }

  Future<void> receivePasswordResetToken({required String? email}) async {
    Dialogs.showLoadingDialog();
    final res = await state.validateEmail(
      email: email!,
    );
    pop();
    if (res.valid) {
      Dialogs.showSuccessSnackbar(
          message: "Password reset token sent successfully , check your email ");
      pushToAndClearStack(ResetPasswordScreen(email: email,));
    } else {
      print(res);
      Dialogs.showErrorSnackbar(message: res.error!.message!);
      // Dialogs.showErrorSnackbar(message: res.error!.detail!);
    }
  }

  Future<void> resetPassword({
    required String? email, 
    required String? resetToken, 
    required String? newPassword
}) async {
    Dialogs.showLoadingDialog();
    final res = await state.resetPassword(
      resetToken: resetToken!,
      email: email!,
      newPassword: newPassword!
    );
    pop();
    if (res.valid) {
      Dialogs.showSuccessSnackbar(
          message: "Password reset successfully");
      pushToAndClearStack(const LoginScreen());
    } else {
      print(res);
      Dialogs.showErrorSnackbar(message: res.error!.message!);
      // Dialogs.showErrorSnackbar(message: res.error!.detail!);
    }
  }

}

class AuthRepo {
  AuthRepo({this.email, this.password, this.country, this.state});

  final BackendService _apiService = BackendService(Dio());
  bool isLoggedIn = false;
  String? email;
  String? password;
  String? country;
  String? state;

  //copyWith
  AuthRepo copyWith(
      {String? email, String? password, String? country, String? state}) {
    return AuthRepo(
        email: email ?? this.email,
        password: password ?? this.password,
        country: country ?? this.country,
        state: state ?? this.state);
  }

  Future<ResponseModel<AuthResponseModel>> loginWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    Response response = await _apiService.runCall(
      _apiService.dio.post(
        '${AppEndpoints.baseUrl}/login',
        data: {"email": email, "password": password},
      ),
    );

    final int statusCode = response.statusCode ?? 000;

    print("here is the response: $response");

    if (statusCode >= 200 && statusCode <= 300) {
      return ResponseModel<AuthResponseModel>(
        valid: true,
        statusCode: statusCode,
        message: response.statusMessage,
        data: AuthResponseModel.fromJson(response.data),
      );
    }

    return ResponseModel(
      error: ErrorModel.fromJson(response.data),
      statusCode: statusCode,
      message: response.data['message'],
    );
  }

  Future<ResponseModel> registerWithEmailAndPassword(
      {required String email,
      required String password,
      required String country,
      required String countryState}) async {
    Response response = await _apiService.runCall(
      _apiService.dio.post(
        '${AppEndpoints.baseUrl}/signup',
        data: {
          "email": email,
          "password": password,
          "country": country,
          "state": countryState
        },
      ),
    );

    final int statusCode = response.statusCode ?? 000;

    if (statusCode >= 200 && statusCode <= 300) {
      return ResponseModel<AuthResponseModel>(
        valid: true,
        statusCode: statusCode,
        message: response.statusMessage,
        data: AuthResponseModel.fromJson(response.data),
      );
    }

    return ResponseModel(
      error: ErrorModel.fromJson(response.data['detail']),
      statusCode: statusCode,
      message: response.data['message'],
    );
  }

  Future<ResponseModel<ValidateModel>> validateEmail({
    required String email,
  }) async {
    Response response = await _apiService.runCall(
      _apiService.dio.post(
        '${AppEndpoints.baseUrl}/forgot-password',
        data: {
          "email": email,
        },
      ),
    );

    // this is the response here
    final int statusCode = response.statusCode ?? 000;

    if (statusCode >= 200 && statusCode <= 300) {
      return ResponseModel<ValidateModel>(
        valid: true,
        statusCode: statusCode,
        message: response.statusMessage,
        data: ValidateModel.fromJson(response.data),
      );
    }
    print("here is the response: ${response}");
    print("here is the response: ${response.data}");

    return ResponseModel(
      error: ErrorModel.fromJson(response.data),
      statusCode: statusCode,
      message: response.data['message'],
    );
  }
  Future<ResponseModel<ValidateModel>> resetPassword({
    required String email,
    required String resetToken,
    required String newPassword
  }) async {
    Response response = await _apiService.runCall(
      _apiService.dio.post(
        '${AppEndpoints.baseUrl}/reset-password',
        data: {
          "email": email,
          "reset_token": resetToken,
          "new_password": newPassword
        },
      ),
    );

    // this is the response here
    final int statusCode = response.statusCode ?? 000;

    if (statusCode >= 200 && statusCode <= 300) {
      return ResponseModel<ValidateModel>(
        valid: true,
        statusCode: statusCode,
        message: response.statusMessage,
        data: ValidateModel.fromJson(response.data),
      );
    }
    print("here is the response: ${response}");
    print("here is the response: ${response.data}");

    return ResponseModel(
      error: ErrorModel.fromJson(response.data),
      statusCode: statusCode,
      message: response.data['message'],
    );
  }
}
