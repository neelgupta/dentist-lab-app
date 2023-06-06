import 'package:dentalapp/screen/reset_password_screen.dart';
import 'package:dentalapp/screen/sign_up_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  bool isVisible = true;
  final formKey = GlobalKey<FormState>();
  var autoValidate = AutovalidateMode.disabled;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
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
                          SizedBox(height: 100,),
                          Text("Login",style: GoogleFonts.lato(fontSize: 45,fontWeight: FontWeight.w600,color: Colors.white,),),
                        ],
                      ))
                ),
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children:  [
                      SizedBox(height: 10,),
                      Text("Hi, Welcome Back! 👋",style: GoogleFonts.lato(fontSize: 24,fontWeight: FontWeight.w600)),
                      SizedBox(height: 30,),
                      TextFormField(
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter some text';
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
                      SizedBox(height: 20,),
                      TextFormField(
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
                            hintText: 'Password',
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
                      Align(
                        alignment: Alignment.centerRight,
                          child: InkWell(
                            onTap: () {
                              Navigator.push(context,
                              MaterialPageRoute(builder: (context) => ResetPasswordScreen(),));
                            },
                              child: Text("Forgot Password ?",style: GoogleFonts.lato(fontSize: 16,fontWeight: FontWeight.w600,color: Color(0xFF116D6E)))))
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
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text('Login Successfully')),
                            );
                          }else{
                            autoValidate = AutovalidateMode.always;
                          }
                        },
                        child: Text("Login",style: GoogleFonts.lato(fontSize: 15,fontWeight: FontWeight.w500,color: Colors.white))),
                  ),
                ),
                SizedBox(height: 20,),
                InkWell(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => SignUpScreen(),));
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Don’t have an account ?   ",style: GoogleFonts.lato(fontSize: 15,fontWeight: FontWeight.w400,color:Color(0xFF999EA1))),
                      Text("Sign Up",style: GoogleFonts.lato(fontSize: 15,fontWeight: FontWeight.w600,color:Color(0xFF116D6E))),
                    ],
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
