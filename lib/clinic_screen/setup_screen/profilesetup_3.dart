import 'dart:convert';

import 'package:dentalapp/clinic_screen/setup_screen/sucessfulsetup_screen.dart';
import 'package:dentalapp/util/api_services.dart';
import 'package:dentalapp/util/utils.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;


class ProfileSetup3 extends StatefulWidget {
  const ProfileSetup3({Key? key}) : super(key: key);

  @override
  State<ProfileSetup3> createState() => _ProfileSetup3State();
}

class _ProfileSetup3State extends State<ProfileSetup3> {

  TextEditingController labManagerNameController = TextEditingController();
  TextEditingController labManagerNumberController = TextEditingController();
  TextEditingController labManagerEmailController = TextEditingController();
  TextEditingController medicalManagerNameController = TextEditingController();
  TextEditingController medicalManagerNumberController = TextEditingController();
  TextEditingController medicalManagerEmailController = TextEditingController();
  TextEditingController medicalManagerLicenseController = TextEditingController();
  TextEditingController financialManagerNameController = TextEditingController();
  TextEditingController financialManagerNumberController = TextEditingController();
  TextEditingController financialManagerEmailController = TextEditingController();
  TextEditingController totalTechnicianController = TextEditingController();

  bool isLoading =  false;
  final formKey = GlobalKey<FormState>();
  var autoValidate = AutovalidateMode.disabled;

  File? financialManagerFile;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width  = MediaQuery.of(context).size.width;
    return Form(
      key: formKey,
      autovalidateMode: autoValidate,
      child: SafeArea(
          child:Scaffold(
            resizeToAvoidBottomInset: true,
            body: !isLoading ? SizedBox(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(
                  children: [
                    Container(
                      height: height*0.25,
                      width: MediaQuery.of(context).size.width,
                      decoration: const BoxDecoration(
                          image: DecorationImage(image: AssetImage("assets/image/01.png"),fit: BoxFit.fill)
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(
                            children: [
                              const SizedBox(width: 20,),
                              InkWell(
                                  onTap: () {
                                    Navigator.pop(context);
                                  },
                                  child: const Image(image: AssetImage("assets/image/left.png"),fit: BoxFit.fill)),
                            ],
                          ),
                          const SizedBox(height: 20,),
                          Align(
                            alignment: Alignment.center,
                            child: Container(
                              alignment: Alignment.center,
                              height: 70,
                              width: 70,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(50),
                                  border: Border.all(color: Colors.white,width: 1),
                                  image: const DecorationImage(image: AssetImage("assets/image/Ellipse 108.png"),fit: BoxFit.fill)
                              ),
                              child: Text("N",style: GoogleFonts.lato(fontSize: 24,fontWeight: FontWeight.w600,color: Colors.white),),
                            ),
                          ),

                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: width*0.057,vertical: height*0.027),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 8,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text("3/",style: GoogleFonts.lato(fontSize: 17,fontWeight: FontWeight.w600),),
                              Text("3",style: GoogleFonts.lato(fontSize: 17,fontWeight: FontWeight.w600,color: const Color(0xFFA0A0A0)),),
                            ],
                          ),
                          const SizedBox(height: 15,),
                          Text("Clinic Manager Details",style: GoogleFonts.lato(fontSize: 19,fontWeight: FontWeight.w600),),
                          const SizedBox(height: 20,),
                          TextFormField(
                            textInputAction: TextInputAction.next,
                            controller: labManagerNameController,
                            keyboardType: TextInputType.name,
                            validator: (value) {
                              if(value == null || value.isEmpty){
                                return 'Please Enter Clinic Manager Name';
                              }
                              return null;
                            },
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12),
                                  borderSide: const BorderSide(color: Color(0xFF707070))
                              ),
                              labelText: 'Clinic Manager Name',
                              hintText: 'Manager Name',
                              hintStyle: const TextStyle(fontSize: 15,fontWeight: FontWeight.w500,color: Color(0xFF707070)),
                              contentPadding: const EdgeInsets.only(left: 18,top: 16,bottom: 16),
                            ),
                          ),
                          const SizedBox(height: 20,),
                          TextFormField(
                            maxLength: 10,
                            controller: labManagerNumberController,
                            textInputAction: TextInputAction.next,
                            keyboardType: TextInputType.number,
                            validator: (value) {
                              if(value == null || value.isEmpty){
                                return 'Please Enter Clinic Manager Number';
                              }
                              return null;
                            },
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12),
                                  borderSide: const BorderSide(color: Color(0xFF707070))
                              ),
                              labelText: 'Contact Number',
                              hintText: '123456789',
                              counterText: "",
                              hintStyle: const TextStyle(fontSize: 15,fontWeight: FontWeight.w500,color: Color(0xFF707070)),
                              contentPadding: const EdgeInsets.only(left: 18,top: 16,bottom: 16),
                            ),
                          ),
                          const SizedBox(height: 20,),
                          TextFormField(
                            textInputAction: TextInputAction.next,
                            controller: labManagerEmailController,
                            keyboardType: TextInputType.emailAddress,
                            validator: (value) {
                              if(value == null || value.isEmpty){
                                return 'Please Enter Clinic Manager Email';
                              }
                              return null;
                            },
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12),
                                  borderSide: const BorderSide(color: Color(0xFF707070))
                              ),
                              labelText: 'Email Address',
                              hintText: 'user@gmail.com',
                              hintStyle: const TextStyle(fontSize: 15,fontWeight: FontWeight.w500,color: Color(0xFF707070)),
                              contentPadding: const EdgeInsets.only(left: 18,top: 16,bottom: 16),
                            ),
                          ),
                          const SizedBox(height: 20,),
                          const Divider(
                            color: Color(0xFFE7E7E7),
                            thickness: 1,
                          ),
                          const SizedBox(height: 20,),
                          Text("Medical Director Details",style: GoogleFonts.lato(fontSize: 19,fontWeight: FontWeight.w600),),
                          const SizedBox(height: 20,),
                          TextFormField(
                            controller: medicalManagerNameController,
                            keyboardType: TextInputType.name,
                            textInputAction: TextInputAction.next,
                            validator: (value) {
                              if(value == null || value.isEmpty){
                                return 'Please Enter Medical Director Name';
                              }
                              return null;
                            },
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12),
                                  borderSide: const BorderSide(color: Color(0xFF707070))
                              ),
                              labelText: 'Medical Director  Name',
                              hintText: 'Manager Name',
                              counterText: "",
                              hintStyle: const TextStyle(fontSize: 15,fontWeight: FontWeight.w500,color: Color(0xFF707070)),
                              contentPadding: const EdgeInsets.only(left: 18,top: 16,bottom: 16),
                            ),
                          ),
                          const SizedBox(height: 20,),
                          TextFormField(
                            maxLength: 10,
                            controller: medicalManagerNumberController,
                            textInputAction: TextInputAction.next,
                            keyboardType: TextInputType.number,
                            validator: (value) {
                              if(value == null || value.isEmpty){
                                return 'Please Enter Medical Director Contact Number';
                              }
                              return null;
                            },
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12),
                                  borderSide: const BorderSide(color: Color(0xFF707070))
                              ),
                              labelText: 'Contact Number',
                              hintText: '12345 67890',
                              counterText: "",
                              hintStyle: const TextStyle(fontSize: 15,fontWeight: FontWeight.w500,color: Color(0xFF707070)),
                              contentPadding: const EdgeInsets.only(left: 18,top: 16,bottom: 16),
                            ),
                          ),
                          const SizedBox(height: 20,),
                          TextFormField(
                            textInputAction: TextInputAction.next,
                            controller: medicalManagerEmailController,
                            keyboardType: TextInputType.emailAddress,
                            validator: (value) {
                              if(value == null || value.isEmpty){
                                return 'Please Enter Medical Director Email';
                              }
                              return null;
                            },
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12),
                                  borderSide: const BorderSide(color: Color(0xFF707070))
                              ),
                              labelText: 'Email Address',
                              hintText: 'user@gmail.com',
                              hintStyle: const TextStyle(fontSize: 15,fontWeight: FontWeight.w500,color: Color(0xFF707070)),
                              contentPadding: const EdgeInsets.only(left: 18,top: 16,bottom: 16),
                            ),
                          ),
                          const SizedBox(height: 20,),
                          TextFormField(
                            controller: medicalManagerLicenseController,
                            textInputAction: TextInputAction.next,
                            keyboardType: TextInputType.name,
                            validator: (value) {
                              if(value == null || value.isEmpty){
                                return 'Please Enter License Number';
                              }
                              return null;
                            },
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12),
                                  borderSide: const BorderSide(color: Color(0xFF707070))
                              ),
                              labelText: 'License Number',
                              hintText: '12345 67890',
                              counterText: "",
                              hintStyle: const TextStyle(fontSize: 15,fontWeight: FontWeight.w500,color: Color(0xFF707070)),
                              contentPadding: const EdgeInsets.only(left: 18,top: 16,bottom: 16),
                            ),
                          ),
                          const SizedBox(height: 20,),
                          const Divider(
                            color: Color(0xFFE7E7E7),
                            thickness: 1,
                          ),
                          const SizedBox(height: 20,),
                          Text("Financial Manager Details",style: GoogleFonts.lato(fontSize: 19,fontWeight: FontWeight.w600),),
                          const SizedBox(height: 20,),
                          TextFormField(
                            controller: financialManagerNameController,
                            keyboardType: TextInputType.name,
                            textInputAction: TextInputAction.next,
                            validator: (value) {
                              if(value == null || value.isEmpty){
                                return 'Please Enter Financial Manager Name';
                              }
                              return null;
                            },
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12),
                                  borderSide: const BorderSide(color: Color(0xFF707070))
                              ),
                              labelText: 'Financial Manager Name ',
                              hintText: 'Manager Name',
                              counterText: "",
                              hintStyle: const TextStyle(fontSize: 15,fontWeight: FontWeight.w500,color: Color(0xFF707070)),
                              contentPadding: const EdgeInsets.only(left: 18,top: 16,bottom: 16),
                            ),
                          ),
                          const SizedBox(height: 20,),
                          TextFormField(
                            maxLength: 10,
                            controller: financialManagerNumberController,
                            textInputAction: TextInputAction.next,
                            keyboardType: TextInputType.number,
                            validator: (value) {
                              if(value == null || value.isEmpty){
                                return 'Please Enter Financial Manager Number';
                              }
                              return null;
                            },
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12),
                                  borderSide: const BorderSide(color: Color(0xFF707070))
                              ),
                              labelText: 'Contact Number',
                              hintText: '12345 67890',
                              counterText: "",
                              hintStyle: const TextStyle(fontSize: 15,fontWeight: FontWeight.w500,color: Color(0xFF707070)),
                              contentPadding: const EdgeInsets.only(left: 18,top: 16,bottom: 16),
                            ),
                          ),
                          const SizedBox(height: 20,),
                          TextFormField(
                            textInputAction: TextInputAction.next,
                            controller: financialManagerEmailController,
                            keyboardType: TextInputType.emailAddress,
                            validator: (value) {
                              if(value == null || value.isEmpty){
                                return 'Please Enter Financial Manager Email';
                              }
                              return null;
                            },
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12),
                                  borderSide: const BorderSide(color: Color(0xFF707070))
                              ),
                              labelText: 'Email Address',
                              hintText: 'user@gmail.com',
                              hintStyle: const TextStyle(fontSize: 15,fontWeight: FontWeight.w500,color: Color(0xFF707070)),
                              contentPadding: const EdgeInsets.only(left: 18,top: 16,bottom: 16),
                            ),
                          ),
                          const SizedBox(height: 20,),

                          DottedBorder(
                            borderType: BorderType.RRect,
                            dashPattern: [3, 3, 3],
                            radius: const Radius.circular(12),
                            color: const Color(0xFF116D6E),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(12),
                              child: Container(
                                height: height*0.13,
                                width: MediaQuery.of(context).size.width,
                                color: const Color(0xFFF5F7F7),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    if (financialManagerFile != null)
                                      Align(
                                        alignment: Alignment.centerLeft,
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(horizontal: 10),
                                          child: Container(
                                            width: 120,
                                            height: 80,
                                            decoration: BoxDecoration(
                                                image: DecorationImage(image: FileImage(financialManagerFile!),fit: BoxFit.fill),
                                                borderRadius: BorderRadius.circular(12)
                                            ),
                                          ),
                                        ),
                                      ),
                                    if (financialManagerFile==null)
                                      InkWell(
                                        onTap: () {
                                          _pickImage3();
                                        },
                                        child: Container(
                                          child: Column(
                                            children: [
                                              Container(
                                                height: 50,
                                                width: 50,
                                                decoration: BoxDecoration(
                                                    borderRadius: BorderRadius.circular(50),
                                                    color: Colors.white,
                                                    image: const DecorationImage(image: AssetImage("assets/image/camera.png"),fit: BoxFit.none)
                                                ),
                                              ),
                                              const SizedBox(height: 5,),
                                              Text("Upload file",style: GoogleFonts.lato(fontSize: 15,fontWeight: FontWeight.w500,color: const Color(0xFF707070)))
                                            ],
                                          ),
                                        ),
                                      ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: height*0.050,),
                          Container(
                            height: height*0.064,
                            width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                color: const Color(0xff116D6E)
                            ),
                            child: TextButton(
                                onPressed: () {
                                  if (formKey.currentState!.validate()){
                                    if (financialManagerFile==null) {
                                      Utils.showErrorToast("Please Upload File");
                                    }
                                    else {
                                      profileSetup3();
                                    }
                                  }else{
                                    autoValidate = AutovalidateMode.always;
                                  }
                                },
                                child: Text("Continue",style: GoogleFonts.lato(fontSize: 15,fontWeight: FontWeight.w500,color: Colors.white))),
                          ),
                          SizedBox(height: height*0.025,),
                        ],),
                    )
                  ],
                ),
              ),
            ) : const Center(
              child: CircularProgressIndicator(),
            )
          )),
    );
  }

  Future<void> _pickImage3() async {
    final picker = ImagePicker();
    final pickedImage3 = await picker.getImage(source: ImageSource.gallery);
    setState(() {
      if(pickedImage3 != null){
        financialManagerFile = File(pickedImage3.path);
      }
      // imageFile = pickedImage;
    });
  }


  Future<void> profileSetup3() async {
    Utils.showLoadingDialog(context);
      var bodyData = {
        "clinicMangerName": labManagerNameController.text.toString(),
        "clinicMangerNumber": labManagerNumberController.text.toString(),
        "clinicMangerEmail": labManagerEmailController.text.toString(),
        "medicalDirectorName": medicalManagerNameController.text.toString(),
        "medicalDirectorNumber": medicalManagerNumberController.text.toString(),
        "medicalDirectorEmail": medicalManagerEmailController.text.toString(),
        "directorLicensNumber": medicalManagerLicenseController.text.toString(),
        "finacialMangerName": financialManagerNameController.text.toString(),
        "finacialMangerNumber": financialManagerNumberController.text.toString(),
        "finacialMangerEmail": financialManagerEmailController.text.toString(),
      };
      var postUri = Uri.parse(ApiServices.addClinicMangerDetails);
      var request = http.MultipartRequest("POST", postUri);
      request.fields.addAll(bodyData);
      request.headers.addAll(Utils.apiHeader);
      http.MultipartFile multipartFile = await http.MultipartFile.fromPath('directorLicensFile',financialManagerFile!.path);
      request.files.add(multipartFile);
      http.StreamedResponse response = await request.send();

      print('code: ${response.statusCode}');
      final res = await http.Response.fromStream(response);
      print('body: ${res.body}');
      Navigator.pop(context);
      Map map = jsonDecode(res.body);
      if (response.statusCode==200) {
        if (map['status'] == 200) {
          Utils.setScreenStatus("4");
          Utils.showSuccessToast(map["message"]);
          Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => const SuccessfulProfileSetUp(),),(route) => false,);
        } else {
          Utils.showErrorToast(map["message"]);
        }
      } else {
        Utils.showErrorToast(jsonDecode(res.body)["message"]);
      }
  }
}
