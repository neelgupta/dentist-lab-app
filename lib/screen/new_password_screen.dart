import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:dentalapp/screen/login_screen.dart';
import 'package:dentalapp/screen/reset_password_screen.dart';
import 'package:dentalapp/screen/reset_successful_screen.dart';
import 'package:dentalapp/screen/submit_code_screen.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';

import '../models/reset_password_model.dart';
import '../utils/api_services.dart';

class NewPasswordScreen extends StatefulWidget {
  final userId;
   NewPasswordScreen({Key? key,this.userId}) : super(key: key);

  @override
  State<NewPasswordScreen> createState() => _NewPasswordScreenState();
}

class _NewPasswordScreenState extends State<NewPasswordScreen> {

  bool isPasswordVisible = true;
  bool isConfirmPasswordVisible = true;
  final formKey = GlobalKey<FormState>();
  var autoValidate = AutovalidateMode.disabled;
  bool isLoading =  false;
  ResetPasswordModel? resetPasswordModel;

  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Form(
      key: formKey,
      autovalidateMode: autoValidate,
      child: SafeArea(
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          body: !isLoading ? SizedBox(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Stack(
              children: [
                Column(
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
                          Text("Create new password",
                              style: GoogleFonts.lato(fontSize: 19,fontWeight: FontWeight.w600,color: Color(0xFF111111)),maxLines: 1,textAlign: TextAlign.start),
                          SizedBox(height: 20,),
                          TextFormField(
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter Password';
                              }if(value.length < 6){
                                return "Enter 6 character password";
                              }
                              return null;
                            },
                            obscureText: isPasswordVisible,
                            controller: passwordController,
                            decoration: InputDecoration(
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(12),
                                    borderSide: BorderSide(color: Color(0xFF707070))
                                ),
                                labelText: 'New Password',
                                hintText: 'Password@123',
                                hintStyle: TextStyle(fontSize: 15,fontWeight: FontWeight.w500,color: Color(0xFF707070)),
                                contentPadding: EdgeInsets.only(left: 18,top: 16,bottom: 16),
                                suffixIcon: InkWell(
                                    onTap: () {
                                      setState(() {
                                        isPasswordVisible = !isPasswordVisible;
                                      });
                                    },
                                    child: Image(image: AssetImage("assets/image/Vector.png")))
                            ),
                          ),
                          SizedBox(height: 20,),
                          TextFormField(
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter ConfirmPassword';
                              } else if(value.length < 6){
                                return "Enter 6 character password";
                              }
                              return null;
                            },
                            controller: confirmPasswordController,
                            obscureText: isConfirmPasswordVisible,
                            decoration: InputDecoration(
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(12),
                                    borderSide: BorderSide(color: Color(0xFF707070))
                                ),
                                labelText: 'Confirm Password',
                                hintText: 'Password@123',
                                hintStyle: TextStyle(fontSize: 15,fontWeight: FontWeight.w500,color: Color(0xFF707070)),
                                contentPadding: EdgeInsets.only(left: 18,top: 16,bottom: 16),
                                suffixIcon: InkWell(
                                    onTap: () {
                                      setState(() {
                                        isConfirmPasswordVisible = !isConfirmPasswordVisible;
                                      });
                                    },
                                    child: Image(image: AssetImage("assets/image/Vector.png")))
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
                            color: Color(0xFF116D6E)
                        ),
                        child: TextButton(
                            onPressed: () {
                              if (formKey.currentState!.validate()){

                                resetPassword();
                                if(passwordController.text.isNotEmpty && confirmPasswordController.text.isNotEmpty){
                                }if(passwordController.value == confirmPasswordController.value){

                                }else{
                                  ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(content: Text("password & Confirm Password is not Same"),shape: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(12),
                                        borderSide: BorderSide(color: Colors.red.shade500)
                                      ),
                                        duration: Duration(seconds: 2),
                                        backgroundColor: Colors.red.shade500,
                                        padding: EdgeInsets.all(20),
                                      ));
                                }
                              }else{
                                autoValidate = AutovalidateMode.always;
                              }
                            },
                            child: Text("Reset Password",style: GoogleFonts.lato(fontSize: 15,fontWeight: FontWeight.w500,color: Colors.white))),
                      ),
                    ),
                    SizedBox(height: height*0.06,),
                  ],
                ),
              ],
            ),
          ) : const Center(
            child: CircularProgressIndicator(),
          ),
        ),
      ),
    );
  }
  resetPassword()async{
    var postUri = Uri.parse(ApiServices.resetPasswordApi);
    try {
      setState(() {
        isLoading = true;
      });
      var bodyData = {
        "userId":widget.userId,
        "password":passwordController.text.toString()
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
          resetPasswordModel = ResetPasswordModel.fromJson(jsonDecode(response.body));
          Navigator.push(context,MaterialPageRoute(builder: (context) =>ResetSuccessfullScreen()));
          Fluttertoast.showToast(
              msg: "${resetPasswordModel?.message}",
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.BOTTOM,
              timeInSecForIosWeb: 1,
              backgroundColor: Colors.black,
              textColor: Colors.white,
              fontSize: 16.0
          );
        } else {
          Fluttertoast.showToast(
              msg: "${resetPasswordModel?.message}",
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
