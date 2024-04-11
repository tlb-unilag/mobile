import 'package:taro_leaf_blight/core/services/local_data/local_data.dart';
import 'package:taro_leaf_blight/core/utils/constants/strings.dart';
import 'package:taro_leaf_blight/features/agreement/presentation/terms_and_conditions.dart';
import 'package:taro_leaf_blight/features/auth/presentation/email_verification.dart';
import 'package:taro_leaf_blight/features/auth/providers/auth_provider.dart';
import 'package:taro_leaf_blight/features/profile/models/user_response_model.dart';
import 'package:taro_leaf_blight/features/profile/presentation/update_details.dart';
import 'package:taro_leaf_blight/features/profile/providers/user_provider.dart';
import 'package:taro_leaf_blight/features/profile/services/email_service.dart';
import 'package:taro_leaf_blight/packages/packages.dart';
import 'package:taro_leaf_blight/widgets/profile_settings_panel.dart';

class ProfileScreen extends ConsumerWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var auth = ref.read(authProvider.notifier);
    return Scaffold(
      body: Center(
        child: SizedBox(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  45.gap,
                  const UserDetails(),
                  45.gap,
                  SettingsPanel(
                      title: AppStrings.profileSettings,
                      subtitle: AppStrings.editYourProfile,
                      onPressed: () => pushTo(SettingsPage(
                              child: SettingsPanel(
                            title: "Update your Profile",
                            onPressed: () =>
                                pushTo(const UpdateDetailsScreen()),
                          )))),
                  SettingsPanel(
                      title: AppStrings.securitySettings,
                      subtitle: AppStrings.secureYourAccount,
                      onPressed: () => pushTo(SettingsPage(
                              child: SettingsPanel(
                            title: "Change your Password",
                            onPressed: () =>
                                pushTo(const EmailVerificationScreen()),
                          )))),
                  SettingsPanel(
                      title: AppStrings.legal,
                      subtitle: AppStrings.legalText,
                      onPressed: () => pushTo(SettingsPage(
                          child: SettingsPanel(
                              title: AppStrings.termsAndConditions,
                              onPressed: () =>
                                  pushTo(const TermsAndConditionsScreen()))))),
                  SettingsPanel(
                    title: AppStrings.help,
                    subtitle: AppStrings.helpText,
                    onPressed: () => pushTo(SettingsPage(
                        child: SettingsPanel(
                            title: AppStrings.forMoreInformation,
                            subtitle: AppStrings.emailAddress,
                            onPressed: () async {
                              emailService.sendFeedbackEmail();
                            }))),
                  ),
                  36.gap,
                  AppButton(
                    width: 200.w,
                    label: 'Sign Out',
                    onPressed: () {
                      auth.logout(context);
                    },
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [Text('Sign Out')],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class SettingsPage extends StatelessWidget {
  final Widget child;
  const SettingsPage({required this.child, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primary,
        elevation: 10,
        leading: backButton(context),
      ),
      body: child,
    );
  }
}

class UserDetails extends ConsumerWidget {
  const UserDetails({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var userdetails = ref.watch(userProvider);
    return userdetails.when(
      skipLoadingOnRefresh: false,
      data: (ResponseModel<UserResponseModel> data) {
        return Column(
          children: [
            CircleAvatar(
              backgroundColor: AppColors.baseWhite,
              radius: 56,
              child: Text(
                  LocalData.email?[0].toUpperCase() ??
                      data.data!.email![0].toUpperCase(),
                  style: const TextStyle(fontSize: 26)),
            ),
            10.gap,
            Text(LocalData.email ?? '${data.data!.email}'),
            10.gap,
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                    "${LocalData.countryState ?? '${data.data!.state}'} , ${LocalData.country ?? '${data.data!.country}'}"),
              ],
            ),
          ],
        );
      },
      loading: () {
        return Skeletonizer(
          child: Column(
            children: [
              CircleAvatar(
                backgroundColor: Colors.grey.withOpacity(0.1),
                radius: 56,
              ),
              const Text("qewrwteywuwiuwowoeueuyeie"),
              10.gap,
              const Text("qtqywiwuweue, qyququqiq")
            ],
          ),
        );
      },
      error: (error, stacktrace) {
        print(error);
        return Text.rich(
          TextSpan(
            children: [
              TextSpan(
                text: AppStrings.failedToLoadDetails,
                style: CustomTextStyle.textmedium16.withColorHex(0xFF17171B),
              ),
              TextSpan(
                text: '  ${AppStrings.retry}',
                style: CustomTextStyle.textmedium16.w500
                    .withColor(AppColors.primary),
                recognizer: TapGestureRecognizer()
                  ..onTap = () {
                    ref.invalidate(userProvider);
                  },
              ),
            ],
          ),
        );
      },
    );
  }
}
