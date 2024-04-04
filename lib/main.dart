import 'package:camera/camera.dart';
import 'package:taro_leaf_blight/core/services/local_data/local_data.dart';
import 'package:taro_leaf_blight/widgets/dialog_parameters_widget.dart';
import 'features/home/presentation/auth_start.dart';
import 'features/home/presentation/home.dart';
import 'package:taro_leaf_blight/packages/packages.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await LocalData.init();

  await dotenv.load();

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
                    AppColors.primary.value,
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
                  bottomAppBarTheme: const BottomAppBarTheme(
                    
                    color: AppColors.primary,
                  ),
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
    if (LocalData.token != null) {
      return const HomeScreen();
    } else {
      return const AuthStart();
    }
  }
}

