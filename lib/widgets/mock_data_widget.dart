import 'package:taro_leaf_blight/packages/packages.dart';

class MockDataWidget extends StatelessWidget {
  const MockDataWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Container(
            height: 290.h,
            width: 370.w,
            color: Colors.white,
          ),
        ),
        const Text("This is the mock text for the skeleton")
      ],
    );
  }
}
