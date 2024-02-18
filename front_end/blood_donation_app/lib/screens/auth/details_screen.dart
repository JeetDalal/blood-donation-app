import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'auth_screen.dart';
import 'verification_screen.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({super.key});

  static const routeName = '/details-screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            top: 0,
            right: 0,
            left: 0,
            child: Container(
              height: 300,
              width: MediaQuery.of(context).size.width,
              color: const Color(0xffEB3738),
              child: Padding(
                padding: const EdgeInsets.only(top: 50),
                child: LogoWidget(),
              ),
            ),
          ),
          Positioned(
            top: 193,
            left: 28,
            right: 28,
            child: UserDetailsFormWidget(),
          ),
        ],
      ),
    );
  }
}

class UserDetailsFormWidget extends StatefulWidget {
  const UserDetailsFormWidget({
    super.key,
  });

  @override
  State<UserDetailsFormWidget> createState() => _UserDetailsFormWidgetState();
}

class _UserDetailsFormWidgetState extends State<UserDetailsFormWidget> {
  late final TextEditingController _otp;
  late String _errorText;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _errorText = "";
    _otp = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 365,
      width: double.infinity,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              offset: const Offset(4, 4),
              color: Colors.black.withOpacity(0.25),
              blurRadius: 25,
            )
          ]),
      child: Stack(
        alignment: Alignment.center,
        clipBehavior: Clip.none,
        children: [
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(
                  top: 42,
                  bottom: 45,
                ),
                child: Text(
                  "USER DETAILS",
                  style: GoogleFonts.roboto(fontSize: 20),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 46,
                ),
                child: Text(
                  "Enter the OTP we have sent on your mobile number",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.roboto(fontSize: 12),
                ),
              ),
              const SizedBox(
                height: 56,
              ),
              Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 32),
                  child: Container())
            ],
          ),
          Positioned(
              bottom: 80,
              child: Text(
                _errorText,
                style: GoogleFonts.roboto(
                  color: Colors.red,
                ),
              )),
          Positioned(
            bottom: -24,
            child: InkWell(
              splashColor: const Color(0xffEB3738).withOpacity(0.5),
              onTap: () {
                Navigator.of(context).pushNamed(DetailsScreen.routeName);
              },
              child: Container(
                height: 48,
                width: 254,
                decoration: BoxDecoration(
                  color: const Color(0xffEB3738),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(
                  child: Text(
                    "VERIFY",
                    style: GoogleFonts.roboto(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
