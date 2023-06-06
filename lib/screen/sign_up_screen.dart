import 'package:dentalapp/screen/email_verification_screen.dart';
import 'package:dentalapp/screen/login_screen.dart';
import 'package:dentalapp/screen/reset_password_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {

  bool isVisible = true;
  bool isCheck = true;
  final formKey = GlobalKey<FormState>();
  var autoValidate = AutovalidateMode.disabled;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      autovalidateMode: autoValidate,
      child: SafeArea(
        child: Scaffold(
          resizeToAvoidBottomInset: true,
          body: SizedBox(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
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
                              SizedBox(height: 100,),
                              Text("Sign Up",style: GoogleFonts.lato(fontSize: 36,fontWeight: FontWeight.w600,color: Colors.white,),),
                            ],
                          ))
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children:  [
                        SizedBox(height: 10,),
                        Text("Hi, Welcome 👋",style: GoogleFonts.lato(fontSize: 24,fontWeight: FontWeight.w600)),
                        SizedBox(height: 30,),
                        TextFormField(
                          textInputAction: TextInputAction.next,
                          maxLength: 30,
                          validator: (value) {
                            if(value == null || value.isEmpty){
                              return 'Please enter some text';
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
                          textInputAction: TextInputAction.next,
                          maxLength: 30,
                          validator: (value) {
                            if(value == null || value.isEmpty){
                              return 'Please enter some text';
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
                          textInputAction: TextInputAction.next,
                          maxLength: 30,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter some text';
                            }if(!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]").hasMatch(value!)){
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
                          textInputAction: TextInputAction.next,
                          maxLength: 30,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter some text';
                            }if(value.length <= 6){
                              return "Enter 8 character password";
                            }
                            return null;
                          },
                          obscureText: isVisible,
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
                                      isVisible = !isVisible;
                                    });
                                  },
                                  child: isVisible ? Image(image: AssetImage("assets/image/Vector.png")) : Image(image: AssetImage("assets/image/Vector12.png")))
                          ),
                        ),
                        SizedBox(height: 10,),
                        Row(
                          children: [
                            Checkbox(
                                value: isCheck,
                                activeColor: Color(0XFF116D6E),
                                onChanged: (value) {
                                  setState(() {
                                    isCheck = !isCheck;
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
                      height: 50,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: Color(0xFF116D6E)
                      ),
                      child: TextButton(
                          onPressed: () {
                            if (formKey.currentState!.validate()){
                              Navigator.push(context, MaterialPageRoute(builder: (context) => EmailVerificationScreen(),));
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
                  SizedBox(height: 50,),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
