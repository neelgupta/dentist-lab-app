import 'dart:convert';
import 'package:dentalapp/util/api_services.dart';
import 'package:dentalapp/util/utils.dart';
import 'package:http/http.dart' as http;
import 'package:dentalapp/screen/email_verified_done_screen.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/otp_field_style.dart';
import 'package:otp_text_field/style.dart';
import '../models/verify_otp_model.dart';

class EmailVerificationScreen extends StatefulWidget {
  final String? userId;
  final String? emailId;
  const EmailVerificationScreen({Key? key,this.userId,this.emailId}) : super(key: key);

  @override
  State<EmailVerificationScreen> createState() => _EmailVerificationScreenState();
}

class _EmailVerificationScreenState extends State<EmailVerificationScreen> {


  bool isOTPFilled = false;
  OtpFieldController  otpController = OtpFieldController();
  var otp = "";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
  bool isLoading =  false;
  VerifyOtpModel? verifyOtpModel;

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
                  decoration: const BoxDecoration(
                      color: Color(0xFF116D6E),
                      image: DecorationImage(image: AssetImage("assets/image/Group 12305.png"),
                          fit: BoxFit.fitWidth,alignment: Alignment.bottomCenter,opacity: 0.3)
                  ),
                  child: Align(
                      alignment: Alignment.center,
                      child: Column(
                        children: [
                          Container(
                            padding: const EdgeInsets.only(left: 15,top: 40),
                            alignment: Alignment.centerLeft,
                            child: InkWell(
                                onTap: () {
                                  Navigator.pop(context);
                                },
                                child: const Icon(Icons.keyboard_backspace,color: Colors.white,)),
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
                    const SizedBox(height: 10,),
                    Text("Enter the 6 digit verification code sent to:",
                        style: GoogleFonts.lato(fontSize: 15,fontWeight: FontWeight.w500,color: const Color(0xFF707070)),maxLines: 3,textAlign: TextAlign.start),
                    Text("${widget.emailId}",
                        style: GoogleFonts.lato(fontSize: 15,fontWeight: FontWeight.w600,color: const Color(0xFF116D6E)),maxLines: 3,textAlign: TextAlign.start),
                    const SizedBox(height: 20,),
                    OTPTextField(
                      length: 6,
                      width: width,
                      fieldWidth: width * 0.13,
                      controller: otpController,
                      keyboardType: TextInputType.number,
                      fieldStyle: FieldStyle.box,
                      otpFieldStyle: OtpFieldStyle(
                        focusBorderColor: Colors.black,
                      ),
                      style: const TextStyle(
                          fontSize: 15,
                          fontFamily: "Rubik"
                      ),
                      textFieldAlignment: MainAxisAlignment.spaceAround,
                      onCompleted: (pin) {
                        setState(() {
                          isOTPFilled = true;
                          otp = pin;
                        });
                      },
                      onChanged: (value) {
                        if(otp.length<6) {
                          setState(() {
                            isOTPFilled = false;
                          });
                        }
                      },
                    ),

                  ],
                ),
              ),
              const Spacer(),
              Padding(
                padding: const EdgeInsets.only(top: 20,left: 20,right: 20),
                child: Container(
                  height: height*0.065,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: isOTPFilled ? const Color(0xFF116D6E) : const Color(0xFFA0A0A0)
                  ),
                  child: TextButton(
                      onPressed: () {
                        if(isOTPFilled){
                          setState(() {
                            verifyOtp();
                          });
                          // Navigator.push(context,MaterialPageRoute(builder: (context) => EmailVerifiedDoneScreen()));
                        }
                      },
                      child: Text("Submit Code",style: GoogleFonts.lato(fontSize: 15,fontWeight: FontWeight.w500,color: Colors.white))),
                ),
              ),
              const SizedBox(height: 20,),
              Align(
                  alignment: Alignment.center,
                  child: InkWell(
                      onTap: () {
                      },
                      child: Text("Resend Code",style: GoogleFonts.lato(color: const Color(0xFF116D6E),fontWeight: FontWeight.w500,fontSize: 16, )))),
              SizedBox(height: height*0.06,),
            ],
          ),
        ),
      ),
    );
  }
  verifyOtp()async{
    Utils.showLoadingDialog(context);
    var postUri = Uri.parse(ApiServices.verifyOtpApi);
      var bodyData = {
        "UserId":widget.userId,
        "otp": otp.toString(),
      };
      var response = await http.post(
        postUri,
        body: bodyData,
      );
      Utils.logAPIResponse(response: response,apiName: ApiServices.verifyOtpApi,function: "verifyOtp");
      Navigator.pop(context);
      if (response.statusCode == 200) {
        Map map = jsonDecode(response.body);
        if (map["status"] == 200) {
          Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => const EmailVerifiedDoneScreen(),),(route) => false,);
          Utils.showErrorToast(map["message"]);
        } else {
          Utils.showErrorToast(map["message"]);
        }
      }else{
        Utils.showErrorToast(jsonDecode(response.body)['message']);
      }
  }
}
