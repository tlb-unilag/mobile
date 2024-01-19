import 'package:taro_leaf_blight/packages/packages.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String label;
  final String? subtitle;
  const CustomAppBar({
    super.key,
    required this.label,
    this.subtitle,
  });

  @override
  Size get preferredSize => Size.fromHeight(
        subtitle == null ? 102 : 133,
      );

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: const BoxDecoration(
        color: Colors.white,
        border: Border(
          bottom: BorderSide(
            color: Color(0xffDDDCDC),
            width: 1,
          ),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // SvgPicture.asset(
          //   IconsaxBold.arrowLeft,
          //   color: AppColors.primary,
          //   height: 24,
          //   width: 24,
          // ),
          // 18.gap,
          Text(
            label,
            style: CustomTextStyle.labelXLBold,
          ),
          if (subtitle != null) ...[
            12.gap,
            Text(
              subtitle!,
              style: CustomTextStyle.labelMedium.withColorHex(0xff999999),
            ),
          ],
        ],
      ),
    );
  }
}
