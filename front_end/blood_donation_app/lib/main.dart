import 'package:blood_donation_app/screens/auth/auth_screen.dart';
import 'package:blood_donation_app/screens/auth/details_screen.dart';
import 'package:blood_donation_app/screens/auth/verification_screen.dart';
import 'package:blood_donation_app/screens/splash/splash_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const BloodDonationApp());
}

class BloodDonationApp extends StatelessWidget {
  const BloodDonationApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const SplashScreen(),
      routes: {
        AuthScreen.routeName: (context) => const AuthScreen(),
        PhoneVerificationScreen.routeName: (context) =>
            const PhoneVerificationScreen(),
        DetailsScreen.routeName: (context) => const DetailsScreen(),
      },
    );
  }
}
