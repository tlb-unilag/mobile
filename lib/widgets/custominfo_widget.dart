import 'package:taro_leaf_blight/packages/global_packages.dart';
import 'package:taro_leaf_blight/packages/textstyles/app_textstyles.dart';

class CustomInfoWidget extends StatelessWidget {
  final Color color;
  final String labelText;
  final dynamic data;

  const CustomInfoWidget({
    Key? key,
    required this.color,
    required this.labelText,
    required this.data,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(16.0),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 8.0),
        child: Row(
          children: [
            Text(
              "$labelText: ",
              style: CustomTextStyle.labelLXBold,
            ),
            Text(data.toString(), style: TextStyle(fontSize: 18.sp)),
          ],
        ),
      ),
    );
  }
}
