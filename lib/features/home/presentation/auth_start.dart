import 'package:taro_leaf_blight/core/services/local_data/local_data.dart';
import 'package:taro_leaf_blight/features/auth/presentation/login.dart';
import 'package:taro_leaf_blight/features/auth/presentation/signup.dart';
import 'package:taro_leaf_blight/features/onboarding/presentation/onboarding.dart';
import 'package:taro_leaf_blight/packages/packages.dart';

class AuthStart extends StatefulWidget {
  const AuthStart({super.key});

  @override
  State<AuthStart> createState() => _AuthStartState();
}

class _AuthStartState extends State<AuthStart> {
  @override
  Widget build(BuildContext context) {
    if (LocalData.isOnboarded) {
      return const LoginScreen();
    } else {
      return const OnboardingScreen();
    }
  }
}
