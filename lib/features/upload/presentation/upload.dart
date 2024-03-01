import 'package:taro_leaf_blight/features/capture/service/image_picker_service.dart';
import 'package:taro_leaf_blight/features/upload/providers/cloudinary_url_generator_provider.dart';
import 'package:taro_leaf_blight/features/upload/service/cloudinary_api_service.dart';
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
  AsyncValue<dynamic>? urlLink;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16).copyWith(top: 0),
        child: ListView(
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
                              file = await localImagePickerService
                                  .getImage(ImageSource.camera);
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
                              file = await localImagePickerService
                                  .getImage(ImageSource.gallery);
                              setState(() {});
                            } catch (e) {
                              setState(() {
                                _pickImageError = e;
                                print(_pickImageError);
                              });
                            }
                          },
                          label: "Select from gallery",
                          child: const Text("Select from gallery"),
                        ),
                      ]);
                    },
                    child: Container(
                        width: context.screenWidth - 50,
                        height: context.screenHeight - 600,
                        color: AppColors.greyDisabled,
                        child: const Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.add_a_photo_outlined,
                              size: 60,
                            ),
                            Text(
                              "Upload a photo",
                              style: CustomTextStyle.labelLBold,
                            )
                          ],
                        )),
                  ),
                  10.gap,
                  // if (file != null) ...[
                  //    AppButton(
                  //     onPressed: () {
                  //       // Detect image fn execution
                  //     },
                  //     label: "Detect image",
                  //   ),
                  // ],
                  AppButton(
                    onPressed: () async {
                      Dialogs.openBottomSheet(children: [
                        AppButton(
                          onPressed: () async {
                            try {
                              file = await localImagePickerService
                                  .getImage(ImageSource.camera);
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
                              file = await localImagePickerService
                                  .getImage(ImageSource.gallery);
                              setState(() {});
                            } catch (e) {
                              setState(() {
                                _pickImageError = e;
                                print(_pickImageError);
                              });
                            }
                            pop();
                          },
                          label: "Select from gallery",
                        ),
                      ]);
                    },
                    label: "Select another Image",
                  ),
        
                  10.gap,
                  // this is just here for checking the url sake
                  if (file != null) ...[
                    AppButton(
                        label: "Generate Url",
                        onPressed: () {
                          final url = ref.read(generateUrlProvider(file!));
                          setState(() {
                            urlLink = url;
                          });
                        }),
                    if (urlLink != null)
                      urlLink!.when(
                          skipLoadingOnRefresh: false,
                          data: (data) {
                            print(data);
                            return Text(data.data);
                          },
                          loading: () {
                            return const CircularProgressIndicator();
                          },
                          error: (error, stackTrace) {
                            print(error);
                            return Text(error.toString());
                          }),
                  ]
                  ////
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

// image is displayed here

//loading spinner doesn't want to stop loading , we get a 401, an eror ought to be thrown and handled by the error block
// upload image -> a loading spinner is shown with the text -> uploading image (lets add a progress bar)

// select another image
