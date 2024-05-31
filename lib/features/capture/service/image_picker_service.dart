import 'package:image_cropper/image_cropper.dart';
import 'package:taro_leaf_blight/packages/packages.dart';

class LocalImagePickerService {
  final ImagePicker _picker = ImagePicker();
  final ImageCropper _cropper = ImageCropper();

  // need to use this
  static Future<String?> _retrieveLostData() async {
    if (!Platform.isAndroid) return null;
    final LostDataResponse response = await ImagePicker().retrieveLostData();
    return response.file?.path != null ? response.file!.path : null;
  }

  Future<XFile?> getImage(ImageSource source) async {
    final XFile? pickedFile =
        await _picker.pickImage(source: source, imageQuality: 100);
    return pickedFile;
  }

// need to fix this
  Future<File?> cropImage(File file) async {
    File? croppedFile;
    final cropped = await _cropper.cropImage(
      sourcePath: file.path,
      compressFormat: ImageCompressFormat.jpg,
      compressQuality: 100,
      uiSettings: [
        AndroidUiSettings(
            toolbarTitle: 'Crop Image',
            toolbarColor: Colors.black,
            toolbarWidgetColor: Colors.white,
            initAspectRatio: CropAspectRatioPreset.original,
            lockAspectRatio: false),
        IOSUiSettings(
          title: 'Crop Image',
        ),
      ],
    );
    if (cropped != null) {
      croppedFile = File(cropped.path);
    }
    return croppedFile;
  }

  void selectImage(
    VoidCallback onCameraPressed,
    VoidCallback onGalleryPressed,
  ) async {
    Dialogs.openBottomSheet(children: [
      AppButton(
        onPressed: onCameraPressed,
        label: "Take a picture",
      ),
      const SizedBox(height: 10),
      AppButton(
        onPressed: onGalleryPressed,
        label: "Select from gallery",
      ),
    ]);
  }
}

final localImagePickerService = LocalImagePickerService();


