// ignore_for_file: use_build_context_synchronously

import 'dart:convert';
import 'dart:io';

import 'package:country_code_picker/country_code_picker.dart';
import 'package:dentalapp/models/clinic_profile.dart';
import 'package:dentalapp/services/clinic_services/clinic_services.dart';
import 'package:dentalapp/util/utils.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart';
import 'package:image_picker/image_picker.dart';

class EditClinicManagerDetail extends StatefulWidget {
  final Data data;
  const EditClinicManagerDetail({super.key, required this.data});

  @override
  State<EditClinicManagerDetail> createState() =>
      _EditClinicManagerDetailState();
}

class _EditClinicManagerDetailState extends State<EditClinicManagerDetail> {
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
  String financeFile = "";
  String oldFile = "";
  String labManagerCountryCode = "+971";
  String medicalManagerCountryCode = "+971";
  String financialManagerCountryCode = "+971";

  bool isFileSelected = false;
  bool isLoading = false;
  final formKey = GlobalKey<FormState>();
  var autoValidate = AutovalidateMode.disabled;
  ClinicService clinicService = ClinicService();
  File? financialManagerFile;

  @override
  void initState() {
    super.initState();
    labManagerNameController.text = widget.data.clinicMangerName ?? "";
    labManagerNumberController.text = widget.data.clinicMangerNumber ?? "";
    labManagerEmailController.text = widget.data.clinicMangerEmail ?? "";
    medicalManagerNameController.text = widget.data.medicalDirectorName ?? "";
    medicalManagerNumberController.text =
        widget.data.medicalDirectorNumber ?? "";
    medicalManagerEmailController.text = widget.data.medicalDirectorEmail ?? "";
    medicalManagerLicenseController.text =
        widget.data.directorLicensNumber ?? "";
    financeFile = widget.data.directorLicensFile ?? "";
    oldFile = widget.data.directorLicensFile ?? "";
    financialManagerNameController.text = widget.data.finacialMangerName ?? "";
    financialManagerNumberController.text =
        widget.data.finacialMangerNumber ?? "";
    financialManagerEmailController.text =
        widget.data.finacialMangerEmail ?? "";
    labManagerCountryCode = widget.data.clinicMangerCountryCode ?? "+971";
    medicalManagerCountryCode =
        widget.data.medicalDirectorCountryCode ?? "+971";
    financialManagerCountryCode =
        widget.data.finacialMangerCountryCode ?? "+971";
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
                                height: height * 0.2,
                                width: MediaQuery.of(context).size.width,
                                decoration: const BoxDecoration(
                                    color: Color(0xFF116D6E),
                                    image: DecorationImage(
                                        image: AssetImage(
                                            "assets/image/Group 12305.png"),
                                        fit: BoxFit.fitWidth,
                                        alignment: Alignment.bottomCenter,
                                        opacity: 0.3)),
                                child: Align(
                                    alignment: Alignment.center,
                                    child: Column(
                                      children: [
                                        SizedBox(height: height * 0.05),
                                        Container(
                                          padding: EdgeInsets.only(
                                              left: width * 0.05),
                                          alignment: Alignment.topLeft,
                                          child: InkWell(
                                              onTap: () {
                                                Navigator.pop(context);
                                              },
                                              child: const Image(
                                                  image: AssetImage(
                                                      "assets/image/left.png"),
                                                  fit: BoxFit.fill)),
                                        ),
                                        SizedBox(height: height * 0.03),
                                        Text(
                                          "Edit Clinic Manager Detail",
                                          style: GoogleFonts.lato(
                                            fontSize: 28,
                                            fontWeight: FontWeight.w600,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ],
                                    ))),
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: width * 0.057,
                                  vertical: height * 0.027),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    "Edit Clinic Manager Details",
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
                                      hintText: 'Clinic Manager Name',
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
                                          controller:
                                              labManagerNumberController,
                                          keyboardType: TextInputType.number,
                                          validator: (value) {
                                            if (value == null ||
                                                value.isEmpty) {
                                              return 'Please Enter Clinic Manager Mobile Number';
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
                                      hintText: 'Medical Director Name',
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
                                            medicalManagerCountryCode =
                                                value.dialCode!;
                                            setState(() {});
                                          },
                                          padding: EdgeInsets.zero,
                                          showFlag: false,
                                          initialSelection:
                                              medicalManagerCountryCode,
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
                                          controller:
                                              medicalManagerNumberController,
                                          keyboardType: TextInputType.number,
                                          validator: (value) {
                                            if (value == null ||
                                                value.isEmpty) {
                                              return 'Please Enter Medical Director Contact Number';
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
                                    controller: medicalManagerEmailController,
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
                                            if (financeFile.isNotEmpty)
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
                                                                    image: NetworkImage(
                                                                        financeFile),
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
                                                          financeFile = "";
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
                                            if (financialManagerFile == null &&
                                                financeFile.isEmpty)
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
                                  if (isFileSelected &&
                                      financialManagerFile == null &&
                                      financeFile.isEmpty)
                                    Utils.showCustomError(
                                        message:
                                            "Please Select Medical License File"),
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
                                      hintText: 'Financial Manager Name',
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
                                          controller:
                                              financialManagerNumberController,
                                          keyboardType: TextInputType.number,
                                          validator: (value) {
                                            if (value == null ||
                                                value.isEmpty) {
                                              return 'Please Enter Financial Manager Mobile Number';
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
                                            isFileSelected = true;
                                            if (financialManagerFile == null &&
                                                financeFile.isEmpty) {
                                              Utils.showErrorToast(
                                                  "Please Upload File");
                                            } else {
                                              isFileSelected = false;
                                              updateClinicManagerDetails();
                                            }
                                          } else {
                                            isFileSelected = true;
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
    });
  }

  Future<void> updateClinicManagerDetails() async {
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
      if (financeFile.isEmpty) "oldLicenceFile": oldFile,
    };

    Response response = await clinicService.updateClinicManagerDetail(
        body: bodyData, license: financialManagerFile);
    Navigator.pop(context);
    if (response.statusCode == 200) {
      Navigator.pop(context);
      Utils.showSuccessToast(jsonDecode(response.body)['message']);
    } else if (response.statusCode == 401) {
      Utils.logout(context);
    } else {
      Utils.showErrorToast(jsonDecode(response.body)['message']);
    }
  }
}
