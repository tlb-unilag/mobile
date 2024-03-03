import 'package:camera/camera.dart';
import 'package:taro_leaf_blight/core/services/local_data/local_data.dart';
import 'package:taro_leaf_blight/features/info/presentation/info.dart';
import 'package:taro_leaf_blight/widgets/dialog_parameters_widget.dart';
import 'features/home/presentation/auth_start.dart';
import 'features/home/presentation/home.dart';
import 'package:taro_leaf_blight/packages/packages.dart';
import 'widgets/camera_box_squircle_painter.dart';

// var cloudinary = Cloudinary.fromStringUrl('cloudinary://${ApiCredentials.CL_API_KEY}:${ApiCredentials.CL_SECRET}@${ApiCredentials.CL_NAME}');

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  //apparently i only need it for server side applications
  await LocalData.init();

  await dotenv.load();

  cameras = await availableCameras();

  runApp(
    const ProviderScope(child: MyApp()),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          //close the keypad whenever the user taps on an inactive widget
          FocusScopeNode currentFocus = FocusScope.of(context);
          if (!currentFocus.hasPrimaryFocus &&
              currentFocus.focusedChild != null) {
            FocusManager.instance.primaryFocus?.unfocus();
          }
        },
        child: ScreenUtilInit(
            designSize: const Size(393, 852),
            builder: (context, child) {
              return MaterialApp(
                navigatorKey: NavigationService.navigatorKey,
                debugShowCheckedModeBanner: false,
                //home: const WidgetLibrary(),
                theme: ThemeData(
                  primarySwatch: MaterialColor(
                    AppColors.primary500.value,
                    const <int, Color>{
                      25: AppColors.primary50,
                      50: AppColors.primary50,
                      100: AppColors.primary100,
                      200: AppColors.primary200,
                      300: AppColors.primary300,
                      400: AppColors.primary400,
                      500: AppColors.primary500,
                      600: AppColors.primary600,
                      700: AppColors.primary700,
                      800: AppColors.primary800,
                      900: AppColors.primary900,
                    },
                  ),
                  // brightness: Brightness.dark,
                  brightness: Brightness.light,
                  // scaffoldBackgroundColor: Colors.grey[900],
                  scaffoldBackgroundColor: Colors.white,
                  appBarTheme: AppBarTheme(
                    titleTextStyle:
                        CustomTextStyle.labelXLBold.withColor(Colors.white),
                    actionsIconTheme: const IconThemeData(
                      color: Colors.white,
                    ),
                    elevation: 0,
                    centerTitle: true,
                    iconTheme: const IconThemeData(
                      color: Colors.white,
                      size: 18,
                    ),
                    // backgroundColor: Colors.grey[900],
                    backgroundColor: Colors.white,
                  ),
                  progressIndicatorTheme: const ProgressIndicatorThemeData(
                    linearMinHeight: 8,
                  ),
                  textButtonTheme: TextButtonThemeData(
                    style: ButtonStyle(
                      textStyle: MaterialStateProperty.all(
                        CustomTextStyle.labelSmall,
                      ),
                    ),
                  ),
                  dividerTheme: const DividerThemeData(
                    thickness: 1,
                    color: Color(0x7FADADAD),
                    space: 1,
                  ),
                  navigationRailTheme: NavigationRailThemeData(
                    selectedLabelTextStyle: CustomTextStyle.labelLBold,
                    backgroundColor: AppColors.primary,
                    useIndicator: false,
                    indicatorColor: AppColors.primary200,
                    selectedIconTheme: const IconThemeData(
                      color: Colors.white,
                    ),
                    unselectedIconTheme: const IconThemeData(
                      color: AppColors.primary100,
                    ),
                    labelType: NavigationRailLabelType.none,
                    indicatorShape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                      side: const BorderSide(
                        color: Colors.red,
                        width: 4,
                      ),
                    ),
                  ),
                  tabBarTheme: TabBarTheme(
                    labelColor: Colors.black,
                    labelStyle: CustomTextStyle.labelMedium,
                    unselectedLabelStyle: CustomTextStyle.textxSmall12.w500,
                    unselectedLabelColor: Colors.black,
                    indicatorColor: Colors.black,
                    indicatorSize: TabBarIndicatorSize.label,
                    indicator: const UnderlineTabIndicator(
                      borderSide: BorderSide(
                        width: 1,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  inputDecorationTheme: InputDecorationTheme(
                    hintStyle: CustomTextStyle.textxSmall12
                        .withColor(Colors.white.withOpacity(0.5)),
                    isDense: true,
                    contentPadding: const EdgeInsets.symmetric(
                      vertical: 13,
                      horizontal: 16,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: const BorderSide(
                        color: Colors.black,
                        width: 1,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: const BorderSide(
                        color: AppColors.primary,
                        width: 1,
                      ),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: const BorderSide(
                        color: Colors.red,
                        width: 1,
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: const BorderSide(
                        color: Colors.black,
                        width: 1,
                      ),
                    ),
                    errorStyle: CustomTextStyle.textxSmall12
                        .withColor(AppColors.error400),
                    disabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide(
                        color: Colors.black.withOpacity(0.5),
                        width: 1,
                      ),
                    ),
                    focusedErrorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: const BorderSide(
                        color: Colors.red,
                        width: 1,
                      ),
                    ),
                  ),
                  primaryColor: AppColors.primary,
                  fontFamily: 'EudoxusSans',
                  textTheme: TextTheme(
                    bodyLarge: CustomTextStyle.textlarge18,
                    bodyMedium: CustomTextStyle.textmedium16,
                    bodySmall: CustomTextStyle.textsmall14,
                    displayLarge: CustomTextStyle.textextraBold24,
                    displayMedium: CustomTextStyle.textxLarge20,
                    displaySmall: CustomTextStyle.textlarge18,
                    titleMedium: CustomTextStyle.textlarge18.w500,
                  ),
                ),
                home: const TokenRouter(),
              );
            }));
  }
}

class TokenRouter extends StatelessWidget {
  const TokenRouter({super.key});

  @override
  Widget build(BuildContext context) {
    // return const AuthStart();
    if (LocalData.token != null) {
      return const HomeScreen();
    } else {
      return const AuthStart();
    }
  }
}

// the capture screen is here because of the camera widget, we have to find a way to remove it from here or pass it as a param somwhow

late List<CameraDescription> cameras;

class CaptureScreen extends ConsumerStatefulWidget {
  const CaptureScreen({super.key});
  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _CaptureScreenState();
}

class _CaptureScreenState extends ConsumerState<CaptureScreen> {
  late CameraController _cameraController;
  late Future<void> _cameraValue;
  bool isFlashOn = false;
  bool isCameraFront = true;
  bool isRecording = false;

  @override
  void initState() {
    super.initState();
    _cameraController = CameraController(cameras[0], ResolutionPreset.high);
    _cameraValue = _cameraController.initialize();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            collapsedHeight: 300,
            pinned: true,
            elevation: 0,
            // backgroundColor: Colors.grey[900],
            expandedHeight: WindowSize.height(context) -
                MediaQuery.paddingOf(context).bottom -
                150,
            flexibleSpace: Stack(
              children: [
                FutureBuilder(
                  future: _cameraValue,
                  builder: (context, snapshot) {
                    if (snapshot.hasError) {
                      var e = snapshot.error;
                      if (e is CameraException) {
                        switch (e.code) {
                          case 'CameraAccessDenied':
                            Dialogs.showAlertDialog(DialogParameters(
                                contentText:
                                    'You have denied camera access, this app needs permission to access the camera or go to the Settings to enable camera access',
                                enableButtonText: 'Ok'));
                            break;
                          default:
                            Dialogs.showAlertDialog(DialogParameters(
                                contentText:
                                    'Sorry, Unknown Error occurred , please try again later',
                                enableButtonText: 'Ok'));
                            break;
                        }
                      }
                    }
                    if (snapshot.connectionState == ConnectionState.done) {
                      return SizedBox(
                        width: double.infinity,
                        child: ClipRRect(
                          borderRadius: const BorderRadius.vertical(
                              bottom: Radius.circular(30)),
                          child: CameraPreview(_cameraController),
                        ),
                      );
                    } else {
                      return const Center(child: CircularProgressIndicator());
                    }
                  },
                ),
                Align(
                  alignment: Alignment.center,
                  child: SizedBox(
                    width: WindowSize.width(context) - 100,
                    height: WindowSize.width(context),
                    child: CustomPaint(
                      painter: CameraBoxSquirclePainter(),
                    ).paddingOnly(b: 100),
                  ),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8).copyWith(
                      bottom: 30,
                    ),
                    child: GestureDetector(
                      onTap: () async {
                        try {
                          final image = await _cameraController.takePicture();
                          print(image.path);
                          if (!context.mounted) return;
                          // await Navigator.of(context).push(
                          //   MaterialPageRoute(
                          //     builder: (context) => DisplayPictureScreen(
                          //       // Pass the automatically generated path to
                          //       // the DisplayPictureScreen widget.
                          //       imagePath: image.path,
                          //     ),
                          //   ),
                          // );
                        } catch (e) {
                          Dialogs.confirmDialog(subtitle: e.toString());
                          print(e);
                        }
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.white,
                            width: 3,
                          ),
                          shape: BoxShape.circle,
                        ),
                        child: Container(
                          height: 75,
                          width: 75,
                          alignment: Alignment.center,
                          margin: const EdgeInsets.all(3),
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.circle,
                          ),
                          child: Icon(
                            Icons.search,
                            color: Colors.grey[800],
                          ),
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// recents page - welcome (slice string)

//  handle upload of detection images and errors , etc

// error handlinggg

// remove capture page , and its files and put it in another project 