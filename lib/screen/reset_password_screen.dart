// ignore_for_file: use_build_context_synchronously

import 'dart:convert';
import 'package:dentalapp/util/api_services.dart';
import 'package:dentalapp/util/utils.dart';
import 'package:http/http.dart' as http;
import 'package:dentalapp/screen/submit_code_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ResetPasswordScreen extends StatefulWidget {
  const ResetPasswordScreen({Key? key}) : super(key: key);

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  TextEditingController emailController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  var autoValidate = AutovalidateMode.disabled;
  bool isOTPSent = true;

  bool isLoading = false;

  @override
  void initState() {
    super.initState();
  }

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
                            Text(
                                "Enter the email address associated with your account and we will send you a code to reset your password.",
                                style: GoogleFonts.lato(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                    color: const Color(0xFF707070)),
                                maxLines: 3,
                                textAlign: TextAlign.start),
                            const SizedBox(
                              height: 20,
                            ),
                            TextFormField(
                              enabled: isOTPSent,
                              controller: emailController,
                              keyboardType: TextInputType.emailAddress,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Please Enter Email';
                                } else if (!RegExp(
                                        "^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]")
                                    .hasMatch(value)) {
                                  return "Please Enter Valid Email";
                                }
                                return null;
                              },
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(12),
                                      borderSide: const BorderSide(
                                          color: Color(0xFF707070))),
                                  labelText: 'Email',
                                  hintText: 'admin@gmail.com',
                                  hintStyle: const TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w500,
                                      color: Color(0xFF707070)),
                                  contentPadding: const EdgeInsets.only(
                                      left: 18, top: 16, bottom: 16)),
                            ),
                          ],
                        ),
                      ),
                      const Spacer(),
                      Padding(
                        padding:
                            const EdgeInsets.only(top: 20, left: 20, right: 20),
                        child: Container(
                          height: 50,
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              color: const Color(0xFF116D6E)),
                          child: TextButton(
                              onPressed: () {
                                if (formKey.currentState!.validate()) {
                                  forgotPassword();
                                } else {
                                  autoValidate = AutovalidateMode.always;
                                }
                              },
                              child: Text("Send Code",
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

  forgotPassword() async {
    Utils.showLoadingDialog(context);
    var postUri = Uri.parse(ApiServices.forgotPasswordApi);
    var bodyData = {
      "email": emailController.text.toString(),
    };
    var response = await http.post(
      postUri,
      body: bodyData,
    );
    Utils.logAPIResponse(
        apiName: ApiServices.forgotPasswordApi,
        response: response,
        function: "forgotPassword");
    Navigator.pop(context);
    if (response.statusCode == 200) {
      Map map = jsonDecode(response.body);
      if (map["status"] == 200) {
        Utils.showSuccessToast(map["message"]);
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => SubmitCodeScreen(
                      userId: map['UserId'],
                      emailId: emailController.text,
                    )));
      } else {
        Utils.showErrorToast(map['message']);
      }
    } else {
      Utils.showErrorToast(jsonDecode(response.body)['message']);
    }
  }
}
