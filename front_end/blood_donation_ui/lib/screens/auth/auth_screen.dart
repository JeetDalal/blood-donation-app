import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'verification_screen.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({super.key});

  static const routeName = '/auth-screen';

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
            child: AuthFormWidget(),
          ),
        ],
      ),
    );
  }
}

class AuthFormWidget extends StatefulWidget {
  const AuthFormWidget({
    super.key,
  });

  @override
  State<AuthFormWidget> createState() => _AuthFormWidgetState();
}

class _AuthFormWidgetState extends State<AuthFormWidget> {
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
                  "PHONE NUMBER",
                  style: GoogleFonts.roboto(fontSize: 20),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 46,
                ),
                child: Text(
                  "“We only need your phone number for authentication purposes and will not contact you otherwise”",
                  style: GoogleFonts.roboto(fontSize: 12),
                ),
              ),
              const SizedBox(
                height: 56,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 32),
                child: TextField(
                  controller: _otp,
                  maxLength: 10,
                  keyboardType: TextInputType.phone,
                  cursorColor: Colors.red,
                  decoration: InputDecoration(
                    label: Text(
                      "PHONE NUMBER",
                      style: GoogleFonts.roboto(
                        fontSize: 10,
                      ),
                    ),
                    floatingLabelStyle:
                        GoogleFonts.roboto(fontSize: 10, color: Colors.red),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.red),
                    ),
                  ),
                ),
              )
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
                RegExp regex = RegExp(r'^[6789]\d{9}$');
                if (!regex.hasMatch(_otp.text)) {
                  log(_otp.text);
                  setState(() {
                    _errorText = "Enter valid phone number";
                  });
                  log(_errorText);
                } else {
                  //submit phone number
                  log("Success...");
                  setState(() {
                    _errorText = "";
                  });
                  Navigator.of(context)
                      .pushNamed(PhoneVerificationScreen.routeName);
                }
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
                    "SEND",
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

class LogoWidget extends StatelessWidget {
  const LogoWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 83,
          width: 83,
          child: Image.asset(
            'assets/logo.png',
            fit: BoxFit.cover,
          ),
        ),
        const SizedBox(
          height: 5,
        ),
        Text(
          "ZINDGI",
          style: GoogleFonts.quando(fontSize: 23, color: Colors.white),
        ),
      ],
    );
  }
}
