import 'package:dentalapp/screen/acceptedquote_details_screen.dart';
import 'package:dentalapp/screen/splash.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Dental',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
       home: SplashScreen(),
    );
  }
}
