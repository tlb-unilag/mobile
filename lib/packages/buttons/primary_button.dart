import 'package:taro_leaf_blight/packages/packages.dart';

class AppButton extends StatelessWidget {
  final Function()? onPressed;
  final String? label;
  final Color? textColor;
  final double? width;
  final String? preIcon;
  final String? postIcon;
  final double preIconSpace;
  final double postIconSpace;
  //final Color borderColor;
  final Color? backgroundColor;
  final bool isOutline;
  final double height;
  final TextStyle? textStyle;
  final Color shadowColor;
  final Color? iconColor;
  final Widget? child;
  final double borderWidth;

  final double radius;

  final bool isText;

  const AppButton({
    super.key,
    required this.onPressed,
    this.label,
    this.borderWidth = 1,
    this.textStyle,
    this.shadowColor = const Color.fromARGB(73, 158, 158, 158),
    this.preIcon,
    this.postIcon,
    this.iconColor,
    this.backgroundColor,
    this.postIconSpace = 20,
    this.preIconSpace = 20,
    this.textColor,
    this.height = 48,
    this.child,
    this.width = double.infinity,
    this.radius = 12,
  })  : assert(label != null || child != null),
        isText = false,
        isOutline = false;

  const AppButton.outline({
    super.key,
    required this.onPressed,
    this.label,
    this.borderWidth = 1,
    this.textStyle,
    this.preIcon,
    this.iconColor,
    this.postIcon,
    this.postIconSpace = 8,
    this.preIconSpace = 8,
    this.shadowColor = Colors.transparent,
    this.height = 48,
    this.child,
    this.width = double.infinity,
    this.radius = 12,
  })  : assert(label != null || child != null),
        isText = true,
        textColor = null,
        backgroundColor = null,
        isOutline = true;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ButtonStyle(
          elevation: const MaterialStatePropertyAll(8),
          shadowColor: backgroundColor != null
              ? const MaterialStatePropertyAll(Colors.transparent)
              : MaterialStateProperty.resolveWith((states) {
                  if (states.contains(MaterialState.disabled)) {
                    return Colors.transparent;
                  } else {
                    return shadowColor;
                  }
                }),
          foregroundColor: textColor != null
              ? MaterialStatePropertyAll(textColor)
              : MaterialStateProperty.resolveWith((states) {
                  if (isOutline) {
                    return AppColors.primary;
                  } else if (states.contains(MaterialState.disabled)) {
                    return AppColors.greyQuatinary;
                  } else if (isOutline) {
                    return AppColors.primary;
                  } else if (states.contains(MaterialState.hovered) ||
                      states.contains(MaterialState.pressed)) {
                    return AppColors.primary400;
                  } else {
                    return Colors.white;
                  }
                }),
          textStyle:
              MaterialStatePropertyAll(CustomTextStyle.textmedium16.w700),
          backgroundColor: backgroundColor != null
              ? MaterialStatePropertyAll(backgroundColor)
              : MaterialStateProperty.resolveWith((states) {
                  if (states.contains(MaterialState.disabled)) {
                    return const Color(0xffE2E2E2);
                  } else if (isOutline) {
                    return Colors.transparent;
                  } else if (states.contains(MaterialState.hovered) ||
                      states.contains(MaterialState.pressed)) {
                    return AppColors.primary400;
                  }
                  return AppColors.primary;
                }),
          fixedSize: MaterialStatePropertyAll(
              width == null ? Size.fromHeight(height) : Size(width!, height)),
          shape: MaterialStatePropertyAll(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(radius),
              side: isOutline
                  ? const BorderSide(
                      color: AppColors.primary,
                      width: 1,
                    )
                  : BorderSide.none,
            ),
          ),
        ),
        child: child == null
            ? Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  if (preIcon != null) ...[
                    SvgPicture.asset(
                      preIcon!,
                      color: iconColor ?? textColor,
                    ),
                    preIconSpace.spacingW,
                  ],
                  Text(
                    label!,
                    style: textStyle,
                  ),
                  if (postIcon != null) ...[
                    postIconSpace.spacingW,
                    SvgPicture.asset(
                      postIcon!,
                      color: iconColor ?? textColor,
                    ),
                  ],
                ],
              )
            : child!,
      ),
    );
  }
}
