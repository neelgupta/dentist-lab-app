import 'package:dentalapp/screen/register_type_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
    Future.delayed(Duration(seconds: 5),() {
      Navigator.push(context,
      MaterialPageRoute(builder: (context) => RegisterTypeScreen()));
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
          child: Column(
            children: [
              SizedBox(height: 135,width: 100,),
              Spacer(),
              Align(
                alignment: Alignment.center,
                  child: Text("Logo",style: GoogleFonts.lato(fontSize: 45,fontWeight: FontWeight.w600,color: Colors.white))),
              Spacer(),
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
