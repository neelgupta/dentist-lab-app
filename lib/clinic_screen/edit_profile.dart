import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class EditProfile extends StatefulWidget {
  final String firstName;
  final String lastName;
  final String email;
  const EditProfile({super.key, required this.firstName, required this.lastName, required this.email,});

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  final formKey = GlobalKey<FormState>();
  var autoValidate = AutovalidateMode.disabled;
  bool isLoading =  false;
  bool isCurrentPasswordVisible = true;
  bool isNewPasswordVisible = true;
  bool isConfirmPasswordVisible = true;
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController emailAddressController = TextEditingController();

  TextEditingController currentPasswordController = TextEditingController();
  TextEditingController newPasswordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    firstNameController.text = widget.firstName;
    lastNameController.text = widget.lastName;
    emailAddressController.text = widget.email;
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Form(
      key: formKey,
      autovalidateMode: autoValidate,
      child: SafeArea(
          child:Scaffold(
              resizeToAvoidBottomInset: true,
              body: SizedBox(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Column(
                    children: [
                      Container(
                          height: height * 0.2,
                          width: MediaQuery.of(context).size.width,
                          decoration: const BoxDecoration(
                              color: Color(0xFF116D6E),
                              image: DecorationImage(
                                  image: AssetImage("assets/image/Group 12305.png"),
                                  fit: BoxFit.fitWidth,
                                  alignment: Alignment.bottomCenter,
                                  opacity: 0.3)),
                          child:  Align(
                              alignment: Alignment.center,
                              child: Column(
                                children: [
                                  SizedBox(height: height * 0.05),
                                  Container(
                                    padding: EdgeInsets.only(left: width * 0.05),
                                    alignment: Alignment.topLeft,
                                    child: InkWell(onTap: () {
                                      Navigator.pop(context);
                                    },child: const Image(image: AssetImage("assets/image/left.png"),fit: BoxFit.fill)),
                                  ),
                                  SizedBox(height: height * 0.03),
                                  Text("Edit Profile",style: GoogleFonts.lato(fontSize: 28,fontWeight: FontWeight.w600,color: Colors.white,),),
                                ],
                              ))
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: width*0.057,vertical: height*0.027),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(height: 10),
                            Text("Edit Profile Info",style: GoogleFonts.lato(fontSize: 19,fontWeight: FontWeight.w600),),
                            const SizedBox(height: 20),
                            TextFormField(
                              textInputAction: TextInputAction.next,
                              controller: firstNameController,
                              keyboardType: TextInputType.name,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(12),
                                    borderSide: const BorderSide(color: Color(0xFF707070))
                                ),
                                labelText: 'First Name',
                                hintText: 'First Name',
                                hintStyle: const TextStyle(fontSize: 15,fontWeight: FontWeight.w500,color: Color(0xFF707070)),
                                contentPadding: const EdgeInsets.only(left: 18,top: 16,bottom: 16),
                              ),
                              validator: (value) {
                                if(value == null || value.isEmpty){
                                  return 'Please Enter First Name';
                                }
                                return null;
                              },
                            ),
                            const SizedBox(height: 20,),
                            TextFormField(
                              controller: lastNameController,
                              textInputAction: TextInputAction.next,
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(12),
                                    borderSide: const BorderSide(color: Color(0xFF707070))
                                ),
                                labelText: 'Last Name',
                                hintText: 'Last Name',
                                counterText: "",
                                hintStyle: const TextStyle(fontSize: 15,fontWeight: FontWeight.w500,color: Color(0xFF707070)),
                                contentPadding: const EdgeInsets.only(left: 18,top: 16,bottom: 16),
                              ),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please Enter Last Name';
                                }
                                return null;
                              },
                            ),
                            const SizedBox(height: 20,),
                            TextFormField(
                              textInputAction: TextInputAction.next,
                              controller: emailAddressController,
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(12),
                                    borderSide: const BorderSide(color: Color(0xFF707070))
                                ),
                                labelText: 'Email Address',
                                hintText: 'Email Address',
                                counterText: "",
                                hintStyle: const TextStyle(fontSize: 15,fontWeight: FontWeight.w500,color: Color(0xFF707070)),
                                contentPadding: const EdgeInsets.only(left: 18,top: 16,bottom: 16),
                              ),
                              validator: (value) {
                                if(value == null || value.isEmpty){
                                  return 'Please Enter Email Address';
                                }
                                return null;
                              },
                            ),



                            const SizedBox(height: 20,),
                            const Divider(
                              color: Color(0xFFE7E7E7),
                              thickness: 1,
                            ),
                            const SizedBox(height: 10,),
                            Text("Change Password",style: GoogleFonts.lato(fontSize: 19,fontWeight: FontWeight.w600),),
                            const SizedBox(height: 10,),
                            Text("To update password, enter your existing sword followed by a new one. Logout and use the Reset Password link on the Log in Page.",style: GoogleFonts.lato(fontSize: 16,color: const Color(0xff707070),fontWeight: FontWeight.w400,height: 1.5,letterSpacing: 0.2)),
                            const SizedBox(height: 20,),
                            TextFormField(
                              controller: currentPasswordController,
                              keyboardType: TextInputType.emailAddress,
                              validator: (value) {
                                if(value!.isNotEmpty && value.length < 6){
                                  return "Please Enter 6 Character Password";
                                }
                                return null;
                              },
                              obscureText: isCurrentPasswordVisible,
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(12),
                                      borderSide: const BorderSide(color: Color(0xFF707070))
                                  ),
                                  labelText: 'Current Password',
                                  hintText: 'Current Password',
                                  hintStyle: const TextStyle(fontSize: 15,fontWeight: FontWeight.w500,color: Color(0xFF707070)),
                                  contentPadding: const EdgeInsets.only(left: 18,top: 16,bottom: 16),
                                  suffixIcon: InkWell(
                                    onTap: () {
                                      setState(() {
                                        isCurrentPasswordVisible = !isCurrentPasswordVisible;
                                      });
                                    },
                                    child: Image(image: isCurrentPasswordVisible ? const AssetImage("assets/image/Vector.png") : const AssetImage("assets/image/Vector12.png")),)
                              ),
                            ),
                            const SizedBox(height: 20,),
                            TextFormField(
                              controller: newPasswordController,
                              keyboardType: TextInputType.emailAddress,
                              validator: (value) {
                                if(currentPasswordController.text.isNotEmpty) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please Enter New Password';
                                  }
                                  if (value.length < 6) {
                                    return "Please Enter 6 Character Password";
                                  }
                                }
                                return null;
                              },
                              obscureText: isNewPasswordVisible,
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(12),
                                      borderSide: const BorderSide(color: Color(0xFF707070))
                                  ),
                                  labelText: 'New Password',
                                  hintText: 'New Password',
                                  hintStyle: const TextStyle(fontSize: 15,fontWeight: FontWeight.w500,color: Color(0xFF707070)),
                                  contentPadding: const EdgeInsets.only(left: 18,top: 16,bottom: 16),
                                  suffixIcon: InkWell(
                                    onTap: () {
                                      setState(() {
                                        isNewPasswordVisible = !isNewPasswordVisible;
                                      });
                                    },
                                    child: Image(image: isNewPasswordVisible ? const AssetImage("assets/image/Vector.png") : const AssetImage("assets/image/Vector12.png")),)
                              ),
                            ),
                            const SizedBox(height: 20,),
                            TextFormField(
                              controller: confirmPasswordController,
                              keyboardType: TextInputType.emailAddress,
                              validator: (value) {
                                if (value != newPasswordController.text) {
                                  return 'Please Enter Confirm Password';
                                }
                                return null;
                              },
                              obscureText: isConfirmPasswordVisible,
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(12),
                                      borderSide: const BorderSide(color: Color(0xFF707070))
                                  ),
                                  labelText: 'Confirm Password',
                                  hintText: 'Confirm Password',
                                  hintStyle: const TextStyle(fontSize: 15,fontWeight: FontWeight.w500,color: Color(0xFF707070)),
                                  contentPadding: const EdgeInsets.only(left: 18,top: 16,bottom: 16),
                                  suffixIcon: InkWell(
                                    onTap: () {
                                      setState(() {
                                        isConfirmPasswordVisible = !isConfirmPasswordVisible;
                                      });
                                    },
                                    child: Image(image: isConfirmPasswordVisible ? const AssetImage("assets/image/Vector.png") : const AssetImage("assets/image/Vector12.png")),)
                              ),
                            ),
                            const SizedBox(height: 30,),
                            Container(
                              height: 50,
                              width: MediaQuery.of(context).size.width,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12),
                                  color: const Color(0xFF116D6E)
                                //:Color(0xffA0A0A0),
                              ),
                              child: TextButton(
                                  onPressed: () {
                                    if (formKey.currentState!.validate()){
                                      Navigator.pop(context);
                                    }else{
                                      autoValidate = AutovalidateMode.always;
                                    }
                                  },
                                  child: Text("Save",style: GoogleFonts.lato(fontSize: 15,fontWeight: FontWeight.w500,color: Colors.white))),
                            ),
                            const SizedBox(height: 40,),
                          ],),
                      )
                    ],
                  ),
                ),
              ))),
    );
  }
}
