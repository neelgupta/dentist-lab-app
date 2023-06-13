import 'package:dentalapp/clinic_screen/Bottom_Navibar.dart';
import 'package:dentalapp/clinic_screen/dasboard_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SuccessfulProfileSetUp extends StatefulWidget {
  const SuccessfulProfileSetUp({Key? key}) : super(key: key);

  @override
  State<SuccessfulProfileSetUp> createState() => _SuccessfulProfileSetUpState();
}

class _SuccessfulProfileSetUpState extends State<SuccessfulProfileSetUp> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: goBack,
      child: SafeArea(
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          body: SizedBox(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Stack(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      height: 190,
                      width: MediaQuery.of(context).size.width,
                      decoration: const BoxDecoration(

                              color: Color(0xFF116D6E),
                          image: DecorationImage(
                              image: AssetImage("assets/image/Group 12305.png"),
                              fit: BoxFit.fitWidth,
                              alignment: Alignment.bottomCenter,
                              opacity: 0.3)),
                      child:  Align(
                          alignment: Alignment.center,
                          child: Column(
                            children: [
                              const SizedBox(height: 80,),
                              Text("Set up Profile",style: GoogleFonts.lato(fontSize: 28,fontWeight: FontWeight.w600,color: Colors.white,),),
                            ],
                          ))
                    ),
                    Padding(
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const SizedBox(
                            height: 110,
                          ),
                          const Image(
                              image: AssetImage("assets/image/Group 12680.png")),
                          const SizedBox(
                            height: 30,
                          ),
                          Text(
                            "Congratulations on a successful profile set up",
                            textAlign: TextAlign.center,
                            style: GoogleFonts.lato(
                                fontSize: 17, fontWeight: FontWeight.w600),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
                            textAlign: TextAlign.center,
                            style: GoogleFonts.lato(
                                fontSize: 15,
                                fontWeight: FontWeight.w500,
                                color: const Color(0xFF707070)),
                          ),
                        ],
                      ),
                    ),
                    const Spacer(),
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 20, left: 20, right: 20),
                      child: Container(
                        height: 50,
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color: const Color(0xFF116D6E)),
                        child: TextButton(
                            onPressed: () {
                              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const BottomNavigation(),),);
                            },
                            child: Text("Continue",
                                style: GoogleFonts.lato(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.white))),
                      ),
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                  ],
                ),
                Positioned(
                    top: 45,
                     left: 12,
                    child: Row(mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        GestureDetector(
                            onTap: () {
                              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const BottomNavigation(),),);
                            },
                            child: const Icon(Icons.keyboard_backspace,color: Colors.white,)),

                      ],
                    ))
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<bool> goBack() async {
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const BottomNavigation(),),);
    return true;
  }
}
