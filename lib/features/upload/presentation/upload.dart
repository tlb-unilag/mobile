import 'dart:async';

import 'package:flutter/foundation.dart';
// import 'package:app_settings/app_settings.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:taro_leaf_blight/core/services/local_data/local_data.dart';
import 'package:taro_leaf_blight/features/capture/service/image_picker_service.dart';
import 'package:taro_leaf_blight/features/detection/provider/detection_providers.dart';
import 'package:taro_leaf_blight/features/upload/providers/cloudinary_url_generator_provider.dart';
import 'package:taro_leaf_blight/packages/packages.dart';
import 'package:taro_leaf_blight/widgets/dialog_parameters_widget.dart';

typedef ImageUpdateCallback = void Function(File? croppedImage);

class UploadScreen extends ConsumerStatefulWidget {
  const UploadScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _UploadScreenState();
}

class _UploadScreenState extends ConsumerState<UploadScreen> {
  dynamic _pickImageError;
  File? file;

  void _updateImage(File? croppedImage) {
    setState(() {
      // cache it here
      file = croppedImage;
    });
     if (croppedImage != null) {
      LocalData.saveImageFile(croppedImage.path);
    }
  }

  void getImageAndUpdate(
      ImageSource source, ImageUpdateCallback onUpdate) async {
    try {
      var pickedImage = await localImagePickerService.getImage(source);
      if (pickedImage != null) {
        File file = File(pickedImage.path);
        var croppedImage = await localImagePickerService.cropImage(file);
        onUpdate(croppedImage);
      }
    } catch (e) {
      setState(() {
        _pickImageError = e;
        pop();
        if (e is PlatformException) {
          switch (e.code) {
            case 'camera_access_denied':
              Dialogs.showAlertDialog(DialogParameters(
                title: const Text(
                  "Permission Denied",
                  style: CustomTextStyle.labelLXBold,
                ),
                contentText:
                    'You have denied camera access, this app needs permission to access the camera or go to the Settings to enable camera access',
                enableButtonText: 'Ok',
                disableButtonText: 'Go to Settings',
                onDisablePressed: () {
                  openAppSettings();
                },
              ));
              break;
            default:
              Dialogs.showAlertDialog(const DialogParameters(
                  title: Text(
                    "Error Occurred",
                    style: CustomTextStyle.labelLXBold,
                  ),
                  contentText:
                      'Sorry, Unknown Error occurred , please try again',
                  enableButtonText: 'Ok'));
              break;
          }
        }
      });
    }
  }

  bool _isImageSelected() {
    return file != null;
  }

  Widget _buildImageSelectionButton(File? file) {
    return file != null
        ? AppButton(
            onPressed: () => localImagePickerService.selectImage(
                () => getImageAndUpdate(ImageSource.camera, _updateImage),
                () => getImageAndUpdate(ImageSource.gallery, _updateImage)),
            label: "Select another image",
          )
        : AppButton(
            onPressed: () => localImagePickerService.selectImage(
                () => getImageAndUpdate(ImageSource.camera, _updateImage),
                () => getImageAndUpdate(ImageSource.gallery, _updateImage)),
            label: "Choose an image to detect",
          );
  }

  Widget _buildImagePreview(File? file, BuildContext context) {
    return GestureDetector(
      onTap: () => localImagePickerService.selectImage(
          () => getImageAndUpdate(ImageSource.camera, _updateImage),
          () => getImageAndUpdate(ImageSource.gallery, _updateImage)),
      child: file != null
          ? Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Image Preview",
                  style: CustomTextStyle.labelLXBold,
                ),
                Image.file(file),
              ],
            )
          : Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16.0),
                color: AppColors.greyDisabled,
              ),
              width: context.screenWidth - 50,
              height: context.screenHeight - 600,
              child: file == null
                  ? const Icon(
                      Icons.add_a_photo_outlined,
                      size: 50,
                      weight: 20.0,
                    )
                  : null,
            ),
    );
  }

  Widget _buildDetectImageButton(File? file) {
    return AppButton(
        label: "Detect Image",
        onPressed: () {
          // bool status = await InternetConnection().hasInternetAccess;
          // switch (status) {
          //   case true:
          //     await 
              cloudinaryService.uploadImage(file!).then((value) {
                if (value.data != null) {
                  detectOneImage(value.data?.url);
                }
              });
            //   break;
            // case false:
            //   Dialogs.showErrorSnackbar(
            //       message:
            //           "You do not have internet access, please try again later");
            //   break;
          // }
        }
      );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16).copyWith(top: 0),
        child: ListView(
          shrinkWrap: true,
          children: [
            Container(
              height: context.screenHeight,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _buildImagePreview(file, context),
                  10.gap,
                  _buildImageSelectionButton(file),
                  10.gap,
                  if (_isImageSelected()) _buildDetectImageButton(file),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

