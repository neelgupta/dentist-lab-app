// ignore_for_file: use_build_context_synchronously

import 'dart:convert';
import 'package:dentalapp/util/api_services.dart';
import 'package:dentalapp/util/utils.dart';
import 'package:http/http.dart' as http;
import 'package:dentalapp/screen/reset_successful_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class NewPasswordScreen extends StatefulWidget {
  final String? userId;
  const NewPasswordScreen({Key? key, this.userId}) : super(key: key);

  @override
  State<NewPasswordScreen> createState() => _NewPasswordScreenState();
}

class _NewPasswordScreenState extends State<NewPasswordScreen> {
  bool isPasswordVisible = true;
  bool isConfirmPasswordVisible = true;
  final formKey = GlobalKey<FormState>();
  var autoValidate = AutovalidateMode.disabled;
  bool isLoading = false;

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
          body: !isLoading
              ? SizedBox(
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
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
                                  Container(
                                    padding: const EdgeInsets.only(
                                        left: 15, top: 40),
                                    alignment: Alignment.centerLeft,
                                    child: InkWell(
                                        onTap: () {
                                          Navigator.pop(context);
                                        },
                                        child: const Icon(
                                          Icons.keyboard_backspace,
                                          color: Colors.white,
                                        )),
                                  ),
                                  SizedBox(
                                    height: height * 0.05,
                                  ),
                                  Text(
                                    "Reset Password",
                                    style: GoogleFonts.lato(
                                      fontSize: 32,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              ))),
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: width * 0.057,
                            vertical: height * 0.027),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(
                              height: 10,
                            ),
                            Text("Create new password",
                                style: GoogleFonts.lato(
                                    fontSize: 19,
                                    fontWeight: FontWeight.w600,
                                    color: const Color(0xFF111111)),
                                maxLines: 1,
                                textAlign: TextAlign.start),
                            const SizedBox(
                              height: 20,
                            ),
                            TextFormField(
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please Enter Password';
                                }
                                if (value.length < 6) {
                                  return "Enter 6 Character Password";
                                }
                                return null;
                              },
                              obscureText: isPasswordVisible,
                              controller: passwordController,
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(12),
                                      borderSide: const BorderSide(
                                          color: Color(0xFF707070))),
                                  labelText: 'New Password',
                                  hintText: 'New Password',
                                  hintStyle: const TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w500,
                                      color: Color(0xFF707070)),
                                  contentPadding: const EdgeInsets.only(
                                      left: 18, top: 16, bottom: 16),
                                  suffixIcon: InkWell(
                                      onTap: () {
                                        setState(() {
                                          isPasswordVisible =
                                              !isPasswordVisible;
                                        });
                                      },
                                      child: const Image(
                                          image: AssetImage(
                                              "assets/image/Vector.png")))),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            TextFormField(
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please Enter Confirm Password';
                                } else if (value.length < 6) {
                                  return "Enter 6 Character Password";
                                } else if (value != passwordController.text) {
                                  return "Password Doesn't Match";
                                }
                                return null;
                              },
                              controller: confirmPasswordController,
                              obscureText: isConfirmPasswordVisible,
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(12),
                                      borderSide: const BorderSide(
                                          color: Color(0xFF707070))),
                                  labelText: 'Confirm Password',
                                  hintText: 'Confirm Password',
                                  hintStyle: const TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w500,
                                      color: Color(0xFF707070)),
                                  contentPadding: const EdgeInsets.only(
                                      left: 18, top: 16, bottom: 16),
                                  suffixIcon: InkWell(
                                      onTap: () {
                                        setState(() {
                                          isConfirmPasswordVisible =
                                              !isConfirmPasswordVisible;
                                        });
                                      },
                                      child: const Image(
                                          image: AssetImage(
                                              "assets/image/Vector.png")))),
                            ),
                          ],
                        ),
                      ),
                      const Spacer(),
                      Padding(
                        padding:
                            const EdgeInsets.only(top: 20, left: 20, right: 20),
                        child: Container(
                          height: height * 0.065,
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              color: const Color(0xFF116D6E)),
                          child: TextButton(
                              onPressed: () {
                                if (formKey.currentState!.validate()) {
                                  if (passwordController.value ==
                                      confirmPasswordController.value) {
                                    resetPassword();
                                  } else {
                                    ScaffoldMessenger.of(context)
                                        .showSnackBar(SnackBar(
                                      content: const Text(
                                          "password & Confirm Password is not Same"),
                                      shape: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(12),
                                          borderSide: BorderSide(
                                              color: Colors.red.shade500)),
                                      duration: const Duration(seconds: 2),
                                      backgroundColor: Colors.red.shade500,
                                      padding: const EdgeInsets.all(20),
                                    ));
                                  }
                                } else {
                                  autoValidate = AutovalidateMode.always;
                                }
                              },
                              child: Text("Reset Password",
                                  style: GoogleFonts.lato(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.white))),
                        ),
                      ),
                      SizedBox(
                        height: height * 0.06,
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

  resetPassword() async {
    Utils.showLoadingDialog(context);
    var postUri = Uri.parse(ApiServices.resetPasswordApi);
    var bodyData = {
      "userId": widget.userId,
      "password": passwordController.text.toString()
    };
    var response = await http.post(
      postUri,
      body: bodyData,
    );
    Utils.logAPIResponse(
        response: response,
        apiName: ApiServices.resetPasswordApi,
        function: "resetPassword");
    Navigator.pop(context);
    if (response.statusCode == 200) {
      Map map = jsonDecode(response.body);
      if (map["status"] == 200) {
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
              builder: (context) => const ResetSuccessfullScreen()),
          (route) => false,
        );
        Utils.showSuccessToast(map['message']);
      } else {
        Utils.showErrorToast(map['message']);
      }
    } else {
      Utils.showErrorToast(jsonDecode(response.body)['message']);
    }
  }
}
