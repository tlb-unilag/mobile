import 'package:taro_leaf_blight/features/auth/providers/auth_provider.dart';
import 'package:taro_leaf_blight/packages/packages.dart';

class ProfileScreen extends ConsumerWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var auth = ref.read(authProvider.notifier);
    return Container(
      height: WindowSize.height(context),
      child: Center(
        child: Column(
           mainAxisAlignment: MainAxisAlignment.center, // Add this line
          children: [
             CircleAvatar(
              radius: 60,
              backgroundColor: AppColors.baseWhite,
              child: SvgPicture.asset('assets/images/profile.svg'),
            ),
            30.gap,
            AppButton(
              width: 200.w,
              label: 'Logout',
              onPressed: () {
                auth.logout(context);
              },
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [Icon(Icons.logout), Text('Logout')],
              ),
            )
          ],
        ),
      ),
    );
  }
}
