// ignore_for_file: use_build_context_synchronously

import 'dart:io';
import 'dart:convert';
import 'package:dentalapp/models/lab_profile.dart';
import 'package:dentalapp/util/api_services.dart';
import 'package:dentalapp/util/utils.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class EditLabAdditionalDetails extends StatefulWidget {
  final LabDatum labData;
  const EditLabAdditionalDetails({super.key, required this.labData});

  @override
  State<EditLabAdditionalDetails> createState() =>
      _EditLabAdditionalDetailsState();
}

class _EditLabAdditionalDetailsState extends State<EditLabAdditionalDetails> {
  TextEditingController medicalLicenseController = TextEditingController();
  TextEditingController tradeLicenseController = TextEditingController();
  TextEditingController trnNumberController = TextEditingController();
  TextEditingController totalDeviceController = TextEditingController();

  File? medicalLicense;
  File? tradeLicense;
  File? trn;
  File? noOfDevice;

  bool isFileUpload = false;

  String medicalFile = "";
  String tradeFile = "";
  String trnFile = "";
  String noOfDeviceFile = "";
  String oldMedicalFile = "";
  String oldTradeFile = "";
  String oldTrnFile = "";
  String oldNoOfDeviceFile = "";

  Future<void> _pickImage() async {
    final picker = ImagePicker();
    final pickedImage = await picker.pickImage(source: ImageSource.gallery);
    setState(() {
      if (pickedImage != null) {
        medicalLicense = File(pickedImage.path);
      }
    });
  }

  bool isLoading = false;
  final formKey = GlobalKey<FormState>();
  var autoValidate = AutovalidateMode.disabled;

  @override
  void initState() {
    super.initState();
    medicalLicenseController.text = widget.labData.medicalLicenseNumber ?? "";
    tradeLicenseController.text = widget.labData.tradeLicenceNumber ?? "";
    trnNumberController.text = widget.labData.tRNNumber ?? "";
    totalDeviceController.text = widget.labData.deviceUsed ?? "";
    medicalFile = widget.labData.licensFile ?? "";
    tradeFile = widget.labData.tradeFile ?? "";
    trnFile = widget.labData.tRNFile ?? "";
    noOfDeviceFile = widget.labData.devicesFile ?? "";
    oldMedicalFile = widget.labData.licensFile ?? "";
    oldTradeFile = widget.labData.tradeFile ?? "";
    oldTrnFile = widget.labData.tRNFile ?? "";
    oldNoOfDeviceFile = widget.labData.devicesFile ?? "";
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
                                    "Edit Additional Details",
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
                              height: 7,
                            ),
                            Text(
                              "Additional",
                              style: GoogleFonts.lato(
                                  fontSize: 19, fontWeight: FontWeight.w600),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            TextFormField(
                              textInputAction: TextInputAction.next,
                              controller: medicalLicenseController,
                              keyboardType: TextInputType.number,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Enter Medical License Number';
                                }
                                return null;
                              },
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(12),
                                    borderSide: const BorderSide(
                                        color: Color(0xFF707070))),
                                labelText: 'Medical License Number',
                                hintText: '123456789',
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
                            Text("Upload Medical License",
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
                                      if (medicalLicense != null)
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
                                                                  medicalLicense!),
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
                                                    medicalLicense = null;
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
                                      if (medicalFile.isNotEmpty)
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
                                                                  medicalFile),
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
                                                    medicalFile = "";
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
                                      if (medicalLicense == null &&
                                          medicalFile.isEmpty)
                                        InkWell(
                                          onTap: () {
                                            _pickImage();
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
                                medicalLicense == null &&
                                medicalFile.isEmpty)
                              Utils.showCustomError(
                                  message:
                                      "Please Select Medical License File"),
                            const SizedBox(
                              height: 20,
                            ),
                            TextFormField(
                              textInputAction: TextInputAction.next,
                              controller: tradeLicenseController,
                              keyboardType: TextInputType.number,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Enter Trade License Number';
                                }
                                return null;
                              },
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(12),
                                    borderSide: const BorderSide(
                                        color: Color(0xFF707070))),
                                labelText: 'Trade License Number',
                                hintText: '123456789',
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
                            Text("Upload Trade License",
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
                                      if (tradeLicense != null)
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
                                                                  tradeLicense!),
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
                                                    tradeLicense = null;
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
                                      if (tradeFile.isNotEmpty)
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
                                                              image:
                                                                  NetworkImage(
                                                                      tradeFile),
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
                                                    tradeFile = "";
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
                                      if (tradeLicense == null &&
                                          tradeFile.isEmpty)
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
                                tradeLicense == null &&
                                tradeFile.isEmpty)
                              Utils.showCustomError(
                                  message: "Please Select Trade License File"),
                            const SizedBox(
                              height: 20,
                            ),
                            TextFormField(
                              textInputAction: TextInputAction.next,
                              controller: trnNumberController,
                              keyboardType: TextInputType.number,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Enter TRN Number';
                                }
                                return null;
                              },
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(12),
                                    borderSide: const BorderSide(
                                        color: Color(0xFF707070))),
                                labelText: 'TRN Number',
                                hintText: '123456789',
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
                            Text("Upload TRN",
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
                                      if (trn != null)
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
                                                          image:
                                                              DecorationImage(
                                                                  image:
                                                                      FileImage(
                                                                          trn!),
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
                                                    trn = null;
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
                                      if (trnFile.isNotEmpty)
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
                                                              image:
                                                                  NetworkImage(
                                                                      trnFile),
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
                                                    trnFile = "";
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
                                      if (trn == null && trnFile.isEmpty)
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
                            if (isFileUpload && trn == null && trnFile.isEmpty)
                              Utils.showCustomError(
                                  message: "Please Select TRN File"),
                            const SizedBox(
                              height: 20,
                            ),
                            TextFormField(
                              textInputAction: TextInputAction.next,
                              controller: totalDeviceController,
                              keyboardType: TextInputType.number,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Enter Total Number of devices used';
                                }
                                return null;
                              },
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(12),
                                    borderSide: const BorderSide(
                                        color: Color(0xFF707070))),
                                labelText: 'Total Number of Devices Used',
                                hintText: '123456789',
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
                            Text("Upload List of Devices",
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
                                      if (noOfDevice != null)
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
                                                                  noOfDevice!),
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
                                                    noOfDevice = null;
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
                                      if (noOfDeviceFile.isNotEmpty)
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
                                                                  noOfDeviceFile),
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
                                                    noOfDeviceFile = "";
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
                                      if (noOfDevice == null &&
                                          noOfDeviceFile.isEmpty)
                                        InkWell(
                                          onTap: () {
                                            _pickImage4();
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
                                noOfDevice == null &&
                                noOfDeviceFile.isEmpty)
                              Utils.showCustomError(
                                  message: "Please Select Device Used File"),
                            SizedBox(
                              height: height * 0.065,
                            ),
                            Container(
                              height: height * 0.064,
                              width: MediaQuery.of(context).size.width,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12),
                                  color: Color(medicalLicenseController
                                              .text.isNotEmpty &&
                                          tradeLicenseController
                                              .text.isNotEmpty &&
                                          tradeLicenseController
                                              .text.isNotEmpty &&
                                          totalDeviceController
                                              .text.isNotEmpty &&
                                          (medicalLicense != null ||
                                              medicalFile.isNotEmpty) &&
                                          (tradeLicense != null ||
                                              tradeFile.isNotEmpty) &&
                                          (trn != null || trnFile.isNotEmpty) &&
                                          (noOfDevice != null ||
                                              noOfDeviceFile.isNotEmpty)
                                      ? 0xFF166D6E
                                      : 0xFFA0A0A0)),
                              child: TextButton(
                                  onPressed: () {
                                    if ((medicalLicense == null &&
                                            medicalFile.isEmpty) ||
                                        (tradeLicense == null &&
                                            tradeFile.isEmpty) ||
                                        (trn == null && trnFile.isEmpty) ||
                                        (noOfDevice == null &&
                                            noOfDeviceFile.isEmpty)) {
                                      isFileUpload = true;
                                      setState(() {});
                                    }
                                    if (formKey.currentState!.validate()) {
                                      if (medicalLicense == null &&
                                          medicalFile.isEmpty) {
                                        isFileUpload = true;
                                        Utils.showErrorToast(
                                            "Please Select Medical License");
                                      } else if (tradeLicense == null &&
                                          tradeFile.isNotEmpty) {
                                        isFileUpload = true;
                                        Utils.showErrorToast(
                                            "Please Select Trade License");
                                      } else if (trn == null &&
                                          trnFile.isEmpty) {
                                        isFileUpload = true;
                                        Utils.showErrorToast(
                                            "Please Select TRN");
                                      } else if (noOfDevice == null &&
                                          noOfDeviceFile.isEmpty) {
                                        isFileUpload = true;
                                        Utils.showErrorToast(
                                            "Please Select Device Used File");
                                      } else {
                                        updateAdditionalDetails();
                                      }
                                    } else {
                                      autoValidate = AutovalidateMode.always;
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

  updateAdditionalDetails() async {
    Utils.showLoadingDialog(context);
    var bodyData = {
      "medicalLicenseNumber": medicalLicenseController.text.toString(),
      "tradeLicenceNumber": tradeLicenseController.text.toString(),
      "TRN_number": trnNumberController.text.toString(),
      "deviceUsed": totalDeviceController.text.toString(),
      if (medicalFile.isEmpty) "removelicensFile": oldMedicalFile,
      if (tradeFile.isEmpty) "removetradeFile": oldTradeFile,
      if (trnFile.isEmpty) "removeTRNFile": oldTrnFile,
      if (noOfDeviceFile.isEmpty) "removedevicesFile": oldNoOfDeviceFile,
    };

    var postUri = Uri.parse(ApiServices.editLabAdditionalDetails);
    var request = http.MultipartRequest("PUT", postUri);

    request.headers.addAll(Utils.apiHeader);
    request.fields.addAll(bodyData);

    if (medicalLicense != null) {
      http.MultipartFile multipartFile =
          await http.MultipartFile.fromPath("licensFile", medicalLicense!.path);
      request.files.add(
        multipartFile,
      );
    }
    if (tradeLicense != null) {
      http.MultipartFile multipartFile1 =
          await http.MultipartFile.fromPath("tradeFile", tradeLicense!.path);
      request.files.add(multipartFile1);
    }
    if (trn != null) {
      http.MultipartFile multipartFile2 =
          await http.MultipartFile.fromPath("TRNFile", trn!.path);
      request.files.add(multipartFile2);
    }
    if (noOfDevice != null) {
      http.MultipartFile multipartFile3 =
          await http.MultipartFile.fromPath("devicesFile", noOfDevice!.path);
      request.files.add(multipartFile3);
    }

    http.StreamedResponse response = await request.send();

    final res = await http.Response.fromStream(response);

    Utils.logAPIResponse(
        apiName: ApiServices.editLabAdditionalDetails,
        body: request.fields,
        function: "updateAdditionalDetails",
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
        tradeLicense = File(pickedImage2.path);
      }
    });
  }

  Future<void> _pickImage3() async {
    final picker = ImagePicker();
    final pickedImage3 = await picker.pickImage(source: ImageSource.gallery);
    setState(() {
      if (pickedImage3 != null) {
        trn = File(pickedImage3.path);
      }
    });
  }

  Future<void> _pickImage4() async {
    final picker = ImagePicker();
    final pickedImage4 = await picker.pickImage(source: ImageSource.gallery);
    setState(() {
      if (pickedImage4 != null) {
        noOfDevice = File(pickedImage4.path);
      }
    });
  }
}
