import 'package:taro_leaf_blight/packages/packages.dart';

class TermsAndConditionsScreen extends ConsumerWidget {
  const TermsAndConditionsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
         leading: backButton(context),
        elevation: 10,
        backgroundColor: AppColors.primary,
      ),
      body: Center(
        child: SizedBox(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                   const Text(
                    'Terms and Agreement for Taro Leaf Blight Detection Mobile Application',
                    style: CustomTextStyle.labelXLXBold,
                  ),
                  16.gap,
                  const Text(
                    'These terms and agreement ("Terms") govern your use of the Taro Leaf Blight Detection mobile application ("the App") provided by the TLB-Detection-Project ("we," "us," or "our"). By downloading, installing, accessing, or using the App, you agree to be bound by these Terms. If you do not agree with any provision of these Terms, you may not use the App.\n'
                    '1. Use of the App:\n'
                    '1.1 The App is designed to assist users in detecting Taro Leaf Blight disease in taro plants.\n'
                    '1.2 Users may use the App to take pictures or upload images from their gallery for disease detection purposes.\n'
                    '2. Image Usage:\n'
                    '2.1 By uploading or taking pictures using the App, you grant us the right to store these images in our cloud storage.\n'
                    '2.2 We assure you that these images will be used solely for the purpose of disease prediction and detection by our machine learning model.\n'
                    '2.3 You acknowledge and agree that the stored images may be used to further train the machine learning model for improved disease detection accuracy.\n'
                    '2.4 You represent and warrant that all images uploaded or taken using the App solely contain pictures of taro crops.\n'
                    '3. Data Privacy:\n'
                    '3.1 We are committed to protecting your privacy. We will handle your personal data in accordance with our Privacy Policy.\n'
                    '3.2 By using the App, you consent to the collection, use, and disclosure of your personal information as described in our Privacy Policy.\n'
                    '4. Intellectual Property:\n'
                    '4.1 All intellectual property rights, including but not limited to copyrights, trademarks, and patents, in the App and its contents are owned by or licensed to us.\n'
                    '4.2 You may not reproduce, distribute, modify, or create derivative works of the App or its contents without our prior written consent.\n'
                    '5. Disclaimer:\n'
                    '5.1 The App is provided on an "as is" and "as available" basis. We make no representations or warranties of any kind, express or implied, regarding the accuracy, reliability, or availability of the App.\n'
                    '5.2 We shall not be liable for any damages arising out of or in connection with the use of the App, including but not limited to direct, indirect, incidental, consequential, or punitive damages.\n'
                    '6. Modification of Terms:\n'
                    '6.1 We reserve the right to modify these Terms at any time without prior notice. Any changes will be effective immediately upon posting on the App.\n'
                    '6.2 Your continued use of the App after the posting of changes constitutes your acceptance of such changes.\n'
                    '7. Governing Law:\n'
                    '7.1 These Terms shall be governed by and construed in accordance with the laws of Nigeria, without regard to its conflict of law principles.\n'
                    '8. Contact Us:\n'
                    '8.1 If you have any questions or concerns regarding these Terms or the App, please contact us at taroleafblight@gmail.com.\n'
                    'By using the App, you acknowledge that you have read, understood, and agree to be bound by these Terms. If you do not agree to these Terms, please refrain from using the App.',
                    style: CustomTextStyle.paragraphMedium,
                  ),
                  16.gap,
                  const Text(
                    'Data Privacy Policy for Taro Leaf Blight Detection Mobile Application',
                    style: CustomTextStyle.labelXLXBold,
                  ),
                  16.gap,
                 const Text(
                    'This Data Privacy Policy ("Policy") outlines how TLB-Detection-Project ("we," "us," or "our") collects, uses, and protects your personal information when you use the Taro Leaf Blight Detection mobile application ("the App"). By using the App, you consent to the collection, use, and disclosure of your personal information as described in this Policy.\n'
                    '1. Information We Collect:\n'
                    '1.1 Account Information: When you sign up for an account on the App, we collect your email address, country, and state information.\n'
                    '1.2 Uploaded Images: When you upload images using the App, we store these images along with the location they were collected from as provided by you.\n'
                    '2. Use of Information:\n'
                    '2.1 We use your account information to manage your account, provide customer support, and communicate with you regarding updates or changes to the App.\n'
                    '2.2 The uploaded images are used solely for the purpose of disease prediction and detection by our machine learning model. We may also use these images to further train the machine learning model for improved accuracy.\n'
                    '3. Data Security:\n'
                    '3.1 We take the security of your personal information seriously. All user information is stored in a secure database system.\n'
                    '3.2 Our servers are located in Africa, and we implement appropriate technical and organizational measures to protect your personal information against unauthorized access, disclosure, alteration, or destruction.\n'
                    '4. User Rights:\n'
                    '4.1 You reserve the right to delete your account and your uploaded images at any time. You can do so by contacting us at taroleafblight@gmail.com.\n'
                    '5. Disclosure of Information:\n'
                    '5.1 We do not disclose your personal information to third parties except as described in this Policy or with your consent.\n'
                    '5.2 We may disclose your personal information if required to do so by law or if we believe that such action is necessary to comply with legal obligations, protect our rights or property, or ensure the safety of our users.\n'
                    '6. Data Retention:\n'
                    '6.1 We retain your personal information only for as long as necessary to fulfill the purposes outlined in this Policy, unless a longer retention period is required or permitted by law.\n'
                    '7. Changes to this Policy:\n'
                    '7.1 We reserve the right to update or modify this Policy at any time. Any changes will be effective immediately upon posting on the App.\n'
                    '8. Contact Us:\n'
                    '8.1 If you have any questions or concerns regarding this Policy or the handling of your personal information, please contact us at taroleafblight@gmail.com.\n'
                    'By using the App, you acknowledge that you have read, understood, and agree to the terms of this Data Privacy Policy. If you do not agree to this Policy, please refrain from using the App.',
                    style: CustomTextStyle.paragraphMedium,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
