import 'package:dentalapp/clinic_screen/Bottom_Navibar.dart';
import 'package:dentalapp/screen/bottomNavigationBar_screen.dart';
import 'package:dentalapp/screen/dashboard_screen.dart';
import 'package:dentalapp/util/utils.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'bottomNavigationBar_screen.dart';
import 'dashboard_1_screen.dart';
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
    Utils.prefs = await SharedPreferences.getInstance();
    bool isLogin = Utils.getLoginStatus() ?? false;
    Future.delayed(const Duration(seconds: 3),() {
      if (isLogin) {
        String userType = Utils.getUserType();
        if(userType=="lab") {
         // Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const DashboardScreen()),);
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const BottomNavigatorBarWidget()),);
        } else {
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const BottomNavigation(index: 0,),),);
        }
      } else {
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const LoginScreen()));
      }
    },);
  }
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
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
                  child: Image(height: height*0.12,image: AssetImage("assets/image/splash_logo.png"))),
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
