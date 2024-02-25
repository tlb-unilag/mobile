// import 'package:camera/camera.dart';
// import 'package:taro_leaf_blight/features/home/presentation/info.dart';

export 'package:extended_image/extended_image.dart';
import 'package:taro_leaf_blight/features/detection/models/detection_model.dart';
import 'package:taro_leaf_blight/features/detection/provider/detection_provider.dart';
import 'package:taro_leaf_blight/features/error/presentation/error.dart';
import 'package:taro_leaf_blight/features/info/presentation/info.dart';
import 'package:taro_leaf_blight/features/recents/presentation/view_all.dart';
import 'package:taro_leaf_blight/packages/packages.dart';

class RecentsScreen extends ConsumerWidget {
  const RecentsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var detections = ref.watch(getAllDetectionsProvider);
    return RefreshIndicator.adaptive(
      onRefresh: () => ref.refresh(getAllDetectionsProvider.future),
      child: CustomScrollView(
        slivers: [
          const SliverToBoxAdapter(
            child: Column(
              children: [
                Icon(
                  Icons.keyboard_double_arrow_down_rounded,
                  color: Colors.white,
                  size: 14,
                ),
              ],
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(16).copyWith(top: 85),
              child: Column(
                children: [
                  Row(
                    children: [
                      const Text(
                        'Recents',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: AppColors.primary),
                      ),
                      const Spacer(),
                      GestureDetector(
                        onTap: () {
                          pushTo(const ViewAllScreen());
                        },
                        child: const Text(
                          'View All',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: AppColors.primary,
                          ),
                        ),
                      ),
                    ],
                  ),
                  12.gap,
                  detections.when(
                    skipLoadingOnRefresh: false,
                    data: (data) {
                      return Column(
                          children: data.data.detections
                              .take(2)
                              .map<Widget>((detectionInfo) {
                        return DetectionInfoWidget(
                            detectionInfo: detectionInfo);
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
                                const Text("This is the mock text for the skeletonizer date")
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
    );
  }
}

class DetectionInfoWidget extends StatefulWidget {
  final SingleDetectionResponseModel detectionInfo;
  const DetectionInfoWidget({required this.detectionInfo, super.key, required});

  @override
  State<DetectionInfoWidget> createState() => _DetectionInfoWidgetState();
}

class _DetectionInfoWidgetState extends State<DetectionInfoWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
    );
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        pushTo(DetectionInfoScreen(
          detectionId: widget.detectionInfo.detectionId,
        ));
      },
      child: Column(
        children: [
        Container(
          width: 370.w,
          height: 290.h,
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(30.0)),
          ),
          child: ExtendedImage.network(
            fit: BoxFit.cover,
            clipBehavior: Clip.antiAlias,
            cache: true,
            'https://res.cloudinary.com/ogbanugot/image/upload/v1706989569/testl21_e7pr6c.png',
            borderRadius: const BorderRadius.all(Radius.circular(30.0)),
            // loadStateChanged: (ExtendedImageState state) {
            // switch (state.extendedImageLoadState) {
            //   case LoadState.loading:
            //     _controller.reset();
            //     return const CircularProgressIndicator.adaptive();
            //   case LoadState.completed:
            //     _controller.forward();
            //     return FadeTransition(
            //       opacity: _controller,
            //       child: ExtendedRawImage(
            //         image: state.extendedImageInfo?.image,
            //         width: 370.w,
            //         height: 290.h,
            //       ),
            //     );
            //   case LoadState.failed:
            //     _controller.reset();
            //     return GestureDetector(
            //       child: Stack(
            //         fit: StackFit.expand,
            //         children: <Widget>[
            //           Image.asset(
            //             "assets/failed.jpg",
            //             fit: BoxFit.fill,
            //           ),
            //           const Positioned(
            //             bottom: 0.0,
            //             left: 0.0,
            //             right: 0.0,
            //             child: Text(
            //               "load image failed, click to reload",
            //               textAlign: TextAlign.center,
            //             ),
            //           )
            //         ],
            //       ),
            //       onTap: () {
            //         state.reLoadImage();
            //       },
            //     );
            // }
            // }
          ),
        ),
        const Text(
          'Date captured: 31 January 2024',
          style: CustomTextStyle.labelMedium,
        ),
        20.gap
      ]),
    );
  }
}

//https://res.cloudinary.com/ogbanugot/image/upload/v1706989569/testl21_e7pr6c.png
