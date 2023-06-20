import 'dart:convert';

import 'package:dentalapp/models/lab_profile.dart';
import 'package:dentalapp/screen/advance_payment_done_screen.dart';
import 'package:dentalapp/services/lab_service/lab_profile_service.dart';
import 'package:dentalapp/util/utils.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({Key? key}) : super(key: key);

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  LabProfile labEditProfile = LabProfile();
  final formKey = GlobalKey<FormState>();
  var autoValidate = AutovalidateMode.disabled;

  TextEditingController firstNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController currentPasswordController = TextEditingController();
  TextEditingController newPasswordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  bool isCurrentPasswordVisible = true;
  bool isPasswordVisible = true;
  bool isConfirmPasswordVisible = true;
  bool isLoading = true;
  LabProfile labProfile = LabProfile();
  LabProfileModel? labProfileData;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    labGetProfileData();
  }
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return SafeArea(
        child: Scaffold(
          body:  isLoading
              ? Center(
            child: loader(),
          )
              :SizedBox(
            height: height,
            width: width,
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                children: [
                  Container(
                      height: height*0.24,
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
                                padding: EdgeInsets.only(left: 15,top: 40),
                                alignment: Alignment.centerLeft,
                                child: InkWell(
                                    onTap: () {
                                      Navigator.pop(context);
                                    },
                                    child: Icon(Icons.keyboard_backspace,color: Colors.white,)),
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
                        SizedBox(height: height*0.025,),
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
                              hintText: 'John',
                              hintStyle: const TextStyle(fontSize: 15,fontWeight: FontWeight.w500,color: Color(0xFF707070)),
                              contentPadding: const EdgeInsets.only(left: 18,top: 16,bottom: 16)
                          ),
                        ),
                        SizedBox(height: height*0.025,),
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
                              hintText: 'Smith',
                              hintStyle: const TextStyle(fontSize: 15,fontWeight: FontWeight.w500,color: Color(0xFF707070)),
                              contentPadding: const EdgeInsets.only(left: 18,top: 16,bottom: 16)
                          ),
                        ),
                        SizedBox(height: height*0.025,),
                        TextFormField(
                          controller: emailController,
                          textInputAction: TextInputAction.next,
                          keyboardType: TextInputType.emailAddress,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please Enter Email';
                            } else if(!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]").hasMatch(value)){
                              return "Please Enter Valid Email";
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
                              hintText: 'User@gmail.com',
                              hintStyle: const TextStyle(fontSize: 15,fontWeight: FontWeight.w500,color: Color(0xFF707070)),
                              contentPadding: const EdgeInsets.only(left: 18,top: 16,bottom: 16)
                          ),
                        ),
                        SizedBox(height: height*0.020,),
                        Divider(
                          thickness: 1,
                          color: Color(0xFFE7E7E7),
                        ),
                        SizedBox(height: height*0.020,),
                        Text("Change Password",style: GoogleFonts.lato(fontSize: 18,fontWeight: FontWeight.w600),),
                        SizedBox(height: height*0.010,),
                        Text("To update password, enter your existing password followed by a new one. "
                            "Logout and use the Reset Password link on the Log In Page. ",
                          style: GoogleFonts.lato(fontSize: 14,fontWeight: FontWeight.w500,color: Color(0xFF707070)),
                        overflow: TextOverflow.ellipsis,maxLines: 3),
                        SizedBox(height: height*0.030,),
                        TextFormField(
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter current Password';
                            }if(value.length < 6){
                              return "Enter 6 character password";
                            }
                            return null;
                          },
                          obscureText: isCurrentPasswordVisible,
                          controller: currentPasswordController,
                          decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12),
                                  borderSide: BorderSide(color: Color(0xFF707070))
                              ),
                              labelText: 'Current Password',
                              hintText: 'Password@123',
                              hintStyle: TextStyle(fontSize: 15,fontWeight: FontWeight.w500,color: Color(0xFF707070)),
                              contentPadding: EdgeInsets.only(left: 18,top: 16,bottom: 16),
                              suffixIcon: InkWell(
                                  onTap: () {
                                    setState(() {
                                      isCurrentPasswordVisible = !isCurrentPasswordVisible;
                                    });
                                  },
                                  child: isCurrentPasswordVisible ? const Image(image: AssetImage("assets/image/Vector.png")) : const Image(image: AssetImage("assets/image/Vector12.png")))
                          ),
                        ),
                        SizedBox(height: height*0.020,),
                        TextFormField(
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter Password';
                            }if(value.length < 6){
                              return "Enter 6 character password";
                            }
                            return null;
                          },
                          obscureText: isPasswordVisible,
                          controller: newPasswordController,
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
                                      isPasswordVisible = !isPasswordVisible;
                                    });
                                  },
                                  child: isPasswordVisible ? const Image(image: AssetImage("assets/image/Vector.png")) : const Image(image: AssetImage("assets/image/Vector12.png")))
                          ),
                        ),
                        SizedBox(height: height*0.020,),
                        TextFormField(
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter ConfirmPassword';
                            } else if(value.length < 6){
                              return "Enter 6 character password";
                            } else if(value!= confirmPasswordController.text) {
                              return "Password Doesn't Match";
                            }
                            return null;
                          },
                          controller: confirmPasswordController,
                          obscureText: isConfirmPasswordVisible,
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
                                      isConfirmPasswordVisible = !isConfirmPasswordVisible;
                                    });
                                  },
                                  child: isConfirmPasswordVisible ? const Image(image: AssetImage("assets/image/Vector.png")) : const Image(image: AssetImage("assets/image/Vector12.png")))
                          ),
                        ),
                        SizedBox(height:height*0.030,),
                        Container(
                          height: height*0.065,
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              color: Color(0xFF116D6E)
                          ),
                          child: TextButton(
                              onPressed: () {
                                // if (formKey.currentState!.validate()){
                                //   if(newPasswordController.value == confirmPasswordController.value){
                                //     editProfile();
                                //   }else{
                                //     ScaffoldMessenger.of(context).showSnackBar(
                                //         SnackBar(content: Text("password & Confirm Password is not Same"),shape: OutlineInputBorder(
                                //             borderRadius: BorderRadius.circular(12),
                                //             borderSide: BorderSide(color: Colors.red.shade500)
                                //         ),
                                //           duration: Duration(seconds: 2),
                                //           backgroundColor: Colors.red.shade500,
                                //           padding: EdgeInsets.all(20),
                                //         ));
                                //   }
                                // }else{
                                //   autoValidate = AutovalidateMode.always;
                                // }

                                if(currentPasswordController.text==''|| newPasswordController.text==''||confirmPasswordController=='')
                                  {

                                    currentPasswordController.text="";
                                    newPasswordController.text="";
                                    confirmPasswordController.text="";
                                    editProfile();
                                  }
                                else if(newPasswordController.text==confirmPasswordController.text)
                                  {
                                    editProfile();
                                  }
                                else{
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


                                //editProfile();
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
        ));
  }
  labGetProfileData() async {
    Response response = await labProfile.getLabProfile();

    var resBody = jsonDecode(response.body);
    if(resBody["status"] == 200){

      if (response.statusCode == 200) {
        labProfileData = LabProfileModel.fromJson(jsonDecode(response.body));
        firstNameController.text=labProfileData!.labData![0].userDetails![0].firstName.toString();
        lastNameController.text=labProfileData!.labData![0].userDetails![0].lastName.toString();
        emailController.text=labProfileData!.labData![0].userDetails![0].email.toString();
      }
    }else{
      Utils.showErrorToast(resBody["message"]);
    }
    isLoading = false;
    setState(() {});
  }

  editProfile() async {
    Utils.showLoadingDialog(context);
    var body = {
      "firstName" : firstNameController.text.toString(),
      "lastName" : lastNameController.text.toString(),
      "email" : emailController.text.toString(),
      "oldPassword" : currentPasswordController.text.toString(),
      "newPassword" : newPasswordController.text.toString(),
    };
    Response response = await labEditProfile.editProfile(body);
    if(response.statusCode==200)
      {
        Map map = jsonDecode(response.body);
        if (map["status"] == 200) {
          labGetProfileData();
          Navigator.push(context, MaterialPageRoute(builder: (context) => AdvancePaymentDoneScreen(),));
          Utils.showErrorToast(jsonDecode(response.body)['message']);
        } else {
          Utils.showErrorToast(map["message"]);
        }

      }
    else {
      Navigator.pop(context);
      Utils.showErrorToast(jsonDecode(response.body)['message']);
    }



  }

}
