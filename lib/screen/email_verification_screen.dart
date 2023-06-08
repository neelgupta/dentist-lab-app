import 'package:dentalapp/screen/email_verified_done_screen.dart';
import 'package:dentalapp/screen/sign_up_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class EmailVerificationScreen extends StatefulWidget {
  const EmailVerificationScreen({Key? key}) : super(key: key);

  @override
  State<EmailVerificationScreen> createState() => _EmailVerificationScreenState();
}

class _EmailVerificationScreenState extends State<EmailVerificationScreen> {


  List<TextEditingController> otpControllers = List.generate(
    6,
        (index) => TextEditingController(),
  );
  @override
  void dispose() {
    for (var controller in otpControllers) {
      controller.dispose();
    }
    otpControllers.forEach((controller) => controller.dispose());
    super.dispose();
  }

  bool isOTPFilled = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    otpControllers[0].addListener(checkOTP);
    otpControllers[0].text = '';
  }
  void checkOTP() {
    setState(() {
      isOTPFilled = otpControllers.every((controller) => controller.text.length == 1);
      if (isOTPFilled) {
        FocusScope.of(context).nextFocus();
      }
    });
  }


  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: SizedBox(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                  height: height*0.24,
                  decoration: BoxDecoration(
                      color: Color(0xFF116D6E),
                      image: DecorationImage(image: AssetImage("assets/image/Group 12305.png"),
                          fit: BoxFit.fitWidth,alignment: Alignment.bottomCenter,opacity: 0.3)
                  ),
                  child: Align(
                      alignment: Alignment.center,
                      child: Column(
                        children: [
                          Container(
                            padding: EdgeInsets.only(left: 15,top: 40),
                            alignment: Alignment.centerLeft,
                            child: InkWell(
                                onTap: () {
                                  Navigator.pop(context);
                                },
                                child: Icon(Icons.keyboard_backspace,color: Colors.white,)),
                          ),
                          SizedBox(height: height*0.05,),
                          Text("Email Verification",style: GoogleFonts.lato(fontSize: 32,fontWeight: FontWeight.w600,color: Colors.white,),),
                        ],
                      ))
              ),
              Padding(
                padding:EdgeInsets.symmetric(horizontal: width*0.057,vertical: height*0.027),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children:  [
                    SizedBox(height: 10,),
                    Text("Enter the 6 digit verification code sent to:",
                        style: GoogleFonts.lato(fontSize: 15,fontWeight: FontWeight.w500,color: Color(0xFF707070)),maxLines: 3,textAlign: TextAlign.start),
                    Text("admin@gmail.com",
                        style: GoogleFonts.lato(fontSize: 15,fontWeight: FontWeight.w600,color: Color(0xFF116D6E)),maxLines: 3,textAlign: TextAlign.start),
                    SizedBox(height: 20,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(
                        6,
                            (index) => buildOTPTextField(index),
                      ),
                    ),

                  ],
                ),
              ),
              Spacer(),
              Padding(
                padding: const EdgeInsets.only(top: 20,left: 20,right: 20),
                child: Container(
                  height: height*0.065,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: isOTPFilled ? Color(0xFF116D6E) : Color(0xFFA0A0A0)
                  ),
                  child: TextButton(
                      onPressed: () {
                        if(isOTPFilled){
                          Navigator.push(context,MaterialPageRoute(builder: (context) => EmailVerifiedDoneScreen()));
                        }
                      },
                      child: Text("Submit Code",style: GoogleFonts.lato(fontSize: 15,fontWeight: FontWeight.w500,color: Colors.white))),
                ),
              ),
              SizedBox(height: 20,),
              Align(
                  alignment: Alignment.center,
                  child: InkWell(
                      onTap: () {
                      },
                      child: Text("Resend Code",style: GoogleFonts.lato(color: Color(0xFF116D6E),fontWeight: FontWeight.w500,fontSize: 16, )))),
              SizedBox(height: height*0.06,),
            ],
          ),
        ),
      ),
    );
  }
  Widget buildOTPTextField(int index) {
    return Container(
      width: 42,
      height: 42,
      margin: EdgeInsets.symmetric(horizontal: 5),
      child: TextField(
        controller: otpControllers[index],
        keyboardType: TextInputType.number,
        maxLength: 1,
        autofocus: true,
        textAlign: TextAlign.center,
        onChanged: (value) {
          if (value.isNotEmpty) {
            if (index < otpControllers.length + 1) {
              FocusScope.of(context).nextFocus();
            }
            checkOTP();
          }
        },
        decoration: InputDecoration(
            counterText: '',
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(color: Color(0xFF707070)),
            ),
            contentPadding: EdgeInsets.only(bottom: 6,)
        ),
      ),
    );
  }
}
