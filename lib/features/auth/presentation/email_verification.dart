import 'dart:async';

import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';
import 'package:taro_leaf_blight/core/services/local_data/local_data.dart';
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

  // Timer _timer = Timer(const Duration(seconds: 1), () {});
  late Timer _timer;
  int _start = 0;
  bool _enableResend = false;
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
            _enableResend = false;
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
    _emailAddressController.text = LocalData.email ?? '';
    startTimer();
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
              18.gap,
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text.rich(
                    TextSpan(children: [
                      TextSpan(
                          text: _start != 0
                              ? _start.toString()
                              : AppStrings.resend,
                          style: CustomTextStyle.textmedium16.w700
                              .withColor(AppColors.primary),
                          recognizer: TapGestureRecognizer()
                            ..onTap = emailError == null && _enableResend == false
                                ? () {
                                    if (_formKey.currentState!.validate()) {
                                      FocusScope.of(context).unfocus();
                                      ref
                                          .read(authProvider.notifier)
                                          .receivePasswordResetToken(
                                              email:
                                                  _emailAddressController.text);
                                      setState(() {
                                        _start = 60;
                                        _enableResend = true;
                                        startTimer();
                                      });
                                    }
                                  }
                                : null
                            ),
                    ], text: "${AppStrings.tokenNotSent} "),
                  ),
                ],
              ),
              24.gap,
              AppButton(
                  onPressed: emailError == null && _enableResend == false
                      ? () {
                          if (_formKey.currentState!.validate()) {
                            FocusScope.of(context).unfocus();
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
