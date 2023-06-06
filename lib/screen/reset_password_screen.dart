import 'package:dentalapp/screen/login_screen.dart';
import 'package:dentalapp/screen/submit_code_screen.dart';
import 'package:flutter/cupertino.dart';
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

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      autovalidateMode: autoValidate,
      child: SafeArea(
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          body: SizedBox(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Column(
              children: [
                Container(
                    height: 190,
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
                              padding: EdgeInsets.only(left: 10,top: 10),
                              alignment: Alignment.centerLeft,
                              child: InkWell(
                                  onTap: () {
                                    Navigator.pop(context);
                                  },
                                  child: Icon(Icons.keyboard_backspace,color: Colors.white,)),
                            ),
                            SizedBox(height: 100,),
                            Text("Reset Password",style: GoogleFonts.lato(fontSize: 32,fontWeight: FontWeight.w600,color: Colors.white,),),
                          ],
                        ))
                ),
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children:  [
                      SizedBox(height: 10,),
                      Text("Enter the email address associated with your account and we will send you a code to reset your password.",
                          style: GoogleFonts.lato(fontSize: 14,fontWeight: FontWeight.w500,color: Color(0xFF707070)),maxLines: 3,textAlign: TextAlign.start),
                      SizedBox(height: 20,),
                      TextFormField(
                        enabled: isOTPSent,
                        keyboardType: TextInputType.emailAddress,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter email';
                          } else if(!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]").hasMatch(value)){
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
                            hintText: 'admin@gmail.com',
                            hintStyle: TextStyle(fontSize: 15,fontWeight: FontWeight.w500,color: Color(0xFF707070)),
                            contentPadding: EdgeInsets.only(left: 18,top: 16,bottom: 16)
                        ),
                      ),
                    ],
                  ),
                ),
                Spacer(),
                isOTPSent ? Padding(
                  padding: const EdgeInsets.only(top: 20,left: 20,right: 20),
                  child: Container(
                    height: 50,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: Color(0xFF116D6E)
                    ),
                    child: TextButton(
                        onPressed: () {
                          if (formKey.currentState!.validate()){
                            setState(() {
                              isOTPSent = ! isOTPSent;
                            });
                          }else{
                            autoValidate = AutovalidateMode.always;
                          }
                        },
                        child: Text("Send Code",style:GoogleFonts.lato(fontSize: 15,fontWeight: FontWeight.w500,color: Colors.white))),
                  ),
                )
                :  Padding(
                  padding: const EdgeInsets.only(top: 20,left: 20,right: 20),
                  child: Container(
                    height: 50,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: Color(0xFF116D6E)
                    ),
                    child: TextButton(
                        onPressed: () {
                          Navigator.push(context,MaterialPageRoute(builder: (context) => SubmitCodeScreen(),));
                        },
                        child: Text("Submit Code",style:GoogleFonts.lato(fontSize: 15,fontWeight: FontWeight.w500,color: Colors.white))),
                  ),
                ),
                SizedBox(height: 50,),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
