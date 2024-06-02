import 'package:taro_leaf_blight/core/utils/extensions/date_extensions.dart';
import 'package:taro_leaf_blight/features/detection/provider/detection_providers.dart';
import 'package:taro_leaf_blight/features/error/presentation/error.dart';
import 'package:taro_leaf_blight/packages/packages.dart';
import 'package:taro_leaf_blight/widgets/custominfo_widget.dart';
import 'package:taro_leaf_blight/widgets/image_viewer.dart';

class DetectionInfoScreen extends ConsumerWidget {
  final String detectionId;
  const DetectionInfoScreen({
    required this.detectionId,
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var detection = ref.watch(getDetectionByIdProvider(detectionId));

    return Scaffold(
      appBar: AppBar(
        leading: backButton(context),
        elevation: 10,
        backgroundColor: AppColors.primary,
      ),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: detection.when(
                  data: (data) {
                    return Column(
                      children: [
                            GestureDetector(
                        onTap: () => showImageViewer(
                            context, data.data!.imageUrl,
                            swipeDismissible: true,
                            doubleTapZoomable: true,
                            // when immersive == true it gets janky switching from SystemOverlay modes
                            immersive: false),
                        child: Container(
                            height: 290.h,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(20),
                              child: ExtendedImage.network(
                                data.data!.imageUrl,
                                fit: BoxFit.cover,
                                mode: ExtendedImageMode.gesture,
                              ),
                            )),
                      ),
                      Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.all(8.0)
                                  .copyWith(top: 10.0, bottom: 16.0),
                              child: const Text("Count",
                                  style: CustomTextStyle.label2XLXBold),
                            ),
                            CustomInfoWidget(
                              color: Colors.white,
                              labelText: "Early",
                              data: data.data!.taroEarly,
                            ),
                            CustomInfoWidget(
                              color: Colors.grey.shade100,
                              labelText: "Not Early",
                              data: data.data!.taroNotEarly,
                            ),
                            CustomInfoWidget(
                              color: Colors.white,
                              labelText: "Healthy",
                              data: data.data!.taroHealthy,
                            ),
                            CustomInfoWidget(
                              color: Colors.grey.shade100,
                              labelText: "Date",
                              data: DateTime.parse(data.data!.createdAt)
                                  .formatDateAndTime,
                            ),
                          ]),
                       const CustomInfoWidget(
                        color: Colors.white,
                        labelText: "Solution",
                        data:"",
                      ),
                      if (data.data?.solution != null) SolutionWidget(
                          solutionText: data.data!.solution!,
                          color: Colors.grey.shade100)
                        ]
                      );
                  },
                  loading: () {
                    return Skeletonizer(
                      child: Column(
                        children: [
                          Column(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(16),
                                child: Container(
                                  height: 290.h,
                                  width: 370.w,
                                  color: Colors.white,
                                ),
                              ),
                              Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Padding(
                                      padding: const EdgeInsets.all(8.0)
                                          .copyWith(top: 10.0, bottom: 16.0),
                                      child: const Text("Count",
                                          style: CustomTextStyle.label2XLXBold),
                                    ),
                                    CustomInfoWidget(
                                      color: Colors.grey.shade100,
                                      labelText: "Early",
                                      data: 1,
                                    ),
                                    const CustomInfoWidget(
                                      color: Colors.white,
                                      labelText: "Not Early",
                                      data: 2,
                                    ),
                                    CustomInfoWidget(
                                      color: Colors.grey.shade100,
                                      labelText: "Healthy",
                                      data: 3,
                                    ),
                                    const CustomInfoWidget(
                                      color: Colors.white,
                                      labelText: "Date",
                                      data: '31 January 2024',
                                    ),
                                  ]),
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
                          ref.invalidate(getDetectionByIdProvider(detectionId));
                        });
                  },
                )),
          ),
        ],
      ),
    );
  }
}

class SolutionWidget extends StatelessWidget {
  final String solutionText;
  final Color color;
  const SolutionWidget(
      {required this.solutionText, super.key, required this.color});
// fontSize: 18.sp
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(16.0),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0),
        child: Row(
          children: [
            Flexible(
              child: Text(
                solutionText,
                style: CustomTextStyle.paragraphMedium,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
