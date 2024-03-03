import 'package:flutter/cupertino.dart';
import 'package:taro_leaf_blight/features/detection/provider/detection_provider.dart';
import 'package:taro_leaf_blight/features/detection/service/detection_service.dart';
import 'package:taro_leaf_blight/features/error/presentation/error.dart';
import 'package:taro_leaf_blight/packages/packages.dart';
import 'package:taro_leaf_blight/widgets/custominfo_widget.dart';

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
        leading: backButton(context)
      ),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: detection.when(
                  data: (data) {
                    return ListView(
                      shrinkWrap: true,
                      children: [
                        Container(
                            height: 290.h,
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
                        // Container(
                        // decoration: const BoxDecoration(
                        //   borderRadius:
                        //       BorderRadius.all(Radius.circular(15.0)),
                        //   shape: BoxShape.rectangle,
                        // ),
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
                                labelText: "Taro Early",
                                data: data.data.taroEarly,
                              ),
                              CustomInfoWidget(
                                color: Colors.white,
                                labelText: "Taro Mid",
                                data: data.data.taroMid,
                              ),
                              CustomInfoWidget(
                                color: Colors.grey.shade100,
                                labelText: "Taro Late",
                                data: data.data.taroLate,
                              ),
                              const CustomInfoWidget(
                                color: Colors.white,
                                labelText: "Date",
                                data: '31 January 2024',
                              ),
                            ]),
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
                                      labelText: "Taro Early",
                                      data: 1,
                                    ),
                                    const CustomInfoWidget(
                                      color: Colors.white,
                                      labelText: "Taro Mid",
                                      data: 2,
                                    ),
                                    CustomInfoWidget(
                                      color: Colors.grey.shade100,
                                      labelText: "Taro Late",
                                      data:3,
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
