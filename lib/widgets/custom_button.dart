import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taro_leaf_blight/packages/colors/colors.dart';
import 'package:taro_leaf_blight/packages/textstyles/app_textstyles.dart';

class CustomButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final String buttonText;
  final Color color;
  final double width;
  CustomButton(
      {required this.onPressed,
      required this.buttonText,
      required this.color, // Default to false
      required this.width});

  @override
  Widget build(BuildContext context) {
    return Semantics(
      label: 'button',
      child: Container(
        width: double.infinity,
        child: ElevatedButton(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.primary500,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(40),
            ),
            elevation: 0,
            padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 20.h),
            textStyle: TextStyle(fontSize: 20.sp),
          ),
          child: Text(
            buttonText,
            style: CustomTextStyle.label2XLBold.white
          ),
        ),
      ),
    );
  }
}
