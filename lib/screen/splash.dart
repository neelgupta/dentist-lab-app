import 'package:dentalapp/screen/register_type_screen.dart';
import 'package:dentalapp/services/helper_fun.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'login_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}
class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    goToNext();
  }

  goToNext() async {
    ApiHelper.prefs = await SharedPreferences.getInstance();
    Future.delayed(Duration(seconds: 5),() {
      Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (context) => LoginScreen()));
    },);
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xFF116D6E),
        body: SizedBox(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Stack(
            children: [
              Align(
                alignment: Alignment.center,
                  child: Image(image: AssetImage("assets/image/Logo.png"))),
              Align(
                alignment: Alignment.bottomCenter,
                  child: Image(image: AssetImage("assets/image/BG.png"),fit: BoxFit.fill,))
            ],
          ),
        ),
      ),
    );
  }
}
