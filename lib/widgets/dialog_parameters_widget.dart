import 'package:flutter/material.dart';
import 'package:taro_leaf_blight/packages/textstyles/app_textstyles.dart';

class DialogParameters extends StatelessWidget {
  final String contentText;
  final String? disableButtonText;
  final String enableButtonText;
  final VoidCallback? onDisablePressed;
  final VoidCallback? onEnablePressed;

  DialogParameters({
    required this.contentText,
    this.disableButtonText,
    required this.enableButtonText,
    this.onDisablePressed,
    this.onEnablePressed,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Text(contentText),
      actions: <Widget>[
        if (disableButtonText != null) TextButton(
            style: TextButton.styleFrom(
              textStyle: CustomTextStyle.labelLXBold,
            ),
            onPressed: onDisablePressed ?? () => Navigator.of(context).pop(),
            child: Text(disableButtonText!),
          ),
        TextButton(
          style: TextButton.styleFrom(
            textStyle: CustomTextStyle.labelLXBold,
          ),
          onPressed:
              onEnablePressed ?? () => Navigator.of(context).pop(),
          child: Text(enableButtonText),
        ),
      ],
    );
  }
}


// Example usage:
// DialogHelper.showAlertDialog(context, );
