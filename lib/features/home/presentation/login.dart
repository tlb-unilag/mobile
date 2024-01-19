// import 'package:taro_leaf_blight/core/utils/validators.dart';
// import 'package:taro_leaf_blight/features/home/presentation/signup.dart';

// import 'package:taro_leaf_blight/features/home/providers/auth_provider.dart';
// import 'package:taro_leaf_blight/packages/packages.dart';

// class LoginScreen extends ConsumerStatefulWidget {
//   const LoginScreen({super.key});
//   @override
//   ConsumerState<ConsumerStatefulWidget> createState() => _LoginScreenState();
// }

// class _LoginScreenState extends ConsumerState<LoginScreen> {
//   final _phoneController = TextEditingController();
//   final _formKey = GlobalKey<FormState>();
//   String? phoneError;
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(),
//       body: Form(
//         key: _formKey,
//         child: Padding(
//           padding: const EdgeInsets.all(16),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Text(
//                 'Welcome Back',
//                 style: CustomTextStyle.textxLarge20.w700,
//               ),
//               12.gap,
//               Text.rich(
//                 TextSpan(
//                   children: [
//                     TextSpan(
//                       text: 'New to taro_leaf_blight? ',
//                       style:
//                           CustomTextStyle.textsmall14.withColorHex(0xFF17171B),
//                     ),
//                     TextSpan(
//                       text: 'Create account',
//                       style: CustomTextStyle.textmedium16.w700
//                           .withColor(AppColors.primary),
//                       recognizer: TapGestureRecognizer()
//                         ..onTap = () {
//                           pushReplacementTo(const SignupScreen());
//                         },
//                     ),
//                   ],
//                 ),
//               ),
//               30.gap,
//               AppInput(
//                 controller: _phoneController,
//                 labelText: 'Phone Number',
//                 hintText: 'Enter your phone number',
//                 validator: Validator().isNotEmpty().validate,
//                 errorText: phoneError,
//                 onChanged: (p0) async {
//                   // final t = await ref.read(authProvider.notifier).validatePhone(
//                   //       phone: p0!,
//                   //     );
//                   // if (t == null) {
//                   //   setState(() {
//                   //     phoneError = '';
//                   //   });
//                   //   return;
//                   // }
//                   // if (!t.valid) {
//                   //   setState(() {
//                   //     phoneError = 'Phone number invalid';
//                   //   });
//                   //   return;
//                   // }
//                   // if (!t.exists) {
//                   //   setState(() {
//                   //     phoneError = 'Phone number does not exists';
//                   //   });
//                   //   return;
//                   // }
//                   // setState(() {
//                   //   phoneError = null;
//                   // });
//                 },
//               ),
//               24.gap,
//               AppButton(
//                 onPressed: phoneError == null
//                     ? () {
//                         // if (!_formKey.currentState!.validate()) return;
//                         // ref.read(authProvider.notifier)
//                         //   ..addChanges(AuthRepo(
//                         //     phone: _phoneController.text,
//                         //   ))
//                         //   ..sendSmsOtp(
//                         //       phone: _phoneController.text, goToVerify: true);
//                       }
//                     : null,
//                 label: 'Log in',
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
