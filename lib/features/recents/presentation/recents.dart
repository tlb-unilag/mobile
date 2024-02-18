// import 'package:camera/camera.dart';
// import 'package:taro_leaf_blight/features/home/presentation/info.dart';
import 'package:taro_leaf_blight/packages/packages.dart';

// late List<CameraDescription> cameras;

// class RecentsScreen extends ConsumerStatefulWidget {
//   const RecentsScreen({super.key});
//   @override
//   ConsumerState<ConsumerStatefulWidget> createState() => _RecentsScreenState();
// }

// class _RecentsScreenState extends ConsumerState<RecentsScreen> {
//   late CameraController _cameraController;
//   late Future<void> _cameraValue;
//   bool isFlashOn = false;
//   bool isCameraFront = true;
//   bool isRecording = false;

//   @override
//   void initState() {
//     super.initState();
//     _cameraController = CameraController(cameras[0], ResolutionPreset.high);
//     _cameraValue = _cameraController.initialize();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.grey[900],
//       body: CustomScrollView(
//         // controller: ,
//         // Add the app bar and list of items as slivers in the next steps.
//         slivers: [
//           SliverAppBar(
//             title: const Text(
//               'Taro Leaf Blight',
//               style: TextStyle(
//                 color: Colors.white,
//               ),
//             ),
//             collapsedHeight: 300,
//             pinned: true,
//             elevation: 0,
//             backgroundColor: Colors.grey[900],
//             expandedHeight: WindowSize.height(context) -
//                 MediaQuery.paddingOf(context).bottom -
//                 150,
//             flexibleSpace: Stack(
//               children: [
//                 FutureBuilder(
//                   future: _cameraValue,
//                   builder: (context, snapshot) {
//                     if (snapshot.hasError) {
//                       var e = snapshot.error;
//                       if (e is CameraException) {
//                         switch (e.code) {
//                           case 'CameraAccessDenied':
//                             // Handle access errors here.
//                             break;
//                           default:
//                             // Handle other errors here.
//                             break;
//                         }
//                       }
//                     }
//                     if (snapshot.connectionState == ConnectionState.done) {
//                       return SizedBox(
//                         width: double.infinity,
//                         child: ClipRRect(
//                           borderRadius: const BorderRadius.vertical(
//                               bottom: Radius.circular(30)),
//                           child: CameraPreview(_cameraController),
//                         ),
//                       );
//                     } else {
//                       return const Center(child: CircularProgressIndicator());
//                     }
//                   },
//                 ),
//                 Align(
//                   alignment: Alignment.center,
//                   child: SizedBox(
//                     width: WindowSize.width(context) - 100,
//                     height: WindowSize.width(context),
//                     child: CustomPaint(
//                       painter: CameraBoxSquirclePainter(),
//                     ).paddingOnly(b: 100),
//                   ),
//                 ),
//                 Align(
//                   alignment: Alignment.bottomCenter,
//                   child: Padding(
//                     padding: const EdgeInsets.symmetric(horizontal: 8).copyWith(
//                       bottom: 50,
//                     ),
//                     child: GestureDetector(
//                       onTap: () {
//                         pushTo(const InfoPage());
//                         // if (!isRecording) takePhoto(context);
//                       },
//                       child: Container(
//                         decoration: BoxDecoration(
//                           border: Border.all(
//                             color: Colors.white,
//                             width: 3,
//                           ),
//                           shape: BoxShape.circle,
//                         ),
//                         child: Container(
//                           height: 75,
//                           width: 75,
//                           alignment: Alignment.center,
//                           margin: const EdgeInsets.all(3),
//                           decoration: const BoxDecoration(
//                             color: Colors.white,
//                             shape: BoxShape.circle,
//                           ),
//                           child: Icon(
//                             Icons.search,
//                             color: Colors.grey[800],
//                           ),
//                         ),
//                       ),
//                     ),
//                   ),
//                 )
//               ],
//             ),
//           ),
//           SliverToBoxAdapter(
//             child: Column(
//               children: [
//                 const Icon(
//                   Icons.keyboard_double_arrow_down_rounded,
//                   color: Colors.white,
//                   size: 14,
//                 ),
//                 5.gap,
//                 const Text(
//                   'Scroll down for recents images',
//                   style: TextStyle(
//                     fontSize: 12,
//                   ),
//                 ),
//               ],
//             ),
//           ),
//           SliverToBoxAdapter(
//             child: Padding(
//               padding: const EdgeInsets.all(16).copyWith(top: 85),
//               child: Column(
//                 children: [
//                   const Row(
//                     children: [
//                       Text(
//                         'Recents',
//                         style: TextStyle(
//                           fontWeight: FontWeight.bold,
//                         ),
//                       ),
//                       Icon(Icons.keyboard_arrow_down,
//                           color: Color.fromARGB(255, 0, 90, 193)),
//                       Spacer(),
//                       Text(
//                         'View All',
//                         style: TextStyle(
//                           fontWeight: FontWeight.bold,
//                           color: Color.fromARGB(255, 0, 90, 193),
//                         ),
//                       ),
//                     ],
//                   ),
//                   12.gap,
//                   ClipRRect(
//                     borderRadius: BorderRadius.circular(10),
//                     child: Column(
//                       children: [
//                         Row(
//                           children: List.generate(
//                             4,
//                             (e) => Expanded(
//                               child: Image.asset(
//                                 Assets.avatar,
//                                 height: 150,
//                                 fit: BoxFit.cover,
//                               ).paddingOnly(
//                                 l: e == 0 ? 0 : 5,
//                               ),
//                             ),
//                           ),
//                         ),
//                         5.gap,
//                         Row(
//                           children: List.generate(
//                             4,
//                             (e) => Expanded(
//                               child: Image.asset(
//                                 Assets.avatar,
//                                 height: 150,
//                                 fit: BoxFit.cover,
//                               ).paddingOnly(
//                                 l: e == 0 ? 0 : 5,
//                               ),
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

// class CameraBoxSquirclePainter extends CustomPainter {
//   @override
//   void paint(Canvas canvas, Size size) {
//     Paint paint = Paint()
//       ..color = Colors.white
//       ..strokeWidth = 3
//       ..style = PaintingStyle.stroke;

//     double cornerRadius = 40.0;
//     double elongate = 20;

//     Path path = Path()
//       ..moveTo(cornerRadius, 0)
//       ..moveTo(size.width - cornerRadius, 0)
//       ..arcToPoint(Offset(size.width, cornerRadius),
//           radius: Radius.circular(cornerRadius))
//       ..moveTo(size.width, size.height - cornerRadius)
//       ..arcToPoint(Offset(size.width - cornerRadius, size.height),
//           radius: Radius.circular(cornerRadius))
//       ..moveTo(cornerRadius, size.height)
//       ..arcToPoint(Offset(0, size.height - cornerRadius),
//           radius: Radius.circular(cornerRadius))
//       ..moveTo(0, cornerRadius)
//       ..arcToPoint(Offset(cornerRadius, 0),
//           radius: Radius.circular(cornerRadius));

//     canvas.drawPath(path, paint);
//   }

//   @override
//   bool shouldRepaint(CustomPainter oldDelegate) {
//     return false;
//   }
// }

class RecentsScreen extends ConsumerWidget {
  const RecentsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Placeholder();
  }
}
