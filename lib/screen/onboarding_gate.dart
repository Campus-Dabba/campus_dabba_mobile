import 'package:campus_dabba/screen/auth_screen.dart';
import 'package:campus_dabba/screen/intro_screen.dart';
// import 'package:campus_dabba/screen/dabba_signin_signup_screen.dart';
import 'package:flutter/material.dart';

class OnboardingGate extends StatefulWidget {
  const OnboardingGate({super.key});

  @override
  State<OnboardingGate> createState() => _OnboardingGateState();
}

class _OnboardingGateState extends State<OnboardingGate> {
  bool onBoardingDone = false;

  void switchScreen() {
    onBoardingDone = true;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    if (onBoardingDone) {
      return AuthScreen();
    } else {
      return OnboardingScreen(
        getStartedCallBack: switchScreen,
      );
    }
  }
}
