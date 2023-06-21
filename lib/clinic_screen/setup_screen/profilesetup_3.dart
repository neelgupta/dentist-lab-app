// ignore_for_file: use_build_context_synchronously

import 'dart:convert';

import 'package:country_code_picker/country_code_picker.dart';
import 'package:dentalapp/clinic_screen/setup_screen/sucessfulsetup_screen.dart';
import 'package:dentalapp/util/api_services.dart';
import 'package:dentalapp/util/utils.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
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
  TextEditingController medicalManagerNumberController =
      TextEditingController();
  TextEditingController medicalManagerEmailController = TextEditingController();
  TextEditingController medicalManagerLicenseController =
      TextEditingController();
  TextEditingController financialManagerNameController =
      TextEditingController();
  TextEditingController financialManagerNumberController =
      TextEditingController();
  TextEditingController financialManagerEmailController =
      TextEditingController();
  TextEditingController totalTechnicianController = TextEditingController();
  String labManagerCountryCode = "+971";
  String medicalManagerCountryCode = "+971";
  String financialManagerCountryCode = "+971";

  bool isLoading = false;
  final formKey = GlobalKey<FormState>();
  var autoValidate = AutovalidateMode.disabled;

  File? financialManagerFile;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Form(
      key: formKey,
      autovalidateMode: autoValidate,
      child: SafeArea(
          child: Scaffold(
              resizeToAvoidBottomInset: true,
              body: !isLoading
                  ? SizedBox(
                      height: MediaQuery.of(context).size.height,
                      width: MediaQuery.of(context).size.width,
                      child: SingleChildScrollView(
                        scrollDirection: Axis.vertical,
                        child: Column(
                          children: [
                            Container(
                              height: height * 0.25,
                              width: MediaQuery.of(context).size.width,
                              decoration: const BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage("assets/image/01.png"),
                                      fit: BoxFit.fill)),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Row(
                                    children: [
                                      const SizedBox(
                                        width: 20,
                                      ),
                                      InkWell(
                                          onTap: () {
                                            Navigator.pop(context);
                                          },
                                          child: const Image(
                                              image: AssetImage(
                                                  "assets/image/left.png"),
                                              fit: BoxFit.fill)),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  Align(
                                    alignment: Alignment.center,
                                    child: Container(
                                      alignment: Alignment.center,
                                      height: 70,
                                      width: 70,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(50),
                                          border: Border.all(
                                              color: Colors.white, width: 1),
                                          image: const DecorationImage(
                                              image: AssetImage(
                                                  "assets/image/Ellipse 108.png"),
                                              fit: BoxFit.fill)),
                                      child: Text(
                                        "N",
                                        style: GoogleFonts.lato(
                                            fontSize: 24,
                                            fontWeight: FontWeight.w600,
                                            color: Colors.white),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: width * 0.057,
                                  vertical: height * 0.027),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const SizedBox(
                                    height: 8,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        "3/",
                                        style: GoogleFonts.lato(
                                            fontSize: 17,
                                            fontWeight: FontWeight.w600),
                                      ),
                                      Text(
                                        "3",
                                        style: GoogleFonts.lato(
                                            fontSize: 17,
                                            fontWeight: FontWeight.w600,
                                            color: const Color(0xFFA0A0A0)),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 15,
                                  ),
                                  Text(
                                    "Clinic Manager Details",
                                    style: GoogleFonts.lato(
                                        fontSize: 19,
                                        fontWeight: FontWeight.w600),
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  TextFormField(
                                    textInputAction: TextInputAction.next,
                                    controller: labManagerNameController,
                                    keyboardType: TextInputType.name,
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return 'Please Enter Clinic Manager Name';
                                      }
                                      return null;
                                    },
                                    decoration: InputDecoration(
                                      border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(12),
                                          borderSide: const BorderSide(
                                              color: Color(0xFF707070))),
                                      labelText: 'Clinic Manager Name',
                                      hintText: 'Manager Name',
                                      hintStyle: const TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.w500,
                                          color: Color(0xFF707070)),
                                      contentPadding: const EdgeInsets.only(
                                          left: 18, top: 16, bottom: 16),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  TextFormField(
                                    controller: labManagerNumberController,
                                    keyboardType: TextInputType.number,
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return 'Please Enter Clinic Manager Mobile Number';
                                      }
                                      return null;
                                    },
                                    decoration: InputDecoration(
                                        labelText: "Mobile Number",
                                        hintText: "Enter Mobile Number",
                                        counterText: "",
                                        border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(12),
                                            borderSide: const BorderSide(
                                                color: Color(0xFF707070))),
                                        prefixIcon: InkWell(
                                          onTap: () {},
                                          child: Container(
                                              width: width * 0.2,
                                              margin: EdgeInsets.only(
                                                  right: width * 0.03,top: 8, bottom: 8),
                                              decoration: const BoxDecoration(
                                                  border: Border(
                                                      right: BorderSide(
                                                          color: Color(
                                                              0xFF707070)))),
                                              alignment: Alignment.center,
                                              child: CountryCodePicker(
                                                onChanged: (value) {
                                                  labManagerCountryCode =
                                                      value.dialCode!;
                                                  setState(() {});
                                                },
                                                showFlag: false,
                                                initialSelection:
                                                    labManagerCountryCode,
                                                padding: EdgeInsets.zero,
                                                showDropDownButton: false,
                                                favorite: const ['+971'],
                                                showCountryOnly: false,
                                                showOnlyCountryWhenClosed:
                                                    false,
                                                alignLeft: false,
                                              )),
                                        )),
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  TextFormField(
                                    textInputAction: TextInputAction.next,
                                    controller: labManagerEmailController,
                                    keyboardType: TextInputType.emailAddress,
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return 'Please Enter Clinic Manager Email Address';
                                      } else if (!RegExp(
                                              "^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]")
                                          .hasMatch(value)) {
                                        return "Please Enter Valid Email Address";
                                      }
                                      return null;
                                    },
                                    decoration: InputDecoration(
                                      border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(12),
                                          borderSide: const BorderSide(
                                              color: Color(0xFF707070))),
                                      labelText: 'Email Address',
                                      hintText: 'user@gmail.com',
                                      hintStyle: const TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.w500,
                                          color: Color(0xFF707070)),
                                      contentPadding: const EdgeInsets.only(
                                          left: 18, top: 16, bottom: 16),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  const Divider(
                                    color: Color(0xFFE7E7E7),
                                    thickness: 1,
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  Text(
                                    "Medical Director Details",
                                    style: GoogleFonts.lato(
                                        fontSize: 19,
                                        fontWeight: FontWeight.w600),
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  TextFormField(
                                    controller: medicalManagerNameController,
                                    keyboardType: TextInputType.name,
                                    textInputAction: TextInputAction.next,
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return 'Please Enter Medical Director Name';
                                      }
                                      return null;
                                    },
                                    decoration: InputDecoration(
                                      border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(12),
                                          borderSide: const BorderSide(
                                              color: Color(0xFF707070))),
                                      labelText: 'Medical Director  Name',
                                      hintText: 'Manager Name',
                                      counterText: "",
                                      hintStyle: const TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.w500,
                                          color: Color(0xFF707070)),
                                      contentPadding: const EdgeInsets.only(
                                          left: 18, top: 16, bottom: 16),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  TextFormField(
                                    controller: medicalManagerNumberController,
                                    keyboardType: TextInputType.number,
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return 'Please Enter Medical Director Mobile Number';
                                      }
                                      return null;
                                    },
                                    decoration: InputDecoration(
                                        labelText: "Mobile Number",
                                        hintText: "Enter Mobile Number",
                                        counterText: "",
                                        border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(12),
                                            borderSide: const BorderSide(
                                                color: Color(0xFF707070))),
                                        prefixIcon: InkWell(
                                          onTap: () {},
                                          child: Container(
                                              width: width * 0.2,
                                              margin: EdgeInsets.only(
                                                  right: width * 0.03,top: 8,bottom: 8),
                                              decoration: const BoxDecoration(
                                                  border: Border(
                                                      right: BorderSide(
                                                          color: Color(
                                                              0xFF707070)))),
                                              alignment: Alignment.center,
                                              child: CountryCodePicker(
                                                onChanged: (value) {
                                                  medicalManagerCountryCode =
                                                      value.dialCode!;
                                                  setState(() {});
                                                },
                                                showFlag: false,
                                                padding: EdgeInsets.zero,
                                                initialSelection:
                                                    medicalManagerCountryCode,
                                                showDropDownButton: false,
                                                favorite: const ['+971'],
                                                showCountryOnly: false,
                                                showOnlyCountryWhenClosed:
                                                    false,
                                                alignLeft: false,
                                              )),
                                        )),
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  TextFormField(
                                    textInputAction: TextInputAction.next,
                                    controller: medicalManagerEmailController,
                                    keyboardType: TextInputType.emailAddress,
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return 'Please Enter Medical Director Email Address';
                                      } else if (!RegExp(
                                              "^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]")
                                          .hasMatch(value)) {
                                        return "Please Enter Valid Email Address";
                                      }
                                      return null;
                                    },
                                    decoration: InputDecoration(
                                      border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(12),
                                          borderSide: const BorderSide(
                                              color: Color(0xFF707070))),
                                      labelText: 'Email Address',
                                      hintText: 'user@gmail.com',
                                      hintStyle: const TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.w500,
                                          color: Color(0xFF707070)),
                                      contentPadding: const EdgeInsets.only(
                                          left: 18, top: 16, bottom: 16),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  TextFormField(
                                    controller: medicalManagerLicenseController,
                                    textInputAction: TextInputAction.next,
                                    keyboardType: TextInputType.name,
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return 'Please Enter Medical Director License Number';
                                      }
                                      return null;
                                    },
                                    decoration: InputDecoration(
                                      border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(12),
                                          borderSide: const BorderSide(
                                              color: Color(0xFF707070))),
                                      labelText: 'License Number',
                                      hintText: '12345 67890',
                                      counterText: "",
                                      hintStyle: const TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.w500,
                                          color: Color(0xFF707070)),
                                      contentPadding: const EdgeInsets.only(
                                          left: 18, top: 16, bottom: 16),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  Text("Upload Medical License Number",
                                      style: GoogleFonts.lato(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w400,
                                        color: const Color(0xff707070),
                                      )),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  DottedBorder(
                                    borderType: BorderType.RRect,
                                    dashPattern: const [3, 3, 3],
                                    radius: const Radius.circular(12),
                                    color: const Color(0xFF116D6E),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(12),
                                      child: Container(
                                        height: width * 0.3,
                                        width:
                                            MediaQuery.of(context).size.width,
                                        color: const Color(0xFFF5F7F7),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            if (financialManagerFile != null)
                                              Align(
                                                alignment: Alignment.centerLeft,
                                                child: SizedBox(
                                                  height: width * 0.3,
                                                  width: width * 0.3,
                                                  child: Stack(
                                                    alignment:
                                                        Alignment.topRight,
                                                    children: [
                                                      Align(
                                                        alignment: Alignment
                                                            .centerLeft,
                                                        child: Padding(
                                                          padding: EdgeInsets
                                                              .symmetric(
                                                                  horizontal:
                                                                      width *
                                                                          0.02),
                                                          child: Container(
                                                            width: width * 0.25,
                                                            height:
                                                                width * 0.25,
                                                            decoration: BoxDecoration(
                                                                image: DecorationImage(
                                                                    image: FileImage(
                                                                        financialManagerFile!),
                                                                    fit: BoxFit
                                                                        .fill),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            12)),
                                                            // child: imageFile != null ? Image.file(File(imageFile!.path), fit: BoxFit.cover,) : Placeholder(),
                                                          ),
                                                        ),
                                                      ),
                                                      InkWell(
                                                        onTap: () {
                                                          financialManagerFile =
                                                              null;
                                                          setState(() {});
                                                        },
                                                        child: Container(
                                                          padding:
                                                              EdgeInsets.all(
                                                                  width *
                                                                      0.005),
                                                          decoration: BoxDecoration(
                                                              shape: BoxShape
                                                                  .circle,
                                                              color:
                                                                  Colors.white,
                                                              border: Border.all(
                                                                  color: Colors
                                                                      .red)),
                                                          child: const Icon(
                                                            Icons
                                                                .delete_outline,
                                                            size: 15,
                                                            color: Colors.red,
                                                          ),
                                                        ),
                                                      )
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            if (financialManagerFile == null)
                                              InkWell(
                                                onTap: () {
                                                  _pickImage3();
                                                },
                                                child: Column(
                                                  children: [
                                                    Container(
                                                      height: 50,
                                                      width: 50,
                                                      decoration: BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(50),
                                                          color: Colors.white,
                                                          image: const DecorationImage(
                                                              image: AssetImage(
                                                                  "assets/image/camera.png"),
                                                              fit:
                                                                  BoxFit.none)),
                                                    ),
                                                    const SizedBox(
                                                      height: 5,
                                                    ),
                                                    Text("Upload file",
                                                        style: GoogleFonts.lato(
                                                            fontSize: 15,
                                                            fontWeight:
                                                                FontWeight.w500,
                                                            color: const Color(
                                                                0xFF707070)))
                                                  ],
                                                ),
                                              ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  const Divider(
                                    color: Color(0xFFE7E7E7),
                                    thickness: 1,
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  Text(
                                    "Financial Manager Details",
                                    style: GoogleFonts.lato(
                                        fontSize: 19,
                                        fontWeight: FontWeight.w600),
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  TextFormField(
                                    controller: financialManagerNameController,
                                    keyboardType: TextInputType.name,
                                    textInputAction: TextInputAction.next,
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return 'Please Enter Financial Manager Name';
                                      }
                                      return null;
                                    },
                                    decoration: InputDecoration(
                                      border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(12),
                                          borderSide: const BorderSide(
                                              color: Color(0xFF707070))),
                                      labelText: 'Financial Manager Name ',
                                      hintText: 'Manager Name',
                                      counterText: "",
                                      hintStyle: const TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.w500,
                                          color: Color(0xFF707070)),
                                      contentPadding: const EdgeInsets.only(
                                          left: 18, top: 16, bottom: 16),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  TextFormField(
                                    controller:
                                        financialManagerNumberController,
                                    keyboardType: TextInputType.number,
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return 'Please Enter Financial Manager Mobile Number';
                                      }
                                      return null;
                                    },
                                    decoration: InputDecoration(
                                        labelText: "Mobile Number",
                                        hintText: "Enter Mobile Number",
                                        counterText: "",
                                        border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(12),
                                            borderSide: const BorderSide(
                                                color: Color(0xFF707070))),
                                        prefixIcon: InkWell(
                                          onTap: () {},
                                          child: Container(
                                              width: width * 0.2,
                                              margin: EdgeInsets.only(
                                                  right: width * 0.03,top: 8,bottom: 8),
                                              decoration: const BoxDecoration(
                                                  border: Border(
                                                      right: BorderSide(
                                                          color: Color(
                                                              0xFF707070)))),
                                              alignment: Alignment.center,
                                              child: CountryCodePicker(
                                                onChanged: (value) {
                                                  financialManagerCountryCode =
                                                      value.dialCode!;
                                                  setState(() {});
                                                },
                                                showFlag: false,
                                                padding: EdgeInsets.zero,
                                                initialSelection:
                                                    financialManagerCountryCode,
                                                showDropDownButton: false,
                                                favorite: const ['+971'],
                                                showCountryOnly: false,
                                                showOnlyCountryWhenClosed:
                                                    false,
                                                alignLeft: false,
                                              )),
                                        )),
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  TextFormField(
                                    textInputAction: TextInputAction.next,
                                    controller: financialManagerEmailController,
                                    keyboardType: TextInputType.emailAddress,
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return 'Please Enter Financial Manager Email Address';
                                      } else if (!RegExp(
                                              "^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]")
                                          .hasMatch(value)) {
                                        return "Please Enter Valid Email Address";
                                      }
                                      return null;
                                    },
                                    decoration: InputDecoration(
                                      border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(12),
                                          borderSide: const BorderSide(
                                              color: Color(0xFF707070))),
                                      labelText: 'Email Address',
                                      hintText: 'user@gmail.com',
                                      hintStyle: const TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.w500,
                                          color: Color(0xFF707070)),
                                      contentPadding: const EdgeInsets.only(
                                          left: 18, top: 16, bottom: 16),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  SizedBox(
                                    height: height * 0.050,
                                  ),
                                  Container(
                                    height: height * 0.064,
                                    width: MediaQuery.of(context).size.width,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(12),
                                        color: const Color(0xff116D6E)),
                                    child: TextButton(
                                        onPressed: () {
                                          if (formKey.currentState!
                                              .validate()) {
                                            if (financialManagerFile == null) {
                                              Utils.showErrorToast(
                                                  "Please Upload File");
                                            } else {
                                              profileSetup3();
                                            }
                                          } else {
                                            autoValidate =
                                                AutovalidateMode.always;
                                          }
                                        },
                                        child: Text("Continue",
                                            style: GoogleFonts.lato(
                                                fontSize: 15,
                                                fontWeight: FontWeight.w500,
                                                color: Colors.white))),
                                  ),
                                  SizedBox(
                                    height: height * 0.025,
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    )
                  : const Center(
                      child: CircularProgressIndicator(),
                    ))),
    );
  }

  Future<void> _pickImage3() async {
    final picker = ImagePicker();
    final pickedImage3 = await picker.pickImage(source: ImageSource.gallery);
    setState(() {
      if (pickedImage3 != null) {
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
      "clinicMangerCountryCode": labManagerCountryCode,
      "medicalDirectorCountryCode": medicalManagerCountryCode,
      "finacialMangerCountryCode": financialManagerCountryCode,
    };
    var postUri = Uri.parse(ApiServices.addClinicMangerDetails);
    var request = http.MultipartRequest("POST", postUri);
    request.fields.addAll(bodyData);
    request.headers.addAll(Utils.apiHeader);
    http.MultipartFile multipartFile = await http.MultipartFile.fromPath(
        'directorLicensFile', financialManagerFile!.path);
    request.files.add(multipartFile);
    http.StreamedResponse response = await request.send();

    final res = await http.Response.fromStream(response);
    Navigator.pop(context);
    Map map = jsonDecode(res.body);
    if (response.statusCode == 200) {
      if (map['status'] == 200) {
        Utils.setScreenStatus("4");
        Utils.showSuccessToast(map["message"]);
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
            builder: (context) => const SuccessfulProfileSetUp(),
          ),
          (route) => false,
        );
      } else if (response.statusCode == 401) {
        Utils.logout(context);
      } else {
        Utils.showErrorToast(map["message"]);
      }
    } else {
      Utils.showErrorToast(jsonDecode(res.body)["message"]);
    }
  }
}
