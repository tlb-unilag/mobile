import 'package:taro_leaf_blight/core/services/local_data/local_data.dart';
import 'package:taro_leaf_blight/core/utils/constants/strings.dart';
import 'package:taro_leaf_blight/features/auth/presentation/login.dart';
import 'package:taro_leaf_blight/packages/packages.dart';

class OnboardingScreen extends ConsumerStatefulWidget {
  const OnboardingScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _OnboardingScreenState();
}

class _OnboardingScreenState extends ConsumerState<OnboardingScreen> {
  @override
  void initState() {
    LocalData.setOnboarded(true);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding:
            EdgeInsets.only(left: 20.w, right: 20.w, top: 15.2.w, bottom: 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  AppStrings.taroleafblight,
                  style:
                      CustomTextStyle.label2XLBold.copyWith(letterSpacing: 0.8),
                ),
                Text(
                  AppStrings.taroleafblightdesc,
                  style: CustomTextStyle.paragraphMedium
                      .copyWith(letterSpacing: 0.05),
                ),
              ],
            ),
            const Center(
              child: CircleAvatar(
                  radius: 150,
                  backgroundImage: AssetImage(
                    'assets/images/taro_leaf_blight.png',
                  )),
            ),
            38.gap,
            Center(
              child: AppButton(
                backgroundColor: AppColors.primary,
                onPressed: () {
                  pushTo(const LoginScreen());
                },
                label: "Get Started",
              ),
            )
          ],
        ),
      ),
    );
  }
}
