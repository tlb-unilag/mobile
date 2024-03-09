import 'package:taro_leaf_blight/features/capture/service/image_picker_service.dart';
import 'package:taro_leaf_blight/features/detection/provider/detection_provider.dart';
import 'package:taro_leaf_blight/features/upload/providers/cloudinary_url_generator_provider.dart';
import 'package:taro_leaf_blight/features/upload/service/cloudinary_api.dart';
import 'package:taro_leaf_blight/main.dart';
import 'package:taro_leaf_blight/packages/packages.dart';

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
      file = croppedImage;
    });
  }

   void getImageAndUpdate(
      ImageSource source, ImageUpdateCallback onUpdate) async {
    try {
      var pickedImage = await localImagePickerService.getImage(source);
      if (pickedImage != null) {
        var croppedImage = await localImagePickerService.cropImage(pickedImage);
        onUpdate(croppedImage);
      }
    } catch (e) {
      setState(() {
        _pickImageError = e;
        print(_pickImageError);
      });
    }
    pop();
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
                  style: CustomTextStyle.paragraphMedium,
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
      onPressed: () async {
        await cloudinaryService.uploadImage(file!).then((value) {
          print(value.data!.url);
          detectOneImage(value.data!.url);
        });
      },
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



// upload image -> a loading spinner is shown with the text -> uploading image (lets add a progress bar)

//refactor the bottomSheet logic

// fix the cropping logic , null conditional logic

