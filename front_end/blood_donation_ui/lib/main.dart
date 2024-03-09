import 'screens/auth/auth_screen.dart';
import 'screens/auth/details_screen.dart';
import 'screens/auth/verification_screen.dart';
import 'screens/location/user_location_screen.dart';
import 'screens/splash/splash_screen.dart';
import 'services/location_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const BloodDonationApp());
}

class BloodDonationApp extends StatelessWidget {
  const BloodDonationApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => LocationService())
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: const SplashScreen(),
        routes: {
          AuthScreen.routeName: (context) => const AuthScreen(),
          PhoneVerificationScreen.routeName: (context) =>
              const PhoneVerificationScreen(),
          DetailsScreen.routeName: (context) => const DetailsScreen(),
          UserLocationScreen.routeName: (context) => const UserLocationScreen(),
        },
      ),
    );
  }
}
