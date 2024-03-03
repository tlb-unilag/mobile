import 'package:taro_leaf_blight/core/utils/validators.dart';
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
                'Welcome Back',
                style: CustomTextStyle.textxLarge20.w700.black,
              ),
              12.gap,
              Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: 'New to taro leaf blight detector? ',
                      style:
                          CustomTextStyle.textsmall14.withColorHex(0xFF17171B),
                    ),
                    TextSpan(
                      text: 'Create account',
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
                labelText: 'Email',
                hintText: 'Enter your email',
                validator: Validator().isEmail().isNotEmpty().validate,
                errorText: emailError,
                keyboardType: TextInputType.emailAddress,
              ),
              20.gap,
              AppInput.password(
                controller: _passwordController,
                labelText: 'Password',
                hintText: 'Enter your password',
                // validator: Validator().isPassword().isNotEmpty().validate,
                errorText: passwordError,
                keyboardType: TextInputType.visiblePassword,
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
                label: 'Log in',
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _passwordController.dispose();
    _emailAddressController.dispose();
  }
}
