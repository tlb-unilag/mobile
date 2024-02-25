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
          SvgPicture.asset(
            'assets/images/error-circle.svg',
            width: 300,
            height: 200,
          ),
          Text(
            error.toString(),
            style: CustomTextStyle.paragraphMedium,
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
                Icon(Icons.refresh_outlined),
                const Text("Retry"),
              ],
            )
          )
        ],
      ),
    );
  }
}
