// import 'package:taro_leaf_blight/core/utils/validators.dart';
// import 'package:taro_leaf_blight/features/home/presentation/login.dart';
// import 'package:taro_leaf_blight/features/home/providers/auth_provider.dart';
// import 'package:taro_leaf_blight/packages/packages.dart';

// class SignupScreen extends ConsumerStatefulWidget {
//   const SignupScreen({super.key});
//   @override
//   ConsumerState<ConsumerStatefulWidget> createState() => _LoginScreenState();
// }

// class _LoginScreenState extends ConsumerState<SignupScreen> {
//   final _phoneController = TextEditingController();
//   final _referralsController = TextEditingController();
//   final _formKey = GlobalKey<FormState>();
//   String? phoneError;
//   String? referralError;

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
//                 'Sign Up',
//                 style: CustomTextStyle.textxLarge20.w700,
//               ),
//               12.gap,
//               Text.rich(
//                 TextSpan(
//                   children: [
//                     TextSpan(
//                       text: 'Have an account? ',
//                       style:
//                           CustomTextStyle.textsmall14.withColorHex(0xFF17171B),
//                     ),
//                     TextSpan(
//                       text: 'Log in',
//                       style: CustomTextStyle.textmedium16.w700
//                           .withColor(AppColors.primary),
//                       recognizer: TapGestureRecognizer()
//                         ..onTap = () {
//                           pushReplacementTo(const LoginScreen());
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
//                   // if (t.exists) {
//                   //   setState(() {
//                   //     phoneError = 'Phone number already exists';
//                   //   });
//                   //   return;
//                   // }
//                   // setState(() {
//                   //   phoneError = null;
//                   // });
//                 },
//               ),
//               24.gap,
//               AppInput(
//                 controller: _referralsController,
//                 errorText: referralError,
//                 onChanged: (p0) async {
//                   // if (p0 == null) {
//                   //   setState(() {
//                   //     referralError = null;
//                   //   });
//                   //   return;
//                   // }
//                   // final t =
//                   //     await ref.read(authProvider.notifier).validateReferral(
//                   //           code: p0,
//                   //         );
//                   // if (t == null) {
//                   //   setState(() {
//                   //     referralError = '';
//                   //   });
//                   //   return;
//                   // }
//                   // if (!t.exists) {
//                   //   setState(() {
//                   //     referralError = 'Referral code doesn\'t exist';
//                   //   });
//                   //   return;
//                   // }
//                   // setState(() {
//                   //   referralError = null;
//                   // });
//                 },
//                 labelText: 'Referral Code (Optional)',
//                 hintText: 'Enter a referral code',
//               ),
//               24.gap,
//               AppButton(
//                 onPressed: phoneError == null && referralError == null
//                     ? () {
//                         // if (!_formKey.currentState!.validate()) return;
//                         // ref.read(authProvider.notifier)
//                         //   ..addChanges(AuthRepo(
//                         //     phone: _phoneController.text,
//                         //     referralCode: _referralsController.text.isEmpty
//                         //         ? null
//                         //         : _referralsController.text,
//                         //   ))
//                         //   ..sendSmsOtp(
//                         //       phone: _phoneController.text, goToVerify: true);
//                       }
//                     : null,
//                 label: 'Create account',
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
