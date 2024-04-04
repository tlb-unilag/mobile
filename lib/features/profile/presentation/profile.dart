import 'package:taro_leaf_blight/core/services/local_data/local_data.dart';
import 'package:taro_leaf_blight/core/utils/constants/strings.dart';
import 'package:taro_leaf_blight/features/agreement/presentation/terms_and_conditions.dart';
import 'package:taro_leaf_blight/features/auth/presentation/email_verification.dart';
import 'package:taro_leaf_blight/features/auth/presentation/reset_password.dart';
import 'package:taro_leaf_blight/features/auth/providers/auth_provider.dart';
import 'package:taro_leaf_blight/features/profile/presentation/edit_details.dart';
import 'package:taro_leaf_blight/packages/packages.dart';

class ProfileScreen extends ConsumerWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var auth = ref.read(authProvider.notifier);
    return  Scaffold(
      appBar: AppBar(
        elevation: 0,
      ),
      body: Center(
        child: SizedBox(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CircleAvatar(
                    backgroundColor:AppColors.baseWhite,
                    radius: 56,
                    child: Text(
                      LocalData.email![0].toUpperCase(),
                       style: TextStyle(fontSize: 26)
                    ),
                  ),
                  10.gap,
                  Text(LocalData.email ?? ''),
                   Row(
                    children: [
                      // Text("${LocalData.countryState ?? ''} , ${LocalData.country!.substring(1, 6) ?? ''}")
                    ],
                  ),
                  70.gap,
                   InkWell(
                    onTap: () => pushTo(const EditDetailsScreen()),
                     child: Padding(
                       padding: const EdgeInsets.all(16.0),
                       child: Row(
                        children: [
                          Expanded(
                              child: Row(
                               mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    AppStrings.updateDetails,
                                    style: CustomTextStyle.textmedium16.w500,
                                  ),
                                  const Icon(Icons.arrow_forward_ios),
                                ],
                              ),
                          ),
                        ],
                      ),
                     ),
                   ),
                InkWell(
                   onTap: () => pushTo(const EmailVerificationScreen()),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Row(
                      children: [
                        Expanded(
                            child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  AppStrings.changePassword,
                                  style: CustomTextStyle.textmedium16.w500,
                                ),
                                const Icon(Icons.arrow_forward_ios),
                              ],
                            ),
                        ),
                      ],
                    ),
                  )),
                InkWell(
                   onTap: () => pushTo(const TermsAndConditionsScreen()),
                  child:Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Row(
                      children: [
                        Expanded(
                            child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  AppStrings.termsAndConditions,
                                  style: CustomTextStyle.textmedium16.w500,
                                ),
                                const Icon(Icons.arrow_forward_ios),
                              ],
                            ),
                        ),
                      ],
                  ),
                 )),
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
