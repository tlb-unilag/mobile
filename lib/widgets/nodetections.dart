import 'package:taro_leaf_blight/packages/global_packages.dart';
import 'package:taro_leaf_blight/packages/textstyles/app_textstyles.dart';

class NoDetections extends StatelessWidget {
  const NoDetections({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 110.h,
        ),
        SvgPicture.asset(
          'assets/images/plantscan.svg',
          width: 300.w,
          height: 300.h,
        ),
        const Text(
          'No detections yet, start scanning for taro leaf blight in your plants',
          style: CustomTextStyle.labelLXBold,
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
