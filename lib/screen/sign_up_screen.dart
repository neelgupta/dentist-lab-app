import 'dart:convert';
import 'package:dentalapp/util/api_services.dart';
import 'package:dentalapp/util/utils.dart';
import 'package:http/http.dart' as http;
import 'package:dentalapp/models/sign_up_model.dart';
import 'package:dentalapp/screen/email_verification_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SignUpScreen extends StatefulWidget {
  final String? businessType;
  const SignUpScreen({Key? key, this.businessType}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {

  bool isPasswordVisible = true;
  bool isCheckBox = false;
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
                      decoration: const BoxDecoration(
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
                        SizedBox(height: height*0.01,),
                        Text("Hi, Welcome 👋",style: GoogleFonts.lato(fontSize: 24,fontWeight: FontWeight.w600)),
                        SizedBox(height: height*0.03,),
                        TextFormField(
                          keyboardType: TextInputType.name,
                          controller: firstNameController,
                          textInputAction: TextInputAction.next,
                          validator: (value) {
                            if(value == null || value.isEmpty){
                              return 'Please Enter First Name';
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12),
                                  borderSide: const BorderSide(color: Color(0xFF707070))
                              ),
                              labelText: 'First Name',
                              counterText: "",
                              hintText: 'First Name',
                              hintStyle: const TextStyle(fontSize: 15,fontWeight: FontWeight.w500,color: Color(0xFF707070)),
                              contentPadding: const EdgeInsets.only(left: 18,top: 16,bottom: 16)
                          ),
                        ),
                        const SizedBox(height: 20,),
                        TextFormField(
                          keyboardType: TextInputType.name,
                          controller: lastNameController,
                          textInputAction: TextInputAction.next,
                          validator: (value) {
                            if(value == null || value.isEmpty){
                              return 'Please Enter Last Name';
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12),
                                  borderSide: const BorderSide(color: Color(0xFF707070))
                              ),
                              labelText: 'Last Name',
                              counterText: "",
                              hintText: 'Last Name',
                              hintStyle: const TextStyle(fontSize: 15,fontWeight: FontWeight.w500,color: Color(0xFF707070)),
                              contentPadding: const EdgeInsets.only(left: 18,top: 16,bottom: 16)
                          ),
                        ),
                        const SizedBox(height: 20,),
                        TextFormField(
                          controller: emailController,
                          textInputAction: TextInputAction.next,
                          keyboardType: TextInputType.emailAddress,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please Enter Email Address';
                            } else if(!RegExp(r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9-]+\.)+[a-zA-Z]{2,}))$').hasMatch(value)){
                              return "Please enter a valid email address";
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12),
                                  borderSide: const BorderSide(color: Color(0xFF707070))
                              ),
                              labelText: 'Email',
                              counterText: "",
                              hintText: 'Email Address',
                              hintStyle: const TextStyle(fontSize: 15,fontWeight: FontWeight.w500,color: Color(0xFF707070)),
                              contentPadding: const EdgeInsets.only(left: 18,top: 16,bottom: 16)
                          ),
                        ),
                        const SizedBox(height: 20,),
                        TextFormField(
                          keyboardType: TextInputType.emailAddress,
                          controller: passwordController,
                          textInputAction: TextInputAction.next,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please Enter Password';
                            } else if(value.length < 6){
                              return "Please Enter 6 Character Password";
                            }
                            return null;
                          },
                          obscureText: isPasswordVisible,
                          decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12),
                                  borderSide: const BorderSide(color: Color(0xFF707070))
                              ),
                              labelText: 'Password',
                              counterText: "",
                              hintText: 'Password',
                              hintStyle: const TextStyle(fontSize: 15,fontWeight: FontWeight.w500,color: Color(0xFF707070)),
                              contentPadding: const EdgeInsets.only(left: 18,top: 16,bottom: 16),
                              suffixIcon: InkWell(
                                  onTap: () {
                                    setState(() {
                                      isPasswordVisible = !isPasswordVisible;
                                    });
                                  },
                                  child: isPasswordVisible ? const Image(image: AssetImage("assets/image/Vector.png")) : const Image(image: AssetImage("assets/image/Vector12.png")))
                          ),
                        ),
                        const SizedBox(height: 10,),
                        Row(
                          children: [
                            Checkbox(
                                value: isCheckBox,
                                activeColor: const Color(0XFF116D6E),
                                onChanged: (value) {
                                  setState(() {
                                    isCheckBox = !isCheckBox;
                                  });
                                },),
                            Text("Accept all terms and conditions. ",style: GoogleFonts.lato(fontSize: 15,fontWeight: FontWeight.w400,color: const Color(0xFF999EA1)),)
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
                          color: const Color(0xFF116D6E)
                      ),
                      child: TextButton(
                          onPressed: () {
                            if (formKey.currentState!.validate()){
                              if(isCheckBox) {
                                signUp();
                              } else {
                                Utils.showErrorToast("Please Accept Terms & Condition");
                              }
                            }else{
                              autoValidate = AutovalidateMode.always;
                            }
                          },
                          child: Text("Sign Up",style: GoogleFonts.lato(fontSize: 15,fontWeight: FontWeight.w500,color: Colors.white))),
                    ),
                  ),
                  const SizedBox(height: 12,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Already have an account ? ",style: GoogleFonts.lato(fontSize: 15,fontWeight: FontWeight.w400,color:const Color(0xFF999EA1))),
                      const SizedBox(width: 9,),
                      InkWell(
                        onTap: () {
                          Navigator.pop(context);
                          Navigator.pop(context);
                        },
                          child: Text("Login",style: GoogleFonts.lato(fontSize: 15,fontWeight: FontWeight.w600,color:const Color(0xFF116D6E)))),
                    ],
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
  signUp() async {
    Utils.showLoadingDialog(context);
    var postUri = Uri.parse(ApiServices.signUpApi);
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
      Utils.logAPIResponse(function: "signUp",apiName: ApiServices.signUpApi, response: response);
      Navigator.pop(context);
      if (response.statusCode == 200) {
        Map map = jsonDecode(response.body);
        if (map["status"] == 200) {
          signUpModel = SignUpModel.fromJson(jsonDecode(response.body));
          Navigator.push(context, MaterialPageRoute(builder: (context) => EmailVerificationScreen(
            userId: signUpModel!.userId.toString(),
            emailId: emailController.text.toString(),
          ),));
          Utils.showSuccessToast(map['message']);
        } else {
          Utils.showErrorToast(map['message']);
        }
      }else{
        Utils.showErrorToast(jsonDecode(response.body)['message']);
      }
  }
}
