// ignore_for_file: use_build_context_synchronously

import 'package:country_code_picker/country_code_picker.dart';
import 'package:dentalapp/util/api_services.dart';
import 'package:dentalapp/util/utils.dart';
import 'package:dotted_border/dotted_border.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'manage_profile_4.dart';

class ManageProfile3 extends StatefulWidget {
  const ManageProfile3({Key? key}) : super(key: key);

  @override
  State<ManageProfile3> createState() => _ManageProfile3State();
}

class _ManageProfile3State extends State<ManageProfile3> {
  TextEditingController labManagerNameController = TextEditingController();
  TextEditingController labManagerNumberController = TextEditingController();
  TextEditingController labManagerEmailController = TextEditingController();
  TextEditingController technicalManagerNameController =
      TextEditingController();
  TextEditingController technicalManagerNumberController =
      TextEditingController();
  TextEditingController technicalManagerEmailController =
      TextEditingController();
  TextEditingController technicalManagerLicenseController =
      TextEditingController();
  TextEditingController financialManagerNameController =
      TextEditingController();
  TextEditingController financialManagerNumberController =
      TextEditingController();
  TextEditingController financialManagerEmailController =
      TextEditingController();
  TextEditingController totalTechnicianController = TextEditingController();
  String labManagerCountryCode = "+971";
  String techDirectorCountryCode = "+971";
  String financialManagerCountryCode = "+971";

  File? technicalManagerLicense;
  File? financialManagerLicense;

  bool isLoading = false;
  final formKey = GlobalKey<FormState>();
  var autoValidate = AutovalidateMode.disabled;
  bool isFileUpload = false;

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
                                      height: width * 0.18,
                                      width: width * 0.18,
                                      decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          border: Border.all(
                                              color: Colors.white, width: 1),
                                          image: DecorationImage(
                                              image: NetworkImage(
                                                  Utils.getProfileImage()),
                                              fit: BoxFit.fill)),
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
                                        "6",
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
                                    "Lab Manager Details",
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
                                        return 'Enter Lab Manager Name';
                                      }
                                      return null;
                                    },
                                    decoration: InputDecoration(
                                      border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(12),
                                          borderSide: const BorderSide(
                                              color: Color(0xFF707070))),
                                      labelText: 'Lab Manager Name',
                                      hintText: 'Lab Manager Name',
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
                                  Row(
                                    children: [
                                      Container(
                                        height: 50,
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                              color: const Color(0xFF707070)),
                                          borderRadius:
                                              BorderRadius.circular(12),
                                        ),
                                        child: CountryCodePicker(
                                          onChanged: (value) {
                                            labManagerCountryCode =
                                                value.dialCode!;
                                            setState(() {});
                                          },
                                          padding: EdgeInsets.zero,
                                          showFlag: false,
                                          initialSelection:
                                              labManagerCountryCode,
                                          showDropDownButton: false,
                                          favorite: const ['+971'],
                                          showCountryOnly: false,
                                          showOnlyCountryWhenClosed: false,
                                          alignLeft: false,
                                        ),
                                      ),
                                      SizedBox(width: width * 0.02),
                                      Expanded(
                                        child: TextFormField(
                                          maxLength: 12,
                                          controller:
                                              labManagerNumberController,
                                          keyboardType: TextInputType.number,
                                          validator: (value) {
                                            if (value == null ||
                                                value.isEmpty) {
                                              return 'Please Enter Mobile Number';
                                            } else if(!RegExp(r'(^(?:[+0]9)?[0-9]{8,12}$)').hasMatch(value)) {
                                              return 'Please Enter Valid Mobile Number';
                                            }
                                            return null;
                                          },
                                          decoration: InputDecoration(
                                              labelText: "Mobile Number",
                                              hintText: "Mobile Number",
                                              counterText: "",
                                              border: OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(12),
                                                  borderSide: const BorderSide(
                                                      color:
                                                          Color(0xFF707070))),
                                              contentPadding:
                                                  const EdgeInsets.only(
                                                      left: 18,
                                                      top: 16,
                                                      bottom: 16)),
                                        ),
                                      ),
                                    ],
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
                                        return 'Please Enter Email Address';
                                      } else if (!RegExp(
                                              r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
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
                                      hintText: 'Email Address',
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
                                    "Technical Manager Details",
                                    style: GoogleFonts.lato(
                                        fontSize: 19,
                                        fontWeight: FontWeight.w600),
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  TextFormField(
                                    controller: technicalManagerNameController,
                                    keyboardType: TextInputType.name,
                                    textInputAction: TextInputAction.next,
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return 'Enter Technical Manager Name';
                                      }
                                      return null;
                                    },
                                    decoration: InputDecoration(
                                      border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(12),
                                          borderSide: const BorderSide(
                                              color: Color(0xFF707070))),
                                      labelText: 'Manager Name',
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
                                  Row(
                                    children: [
                                      Container(
                                        height: 50,
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                              color: const Color(0xFF707070)),
                                          borderRadius:
                                              BorderRadius.circular(12),
                                        ),
                                        child: CountryCodePicker(
                                          onChanged: (value) {
                                            techDirectorCountryCode =
                                                value.dialCode!;
                                            setState(() {});
                                          },
                                          padding: EdgeInsets.zero,
                                          showFlag: false,
                                          initialSelection:
                                              techDirectorCountryCode,
                                          showDropDownButton: false,
                                          favorite: const ['+971'],
                                          showCountryOnly: false,
                                          showOnlyCountryWhenClosed: false,
                                          alignLeft: false,
                                        ),
                                      ),
                                      SizedBox(width: width * 0.02),
                                      Expanded(
                                        child: TextFormField(
                                          maxLength: 12,
                                          controller:
                                              technicalManagerNumberController,
                                          keyboardType: TextInputType.number,
                                          validator: (value) {
                                            if (value == null ||
                                                value.isEmpty) {
                                              return 'Please Enter Mobile Number';
                                            } else if(!RegExp(r'(^(?:[+0]9)?[0-9]{8,12}$)').hasMatch(value)) {
                                              return 'Please Enter Valid Mobile Number';
                                            }
                                            return null;
                                          },
                                          decoration: InputDecoration(
                                            labelText: "Mobile Number",
                                            hintText: "Mobile Number",
                                            counterText: "",
                                            border: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(12),
                                                borderSide: const BorderSide(
                                                    color: Color(0xFF707070))),
                                            contentPadding:
                                                const EdgeInsets.only(
                                                    left: 18,
                                                    top: 16,
                                                    bottom: 16),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  TextFormField(
                                    textInputAction: TextInputAction.next,
                                    controller: technicalManagerEmailController,
                                    keyboardType: TextInputType.emailAddress,
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return 'Please Enter Email Address';
                                      } else if (!RegExp(
                                              r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
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
                                      hintText: 'Email Address',
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
                                        technicalManagerLicenseController,
                                    textInputAction: TextInputAction.next,
                                    keyboardType: TextInputType.number,
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return 'Please Enter License Number';
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
                                      hintText: 'License Number',
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
                                  Text(
                                      "Upload Technical Manager License Number",
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
                                            if (technicalManagerLicense != null)
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
                                                                        technicalManagerLicense!),
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
                                                          technicalManagerLicense =
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
                                            if (technicalManagerLicense == null)
                                              InkWell(
                                                onTap: () {
                                                  _pickImage2();
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
                                  if (isFileUpload &&
                                      technicalManagerLicense == null)
                                    Utils.showCustomError(
                                        message:
                                            "Please Select Technical Manager License File"),
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
                                        return 'Enter Financial Manager Name';
                                      }
                                      return null;
                                    },
                                    decoration: InputDecoration(
                                      border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(12),
                                          borderSide: const BorderSide(
                                              color: Color(0xFF707070))),
                                      labelText: 'Manager Name  ',
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
                                  Row(
                                    children: [
                                      Container(
                                        height: 50,
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                              color: const Color(0xFF707070)),
                                          borderRadius:
                                              BorderRadius.circular(12),
                                        ),
                                        child: CountryCodePicker(
                                          onChanged: (value) {
                                            financialManagerCountryCode =
                                                value.dialCode!;
                                            setState(() {});
                                          },
                                          padding: EdgeInsets.zero,
                                          showFlag: false,
                                          initialSelection:
                                              financialManagerCountryCode,
                                          showDropDownButton: false,
                                          favorite: const ['+971'],
                                          showCountryOnly: false,
                                          showOnlyCountryWhenClosed: false,
                                          alignLeft: false,
                                        ),
                                      ),
                                      SizedBox(width: width * 0.02),
                                      Expanded(
                                        child: TextFormField(
                                          maxLength: 12,
                                          controller:
                                              financialManagerNumberController,
                                          keyboardType: TextInputType.number,
                                          validator: (value) {
                                            if (value == null ||
                                                value.isEmpty) {
                                              return 'Please Enter Mobile Number';
                                            } else if(!RegExp(r'(^(?:[+0]9)?[0-9]{8,12}$)').hasMatch(value)) {
                                              return 'Please Enter Valid Mobile Number';
                                            }
                                            return null;
                                          },
                                          decoration: InputDecoration(
                                              labelText: "Mobile Number",
                                              hintText: "Mobile Number",
                                              counterText: "",
                                              border: OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(12),
                                                  borderSide: const BorderSide(
                                                      color:
                                                          Color(0xFF707070))),
                                              contentPadding:
                                                  const EdgeInsets.only(
                                                      left: 18,
                                                      top: 16,
                                                      bottom: 16)),
                                        ),
                                      ),
                                    ],
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
                                        return 'Please Enter Email Address';
                                      } else if (!RegExp(
                                              r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
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
                                      hintText: 'Email Address',
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
                                    controller: totalTechnicianController,
                                    textInputAction: TextInputAction.next,
                                    keyboardType: TextInputType.number,
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return 'Enter Total Lab Technicians ';
                                      }
                                      return null;
                                    },
                                    decoration: InputDecoration(
                                      border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(12),
                                          borderSide: const BorderSide(
                                              color: Color(0xFF707070))),
                                      labelText:
                                          'Total Number of Lab Technicians',
                                      hintText:
                                          'Total Number of Lab Technicians',
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
                                  Text("Upload List of Lab Technicians",
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
                                            if (financialManagerLicense != null)
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
                                                                        financialManagerLicense!),
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
                                                          financialManagerLicense =
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
                                            if (financialManagerLicense == null)
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
                                  if (isFileUpload &&
                                      financialManagerLicense == null)
                                    Utils.showCustomError(
                                        message:
                                            "Please Select List of Lab Tech File"),
                                  SizedBox(
                                    height: height * 0.050,
                                  ),
                                  Container(
                                    height: height * 0.064,
                                    width: MediaQuery.of(context).size.width,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(12),
                                        color: const Color(0xFF116D6E)),
                                    child: TextButton(
                                        onPressed: () {
                                          if (technicalManagerLicense == null ||
                                              financialManagerLicense == null) {
                                            isFileUpload = true;
                                            setState(() {});
                                          }

                                          if (formKey.currentState!
                                              .validate()) {
                                            if (technicalManagerLicense ==
                                                null) {
                                              isFileUpload = true;
                                              Utils.showErrorToast(
                                                  "Please Select Technical Manager License");
                                            } else if (financialManagerLicense ==
                                                null) {
                                              isFileUpload = true;
                                              Utils.showErrorToast(
                                                  "Please Select lab Technicians File");
                                            } else {
                                              isFileUpload = false;
                                              manageProfile3();
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

  manageProfile3() async {
    Utils.showLoadingDialog(context);
    var bodyData = {
      "labMangerName": labManagerNameController.text.toString(),
      "labMangerNumber": labManagerNumberController.text.toString(),
      "labMangerEmail": labManagerEmailController.text.toString(),
      "techMangerName": technicalManagerNameController.text.toString(),
      "techMangerNumber": technicalManagerNumberController.text.toString(),
      "techMangerEmail": technicalManagerEmailController.text.toString(),
      "techMangerlicensNo": technicalManagerLicenseController.text.toString(),
      "finacialMangerName": financialManagerNameController.text.toString(),
      "finacialMangerNumber": financialManagerNumberController.text.toString(),
      "finacialMangerEmail": financialManagerEmailController.text.toString(),
      "totalLabTechinicians": totalTechnicianController.text.toString(),
      "labMangerCountryCode": labManagerCountryCode,
      "techMangerCountryCode": techDirectorCountryCode,
      "finacialMangerCountryCode": financialManagerCountryCode,
    };

    http.MultipartFile multipartFile = await http.MultipartFile.fromPath(
        "techlicensFile", technicalManagerLicense!.path);
    http.MultipartFile multipartFile1 = await http.MultipartFile.fromPath(
        "labTechs", financialManagerLicense!.path);
    var postUri = Uri.parse(ApiServices.manageProfile3Api);
    var request = http.MultipartRequest("POST", postUri);
    request.headers.addAll(Utils.apiHeader);
    request.fields.addAll(bodyData);
    request.files.add(
      multipartFile,
    );
    request.files.add(
      multipartFile1,
    );
    http.StreamedResponse response = await request.send();

    final res = await http.Response.fromStream(response);

    Navigator.pop(context);

    if (response.statusCode == 200) {
      Map map = jsonDecode(res.body);
      if (map["status"] == 200) {
        Utils.setScreenStatus("4");
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const ManageProfile4(),
            ));
        Utils.showSuccessToast(map['message']);
      } else {
        Utils.showErrorToast(map['message']);
      }
    } else if (response.statusCode == 401) {
      Utils.logout(context);
    } else {
      Utils.showErrorToast(jsonDecode(res.body)['message']);
    }
  }

  Future<void> _pickImage2() async {
    final picker = ImagePicker();
    final pickedImage2 = await picker.pickImage(source: ImageSource.gallery);
    setState(() {
      if (pickedImage2 != null) {
        technicalManagerLicense = File(pickedImage2.path);
      }
    });
  }

  Future<void> _pickImage3() async {
    final picker = ImagePicker();
    final pickedImage3 = await picker.pickImage(source: ImageSource.gallery);
    setState(() {
      if (pickedImage3 != null) {
        financialManagerLicense = File(pickedImage3.path);
      }
    });
  }
}
