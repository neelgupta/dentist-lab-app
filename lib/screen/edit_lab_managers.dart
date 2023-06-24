// ignore_for_file: use_build_context_synchronously

import 'package:country_code_picker/country_code_picker.dart';
import 'package:dentalapp/models/lab_profile.dart';
import 'package:dentalapp/util/api_services.dart';
import 'package:dentalapp/util/utils.dart';
import 'package:dotted_border/dotted_border.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';

class EditlabManagerDetail extends StatefulWidget {
  final LabDatum labData;
  const EditlabManagerDetail({super.key, required this.labData});

  @override
  State<EditlabManagerDetail> createState() => _EditlabManagerDetailState();
}

class _EditlabManagerDetailState extends State<EditlabManagerDetail> {
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

  String technicalManagerLicenseFile = "";
  String financialManagerLicenseFile = "";
  String removeTechnicalManagerLicenseFile = "";
  String removeFinancialManagerLicenseFile = "";

  bool isFileUpload = false;
  final formKey = GlobalKey<FormState>();
  var autoValidate = AutovalidateMode.disabled;

  @override
  void initState() {
    super.initState();
    labManagerNameController.text = widget.labData.labMangerName ?? "";
    labManagerNumberController.text = widget.labData.labMangerNumber ?? "";
    labManagerEmailController.text = widget.labData.labMangerEmail ?? "";
    technicalManagerNameController.text = widget.labData.techMangerName ?? "";
    technicalManagerNumberController.text =
        widget.labData.techMangerNumber ?? "";
    technicalManagerEmailController.text = widget.labData.techMangerEmail ?? "";
    technicalManagerLicenseController.text =
        widget.labData.techMangerlicensNo ?? "";
    financialManagerNameController.text =
        widget.labData.finacialMangerName ?? "";
    financialManagerNumberController.text =
        widget.labData.finacialMangerNumber ?? "";
    financialManagerEmailController.text =
        widget.labData.finacialMangerEmail ?? "";
    totalTechnicianController.text = widget.labData.totalLabTechinicians ?? "";
    labManagerCountryCode = widget.labData.labMangerCountryCode ?? '+971';
    techDirectorCountryCode = widget.labData.techMangerCountryCode ?? '+971';
    financialManagerCountryCode =
        widget.labData.finacialMangerCountryCode ?? '+971';
    technicalManagerLicenseFile = widget.labData.techlicensFile ?? "";
    financialManagerLicenseFile = widget.labData.labTechs ?? "";
    removeTechnicalManagerLicenseFile = widget.labData.techlicensFile ?? "";
    removeFinancialManagerLicenseFile = widget.labData.labTechs ?? "";
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
              body: SizedBox(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Column(
                    children: [
                      Container(
                          height: height * 0.24,
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
                                  Container(
                                    padding: EdgeInsets.only(
                                        left: width * 0.05, top: height * 0.04),
                                    alignment: Alignment.centerLeft,
                                    child: InkWell(
                                        onTap: () {
                                          Navigator.pop(context);
                                        },
                                        child: const Icon(
                                          Icons.keyboard_backspace,
                                          color: Colors.white,
                                        )),
                                  ),
                                  SizedBox(
                                    height: height * 0.04,
                                  ),
                                  Text(
                                    "Edit Manager Details",
                                    style: GoogleFonts.lato(
                                      fontSize: 30,
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
                              height: 8,
                            ),
                            Text(
                              "Lab Manager Details",
                              style: GoogleFonts.lato(
                                  fontSize: 19, fontWeight: FontWeight.w600),
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
                                    borderRadius: BorderRadius.circular(12),
                                    borderSide: const BorderSide(
                                        color: Color(0xFF707070))),
                                labelText: 'Manager Name',
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
                            Row(
                              children: [
                                Container(
                                  height: 50,
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                        color: const Color(0xFF707070)),
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  child: CountryCodePicker(
                                    onChanged: (value) {
                                      labManagerCountryCode = value.dialCode!;
                                      setState(() {});
                                    },
                                    padding: EdgeInsets.zero,
                                    showFlag: false,
                                    initialSelection: labManagerCountryCode,
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
                                    controller: labManagerNumberController,
                                    keyboardType: TextInputType.number,
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
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
                                        contentPadding: const EdgeInsets.only(
                                            left: 18, top: 16, bottom: 16)),
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
                                    borderRadius: BorderRadius.circular(12),
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
                                  fontSize: 19, fontWeight: FontWeight.w600),
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
                                    borderRadius: BorderRadius.circular(12),
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
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  child: CountryCodePicker(
                                    onChanged: (value) {
                                      techDirectorCountryCode = value.dialCode!;
                                      setState(() {});
                                    },
                                    padding: EdgeInsets.zero,
                                    showFlag: false,
                                    initialSelection: techDirectorCountryCode,
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
                                      if (value == null || value.isEmpty) {
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
                                        contentPadding: const EdgeInsets.only(
                                            left: 18, top: 16, bottom: 16)),
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
                                    borderRadius: BorderRadius.circular(12),
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
                              controller: technicalManagerLicenseController,
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
                                    borderRadius: BorderRadius.circular(12),
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
                            Text("Upload Technical Manager License Number",
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
                                  width: MediaQuery.of(context).size.width,
                                  color: const Color(0xFFF5F7F7),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
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
                                              alignment: Alignment.topRight,
                                              children: [
                                                Align(
                                                  alignment:
                                                      Alignment.centerLeft,
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsets.symmetric(
                                                            horizontal:
                                                                width * 0.02),
                                                    child: Container(
                                                      width: width * 0.25,
                                                      height: width * 0.25,
                                                      decoration: BoxDecoration(
                                                          image: DecorationImage(
                                                              image: FileImage(
                                                                  technicalManagerLicense!),
                                                              fit: BoxFit.fill),
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
                                                    padding: EdgeInsets.all(
                                                        width * 0.005),
                                                    decoration: BoxDecoration(
                                                        shape: BoxShape.circle,
                                                        color: Colors.white,
                                                        border: Border.all(
                                                            color: Colors.red)),
                                                    child: const Icon(
                                                      Icons.delete_outline,
                                                      size: 15,
                                                      color: Colors.red,
                                                    ),
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                        ),
                                      if (technicalManagerLicenseFile
                                          .isNotEmpty)
                                        Align(
                                          alignment: Alignment.centerLeft,
                                          child: SizedBox(
                                            height: width * 0.3,
                                            width: width * 0.3,
                                            child: Stack(
                                              alignment: Alignment.topRight,
                                              children: [
                                                Align(
                                                  alignment:
                                                      Alignment.centerLeft,
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsets.symmetric(
                                                            horizontal:
                                                                width * 0.02),
                                                    child: Container(
                                                      width: width * 0.25,
                                                      height: width * 0.25,
                                                      decoration: BoxDecoration(
                                                          image: DecorationImage(
                                                              image: NetworkImage(
                                                                  technicalManagerLicenseFile),
                                                              fit: BoxFit.fill),
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
                                                    technicalManagerLicenseFile =
                                                        "";
                                                    setState(() {});
                                                  },
                                                  child: Container(
                                                    padding: EdgeInsets.all(
                                                        width * 0.005),
                                                    decoration: BoxDecoration(
                                                        shape: BoxShape.circle,
                                                        color: Colors.white,
                                                        border: Border.all(
                                                            color: Colors.red)),
                                                    child: const Icon(
                                                      Icons.delete_outline,
                                                      size: 15,
                                                      color: Colors.red,
                                                    ),
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                        ),
                                      if (technicalManagerLicense == null &&
                                          technicalManagerLicenseFile.isEmpty)
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
                                                        BorderRadius.circular(
                                                            50),
                                                    color: Colors.white,
                                                    image: const DecorationImage(
                                                        image: AssetImage(
                                                            "assets/image/camera.png"),
                                                        fit: BoxFit.none)),
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
                                technicalManagerLicense == null &&
                                technicalManagerLicenseFile.isEmpty)
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
                                  fontSize: 19, fontWeight: FontWeight.w600),
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
                                    borderRadius: BorderRadius.circular(12),
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
                                    borderRadius: BorderRadius.circular(12),
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
                                      if (value == null || value.isEmpty) {
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
                                        contentPadding: const EdgeInsets.only(
                                            left: 18, top: 16, bottom: 16)),
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
                                    borderRadius: BorderRadius.circular(12),
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
                                    borderRadius: BorderRadius.circular(12),
                                    borderSide: const BorderSide(
                                        color: Color(0xFF707070))),
                                labelText: 'Total Number of Lab Technicians',
                                hintText: 'Total Number of Lab Technicians',
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
                                  width: MediaQuery.of(context).size.width,
                                  color: const Color(0xFFF5F7F7),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
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
                                              alignment: Alignment.topRight,
                                              children: [
                                                Align(
                                                  alignment:
                                                      Alignment.centerLeft,
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsets.symmetric(
                                                            horizontal:
                                                                width * 0.02),
                                                    child: Container(
                                                      width: width * 0.25,
                                                      height: width * 0.25,
                                                      decoration: BoxDecoration(
                                                          image: DecorationImage(
                                                              image: FileImage(
                                                                  financialManagerLicense!),
                                                              fit: BoxFit.fill),
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
                                                    padding: EdgeInsets.all(
                                                        width * 0.005),
                                                    decoration: BoxDecoration(
                                                        shape: BoxShape.circle,
                                                        color: Colors.white,
                                                        border: Border.all(
                                                            color: Colors.red)),
                                                    child: const Icon(
                                                      Icons.delete_outline,
                                                      size: 15,
                                                      color: Colors.red,
                                                    ),
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                        ),
                                      if (financialManagerLicenseFile
                                          .isNotEmpty)
                                        Align(
                                          alignment: Alignment.centerLeft,
                                          child: SizedBox(
                                            height: width * 0.3,
                                            width: width * 0.3,
                                            child: Stack(
                                              alignment: Alignment.topRight,
                                              children: [
                                                Align(
                                                  alignment:
                                                      Alignment.centerLeft,
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsets.symmetric(
                                                            horizontal:
                                                                width * 0.02),
                                                    child: Container(
                                                      width: width * 0.25,
                                                      height: width * 0.25,
                                                      decoration: BoxDecoration(
                                                          image: DecorationImage(
                                                              image: NetworkImage(
                                                                  financialManagerLicenseFile),
                                                              fit: BoxFit.fill),
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
                                                    financialManagerLicenseFile =
                                                        "";
                                                    setState(() {});
                                                  },
                                                  child: Container(
                                                    padding: EdgeInsets.all(
                                                        width * 0.005),
                                                    decoration: BoxDecoration(
                                                        shape: BoxShape.circle,
                                                        color: Colors.white,
                                                        border: Border.all(
                                                            color: Colors.red)),
                                                    child: const Icon(
                                                      Icons.delete_outline,
                                                      size: 15,
                                                      color: Colors.red,
                                                    ),
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                        ),
                                      if (financialManagerLicense == null &&
                                          financialManagerLicenseFile.isEmpty)
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
                                                        BorderRadius.circular(
                                                            50),
                                                    color: Colors.white,
                                                    image: const DecorationImage(
                                                        image: AssetImage(
                                                            "assets/image/camera.png"),
                                                        fit: BoxFit.none)),
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
                                financialManagerLicense == null &&
                                financialManagerLicenseFile.isEmpty)
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
                                    if (formKey.currentState!.validate()) {
                                      isFileUpload = true;
                                      if (technicalManagerLicense == null &&
                                          technicalManagerLicenseFile.isEmpty) {
                                        Utils.showErrorToast(
                                            "Please Select Technical Manager License");
                                      } else if (financialManagerLicense ==
                                              null &&
                                          financialManagerLicenseFile.isEmpty) {
                                        Utils.showErrorToast(
                                            "Please Select lab Technicians File");
                                      } else {
                                        isFileUpload = false;
                                        updateManagerDetails();
                                      }
                                    } else {
                                      isFileUpload = true;
                                      autoValidate = AutovalidateMode.always;
                                      setState(() {});
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
              ))),
    );
  }

  updateManagerDetails() async {
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
      if (technicalManagerLicenseFile.isEmpty)
        "removetechlicensFile": removeTechnicalManagerLicenseFile,
      if (financialManagerLicenseFile.isEmpty)
        "removelabTechs": removeFinancialManagerLicenseFile,
    };

    var postUri = Uri.parse(ApiServices.editMangersDetails);
    var request = http.MultipartRequest("PUT", postUri);
    request.headers.addAll(Utils.apiHeader);
    request.fields.addAll(bodyData);
    if (technicalManagerLicense != null) {
      http.MultipartFile multipartFile = await http.MultipartFile.fromPath(
          "techlicensFile", technicalManagerLicense!.path);
      request.files.add(multipartFile);
    }
    if (financialManagerLicense != null) {
      http.MultipartFile multipartFile1 = await http.MultipartFile.fromPath(
          "labTechs", financialManagerLicense!.path);
      request.files.add(multipartFile1);
    }
    http.StreamedResponse response = await request.send();

    final res = await http.Response.fromStream(response);
    Utils.logAPIResponse(
        apiName: ApiServices.editMangersDetails,
        body: request.fields,
        function: "updateManagerDetails",
        response: res);

    Navigator.pop(context);

    if (response.statusCode == 200) {
      Map map = jsonDecode(res.body);
      Navigator.pop(context);
      Utils.showSuccessToast(map['message']);
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
