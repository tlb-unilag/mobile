// import 'package:taro_leaf_blight/core/utils/string_exception.dart';
// import 'package:taro_leaf_blight/packages/global_packages.dart';
//package_info_plus package breaks build 
// final appInfoProvider = FutureProvider((ref) async {
//   Map<String, String> res =
//       await PackageInfo.fromPlatform().then((PackageInfo packageInfo) {
//     String appName = packageInfo.appName;
//     String packageName = packageInfo.packageName;
//     String version = packageInfo.version;
//     String buildNumber = packageInfo.buildNumber;
//     return {
//       "appName": appName,
//       "packageName": packageName,
//       "version": version,
//       "buildNumber": buildNumber
//     };
//   }).catchError((err) => throw StringException(err ?? 'Something went wrong'));
//   return res;
// });
