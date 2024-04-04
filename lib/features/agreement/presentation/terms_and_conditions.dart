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
                  70.gap,
                  AppButton(
                    width: 200.w,
                    label: 'Sign Out',
                    onPressed: () {
                      
                    },
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [Text('Sign Out')],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
