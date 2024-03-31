
import 'package:taro_leaf_blight/packages/packages.dart';

import 'package:taro_leaf_blight/core/utils/constants/strings.dart';
import 'package:taro_leaf_blight/core/utils/validators.dart';
import 'package:taro_leaf_blight/features/auth/providers/auth_provider.dart';
import 'package:taro_leaf_blight/packages/packages.dart';

import 'package:taro_leaf_blight/core/utils/constants/strings.dart';
import 'package:taro_leaf_blight/core/utils/validators.dart';
import 'package:taro_leaf_blight/features/auth/providers/auth_provider.dart';
import 'package:taro_leaf_blight/packages/packages.dart';

class ResetPasswordScreen extends ConsumerStatefulWidget {
  final String email;
  const ResetPasswordScreen({
    required this.email,
    super.key
  });
  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends ConsumerState<ResetPasswordScreen> {
  final _newPasswordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  final _resetPasswordTokenController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  String? emailError;
  String? newPasswordError;
  String? confirmPasswordError;
  String? resetPasswordTokenError;

  @override
  void dispose() {
    super.dispose();
   _newPasswordController.dispose();
   _confirmPasswordController.dispose();
   _resetPasswordTokenController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
          leading: backButton(context), title: const Text("Reset Password")),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(AppStrings.enteryouremail,
                  style: CustomTextStyle.textextraBold24.w700.black),
              // 12.gap,
              30.gap,
              AppInput(
                controller: _resetPasswordTokenController,
                labelText: 'Enter the token sent to ${widget.email}',
                hintText: AppStrings.enterPasswordResetToken,
                validator: Validator().isNotEmpty().validate,
                errorText: resetPasswordTokenError,
                keyboardType: TextInputType.text,
              ),
              AppInput(
                controller: _newPasswordController,
                labelText: AppStrings.password,
                hintText: AppStrings.enterNewPassword,
                validator: Validator().isPassword().isNotEmpty().validate,
                errorText: newPasswordError,
                keyboardType: TextInputType.visiblePassword,
              ),
              AppInput(
                controller: _confirmPasswordController,
                labelText: AppStrings.password,
                hintText: AppStrings.confirmPassword,
                validator: Validator().isPassword().isNotEmpty().validate,
                errorText: confirmPasswordError,
                keyboardType: TextInputType.visiblePassword,
              ),
              24.gap,
              AppButton(
                  onPressed: emailError == null || 
                  resetPasswordTokenError == null || 
                  confirmPasswordError == null || 
                  newPasswordError == null 
                      ? () {
                          FocusScope.of(context).unfocus();
                          if (_formKey.currentState!.validate()) {
                            ref
                                .read(authProvider.notifier).resetPassword(
                                  email: widget.email, 
                                  resetToken: _resetPasswordTokenController.text, 
                                  newPassword: _newPasswordController.text
                                );
                          }
                        }
                      : null,
                    label: AppStrings.sendToken
                  ),
            ],
          ),
        ),
      ),
    );
  }
}
