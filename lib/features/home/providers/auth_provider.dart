// import 'package:taro_leaf_blight/core/services/api_handler/app_endpoints.dart';
// import 'package:taro_leaf_blight/core/services/local_data/local_data.dart';
// import 'package:taro_leaf_blight/features/home/models/login_model.dart';
// import 'package:taro_leaf_blight/features/home/models/validate_model.dart';

// import 'package:taro_leaf_blight/packages/packages.dart';

// final authProvider = NotifierProvider<AuthNotifier, AuthRepo>(AuthNotifier.new);

// class AuthNotifier extends Notifier<AuthRepo> {
//   @override
//   build() {
//     return AuthRepo();
//   }

//   addChanges(AuthRepo repo) {
//     state = state.copyWith(
//       phone: repo.phone,
//     );
//   }

//   // logout([BuildContext? context]) {
//   //   LocalData.removeToken();
//   //   ref.refresh(authProvider);
//   //   if (context == null) return;
//   //   pushToAndClearStack(const OnboardingScreen());
//   // }

//   Future<void> loginUser({
//     required String phone,
//     required String authCode,
//   }) async {
//     Dialogs.showLoadingDialog();
//     final res = await state.loginWithOTP(
//       phone: phone,
//       authCode: authCode,
//     );
//     pop();
//     if (res.valid) {
//       LocalData.setToken(res.data!.token!);
//       // LocalData.setUser(res.data!.data!.user!.id!);
//       if (res.data?.user?.firstname == null) {
//         // pushTo(const CompleteYourProfleScreen());
//       } else {
//         // pushToAndClearStack(const Home());
//       }
//     } else {
//       Dialogs.showErrorSnackbar(message: res.error!.message!);
//     }
//   }

//   Future<void> sendSmsOtp({
//     required String phone,
//     bool goToVerify = false,
//   }) async {
//     Dialogs.showLoadingDialog();
//     final res = await state.sendPhoneOTP(
//       phone: phone,
//     );
//     pop();
//     if (res.valid) {
//       // LocalData.setToken(res.data!.token!);
//       // LocalData.setUser(res.data!.data!.user!.id!);
//     } else {
//       Dialogs.showErrorSnackbar(message: res.error!.message!);
//     }
//   }

//   Future<({bool exists, bool valid})?> validateEmail({
//     required String email,
//   }) async {
//     final res = await state.validateEmail(
//       email: email,
//     );
//     if (res.valid) {
//       return (exists: res.data!.exists!, valid: res.data!.valid!);
//     } else {
//       return null;
//     }
//   }

//   Future<({bool exists, bool valid})?> validatePhone({
//     required String phone,
//   }) async {
//     final res = await state.validatePhone(
//       phone: phone,
//     );
//     if (res.valid) {
//       return (exists: res.data!.exists!, valid: res.data!.valid!);
//     } else {
//       return null;
//     }
//   }

//   Future<({bool exists})?> validateReferral({
//     required String code,
//   }) async {
//     final res = await state.validateReferralCode(
//       code: code,
//     );
//     if (res.valid) {
//       return (exists: res.data!.exists!);
//     } else {
//       return null;
//     }
//   }
// }

// enum SendEmailOTPAction {
//   signIn('SIGN_IN'),
//   withdrawal('WITHDRAWAL');

//   const SendEmailOTPAction(this.action);
//   final String action;
// }

// class AuthRepo {
//   String? phone;
//   String? email;
//   String? referralCode;
//   AuthRepo({
//     this.phone,
//     this.email,
//     this.referralCode,
//   });

//   final BackendService _apiService = BackendService(Dio());

//   //copyWith
//   AuthRepo copyWith({
//     String? phone,
//     String? email,
//   }) {
//     return AuthRepo(
//       phone: phone ?? this.phone,
//       email: email ?? this.email,
//     );
//   }

//   Future<ResponseModel> sendEmailOTP({
//     SendEmailOTPAction action = SendEmailOTPAction.signIn,
//     required String email,
//   }) async {
//     Response response = await _apiService.runCall(
//       _apiService.dio.post(
//         '${AppEndpoints.baseUrl}/v2/auth/email-otp',
//         data: {
//           "action": action.action,
//           "accountType": "USER",
//           "email": email,
//         },
//       ),
//     );

//     final int statusCode = response.statusCode ?? 000;

//     if (statusCode >= 200 && statusCode <= 300) {
//       return ResponseModel(
//         valid: true,
//         statusCode: statusCode,
//         message: response.statusMessage,
//         data: response.data,
//       );
//     }

//     return ResponseModel(
//       error: ErrorModel.fromJson(response.data),
//       statusCode: statusCode,
//       message: response.data['message'],
//     );
//   }

//   Future<ResponseModel> sendPhoneOTP({
//     SendEmailOTPAction action = SendEmailOTPAction.signIn,
//     required String phone,
//   }) async {
//     Response response = await _apiService.runCall(
//       _apiService.dio.post(
//         '${AppEndpoints.baseUrl}/v2/auth/sms-otp',
//         data: {
//           "action": action.action,
//           "accountType": "USER",
//           "phonenumber": phone,
//         },
//       ),
//     );

//     final int statusCode = response.statusCode ?? 000;

//     if (statusCode >= 200 && statusCode <= 300) {
//       return ResponseModel(
//         valid: true,
//         statusCode: statusCode,
//         message: response.statusMessage,
//         data: response.data,
//       );
//     }

//     return ResponseModel(
//       error: ErrorModel.fromJson(response.data),
//       statusCode: statusCode,
//       message: response.data['message'],
//     );
//   }

//   Future<ResponseModel> sendWhatsappOTP({
//     SendEmailOTPAction action = SendEmailOTPAction.signIn,
//     required String email,
//   }) async {
//     Response response = await _apiService.runCall(
//       _apiService.dio.post(
//         '${AppEndpoints.baseUrl}/v2/auth/whatsapp-otp',
//         data: {
//           "action": action.action,
//           "accountType": "USER",
//           "phonenumber": email,
//         },
//       ),
//     );

//     final int statusCode = response.statusCode ?? 000;

//     if (statusCode >= 200 && statusCode <= 300) {
//       return ResponseModel(
//         valid: true,
//         statusCode: statusCode,
//         message: response.statusMessage,
//         data: response.data,
//       );
//     }

//     return ResponseModel(
//       error: ErrorModel.fromJson(response.data),
//       statusCode: statusCode,
//       message: response.data['message'],
//     );
//   }

//   Future<ResponseModel<LoginModel>> loginWithOTP({
//     required String phone,
//     required String authCode,
//     String? referralCode,
//   }) async {
//     Response response = await _apiService.runCall(
//       _apiService.dio.post(
//         '${AppEndpoints.baseUrl}/v2/auth/sign-in/otp',
//         data: {
//           "phonenumber": phone,
//           "authCode": authCode,
//           "referralCode": referralCode,
//           "platform": Platform.isIOS ? "IOS" : "ANDROID",
//           "rememberMe": true
//         },
//       ),
//     );

//     final int statusCode = response.statusCode ?? 000;

//     if (statusCode >= 200 && statusCode <= 300) {
//       return ResponseModel<LoginModel>(
//         valid: true,
//         statusCode: statusCode,
//         message: response.statusMessage,
//         data: LoginModel.fromJson(response.data),
//       );
//     }

//     return ResponseModel(
//       error: ErrorModel.fromJson(response.data),
//       statusCode: statusCode,
//       message: response.data['message'],
//     );
//   }

//   Future<ResponseModel<ValidateModel>> validateEmail({
//     required String email,
//   }) async {
//     Response response = await _apiService.runCall(
//       _apiService.dio.post(
//         '${AppEndpoints.baseUrl}' '/v2/utils/validate-email',
//         data: {
//           "accountType": "USER",
//           "email": email,
//         },
//       ),
//     );

//     final int statusCode = response.statusCode ?? 000;

//     if (statusCode >= 200 && statusCode <= 300) {
//       return ResponseModel<ValidateModel>(
//         valid: true,
//         statusCode: statusCode,
//         message: response.statusMessage,
//         data: ValidateModel.fromJson(response.data),
//       );
//     }

//     return ResponseModel(
//       error: ErrorModel.fromJson(response.data),
//       statusCode: statusCode,
//       message: response.data['message'],
//     );
//   }

//   Future<ResponseModel<ValidateModel>> validatePhone({
//     required String phone,
//   }) async {
//     Response response = await _apiService.runCall(
//       _apiService.dio.post(
//         '${AppEndpoints.baseUrl}' '/v2/utils/validate-phone-number',
//         data: {
//           "accountType": "USER",
//           "phonenumber": phone,
//         },
//       ),
//     );

//     final int statusCode = response.statusCode ?? 000;

//     if (statusCode >= 200 && statusCode <= 300) {
//       return ResponseModel<ValidateModel>(
//         valid: true,
//         statusCode: statusCode,
//         message: response.statusMessage,
//         data: ValidateModel.fromJson(response.data),
//       );
//     }

//     return ResponseModel(
//       error: ErrorModel.fromJson(response.data),
//       statusCode: statusCode,
//       message: response.data['message'],
//     );
//   }

//   Future<ResponseModel<ValidateModel>> validateReferralCode({
//     required String code,
//   }) async {
//     Response response = await _apiService.runCall(
//       _apiService.dio.post(
//         '${AppEndpoints.baseUrl}' '/v2/utils/validate-referral-code',
//         data: {
//           "code": code,
//         },
//       ),
//     );

//     final int statusCode = response.statusCode ?? 000;

//     if (statusCode >= 200 && statusCode <= 300) {
//       return ResponseModel<ValidateModel>(
//         valid: true,
//         statusCode: statusCode,
//         message: response.statusMessage,
//         data: ValidateModel.fromJson(response.data),
//       );
//     }

//     return ResponseModel(
//       error: ErrorModel.fromJson(response.data),
//       statusCode: statusCode,
//       message: response.data['message'],
//     );
//   }
// }
