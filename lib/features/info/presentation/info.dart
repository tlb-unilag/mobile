import 'package:taro_leaf_blight/core/utils/extensions/date_extensions.dart';
import 'package:taro_leaf_blight/features/detection/models/detection_model.dart';
import 'package:taro_leaf_blight/features/detection/provider/detection_providers.dart';
import 'package:taro_leaf_blight/features/error/presentation/error.dart';
import 'package:taro_leaf_blight/packages/packages.dart';
import 'package:taro_leaf_blight/widgets/custominfo_widget.dart';

class DetectionInfoScreen extends ConsumerWidget {
  final String detectionId;
  const DetectionInfoScreen(
      {required this.detectionId, super.key,});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var detection = ref.watch(getDetectionByIdProvider(detectionId));
    
    return Scaffold(
      appBar: AppBar(leading: backButton(context)),
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
                              scrollDirection: Axis.horizontal,
                              itemCount: 1,
                              itemBuilder: (BuildContext context, int index) {
                                Widget image = ClipRRect(
                                   borderRadius: BorderRadius.circular(20),
                                  child: ExtendedImage.network(
                                      data.data!.imageUrl
                                     ,
                                    fit: BoxFit.cover,
                                    mode: ExtendedImageMode.gesture,
                                    
                                    
                                  ),
                                );
                                return Hero(
                                  tag: index.toString(),
                                  child: image,
                                );
                              },
                            )),
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
                                data: data.data!.taroEarly,
                              ),
                              CustomInfoWidget(
                                color: Colors.white,
                                labelText: "Taro Not Early",
                                data: data.data!.taroNotEarly,
                              ),
                              CustomInfoWidget(
                                color: Colors.grey.shade100,
                                labelText: "Taro Healthy",
                                data: data.data!.taroHealthy,
                              ),
                              CustomInfoWidget(
                                color: Colors.white,
                                labelText: "Date",
                                data:  DateTime.parse(data.data!.createdAt).formatDateAndTime,
                              ),
                            ]),
                      ],
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
                                      labelText: "Taro Early",
                                      data: 1,
                                    ),
                                    const CustomInfoWidget(
                                      color: Colors.white,
                                      labelText: "Taro Not Early",
                                      data: 2,
                                    ),
                                    CustomInfoWidget(
                                      color: Colors.grey.shade100,
                                      labelText: "Taro Healthy",
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
