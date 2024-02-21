import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';

import '../auth/auth_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(const Duration(seconds: 2), () {
      Navigator.pushReplacementNamed(context, AuthScreen.routeName);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffEB3738),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 209,
              width: 209,
              child: Image.asset(
                'assets/logo.png',
                fit: BoxFit.cover,
              ),
            ).animate().fade().slide(
                  duration: const Duration(milliseconds: 500),
                  curve: Curves.easeIn,
                ),
            const SizedBox(
              height: 10,
            ),
            Text(
              "ZINDGI",
              style: GoogleFonts.quando(
                color: Colors.white,
                fontSize: 48,
                fontWeight: FontWeight.bold,
              ),
            ).animate().fade(delay: const Duration(milliseconds: 600))
          ],
        ),
      ),
    );
  }
}
