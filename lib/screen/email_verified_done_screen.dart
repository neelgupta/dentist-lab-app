import 'package:dentalapp/screen/dashboard_screen.dart';
import 'package:dentalapp/screen/email_verification_screen.dart';
import 'package:dentalapp/screen/reset_password_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class EmailVerifiedDoneScreen extends StatefulWidget {
  const EmailVerifiedDoneScreen({Key? key}) : super(key: key);

  @override
  State<EmailVerifiedDoneScreen> createState() => _EmailVerifiedDoneScreenState();
}

class _EmailVerifiedDoneScreenState extends State<EmailVerifiedDoneScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
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
                      decoration: BoxDecoration(
                          color: Color(0xFF116D6E),
                          image: DecorationImage(image: AssetImage("assets/image/Group 12305.png"),
                              fit: BoxFit.fitWidth,alignment: Alignment.bottomCenter,opacity: 0.3)
                      ),
                      child: Align(
                          alignment: Alignment.center,
                          child: Column(
                            children: [
                              SizedBox(height: 100,),
                              Text("Email Verification",style: GoogleFonts.lato(fontSize: 32,fontWeight: FontWeight.w600,color: Colors.white,),),
                            ],
                          ))
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children:  [
                        SizedBox(height: 110,),
                        Image(image: AssetImage("assets/image/Group 12680.png")),
                        SizedBox(height: 30,),
                        Text("Email verification Successful",style: GoogleFonts.lato(fontSize: 19,fontWeight: FontWeight.w600 ),),
                      ],
                    ),
                  ),
                  Spacer(),
                  Padding(
                    padding: const EdgeInsets.only(top: 20,left: 20,right: 20),
                    child: Container(
                      height: 50,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: Color(0xFF116D6E)
                      ),
                      child: TextButton(
                          onPressed: () {
                             Navigator.push(context, MaterialPageRoute(builder: (context) => DashboardScreen(),));
                          },
                          child: Text("Continue To Sign In",style: GoogleFonts.lato(fontSize: 15,fontWeight: FontWeight.w500,color: Colors.white))),
                    ),
                  ),
                  SizedBox(height: 50,),
                ],
              ),
              Positioned(
                  top: 45,
                  left: 12,
                  child: InkWell(
                      onTap: () {
                        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => EmailVerificationScreen(),));
                      },
                      child: Icon(Icons.keyboard_backspace,color: Colors.white,)))
            ],
          ),
        ),
      ),
    );
  }
}
