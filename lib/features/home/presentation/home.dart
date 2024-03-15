import 'package:taro_leaf_blight/core/utils/constants/strings.dart';
import 'package:taro_leaf_blight/features/home/provider/current_index_provider.dart';
import 'package:taro_leaf_blight/features/profile/presentation/profile.dart';
import 'package:taro_leaf_blight/features/recents/presentation/recents.dart';
import 'package:taro_leaf_blight/features/upload/presentation/upload.dart';
import 'package:taro_leaf_blight/main.dart';
import 'package:taro_leaf_blight/packages/packages.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final currentPageIndex = ref.watch(homeCurrentPageIndexProvider);

    return Scaffold(
      body: [
        const RecentsScreen(),
        const UploadScreen(),
        const ProfileScreen(),
      ][currentPageIndex],
      bottomNavigationBar: BottomNavigationBar(
        selectedIconTheme: const IconThemeData(
          color: AppColors.primary
        ),
        currentIndex: currentPageIndex,
                selectedItemColor: AppColors.primary,
        onTap: (newIndex) =>
            ref.read(homeCurrentPageIndexProvider.notifier).state = newIndex,
        showUnselectedLabels: true,
        type: BottomNavigationBarType.fixed,
        unselectedLabelStyle:const TextStyle(
          fontSize: 14,
          color: AppColors.baseBlack
        ),
        selectedLabelStyle: const TextStyle(
          fontSize: 16,
          color: AppColors.baseBlack
        ),
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: AppStrings.home,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.file_upload_outlined),
            label: AppStrings.detect,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            label: AppStrings.profile,
          ),
        ],
      ),
    );
  }
}


