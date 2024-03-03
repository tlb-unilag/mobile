import 'package:taro_leaf_blight/core/utils/validators.dart';
import 'package:taro_leaf_blight/features/auth/presentation/login.dart';
import 'package:taro_leaf_blight/features/auth/providers/auth_provider.dart';
import 'package:taro_leaf_blight/packages/packages.dart';

class SignupScreen extends ConsumerStatefulWidget {
  const SignupScreen({super.key});
  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<SignupScreen> {
  final _emailAddressController = TextEditingController();
  final _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  String? countryValue;
  String? stateValue;
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
                'Sign Up',
                style: CustomTextStyle.textxLarge20.w700.black,
              ),
              12.gap,
              Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: 'Have an account? ',
                      style:
                          CustomTextStyle.textsmall14.withColorHex(0xFF17171B),
                    ),
                    TextSpan(
                      text: 'Log in',
                      style: CustomTextStyle.textmedium16.w700
                          .withColor(AppColors.primary),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          pushReplacementTo(const LoginScreen());
                        },
                    ),
                  ],
                ),
              ),
              24.gap,
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
                labelText: 'Enter your password',
                hintText: 'Enter your password',
                // validator: Validator().isPassword().isNotEmpty().validate,
                errorText: passwordError,
                keyboardType: TextInputType.visiblePassword,
              ),
              CSCPicker(
                layout: Layout.vertical,
                  flagState: CountryFlag.ENABLE,
                  dropdownDecoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(Radius.circular(10)),
                      color: Colors.white,
                      border:
                          Border.all(color: Colors.grey.shade300, width: 1)),
                  disabledDropdownDecoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(Radius.circular(10)),
                      color: Colors.grey.shade300,
                      border:
                          Border.all(color: Colors.grey.shade300, width: 1)),
                  countrySearchPlaceholder: "Country",
                  stateSearchPlaceholder: "State",
                  countryDropdownLabel: "Country",
                  stateDropdownLabel: "State",
                  selectedItemStyle: const TextStyle(
                    color: Colors.black,
                    fontSize: 14,
                  ),
                  dropdownHeadingStyle: const TextStyle(
                      color: Colors.black,
                      fontSize: 17,
                      fontWeight: FontWeight.bold),
                  dropdownItemStyle: const TextStyle(
                    color: Colors.black,
                    fontSize: 14,
                  ),

                  dropdownDialogRadius: 10.0,

                  searchBarRadius: 10.0,

                  onCountryChanged: (value) {
                    setState(() {
                      countryValue = value;
                    });
                  },

                  onStateChanged: (value) {
                    setState(() {
                      stateValue = value;
                    });
                  },
              ),
              24.gap,
              AppButton(
                onPressed: emailError == null && passwordError == null
                    ? () {
                      if (_formKey.currentState!.validate()) {
                          ref.read(authProvider.notifier).registerUser(
                                email: _emailAddressController.text,
                                password: _passwordController.text,
                                country: countryValue,
                                countryState: stateValue,
                              );
                        }
                      }
                    : () {
                         if (!_formKey.currentState!.validate()) return;
                        ref.read(authProvider.notifier).addChanges(
                            repo: AuthRepo(
                                email: _emailAddressController.text,
                                password: _passwordController.text));
                      },
                label: 'Create account',
              ),
            ],
          ),
        ),
      ),
    );
  }
}



