import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:twitch_yee/firebaseResources/auth_methods.dart';
import 'package:twitch_yee/providers/user_provider.dart';
import 'package:twitch_yee/screens/home_screen.dart';
import 'package:twitch_yee/screens/login_screen.dart';
import 'package:twitch_yee/screens/onboarding_screen.dart';
import 'package:twitch_yee/screens/signup_screen.dart';
import 'package:twitch_yee/utils/colors.dart';
import 'package:twitch_yee/widgets/loading_indicator.dart';
import 'models/user.dart' as model;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => UserProvider())],
      child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'No',
      theme: ThemeData.light().copyWith(
        appBarTheme: AppBarTheme.of(context).copyWith(
          backgroundColor: backgroundColor,
          elevation: 0,
          titleTextStyle: const TextStyle(
              color: primaryColor, fontSize: 20, fontWeight: FontWeight.w600),
        ),
        iconTheme: const IconThemeData(
          color: primaryColor,
        ),
      ),
      routes: {
        OnboardingScreen.namedRoute: (context) => const OnboardingScreen(),
        LoginScreen.namedRoute: (context) => const LoginScreen(),
        SignUp.namedRoute: (context) => const SignUp(),
        HomeScreen.namedRoute: (context) => const HomeScreen(),
      },
      home: FutureBuilder(
          future: AuthMethods()
              .getCurrentUser(FirebaseAuth.instance.currentUser != null
                  ? FirebaseAuth.instance.currentUser!.uid
                  : null)
              .then((value) {
            if (value != null) {
              Provider.of<UserProvider>(context, listen: false).setUser(
                model.User.fromMap(value),
              );
            }
            return value;
          }),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return LoadingIndicator();
            }
            if (snapshot.hasData) {
              return const HomeScreen();
            }
            return OnboardingScreen();
          }),
    );
  }
}
