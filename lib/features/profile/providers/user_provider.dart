import 'package:taro_leaf_blight/core/utils/string_exception.dart';
import 'package:taro_leaf_blight/features/profile/models/user_response_model.dart';
import 'package:taro_leaf_blight/features/profile/services/user_service.dart';
import 'package:taro_leaf_blight/packages/packages.dart';

final userProvider = FutureProvider((ref) async {
  ResponseModel<UserResponseModel> res = await userRepo.getUser();
  if (!res.valid) {
    throw StringException(res.message ?? 'Something went wrong');
  } else {
    return res;
  }
});
