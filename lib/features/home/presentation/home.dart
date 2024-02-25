import 'package:taro_leaf_blight/core/utils/constants/strings.dart';
import 'package:taro_leaf_blight/features/capture/presentation/capture.dart';
import 'package:taro_leaf_blight/features/home/provider/current_index_provider.dart';
import 'package:taro_leaf_blight/features/profile/presentation/profile.dart';
import 'package:taro_leaf_blight/features/recents/presentation/recents.dart';
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
        const CaptureScreen(),
        const ProfileScreen(),
      ][currentPageIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentPageIndex,
        onTap: (newIndex) =>
            ref.read(homeCurrentPageIndexProvider.notifier).state = newIndex,
        showUnselectedLabels: true,
        type: BottomNavigationBarType.fixed,
        selectedLabelStyle: const TextStyle(fontSize: 12),
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: AppStrings.home,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.camera_rounded),
            label: AppStrings.capture,
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
