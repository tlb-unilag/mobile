// import 'package:camera/camera.dart';
// import 'package:taro_leaf_blight/features/home/presentation/info.dart';

export 'package:extended_image/extended_image.dart';
import 'package:taro_leaf_blight/features/detection/models/detection_model.dart';
import 'package:taro_leaf_blight/features/detection/provider/detection_provider.dart';
import 'package:taro_leaf_blight/features/error/presentation/error.dart';
import 'package:taro_leaf_blight/features/info/presentation/info.dart';
import 'package:taro_leaf_blight/features/recents/presentation/view_all.dart';
import 'package:taro_leaf_blight/packages/packages.dart';
import 'package:taro_leaf_blight/widgets/mock_data_widget.dart';
import 'package:taro_leaf_blight/widgets/nodetections.dart';

class RecentsScreen extends ConsumerWidget {
  const RecentsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var detections = ref.watch(getAllDetectionsProvider);
    return RefreshIndicator.adaptive(
      color: AppColors.primary,
      onRefresh: () => ref.refresh(getAllDetectionsProvider.future),
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(16).copyWith(top: 85),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
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
                    data: (ResponseModel<MultipleDetectionResponseModel> data) {
                      if (data.data!.detections.isNotEmpty) {
                        return Column(
                            children: data.data!.detections
                                .take(2)
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
                            ref.invalidate(getAllDetectionsProvider);
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

class _DetectionInfoWidgetState extends State<DetectionInfoWidget> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        pushTo(DetectionInfoScreen(
          detectionId: widget.detectionInfo.detectionId,
        ));
        print(widget.detectionInfo.detectionId);
      },
      child: Column(children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Container(
            width: 370.w,
            height: 290.h,
            color: Colors.white,
            child: ExtendedImage.network(
              fit: BoxFit.cover,
              cache: true,
              widget.detectionInfo.imageUrl,
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
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text('Date captured: ', style: CustomTextStyle.labelLXBold),
            Text(
              '31 January 2024',
              style: CustomTextStyle.textsmall14.withColorHex(0xFF17171B),
            ),
          ],
        ),
        20.gap
      ]),
    );
  }
}

//https://res.cloudinary.com/ogbanugot/image/upload/v1706989569/testl21_e7pr6c.png
