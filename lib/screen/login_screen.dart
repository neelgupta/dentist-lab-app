// ignore_for_file: use_build_context_synchronously

import 'dart:convert';
import 'package:dentalapp/clinic_screen/bottom_navigation_bar.dart';
import 'package:dentalapp/models/sign_in_model.dart';
import 'package:dentalapp/screen/lab_home.dart';
import 'package:dentalapp/screen/email_verification_screen.dart';
import 'package:dentalapp/screen/register_type_screen.dart';
import 'package:dentalapp/screen/reset_password_screen.dart';
import 'package:dentalapp/util/api_services.dart';
import 'package:dentalapp/util/utils.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool isVisible = true;
  final formKey = GlobalKey<FormState>();
  var autoValidate = AutovalidateMode.disabled;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool isLoading = false;
  SignInModel? signInModel;

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
          body: !isLoading
              ? SizedBox(
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  child: Column(
                    children: [
                      Container(
                          height: height * 0.24,
                          decoration: const BoxDecoration(
                              color: Color(0xFF116D6E),
                              image: DecorationImage(
                                  image: AssetImage(
                                      "assets/image/Group 12305.png"),
                                  fit: BoxFit.fitWidth,
                                  alignment: Alignment.bottomCenter,
                                  opacity: 0.3)),
                          child: Align(
                              alignment: Alignment.center,
                              child: Column(
                                children: [
                                  SizedBox(
                                    height: height * 0.11,
                                  ),
                                  Text(
                                    "Login",
                                    style: GoogleFonts.lato(
                                      fontSize: 45,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              ))),
                      Padding(
                        padding: EdgeInsets.symmetric(
                            vertical: height * 0.03, horizontal: width * 0.055),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: height * 0.01,
                            ),
                            Text("Hi, Welcome Back! 👋",
                                style: GoogleFonts.lato(
                                    fontSize: 24, fontWeight: FontWeight.w600)),
                            SizedBox(
                              height: height * 0.03,
                            ),
                            TextFormField(
                              controller: emailController,
                              keyboardType: TextInputType.emailAddress,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please Enter Email Address';
                                } else if (!RegExp(
                                        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                    .hasMatch(value)) {
                                  return "Please Enter Valid Email Address";
                                }
                                return null;
                              },
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(12),
                                      borderSide: const BorderSide(
                                          color: Color(0xFF707070))),
                                  labelText: 'Email Address',
                                  hintText: 'Email Address',
                                  hintStyle: const TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w500,
                                      color: Color(0xFF707070)),
                                  contentPadding: const EdgeInsets.only(
                                      left: 18, top: 16, bottom: 16)),
                            ),
                            SizedBox(
                              height: height * 0.020,
                            ),
                            TextFormField(
                              controller: passwordController,
                              keyboardType: TextInputType.emailAddress,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please Enter Password';
                                }
                                if (value.length < 6) {
                                  return "Please Enter 6 Character Password";
                                }
                                return null;
                              },
                              obscureText: isVisible,
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(12),
                                      borderSide: const BorderSide(
                                          color: Color(0xFF707070))),
                                  labelText: 'Password',
                                  hintText: 'Password',
                                  hintStyle: const TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w500,
                                      color: Color(0xFF707070)),
                                  contentPadding: const EdgeInsets.only(
                                      left: 18, top: 16, bottom: 16),
                                  suffixIcon: InkWell(
                                    onTap: () {
                                      setState(() {
                                        isVisible = !isVisible;
                                      });
                                    },
                                    child: Image(
                                        image: isVisible
                                            ? const AssetImage(
                                                "assets/image/Vector.png")
                                            : const AssetImage(
                                                "assets/image/Vector12.png")),
                                  )),
                            ),
                            SizedBox(
                              height: height * 0.02,
                            ),
                            Align(
                                alignment: Alignment.centerRight,
                                child: InkWell(
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                const ResetPasswordScreen(),
                                          ));
                                    },
                                    child: Text("Forgot Password ?",
                                        style: GoogleFonts.lato(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w600,
                                            color: const Color(0xFF116D6E)))))
                          ],
                        ),
                      ),
                      const Spacer(),
                      Padding(
                        padding:
                            const EdgeInsets.only(top: 20, left: 20, right: 20),
                        child: Container(
                          height: height * 0.06,
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              color: const Color(0xFF116D6E)),
                          child: TextButton(
                              onPressed: () {
                                if (formKey.currentState!.validate()) {
                                  signIn();
                                } else {
                                  autoValidate = AutovalidateMode.always;
                                }
                              },
                              child: Text("Login",
                                  style: GoogleFonts.lato(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.white))),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Don’t have an account ?   ",
                              style: GoogleFonts.lato(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w400,
                                  color: const Color(0xFF999EA1))),
                          InkWell(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          const RegisterTypeScreen(),
                                    ));
                              },
                              child: Text("Sign Up",
                                  style: GoogleFonts.lato(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w600,
                                      color: const Color(0xFF116D6E)))),
                        ],
                      ),
                      SizedBox(
                        height: height * 0.04,
                      ),
                    ],
                  ),
                )
              : const Center(
                  child: CircularProgressIndicator(),
                ),
        ),
      ),
    );
  }

  signIn() async {
    var postUri = Uri.parse(ApiServices.signInApi);
    Utils.showLoadingDialog(context);
    var bodyData = {
      "email": emailController.text.toString(),
      "password": passwordController.text.toString(),
    };
    var response = await http.post(
      postUri,
      body: bodyData,
    );
    Utils.logAPIResponse(
        apiName: ApiServices.signInApi, function: "signIn", response: response);
    Navigator.pop(context);
    if (response.statusCode == 200) {
      Map map = jsonDecode(response.body);
      if (map["status"] == 200) {
        signInModel = SignInModel.fromJson(jsonDecode(response.body));
        if (signInModel!.screenStatus == "0") {
          sendOTP();
        } else {
          Utils.prefs = await SharedPreferences.getInstance();
          setState(() {
            Utils.setToken(signInModel!.token);
            Utils.setUserType(signInModel!.type);
            Utils.setLoginStatus(true);
            Utils.showSuccessToast(signInModel!.message);
            Utils.setScreenStatus(signInModel!.screenStatus);
            Utils.setFirstName(signInModel!.firstName);
            Utils.setLastName(signInModel!.lastName);
            Utils.setProfileImage(signInModel!.profileImage);
            Utils.setEstablishDate(signInModel!.dateOfEstablishment);
            Utils.apiHeader = {
              "Content-Type": "application/json",
              "Authorization": "Bearer ${Utils.getToken()}"
            };
          });
          Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                  builder: (context) => signInModel!.type == "lab"
                      ? const LabHome(index: 0)
                      : const BottomNavigation(index: 0)));
        }
      } else {
        Utils.showErrorToast(map["message"]);
      }
    } else {
      Utils.showErrorToast(jsonDecode(response.body)['message']);
    }
  }

  sendOTP() async {
    var postUri = Uri.parse(ApiServices.sendOtpApi);
    Utils.showLoadingDialog(context);
    var bodyData = {
      "email": emailController.text.toString(),
    };
    var response = await http.post(
      postUri,
      body: bodyData,
    );
    Utils.logAPIResponse(
        apiName: ApiServices.sendOtpApi,
        function: "sendOTP",
        response: response);
    Navigator.pop(context);
    if (response.statusCode == 200) {
      Map map = jsonDecode(response.body);
      if (map["status"] == 200) {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => EmailVerificationScreen(
                userId: signInModel!.userId.toString(),
                emailId: emailController.text.toString(),
              ),
            ));
      } else {
        Utils.showErrorToast(map["message"]);
      }
    } else {
      Utils.showErrorToast(jsonDecode(response.body)['message']);
    }
  }
}
