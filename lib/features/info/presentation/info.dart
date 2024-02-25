import 'package:taro_leaf_blight/features/detection/provider/detection_provider.dart';
import 'package:taro_leaf_blight/features/detection/service/detection_service.dart';
import 'package:taro_leaf_blight/features/error/presentation/error.dart';
import 'package:taro_leaf_blight/packages/packages.dart';

class DetectionInfoScreen extends ConsumerWidget {
  final String detectionId;
  const DetectionInfoScreen({required this.detectionId, super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // change from hardcoded data
    var detection = ref.watch(
        getDetectionByIdProvider('97945337-27b4-4c1f-aba0-8a03c58d9dda'));
    return Scaffold(
      appBar: AppBar(
        leading: const BackButton(
          color: Colors.black,
        ),
      ),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: SizedBox(
              height: WindowSize.height(context) - 200,
              child: Column(
                children: [
                  detection.when(
                    data: (data) {
                      return Column(
                        children: [
                          Container(
                              height: 290.h,
                              width: 370.w,
                              child: ExtendedImageGesturePageView.builder(
                                itemBuilder: (BuildContext context, int index) {
                                  Widget image = ExtendedImage.network(
                                    //placeholder image - would be replaced
                                    'https://res.cloudinary.com/ogbanugot/image/upload/v1706989569/testl21_e7pr6c.png',
                                    fit: BoxFit.cover,
                                    mode: ExtendedImageMode.gesture,
                                    // gestureConfig: GestureConfig(
                                    //     inPageView: true,
                                    //     initialScale: 1.0,
                                    //     cacheGesture: false),
                                  );
                                  return ExtendedImageSlidePage(
                                    child: image,
                                    slideAxis: SlideAxis.both,
                                    slideType: SlideType.onlyImage,
                                    // onSlidingPage: (state) {
                                    //   var showSwiper = !state.isSliding;
                                    //   if (showSwiper != _showSwiper) {
                                    //     _showSwiper = showSwiper;
                                    //     rebuildSwiper.add(_showSwiper);
                                    //   }
                                    // },
                                  );
                                },
                              )),
                          // ignore: avoid_unnecessary_containers
                          Container(
                            decoration: const BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15.0)),
                              shape: BoxShape.rectangle,
                            ),
                            child: Padding(
                              padding:
                                  const EdgeInsets.all(16).copyWith(top: 30),
                              child: SizedBox(
                                height: 300.h,
                                child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                       Padding(
                                        padding: EdgeInsets.all(8.0)
                                            .copyWith(top: 10.0, bottom: 16.0),
                                        child: const Text("Count",
                                            style: CustomTextStyle.label2XLXBold),
                                      ),
                                      Container(
                                        decoration: BoxDecoration(
                                            color: Colors.grey.shade100,
                                            borderRadius:
                                                const BorderRadius.all(
                                                    Radius.circular(16.0))),
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0)
                                              .copyWith(
                                                  top: 16.0, bottom: 16.0),
                                          child: Row(children: [
                                            const Text(
                                              "Taro Early : ",
                                              style:
                                                  CustomTextStyle.labelLXBold,
                                            ),
                                            Text(data.data.taroEarly.toString())
                                          ]),
                                        ),
                                      ),
                                      Container(
                                        decoration: const BoxDecoration(
                                            color: Colors.white,
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(16.0))),
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0)
                                              .copyWith(
                                                  top: 16.0, bottom: 16.0),
                                          child: Row(children: [
                                            const Text(
                                              "Taro Mid : ",
                                              style:
                                                  CustomTextStyle.labelLXBold,
                                            ),
                                            Text(data.data.taroMid.toString())
                                          ]),
                                        ),
                                      ),
                                      Container(
                                        decoration: BoxDecoration(
                                            color: Colors.grey.shade100,
                                            borderRadius:
                                                const BorderRadius.all(
                                                    Radius.circular(16.0))),
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0)
                                              .copyWith(
                                                  top: 16.0, bottom: 16.0),
                                          child: Row(children: [
                                            const Text(
                                              "Taro Late : ",
                                              style:
                                                  CustomTextStyle.labelLXBold,
                                            ),
                                            Text(data.data.taroLate.toString())
                                          ]),
                                        ),
                                      ),
                                      Container(
                                        decoration: const BoxDecoration(
                                            color: Colors.white,
                                            borderRadius:
                                                BorderRadius.all(
                                                    Radius.circular(16.0))),
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0)
                                              .copyWith(
                                                  top: 16.0, bottom: 16.0),
                                          child: const Row(children: [
                                            Text(
                                              "Date: ",
                                              style:
                                                  CustomTextStyle.labelLXBold,
                                            ),
                                            Text(
                                              '31 January 2024',
                                            )
                                          ]),
                                        ),
                                      ),
                                    ]),
                              ),
                            ),
                          ),
                        ],
                      );
                    },
                    loading: () {
                      //change to skeletonizer
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
                          ],
                        ),
                      );
                    },
                    error: (error, stacktrace) {
                      return ErrorScreen(
                          error: error,
                          onPressed: () {
                            ref.invalidate(
                                getDetectionByIdProvider(detectionId));
                          });
                    },
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
