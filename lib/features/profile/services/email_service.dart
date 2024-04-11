import 'package:taro_leaf_blight/core/core.dart';
import 'package:url_launcher/url_launcher.dart';

class EmailService {
  Future<void> sendFeedbackEmail() async {
    try {
      const String email = "taroleftblight@gmail.com";
      const String subject = "Feedback on Taro Leaf Blight Plant Detection App";
      const String message =
          "Hello,\n\nI am reaching out to provide feedback on the taro leaf blight detection app. Overall, I find the app to be [insert your feedback here, such as user-friendly, accurate in detecting taro leaf blight, etc.]. However, I would like to suggest [insert any suggestions or improvements you have for the app here, such as, improving user interface, etc.].\nAlso I am reaching out to report an error/issue/crash/bug I encountered while using your plant detection app. \n\nThank you for developing this app and considering my feedback.\n\nBest regards, [Your Name] ";
      String? encodeQueryParameters(Map<String, String> params) {
          return params.entries
              .map((MapEntry<String, String> e) =>
                  '${Uri.encodeComponent(e.key)}=${Uri.encodeComponent(e.value)}')
              .join('&');
}
      final Uri uri = Uri(
        scheme: 'mailto',
        path: email,
        query: encodeQueryParameters(<String,String> {
          'subject': subject,
          'body':message
        })
      );
      await launchUrl(uri);

    } catch (e) {
      Dialogs.showErrorSnackbar(message: 'An error occurred $e');
    }
  }
}

final emailService = EmailService();
