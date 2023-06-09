import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:dentalapp/models/verify_otp_model.dart';
import 'package:dentalapp/screen/reset_password_screen.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:otp_text_field/otp_text_field.dart';
import 'package:otp_text_field/style.dart';
import '../utils/api_services.dart';
import 'new_password_screen.dart';

class SubmitCodeScreen extends StatefulWidget {
  String? UseId;
  String? EmailId;

  SubmitCodeScreen({Key? key,this.UseId,this.EmailId}) : super(key: key);

  @override
  State<SubmitCodeScreen> createState() => _SubmitCodeScreenState();
}

class _SubmitCodeScreenState extends State<SubmitCodeScreen> {

  OtpFieldController  otpController = OtpFieldController();
  bool isLoading =  false;
  VerifyOtpModel? verifyOtpModel;
  bool isOTPFilled = false;
  var Otp;



  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
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
                          Text("Reset Password",style: GoogleFonts.lato(fontSize: 32,fontWeight: FontWeight.w600,color: Colors.white,),),
                        ],
                      ))
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: width*0.057,vertical: height*0.027),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children:  [
                    SizedBox(height: 10,),
                    Text("Enter the 6 digit verification code sent to:",
                        style: GoogleFonts.lato(fontSize: 15,fontWeight: FontWeight.w500,color: Color(0xFF707070)),maxLines: 3,textAlign: TextAlign.start),
                    Text("${widget.EmailId}",
                        style: GoogleFonts.lato(fontSize: 15,fontWeight: FontWeight.w600,color: Color(0xFF116D6E)),maxLines: 3,textAlign: TextAlign.start),
                    SizedBox(height: 20,),
                    OTPTextField(
                      length: 6,
                      width: width,
                      fieldWidth: 45,
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
                          Otp = pin;
                        });
                        print("Completed ====> $pin");
                      },
                      onChanged: (value) {
                        print("value ====> $value");
                      },
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
                          setState(() {
                            verifyOtp();
                          });
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
        ): const Center(
    child:  CircularProgressIndicator(),
      ),
      ),
    );
  }

  verifyOtp()async{
    var postUri = Uri.parse(ApiServices.verifyOtpApi);
    try {
      setState(() {
        isLoading = true;
      });
      var bodyData = {
        "UserId":widget.UseId,
        "otp": Otp.toString(),
      };
      var response = await http.post(
        postUri,
        body: bodyData,
      );
      print("body ====> $bodyData");
      print("body ====> ${response.statusCode}");
      print("body ====> ${response.body}");
      if (response.statusCode == 200) {
        Map map = jsonDecode(response.body);
        if (map["status"] == 200) {
          verifyOtpModel = VerifyOtpModel.fromJson(jsonDecode(response.body));
          Navigator.pushReplacement(context,MaterialPageRoute(builder: (context) => NewPasswordScreen(userId: widget.UseId,)));
          Fluttertoast.showToast(
              msg: "${verifyOtpModel?.message}",
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.BOTTOM,
              timeInSecForIosWeb: 1,
              backgroundColor: Colors.black,
              textColor: Colors.white,
              fontSize: 16.0
          );
        } else {
          Fluttertoast.showToast(
              msg: "${verifyOtpModel?.message}",
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.BOTTOM,
              timeInSecForIosWeb: 1,
              backgroundColor: Colors.black,
              textColor: Colors.white,
              fontSize: 16.0
          );
        }
      }else{
        Fluttertoast.showToast(
            msg: "${jsonDecode(response.body)['message']}",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.black,
            textColor: Colors.white,
            fontSize: 16.0
        );
      }
    }catch(e){
      rethrow;
    }finally{
      setState(() {
        isLoading = false;
      });
    }
  }
}
