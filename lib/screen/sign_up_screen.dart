import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:dentalapp/models/sign_up_model.dart';
import 'package:dentalapp/screen/email_verification_screen.dart';
import 'package:dentalapp/screen/login_screen.dart';
import 'package:dentalapp/screen/reset_password_screen.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';

import '../utils/api_services.dart';

class SignUpScreen extends StatefulWidget {
  String? businessType;
  SignUpScreen({Key? key, this.businessType}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {

  bool isPasswordVisible = true;
  bool isCheckBox = true;
  final formKey = GlobalKey<FormState>();
  var autoValidate = AutovalidateMode.disabled;

  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  bool isLoading =  false;
  SignUpModel? signUpModel;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Form(
      key: formKey,
      autovalidateMode: autoValidate,
      child: SafeArea(
        child: Scaffold(
          resizeToAvoidBottomInset: true,
          body: !isLoading ?  SizedBox(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
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
                              SizedBox(height: height*0.11,),
                              Text("Sign Up",style: GoogleFonts.lato(fontSize: 45,fontWeight: FontWeight.w600,color: Colors.white,),),
                            ],
                          ))
                  ),
                  Padding(
                    padding:EdgeInsets.symmetric(horizontal: width*0.057,vertical: height*0.027),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children:  [
                        SizedBox(height: 10,),
                        Text("Hi, Welcome 👋",style: GoogleFonts.lato(fontSize: 24,fontWeight: FontWeight.w600)),
                        SizedBox(height: 30,),
                        TextFormField(
                          keyboardType: TextInputType.name,
                          controller: firstNameController,
                          textInputAction: TextInputAction.next,
                          maxLength: 20,
                          validator: (value) {
                            if(value == null || value.isEmpty){
                              return 'Please enter First Name';
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12),
                                  borderSide: BorderSide(color: Color(0xFF707070))
                              ),
                              labelText: 'First Name',
                              counterText: "",
                              hintText: 'First Name',
                              hintStyle: TextStyle(fontSize: 15,fontWeight: FontWeight.w500,color: Color(0xFF707070)),
                              contentPadding: EdgeInsets.only(left: 18,top: 16,bottom: 16)
                          ),
                        ),
                        SizedBox(height: 20,),
                        TextFormField(
                          keyboardType: TextInputType.name,
                          controller: lastNameController,
                          textInputAction: TextInputAction.next,
                          maxLength: 20,
                          validator: (value) {
                            if(value == null || value.isEmpty){
                              return 'Please enter Last Name';
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12),
                                  borderSide: BorderSide(color: Color(0xFF707070))
                              ),
                              labelText: 'Last Name',
                              counterText: "",
                              hintText: 'Last Name',
                              hintStyle: TextStyle(fontSize: 15,fontWeight: FontWeight.w500,color: Color(0xFF707070)),
                              contentPadding: EdgeInsets.only(left: 18,top: 16,bottom: 16)
                          ),
                        ),
                        SizedBox(height: 20,),
                        TextFormField(
                          controller: emailController,
                          textInputAction: TextInputAction.next,
                          keyboardType: TextInputType.emailAddress,
                          maxLength: 25,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter Email';
                            } else if(!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]").hasMatch(value!)){
                              return "Enter valid email id";
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12),
                                  borderSide: BorderSide(color: Color(0xFF707070))
                              ),
                              labelText: 'Email',
                              counterText: "",
                              hintText: 'admin@gmail.com',
                              hintStyle: TextStyle(fontSize: 15,fontWeight: FontWeight.w500,color: Color(0xFF707070)),
                              contentPadding: EdgeInsets.only(left: 18,top: 16,bottom: 16)
                          ),
                        ),
                        SizedBox(height: 20,),
                        TextFormField(
                          keyboardType: TextInputType.emailAddress,
                          controller: passwordController,
                          textInputAction: TextInputAction.next,
                          maxLength: 20,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter some text';
                            } else if(value.length < 6){
                              return "Enter 6 character password";
                            }
                            return null;
                          },
                          obscureText: isPasswordVisible,
                          decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12),
                                  borderSide: BorderSide(color: Color(0xFF707070))
                              ),
                              labelText: 'Password',
                              counterText: "",
                              hintText: 'Password',
                              hintStyle: TextStyle(fontSize: 15,fontWeight: FontWeight.w500,color: Color(0xFF707070)),
                              contentPadding: EdgeInsets.only(left: 18,top: 16,bottom: 16),
                              suffixIcon: InkWell(
                                  onTap: () {
                                    setState(() {
                                      isPasswordVisible = !isPasswordVisible;
                                    });
                                  },
                                  child: isPasswordVisible ? Image(image: AssetImage("assets/image/Vector.png")) : Image(image: AssetImage("assets/image/Vector12.png")))
                          ),
                        ),
                        SizedBox(height: 10,),
                        Row(
                          children: [
                            Checkbox(
                                value: isCheckBox,
                                activeColor: Color(0XFF116D6E),
                                onChanged: (value) {
                                  setState(() {
                                    isCheckBox = !isCheckBox;
                                  });
                                },),
                            Text("Accept all terms and conditions. ",style: GoogleFonts.lato(fontSize: 15,fontWeight: FontWeight.w400,color: Color(0xFF999EA1)),)
                          ],
                        ),

                      ],
                    ),
                  ),
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
                              setState(() {
                                signUp();
                              });
                            }else{
                              autoValidate = AutovalidateMode.always;
                            }
                          },
                          child: Text("Sign Up",style: GoogleFonts.lato(fontSize: 15,fontWeight: FontWeight.w500,color: Colors.white))),
                    ),
                  ),
                  SizedBox(height: 12,),
                  InkWell(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => LoginScreen(),));
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Already have an account ? ",style: GoogleFonts.lato(fontSize: 15,fontWeight: FontWeight.w400,color:Color(0xFF999EA1))),
                        SizedBox(width: 9,),
                        Text("Login",style: GoogleFonts.lato(fontSize: 15,fontWeight: FontWeight.w600,color:Color(0xFF116D6E))),
                      ],
                    ),
                  ),
                  SizedBox(height: height*0.06,),
                ],
              ),
            ),
          ) : const Center(
    child:  CircularProgressIndicator(),
        ),
      ),
      ),
    );
  }
  signUp()async{
    var postUri = Uri.parse(ApiServices.signUpApi);
    try {
      setState(() {
        isLoading = true;
      });
      var bodyData = {
        "firstName":firstNameController.text.toString(),
        "lastName":lastNameController.text.toString(),
        "email":emailController.text.toString(),
        "password":passwordController.text.toString(),
        "role": widget.businessType?.toLowerCase() // clinic or lab or dentist
      };
      var response = await http.post(
        postUri,
        body: bodyData,
      );
      print("body ====> $bodyData");
      print("body ====> ${response.statusCode}");
      print("body ====> ${response.body}");
      if (response.statusCode == 201) {
        Map map = jsonDecode(response.body);
        if (map["status"] == 201) {
          signUpModel = SignUpModel.fromJson(jsonDecode(response.body));
          Navigator.push(context, MaterialPageRoute(builder: (context) => EmailVerificationScreen(
            UseId: signUpModel!.userId.toString(),
            EmailId: emailController.text.toString(),
          ),));
          Fluttertoast.showToast(
              msg: "${signUpModel?.message}",
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.BOTTOM,
              timeInSecForIosWeb: 1,
              backgroundColor: Colors.black,
              textColor: Colors.white,
              fontSize: 16.0
          );
        } else {
          Fluttertoast.showToast(
              msg: "${signUpModel?.message}",
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
