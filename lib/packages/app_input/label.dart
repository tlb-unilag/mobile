import 'package:taro_leaf_blight/packages/packages.dart';

class Label extends StatelessWidget {
  const Label({
    Key? key,
    required this.title,
  }) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 3),
      child: Text(
        title,
        style:
            const TextStyle(fontWeight: FontWeight.w500, color: Colors.black54),
      ),
    );
  }
}

// RETURN A TEXT WIDGET
Text hintText(String text, {TextStyle? style}) {
  return Text(text, style: style);
}
