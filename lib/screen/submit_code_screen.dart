import 'dart:convert';
import 'package:dentalapp/util/api_services.dart';
import 'package:dentalapp/util/utils.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:otp_text_field/otp_text_field.dart';
import 'package:otp_text_field/style.dart';
import 'new_password_screen.dart';

class SubmitCodeScreen extends StatefulWidget {
  final String? userId;
  final String? emailId;

  const SubmitCodeScreen({Key? key,this.userId,this.emailId}) : super(key: key);

  @override
  State<SubmitCodeScreen> createState() => _SubmitCodeScreenState();
}

class _SubmitCodeScreenState extends State<SubmitCodeScreen> {

  OtpFieldController  otpController = OtpFieldController();
  bool isLoading =  false;
  bool isOTPFilled = false;
  var otp = "";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: !isLoading ? SizedBox(
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
                          Text("Reset Password",style: GoogleFonts.lato(fontSize: 32,fontWeight: FontWeight.w600,color: Colors.white,),),
                        ],
                      ))
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: width*0.057,vertical: height*0.027),
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
                            verifyOtp();
                        } else {
                          Fluttertoast.showToast(
                              msg: "Please Enter OTP",
                              toastLength: Toast.LENGTH_SHORT,
                              gravity: ToastGravity.BOTTOM,
                              timeInSecForIosWeb: 1,
                              backgroundColor: Colors.black,
                              textColor: Colors.white,
                              fontSize: 16.0
                          );
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
                      resendOTP();
                    },
                      child: Text("Resend Code",style: GoogleFonts.lato(color: const Color(0xFF116D6E),fontWeight: FontWeight.w500,fontSize: 16, )))),
              SizedBox(height: height*0.06,),
            ],
          ),
        ): const Center(
    child:  CircularProgressIndicator(),
      ),
      ),
    );
  }

  verifyOtp()async{
    Utils.showLoadingDialog(context);
    var postUri = Uri.parse(ApiServices.verifyResetOtpApi);
      var bodyData = {
        "UserId" : widget.userId.toString(),
        "OTP" : otp.toString(),
      };
      var response = await http.post(
        postUri,
        body: bodyData,
      );
      Utils.logAPIResponse(function: "verifyOtp",apiName: ApiServices.verifyResetOtpApi,response: response);
      Navigator.pop(context);
      if (response.statusCode == 200) {
        Map map = jsonDecode(response.body);
        if (map["status"] == 200) {
          Navigator.pushReplacement(context,MaterialPageRoute(builder: (context) => NewPasswordScreen(userId: widget.userId,)));
          Utils.showSuccessToast(map["message"]);
        } else {
          Utils.showErrorToast(map["message"]);
        }
      }else{
        Utils.showErrorToast(jsonDecode(response.body)['message']);
      }
    }

    resendOTP() async {
      Utils.showLoadingDialog(context);
      var postUri = Uri.parse(ApiServices.forgotPasswordApi);
      var bodyData = {
        "email":widget.emailId,
      };
      var response = await http.post(
        postUri,
        body: bodyData,
      );
      Utils.logAPIResponse(apiName: ApiServices.forgotPasswordApi,response: response,function: "resendOTP");
      Navigator.pop(context);
      if (response.statusCode == 200) {
        Map map = jsonDecode(response.body);
        if (map["status"] == 200) {
          Utils.showSuccessToast(map["message"]);
        } else {
          Utils.showErrorToast(map['message']);
        }
      }else{
        Utils.showErrorToast(jsonDecode(response.body)['message']);
      }
    }
}
