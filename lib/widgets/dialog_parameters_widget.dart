import 'package:flutter/material.dart';
import 'package:taro_leaf_blight/packages/packages.dart';
import 'package:taro_leaf_blight/packages/textstyles/app_textstyles.dart';

class DialogParameters extends StatelessWidget {
  final String contentText;
  final String? disableButtonText;
  final String enableButtonText;
  final VoidCallback? onDisablePressed;
  final VoidCallback? onEnablePressed;
  final Widget? title;
  const DialogParameters({super.key, 
    required this.contentText,
    this.disableButtonText,
    required this.enableButtonText,
    this.title,
    this.onDisablePressed,
    this.onEnablePressed,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      titlePadding: const EdgeInsets.only(left: 20,right: 20, top:20,bottom: 10),
      contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical:0),
      title: title,
      iconColor: AppColors.primary,
      backgroundColor: Colors.white,
      content: Text(contentText ,style: const TextStyle(color: Colors.black),),
      actions: <Widget>[
        if (disableButtonText != null) TextButton(
            style: TextButton.styleFrom(
              textStyle: CustomTextStyle.labelLXBold,
            ),
            onPressed: onDisablePressed ?? () => Navigator.of(context).pop(),
            child: Text(disableButtonText!, style:const TextStyle(color: Colors.black),),
          ),
        TextButton(
          style: TextButton.styleFrom(
            textStyle: CustomTextStyle.labelLXBold,
          ),
          onPressed:
              onEnablePressed ?? () => Navigator.of(context).pop(),
          child: Text(enableButtonText, style: const TextStyle(color: Colors.black),),
        ),
      ],
      actionsPadding: const EdgeInsets.symmetric(horizontal: 35, vertical:10),
    );
  }
}


// Example usage:
// DialogHelper.showAlertDialog(context, );
