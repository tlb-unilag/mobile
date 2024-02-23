// import 'package:camera/camera.dart';
// import 'package:taro_leaf_blight/features/home/presentation/info.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taro_leaf_blight/features/auth/providers/auth_provider.dart';
import 'package:taro_leaf_blight/features/detection/models/detection_model.dart';
import 'package:taro_leaf_blight/features/detection/provider/detection_provider.dart';
import 'package:taro_leaf_blight/features/info/presentation/info.dart';
import 'package:taro_leaf_blight/packages/buttons/primary_button.dart';
import 'package:taro_leaf_blight/packages/packages.dart';
import 'package:taro_leaf_blight/widgets/safe_cached_network_image_provider.dart';

class RecentsScreen extends ConsumerWidget {
  const RecentsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var detections = ref.watch(getAllDetectionsProvider);
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Column(
            children: [
              const Icon(
                Icons.keyboard_double_arrow_down_rounded,
                color: Colors.white,
                size: 14,
              ),
              5.gap,
              const Text(
                'Scroll down for recents images',
                style: TextStyle(
                  fontSize: 12,
                ),
              ),
            ],
          ),
        ),
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.all(16).copyWith(top: 85),
            child: Column(
              children: [
                const Row(
                  children: [
                    Text(
                      'Recents',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Icon(Icons.keyboard_arrow_down,
                        color: Color.fromARGB(255, 0, 90, 193)),
                    Spacer(),
                    Text(
                      'View All',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 0, 90, 193),
                      ),
                    ),
                  ],
                ),
                12.gap,
                // pul to refresh , show skeletonizer
                detections.when(
                  data: (data) {
                    return Column(
                        children:
                            data.data.detections.map<Widget>((detectionInfo) {
                      return DetectionInfoWidget(detectionInfo: detectionInfo);
                    }).toList());
                  },
                  loading: () {
                    // replace with skeletonizer
                    return const CircularProgressIndicator();
                  },
                  error: (error, stacktrace) {
                    print(error);
                    return Text(error.toString());
                  },
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class DetectionInfoWidget extends StatelessWidget {
  final SingleDetectionResponseModel detectionInfo;
  const DetectionInfoWidget({required this.detectionInfo, super.key, required});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        pushTo(const DetectionInfoScreen());
      },
      child: Column(children: [
        CachedNetworkImage(
          imageUrl: detectionInfo.imageUrl,
          imageBuilder: (context, imageProvider) {
            imageProvider = SafeCachedNetworkImageProvider(
              detectionInfo.imageUrl,
              fallbackImage: const AssetImage('assets/images/placeholder.png'),
            );
            return Container(
                width: 300.w,
                height: 240.h,
                clipBehavior: Clip.antiAlias,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    image: DecorationImage(
                      image: imageProvider,
                      fit: BoxFit.cover,
                    )));
          },
        ),
        Text(detectionInfo.createdAt.toString())
      ]),
    );
  }
}

// ClipRRect(
//                   borderRadius: BorderRadius.circular(10),
//                   child: Column(
//                     children: [
//                       Row(
//                         children: List.generate(
//                           4,
//                           (e) => Expanded(
//                             child: Image.asset(
//                               Assets.avatar,
//                               height: 150,
//                               fit: BoxFit.cover,
//                             ).paddingOnly(
//                               l: e == 0 ? 0 : 5,
//                             ),
//                           ),
//                         ),
//                       ),
//                       5.gap,
//                       Row(
//                         children: List.generate(
//                           4,
//                           (e) => Expanded(
//                             child: Image.asset(
//                               Assets.avatar,
//                               height: 150,
//                               fit: BoxFit.cover,
//                             ).paddingOnly(
//                               l: e == 0 ? 0 : 5,
//                             ),
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
