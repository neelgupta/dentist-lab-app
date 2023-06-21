import 'dart:convert';

import 'package:dentalapp/models/lab_profile.dart';
import 'package:dentalapp/screen/advance_payment_done_screen.dart';
import 'package:dentalapp/services/lab_service/lab_profile_service.dart';
import 'package:dentalapp/util/utils.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart';

class EditProfileScreen extends StatefulWidget {
  final UserDetail userDetails;
  const EditProfileScreen({Key? key, required this.userDetails}) : super(key: key);

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  LabProfile labEditProfile = LabProfile();
  final formKey = GlobalKey<FormState>();
  var autoValidate = AutovalidateMode.disabled;

  TextEditingController firstNameController = TextEditingController();
  TextEditingController emailAddressController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController currentPasswordController = TextEditingController();
  TextEditingController newPasswordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  bool isCurrentPasswordVisible = true;
  bool isNewPasswordVisible = true;
  bool isConfirmPasswordVisible = true;
  LabProfile labProfile = LabProfile();
  LabProfileModel? labProfileData;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    firstNameController.text = widget.userDetails.firstName.toString();
    lastNameController.text = widget.userDetails.lastName.toString();
    emailAddressController.text = widget.userDetails.email.toString();
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
            body:  SizedBox(
              height: height,
              width: width,
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
                                Container(
                                  padding: const EdgeInsets.only(left: 15,top: 40),
                                  alignment: Alignment.centerLeft,
                                  child: InkWell(
                                      onTap: () {
                                        Navigator.pop(context);
                                      },
                                      child: const Icon(Icons.keyboard_backspace,color: Colors.white,)),
                                ),
                                SizedBox(height: height*0.05,),
                                Text("Edit Profile",style: GoogleFonts.lato(fontSize: 30,fontWeight: FontWeight.w600,color: Colors.white,),),
                              ],
                            ))
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: width*0.057,vertical: height*0.027),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: height*0.010,),
                          Text("Edit Profile Info",style: GoogleFonts.lato(fontSize: 18,fontWeight: FontWeight.w600),),
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
                          SizedBox(height: height*0.020,),
                          const Divider(
                            thickness: 1,
                            color: Color(0xFFE7E7E7),
                          ),
                          SizedBox(height: height*0.020,),
                          Text("Change Password",style: GoogleFonts.lato(fontSize: 18,fontWeight: FontWeight.w600),),
                          SizedBox(height: height*0.010,),
                          Text("To update password, enter your existing password followed by a new one. "
                              "Logout and use the Reset Password link on the Log In Page. ",
                            style: GoogleFonts.lato(fontSize: 14,fontWeight: FontWeight.w500,color: const Color(0xFF707070)),
                          overflow: TextOverflow.ellipsis,maxLines: 3),
                          SizedBox(height: height*0.030,),
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
                                return 'Password Doesn\'t Match';
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
                          SizedBox(height:height*0.030,),
                          Container(
                            height: height*0.065,
                            width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                color: const Color(0xFF116D6E)
                            ),
                            child: TextButton(
                                onPressed: () {
                                  if (formKey.currentState!.validate()){
                                    editProfile();
                                  }else{
                                    autoValidate = AutovalidateMode.always;
                                  }
                                },
                                child: Text("Save",style: GoogleFonts.lato(fontSize: 15,fontWeight: FontWeight.w500,color: Colors.white))),
                          ),
                          SizedBox(height:height*0.020,),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          )),
    );
  }

  editProfile() async {
    Utils.showLoadingDialog(context);
    var body = {
      "firstName" : firstNameController.text.toString(),
      "lastName" : lastNameController.text.toString(),
      "email" : emailAddressController.text.toString(),
      if(currentPasswordController.text.isNotEmpty)"oldPassword" : currentPasswordController.text.toString(),
      if(currentPasswordController.text.isNotEmpty)"newPassword" : newPasswordController.text.toString(),
    };
    Response response = await labEditProfile.editProfile(body);
    Navigator.pop(context);
    if(response.statusCode==200) {
      Navigator.pop(context);
      Utils.showSuccessToast(jsonDecode(response.body)['message']);
    } else if (response.statusCode == 401) {
      Utils.logout(context);
    } else {
      Utils.showErrorToast(jsonDecode(response.body)['message']);
    }
  }
}
