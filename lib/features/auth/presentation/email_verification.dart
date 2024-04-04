import 'dart:async';

import 'package:taro_leaf_blight/core/utils/constants/strings.dart';
import 'package:taro_leaf_blight/core/utils/validators.dart';
import 'package:taro_leaf_blight/features/auth/providers/auth_provider.dart';
import 'package:taro_leaf_blight/packages/packages.dart';

class EmailVerificationScreen extends ConsumerStatefulWidget {
  const EmailVerificationScreen({super.key});
  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _EmailVerificationScreenState();
}

class _EmailVerificationScreenState
    extends ConsumerState<EmailVerificationScreen> {
  final _emailAddressController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  String? emailError;

  Timer _timer = Timer(const Duration(seconds: 1), () {});
  int _start = 0;

// can we change this from setState to valueListenableBuilder?
  // var _start1 = ValueNotifier<int>(0);

  void startTimer() {
    const oneSec = Duration(seconds: 1);
    _timer = Timer.periodic(
      oneSec,
      (Timer timer) {
        if (_start == 0) {
          setState(() {
            timer.cancel();
          });
        } else {
          setState(() {
            _start--;
          });
        }
      },
    );
  }

  @override
  void initState() {
    super.initState();
    // startTimer();
  }

  @override
  void dispose() {
    super.dispose();
    _timer.cancel();
    _emailAddressController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
          leading: backButton(context),
           elevation: 10,
          backgroundColor: AppColors.primary,
      ),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              30.gap,
              AppInput(
                controller: _emailAddressController,
                labelText: AppStrings.email,
                hintText: AppStrings.enteryouremail,
                validator: Validator().isEmail().isNotEmpty().validate,
                errorText: emailError,
                keyboardType: TextInputType.emailAddress,
              ),
              12.gap,
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text.rich(
                    TextSpan(children: [
                      TextSpan(
                        text:
                            _start != 0 ? _start.toString() : AppStrings.resend,
                        style: CustomTextStyle.textmedium16.w700
                            .withColor(AppColors.primary),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            print("data");
                            emailError == null
                                ? () {
                                    if (_formKey.currentState!.validate()) {
                                      ref
                                          .read(authProvider.notifier)
                                          .receivePasswordResetToken(
                                              email:
                                                  _emailAddressController.text);
                                    }
                                    setState(() {
                                      _start = 60;
                                      startTimer();
                                    });
                                  }
                                : null;
                          },
                      ),
                    ], text: "${AppStrings.tokenNotSent} "),
                  ),
                ],
              ),
              24.gap,
              AppButton(
                  onPressed: emailError == null
                      ? () {
                          FocusScope.of(context).unfocus();
                          if (_formKey.currentState!.validate()) {
                            ref
                                .read(authProvider.notifier)
                                .receivePasswordResetToken(
                                    email: _emailAddressController.text);
                          }
                        }
                      : null,
                  label: AppStrings.sendToken),
            ],
          ),
        ),
      ),
    );
  }
}
