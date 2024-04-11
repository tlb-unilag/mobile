import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taro_leaf_blight/packages/textstyles/app_textstyles.dart';

class SettingsPanel extends StatefulWidget {
  final String title;
  final String? subtitle;
  final void Function()? onPressed;
  final bool isSubtitle;

  const SettingsPanel({
    super.key,
    required this.title,
    this.subtitle,
    this.isSubtitle  = true,
    required this.onPressed,
  });

  @override
  State<SettingsPanel> createState() => _SettingsPanelState();
}

class _SettingsPanelState extends State<SettingsPanel> {
  @override
  Widget build(BuildContext context) {
    
    return SizedBox(
      height: 100.h,
      child: InkWell(
        onTap: widget.onPressed,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 1.7.h),
          child: Card(
            color: Colors.white,
            elevation: 0.4,
            shadowColor: const Color.fromARGB(255, 17, 4, 4),
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 16.0, horizontal: 12.0),
              child: Row(
                // crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.title,
                          style: CustomTextStyle.textmedium16.w500,
                        ),
                        if (widget.isSubtitle && widget.subtitle != null) Text(
                            widget.subtitle!,
                            style: CustomTextStyle.labelSmall.w400,
                          ),
                      ]),
                  const Icon(Icons.arrow_forward_ios),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
