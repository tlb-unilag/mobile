import 'package:taro_leaf_blight/features/capture/service/image_picker_service.dart';
import 'package:taro_leaf_blight/features/upload/providers/cloudinary_url_generator_provider.dart';
import 'package:taro_leaf_blight/features/upload/service/cloudinary_url_gen_service.dart';
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
  AsyncValue<ResponseModel<dynamic>>? urlLink;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Container(
            height: context.screenHeight,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
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
                  child: const Text("Take a picture"),
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
                10.gap,
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
                        skipLoadingOnReload: false,
                        data: (data) {
                          print(data);
                          return Text(data.data);
                        },
                        error: (error, stackTrace) {
                          print(error);
                          return Text(error.toString());
                        },
                        loading: () {
                          return const CircularProgressIndicator();
                        })
                ]
              ],
            ),
          )
        ],
      ),
    );
  }
}

// image is displayed here

// select image from gallery

// upload image -> a loading spinner is shown with the text -> uploading image (lets add a progress bar)

// select another image
