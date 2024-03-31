import 'package:taro_leaf_blight/core/utils/constants/strings.dart';
import 'package:taro_leaf_blight/core/utils/validators.dart';
import 'package:taro_leaf_blight/features/auth/presentation/email_verification.dart';
import 'package:taro_leaf_blight/features/auth/presentation/signup.dart';
import 'package:taro_leaf_blight/features/auth/providers/auth_provider.dart';
import 'package:taro_leaf_blight/packages/packages.dart';

class LoginScreen extends ConsumerStatefulWidget {
  const LoginScreen({super.key});
  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {

  final _emailAddressController = TextEditingController();
  final _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  String? emailError;
  String? passwordError;

   @override
  void dispose() {
    super.dispose();
    _passwordController.dispose();
    _emailAddressController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
            resizeToAvoidBottomInset: false,
      appBar: AppBar(),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [ 
              Text(
                AppStrings.welcomeback,
                style: CustomTextStyle.textextraBold24.w700.black
              ),
              12.gap,
              Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: AppStrings.taroleafnew,
                      style:
                          CustomTextStyle.textsmall14.withColorHex(0xFF17171B),
                    ),
                    TextSpan(
                      text: ' ${AppStrings.createaccount}',
                      style: CustomTextStyle.textmedium16.w700
                          .withColor(AppColors.primary),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          pushReplacementTo(const SignupScreen());
                        },
                    ),
                  ],
                ),
              ),
              30.gap,
              AppInput(
                controller: _emailAddressController,
                labelText: AppStrings.email,
                hintText: AppStrings.enteryouremail,
                validator: Validator().isEmail().isNotEmpty().validate,
                errorText: emailError,
                keyboardType: TextInputType.emailAddress,
              ),
              20.gap,
              AppInput.password(
                controller: _passwordController,
                labelText: AppStrings.password,
                hintText: AppStrings.enteryourpassword,
                validator: Validator().isPassword().isNotEmpty().validate,
                errorText: passwordError,
                keyboardType: TextInputType.visiblePassword,
              ),
              24.gap,
               Row(
                mainAxisAlignment: MainAxisAlignment.end,
                 children: [
                   Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text: ' ${AppStrings.forgotPassword}',
                          style: CustomTextStyle.textmedium16.w700
                              .withColor(AppColors.primary),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              pushTo(const EmailVerificationScreen());
                            },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              24.gap,
              AppButton(
                onPressed: emailError == null && passwordError == null
                    ? () {
                        FocusScope.of(context).unfocus();
                        if (_formKey.currentState!.validate()) {
                          ref.read(authProvider.notifier).loginUser(
                              email: _emailAddressController.text,
                              password: _passwordController.text);
                        }
                      }
                    : () {
                        if (!_formKey.currentState!.validate()) return;
                        ref.read(authProvider.notifier).addChanges(
                            repo: AuthRepo(
                                password: _passwordController.text,
                                email: _emailAddressController.text));
                      },
                label: AppStrings.login
              ),
            ],
          ),
        ),
      ),
    );
  }
}
