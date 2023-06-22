import 'package:dentalapp/clinic_screen/bottom_navigation_bar.dart';
import 'package:dentalapp/screen/lab_home.dart';
import 'package:dentalapp/util/utils.dart';
import 'package:flutter/material.dart';
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
    super.initState();
    goToNext();
  }

  goToNext() async {
    Utils.prefs = await SharedPreferences.getInstance();
    bool isLogin = Utils.getLoginStatus() ?? false;
    Future.delayed(
      const Duration(seconds: 3),
      () {
        if (isLogin) {
          String userType = Utils.getUserType();
          if (userType == "lab") {
            // Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const DashboardScreen()),);
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const LabHome(index: 0)),
            );
          } else {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => const BottomNavigation(
                  index: 0,
                ),
              ),
            );
          }
        } else {
          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) => const LoginScreen()));
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xFF116D6E),
        body: SizedBox(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Stack(
            children: [
              Align(
                  alignment: Alignment.center,
                  child: Image(
                      height: height * 0.12,
                      image: const AssetImage("assets/image/splash_logo.png"))),
              const Align(
                  alignment: Alignment.bottomCenter,
                  child: Image(
                    image: AssetImage("assets/image/BG.png"),
                    fit: BoxFit.fill,
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
