import 'package:taro_leaf_blight/packages/packages.dart';

class ErrorScreen extends StatelessWidget {
  final Object? error;
  final Function() onPressed;
  const ErrorScreen({required this.error, super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 110.h,
          ),
          SvgPicture.asset(
            'assets/images/errorcirclex.svg',
            width: 300,
            height: 170,
          ),
          Text(
            error.toString(),
           style: CustomTextStyle.labelLXBold,
          textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: 20,
          ),
          AppButton(
            onPressed: onPressed,
            label: "press",
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Retry"),
              ],
            )
          )
        ],
      ),
    );
  }
}
