// import 'package:taro_leaf_blight/features/home/presentation/login.dart';
// import 'package:taro_leaf_blight/features/home/presentation/signup.dart';
// import 'package:taro_leaf_blight/packages/packages.dart';

// class AuthStart extends StatefulWidget {
//   const AuthStart({super.key});

//   @override
//   State<AuthStart> createState() => _AuthStartState();
// }

// class _AuthStartState extends State<AuthStart> {
//   final onboardList = <(String, String, String)>[
//     (
//       'Unlock Unbeatable Prices',
//       'Get massive discounts on all products. You get the best prices when you shop with your friends.',
//       ImagesAssets.onboard1,
//     ),
//     (
//       'Share, Shop, and Save with friends!',
//       'Share exciting deals with friends, create or join groups, and explore exciting deals. Save together when you shop in groups',
//       ImagesAssets.onboard2,
//     ),
//     (
//       'Ready to Shop Smart?',
//       'Explore the ultimate grocery shopping experience with your friends.',
//       ImagesAssets.onboard3,
//     ),
//   ];
//   final _controller = PageController();
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Padding(
//         padding: const EdgeInsets.symmetric(
//           horizontal: 16,
//           vertical: 64,
//         ),
//         child: Column(
//           children: [
//             Expanded(
//               child: PageView(
//                 controller: _controller,
//                 children: [
//                   for (final (i, item) in onboardList.indexed)
//                     Column(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         Image.asset(
//                           item.$3,
//                           width: double.infinity,
//                         ),
//                         50.gap,
//                         Row(
//                           mainAxisAlignment: MainAxisAlignment.center,
//                           children: onboardList.mapIndexed((index, item) {
//                             return Container(
//                               width: 4,
//                               height: 4,
//                               decoration: BoxDecoration(
//                                 color: index == i
//                                     ? AppColors.primary
//                                     : AppColors.greyDisabled,
//                                 shape: BoxShape.circle,
//                               ),
//                             ).paddingSymmetric(horizontal: 1.5);
//                           }).toList(),
//                         ),
//                         8.gap,
//                         Text(
//                           item.$1,
//                           style: CustomTextStyle.textlarge18.w700,
//                           textAlign: TextAlign.center,
//                         ),
//                         12.gap,
//                         Text(
//                           item.$2,
//                           style: CustomTextStyle.textsmall14,
//                           textAlign: TextAlign.center,
//                         ),
//                       ],
//                     ),
//                 ],
//               ),
//             ),
//             44.spacingH,
//             AppButton(
//               onPressed: () {
//                 pushTo(const SignupScreen());
//               },
//               label: 'Create an account',
//             ),
//             16.gap,
//             AppButton.outline(
//               onPressed: () {
//                 pushTo(const LoginScreen());
//               },
//               label: 'Log in',
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
