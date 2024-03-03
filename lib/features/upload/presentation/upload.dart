import 'package:taro_leaf_blight/features/capture/service/image_picker_service.dart';
import 'package:taro_leaf_blight/features/detection/provider/detection_provider.dart';
import 'package:taro_leaf_blight/features/upload/providers/cloudinary_url_generator_provider.dart';
import 'package:taro_leaf_blight/features/upload/service/cloudinary_api.dart';
import 'package:taro_leaf_blight/main.dart';
import 'package:taro_leaf_blight/packages/packages.dart';

class UploadScreen extends ConsumerStatefulWidget {
  const UploadScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _UploadScreenState();
}

class _UploadScreenState extends ConsumerState<UploadScreen> {
  // const UploadScreen({super.key});
  dynamic _pickImageError;
  File? file;
  ResponseModel? imageUrl;
  // AsyncValue<dynamic>? urlLink;

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
                  GestureDetector(
                    onTap: () {
                      Dialogs.openBottomSheet(children: [
                        AppButton(
                          onPressed: () async {
                            try {
                              // i get a fileNotfOUND EXCEPTION because of the way i wrote the cropped logic , i gave it '' empty string
                              var croppedImage = await localImagePickerService
                                  .getImage(ImageSource.camera)
                                  .then((value) =>
                                      localImagePickerService.cropImage(value));
                              setState(() {
                                file = croppedImage;
                              });
                            } catch (e) {
                              setState(() {
                                _pickImageError = e;
                                print(_pickImageError);
                              });
                            }
                             pop(context);
                          },
                          label: "Take a picture",
                        ),
                        10.gap,
                        AppButton(
                          onPressed: () async {
                            try {
                              var croppedImage = await localImagePickerService
                                  .getImage(ImageSource.gallery)
                                  .then((value) =>
                                      localImagePickerService.cropImage(value));
                              setState(() {
                                file = croppedImage;
                              });
                            } catch (e) {
                              setState(() {
                                _pickImageError = e;
                                print(_pickImageError);
                              });
                            }
                             pop(context);
                          },
                          label: "Select from gallery",
                          child: const Text("Select from gallery"),
                        ),
                      ]);
                    },
                    // modify the image in such a way that it uses extendedImage and taps to view full screen but the image height is fixed
                    //
                    child: file != null
                        ? Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                                const Text(
                                  "Image Preview",
                                  style: CustomTextStyle.paragraphMedium,
                                ),
                                Image.file(file!)
                              ])
                        : Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16.0),
                              color: AppColors.greyDisabled,
                            ),
                            width: context.screenWidth - 50,
                            height: context.screenHeight - 600,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                if (file == null)
                                  const Icon(
                                    Icons.add_a_photo_outlined,
                                    size: 50,
                                    weight: 20.0,
                                  ),
                                if (file == null)
                                  Text(
                                    "Upload a photo",
                                    style: CustomTextStyle.textsmall14
                                        .withColorHex(0xFF17171B),
                                  )
                              ],
                            )),
                  ),
                  10.gap,
                  file != null
                      ? AppButton(
                          onPressed: () async {
                            Dialogs.openBottomSheet(children: [
                              AppButton(
                                onPressed: () async {
                                  try {
                                    var croppedImage =
                                        await localImagePickerService
                                            .getImage(ImageSource.camera)
                                            .then((value) =>
                                                localImagePickerService
                                                    .cropImage(value));
                                    setState(() {
                                      file = croppedImage;
                                    });
                                  } catch (e) {
                                    setState(() {
                                      _pickImageError = e;
                                      print(_pickImageError);
                                    });
                                  }
                                },
                                label: "Take a picture",
                              ),
                              10.gap,
                              AppButton(
                                onPressed: () async {
                                  try {
                                    var croppedImage =
                                        await localImagePickerService
                                            .getImage(ImageSource.gallery)
                                            .then((value) =>
                                                localImagePickerService
                                                    .cropImage(value));
                                    setState(() {
                                      file = croppedImage;
                                    });
                                  } catch (e) {
                                    setState(() {
                                      _pickImageError = e;
                                      print(_pickImageError);
                                    });
                                  }
                                  pop(context);
                                },
                                label: "Select from gallery",
                              ),
                            ]);
                          },
                          label: "Select another image",
                        )
                      : AppButton(
                          onPressed: () async {
                            Dialogs.openBottomSheet(children: [
                              AppButton(
                                onPressed: () async {
                                  try {
                                    var croppedImage =
                                        await localImagePickerService
                                            .getImage(ImageSource.camera)
                                            .then((value) =>
                                                localImagePickerService
                                                    .cropImage(value));
                                    setState(() {
                                      file = croppedImage;
                                    });
                                  } catch (e) {
                                    setState(() {
                                      _pickImageError = e;
                                      print(_pickImageError);
                                    });
                                  }
                                   pop(context);
                                },
                                label: "Take a picture",
                              ),
                              10.gap,
                              AppButton(
                                onPressed: () async {
                                  try {
                                    var croppedImage =
                                        await localImagePickerService
                                            .getImage(ImageSource.gallery)
                                            .then((value) =>
                                                localImagePickerService
                                                    .cropImage(value));
                                    setState(() {
                                      file = croppedImage;
                                    });
                                  } catch (e) {
                                    setState(() {
                                      _pickImageError = e;
                                      print(_pickImageError);
                                    });
                                  }
                                  pop(context);
                                },
                                label: "Select from gallery",
                              ),
                            ]);
                          },
                          label: "Choose an image to detect",
                        ),
                  10.gap,
                  if (file != null) ...[
                    AppButton(
                        label: "Detect Image",
                        onPressed: () async {
                          var res = await cloudinaryService
                              .uploadImage(file!, context)
                              .then((value) {
                            print(value);
                            // detectOneImage(value.data!.url)
                            detectOneImage(context);
                          });
                        }),
                  ],
                  10.gap,
                  // this is just here for checking the url sake
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