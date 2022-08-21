import 'package:flutter/material.dart';
import 'package:twitch_yee/screens/login_screen.dart';
import 'package:twitch_yee/screens/signup_screen.dart';

import '../utils/colors.dart';
import '../widgets/custom_button.dart';

class OnboardingScreen extends StatelessWidget {
  static String namedRoute = "/onboardingroute";
  const OnboardingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: const [
                Text(
                  'Welcome \n to Twitch',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 40,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: CustomButton(
                onTap: () {
                  Navigator.pushNamed(context, LoginScreen.namedRoute);
                },
                text: 'Log in',
                color: buttonColor,
              ),
            ),
            CustomButton(
              onTap: () {
                Navigator.pushNamed(context, SignUp.namedRoute);
              },
              text: 'Sign Up',
              color: buttonColor,
            ),
          ],
        ),
      ),
    );
  }
}
