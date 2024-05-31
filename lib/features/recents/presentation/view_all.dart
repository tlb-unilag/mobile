import 'package:flutter/physics.dart';
import 'package:taro_leaf_blight/features/detection/provider/detection_providers.dart';
import 'package:taro_leaf_blight/features/error/presentation/error.dart';
import 'package:taro_leaf_blight/features/recents/presentation/recents.dart';
import 'package:taro_leaf_blight/packages/packages.dart';
import 'package:taro_leaf_blight/widgets/mock_data_widget.dart';
import 'package:taro_leaf_blight/widgets/no_detections.dart';

class ViewAllScreen extends ConsumerWidget {
  const ViewAllScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    
    var detections = ref.watch(getAllDetectionsProvider);
    return Scaffold(
      appBar: AppBar(leading: backButton(context),backgroundColor: AppColors.primary,),
      body: RefreshIndicator.adaptive(
         color: AppColors.primary,
        onRefresh: () => ref.refresh(getAllDetectionsProvider.future),
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.all(16).copyWith(top: 0),
                child: Column(
                  children: [
                    12.gap,
                    detections.when(
                      skipLoadingOnRefresh: false,
                      data: (data) {
                        if (data.data!.detections.isNotEmpty) {
                          return Column(
                              children: data.data!.detections
                                  .map<Widget>((detectionInfo) {
                            return DetectionInfoWidget(
                                detectionInfo: detectionInfo);
                          }).toList());
                        } else {
                          return const NoDetections();
                        }
                      },
                      loading: () {
                        return Skeletonizer(
                          child: Column(
                            children: [
                              const MockDataWidget(),
                              20.gap,
                              const MockDataWidget(),
                              20.gap,
                              const MockDataWidget(),
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
