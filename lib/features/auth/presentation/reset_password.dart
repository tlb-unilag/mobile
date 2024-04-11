import 'package:taro_leaf_blight/core/utils/extensions/string_extensions.dart';
import 'package:taro_leaf_blight/packages/packages.dart';

import 'package:taro_leaf_blight/core/utils/constants/strings.dart';
import 'package:taro_leaf_blight/core/utils/validators.dart';
import 'package:taro_leaf_blight/features/auth/providers/auth_provider.dart';

class ResetPasswordScreen extends ConsumerStatefulWidget {
  final String email;
  const ResetPasswordScreen({required this.email, super.key});
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


  isPasswordMatch() {
    return (value) => value == _newPasswordController.text;
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
                controller: _resetPasswordTokenController,
                labelText: 'Enter the token sent to ${widget.email.maskEmailAddress()}',
                hintText: AppStrings.enterPasswordResetToken,
                validator: Validator().isNotEmpty().validate,
                errorText: resetPasswordTokenError,
                keyboardType: TextInputType.text,
              ),
              30.gap,
              AppInput.password(
                controller: _newPasswordController,
                labelText: "Enter new ${AppStrings.password}",
                hintText: AppStrings.enterNewPassword,
                validator: Validator().isPassword().isNotEmpty().validate,
                errorText: newPasswordError,
                keyboardType: TextInputType.visiblePassword,
              ),
              30.gap,
              AppInput.password(
                controller: _confirmPasswordController,
                labelText: "Confirm ${AppStrings.password}",
                hintText: AppStrings.confirmPassword,
                validator: Validator()
                    .isNotEmpty()
                    .custom(isPasswordMatch(),"Passwords do not match")
                    .validate,
                errorText: confirmPasswordError,
                keyboardType: TextInputType.visiblePassword,
              ),
              30.gap,
              AppButton(
                  onPressed: emailError == null ||
                          resetPasswordTokenError == null ||
                          confirmPasswordError == null ||
                          newPasswordError == null &&
                              _newPasswordController.text ==
                                  _confirmPasswordController.text
                      ? () {
                          FocusScope.of(context).unfocus();
                          if (_formKey.currentState!.validate()) {
                            ref.read(authProvider.notifier).resetPassword(
                                email: widget.email,
                                resetToken: _resetPasswordTokenController.text,
                                newPassword: _newPasswordController.text);
                          }
                        }
                      : null,
                  label: AppStrings.resetPassword),
            ],
          ),
        ),
      ),
    );
  }
}
