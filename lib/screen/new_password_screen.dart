import 'package:dentalapp/screen/login_screen.dart';
import 'package:dentalapp/screen/submit_code_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class NewPasswordScreen extends StatefulWidget {
  const NewPasswordScreen({Key? key}) : super(key: key);

  @override
  State<NewPasswordScreen> createState() => _NewPasswordScreenState();
}

class _NewPasswordScreenState extends State<NewPasswordScreen> {

  bool isVisible = true;
  final formKey = GlobalKey<FormState>();
  var autoValidate = AutovalidateMode.disabled;

  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

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
            child: Stack(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
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
                          Text("Create new password",
                              style: GoogleFonts.lato(fontSize: 19,fontWeight: FontWeight.w600,color: Color(0xFF111111)),maxLines: 1,textAlign: TextAlign.start),
                          SizedBox(height: 20,),
                          TextFormField(
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter some text';
                              }if(value.length <= 7){
                                return "Enter 7 character password";
                              }
                              return null;
                            },
                            obscureText: isVisible,
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
                                        isVisible = !isVisible;
                                      });
                                    },
                                    child: Image(image: AssetImage("assets/image/Vector.png")))
                            ),
                          ),
                          SizedBox(height: 20,),
                          TextFormField(
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter some text';
                              }if(value.length <= 7){
                                return "Enter 7 character password";
                              }
                              return null;
                            },
                            controller: confirmPasswordController,
                            obscureText: isVisible,
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
                                        isVisible = !isVisible;
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
                        height: 50,
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color: Color(0xFF116D6E)
                        ),
                        child: TextButton(
                            onPressed: () {
                              if (formKey.currentState!.validate()){
                                if(passwordController.text.isNotEmpty && confirmPasswordController.text.isNotEmpty){
                                }if(passwordController.value == confirmPasswordController.value){
                                  Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => LoginScreen(),),(route) => false,);
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
                              // Navigator.push(context,MaterialPageRoute(builder: (context) => ));
                            },
                            child: Text("Reset Password",style: GoogleFonts.lato(fontSize: 15,fontWeight: FontWeight.w500,color: Colors.white))),
                      ),
                    ),
                    SizedBox(height: 50,),
                  ],
                ),
                Positioned(
                    top: 45,
                    left: 12,
                    child: InkWell(
                        onTap: () {
                           Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => SubmitCodeScreen(),));
                        },
                        child: Icon(Icons.keyboard_backspace,color: Colors.white,)))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
