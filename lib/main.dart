import 'package:flutter/material.dart';
import 'package:koin/theme.dart';
import 'package:koin/user/views/home_screen.dart';
import 'package:koin/user/views/auth/views/splash_screen.dart';

void main() {
  runApp(const KoinApp());
}

class KoinApp extends StatelessWidget {
  const KoinApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        textTheme: koinTextTheme(context),
        colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.blue),
      ),
      debugShowCheckedModeBanner: false,
      home: SplashScreenWrapper(),
    );
  }
}
