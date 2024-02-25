import 'package:taro_leaf_blight/features/detection/provider/detection_provider.dart';
import 'package:taro_leaf_blight/features/error/presentation/error.dart';
import 'package:taro_leaf_blight/features/recents/presentation/recents.dart';
import 'package:taro_leaf_blight/packages/global_packages.dart';
import 'package:taro_leaf_blight/packages/packages.dart';

class ViewAllScreen extends ConsumerWidget {
  const ViewAllScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var detections = ref.watch(getAllDetectionsProvider);
    return Scaffold(
      appBar: AppBar(
          leading: const BackButton(
            color: Colors.black,
          ),
      ),
      body: RefreshIndicator.adaptive(
        onRefresh: () => ref.refresh(getAllDetectionsProvider.future),
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.all(16).copyWith(top: 15),
                child: Column(
                  children: [
                    12.gap,
                    // pul to refresh , show skeletonizer
                    detections.when(
                      skipLoadingOnRefresh: false,
                      data: (data) {
                        return Column(
                            children: data.data.detections
                                .take(2)
                                .map<Widget>((detectionInfo) {
                          return DetectionInfoWidget(detectionInfo: detectionInfo);
                        }).toList());
                      },
                      loading: () {
                        return Skeletonizer(
                          child: Column(
                            children: [
                              Column(
                                children: [
                                  Container(
                                    height: 290.h,
                                    width: 370.w,
                                    color: Colors.white,
                                  ),
                                  const Text(
                                      "This is the mock text for the skeletonizer date")
                                ],
                              ),
                              20.gap,
                              Column(
                                children: [
                                  Container(
                                    height: 290.h,
                                    width: 370.w,
                                    color: Colors.white,
                                  ),
                                  const Text(
                                      "This is the mock text for the skeletonizer date")
                                ],
                              ),
                              20.gap,
                              Column(
                                children: [
                                  Container(
                                    height: 290.h,
                                    width: 370.w,
                                    color: Colors.white,
                                  ),
                                  const Text(
                                      "This is the mock text for the skeletonizer date")
                                ],
                              ),
                              20.gap,
                            ],
                          ),
                        );
                      },
                      error: (error, stacktrace) {
                        return ErrorScreen(
                            error: error,
                            onPressed: () {
                              ref.refresh(getAllDetectionsProvider.future);
                            });
                      },
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
