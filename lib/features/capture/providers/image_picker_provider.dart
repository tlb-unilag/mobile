import 'package:taro_leaf_blight/packages/global_packages.dart';

class LocalImagePicker {
  Future<File> getImage(ImageSource source) async {
    final ImagePicker _picker = ImagePicker();

    final XFile? pickedFile =
        await _picker.pickImage(source: source, imageQuality: 200);

    File file = File(pickedFile!.path);

    return file;
  }
}

final localImagePicker = LocalImagePicker();

