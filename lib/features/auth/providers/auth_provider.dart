import 'package:taro_leaf_blight/core/services/local_data/local_data.dart';
import 'package:taro_leaf_blight/features/auth/models/auth_model.dart';
import 'package:taro_leaf_blight/features/home/presentation/home.dart';
import 'package:taro_leaf_blight/features/onboarding/presentation/onboarding.dart';
import 'package:taro_leaf_blight/packages/packages.dart';

final authProvider = NotifierProvider<AuthNotifier, AuthRepo>(AuthNotifier.new);

class AuthNotifier extends Notifier<AuthRepo> {
  @override
  build() {
    return AuthRepo();
  }

  // refreshAuth() {
  //   state.isLoggedIn = LocalData.token != null;
  //   state = state;
  // }

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
      pushToAndClearStack(const HomeScreen());
    } else {
      Dialogs.showErrorSnackbar(message: res.error!.message!);
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

  Future<ResponseModel> loginWithEmailAndPassword({
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
      error: ErrorModel.fromJson(response.data),
      statusCode: statusCode,
      message: response.data['message'],
    );
  }
}
