import 'package:dentalapp/models/clinic_profile.dart';
import 'package:flutter/material.dart';
import 'dart:io';
import 'package:dentalapp/util/utils.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';

class EditAdditionalInfo extends StatefulWidget {
  final Data data;
  const EditAdditionalInfo({super.key, required this.data});

  @override
  State<EditAdditionalInfo> createState() => _EditAdditionalInfoState();
}

class _EditAdditionalInfoState extends State<EditAdditionalInfo> {
  final formKey = GlobalKey<FormState>();
  var autoValidate = AutovalidateMode.disabled;
  TextEditingController licenseAuthorityController = TextEditingController();
  TextEditingController medicalLicenseController = TextEditingController();
  TextEditingController tradeLicenseController = TextEditingController();
  TextEditingController trnNumberController = TextEditingController();
  String medicalFile = "";
  String tradeFile = "";
  String trnFile = "";
  File? medicalLicense;
  File? tradeLicense;
  File? trn;

  bool isLoading = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    licenseAuthorityController.text = widget.data.licensingAuthority ?? "";
    medicalLicenseController.text = widget.data.medicalLicenseNumber ?? "";
    tradeLicenseController.text = widget.data.tradeLicenceNumber ?? "";
    trnNumberController.text = widget.data.tRNNumber ?? "";
    medicalFile = widget.data.licensFile ?? "";
    tradeFile = widget.data.tradeFile ?? "";
    trnFile = widget.data.trnFile ?? "";
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
                                Text("Edit Additional Info",style: GoogleFonts.lato(fontSize: 28,fontWeight: FontWeight.w600,color: Colors.white,),),
                              ],
                            ))
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: width * 0.057, vertical: height * 0.027),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            "Edit Additional Info",
                            style: GoogleFonts.lato(
                                fontSize: 19, fontWeight: FontWeight.w600),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          TextFormField(
                            textInputAction: TextInputAction.next,
                            controller: licenseAuthorityController,
                            validator: (value) {
                              if(value!.isEmpty) {
                                return 'Please Enter Licensing Authority';
                              }
                              return null;
                            },
                            keyboardType: TextInputType.name,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12),
                                  borderSide:
                                  const BorderSide(color: Color(0xFF707070))),
                              labelText: 'Licensing Authority',
                              hintText: 'Licensing Authority',
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
                            textInputAction: TextInputAction.next,
                            controller: medicalLicenseController,
                            keyboardType: TextInputType.name,
                            validator: (value) {
                              if(value!.isEmpty) {
                                return 'Please Enter Medical License Number';
                              }
                              return null;
                            },
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12),
                                  borderSide:
                                  const BorderSide(color: Color(0xFF707070))),
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
                          const SizedBox(height: 10,),
                          DottedBorder(
                            borderType: BorderType.RRect,
                            dashPattern: [3, 3, 3],
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
                                  crossAxisAlignment: CrossAxisAlignment.center,
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
                                                alignment: Alignment.centerLeft,
                                                child: Padding(
                                                  padding: EdgeInsets.symmetric(
                                                      horizontal: width * 0.02),
                                                  child: Container(
                                                    width: width * 0.25,
                                                    height: width * 0.25,
                                                    decoration: BoxDecoration(
                                                        image: DecorationImage(
                                                            image: FileImage(medicalLicense!),
                                                            fit: BoxFit.fill),
                                                        borderRadius:
                                                        BorderRadius.circular(12)),
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
                                                  padding: EdgeInsets.all(width*0.005),
                                                  decoration: BoxDecoration(
                                                      shape: BoxShape.circle,
                                                      color: Colors.white,
                                                      border: Border.all(color: Colors.red)
                                                  ),
                                                  child: const Icon(Icons.delete_outline,size: 15,color: Colors.red,),
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
                                                alignment: Alignment.centerLeft,
                                                child: Padding(
                                                  padding: EdgeInsets.symmetric(
                                                      horizontal: width * 0.02),
                                                  child: Container(
                                                    width: width * 0.25,
                                                    height: width * 0.25,
                                                    decoration: BoxDecoration(
                                                        image: DecorationImage(
                                                            image: NetworkImage(medicalFile),
                                                            fit: BoxFit.fill),
                                                        borderRadius:
                                                        BorderRadius.circular(12)),
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
                                                  padding: EdgeInsets.all(width*0.005),
                                                  decoration: BoxDecoration(
                                                      shape: BoxShape.circle,
                                                      color: Colors.white,
                                                      border: Border.all(color: Colors.red)
                                                  ),
                                                  child: const Icon(Icons.delete_outline,size: 15,color: Colors.red,),
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                    if (medicalLicense==null && medicalFile.isEmpty)
                                      InkWell(
                                        onTap: () {
                                          _pickImage1();
                                        },
                                        child: Column(
                                          children: [
                                            Container(
                                              height: 50,
                                              width: 50,
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                  BorderRadius.circular(50),
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
                                                    fontWeight: FontWeight.w500,
                                                    color: const Color(0xFF707070)))
                                          ],
                                        ),
                                      ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          TextFormField(
                            textInputAction: TextInputAction.next,
                            controller: tradeLicenseController,
                            keyboardType: TextInputType.name,
                            validator: (value) {
                              if(value!.isEmpty) {
                                return 'Please Enter Trade License Number';
                              }
                              return null;
                            },
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12),
                                  borderSide:
                                  const BorderSide(color: Color(0xFF707070))),
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
                          const SizedBox(height: 10,),
                          DottedBorder(
                            borderType: BorderType.RRect,
                            dashPattern: [3, 3, 3],
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
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    if (tradeLicense != null)
                                      Align(
                                        alignment: Alignment.centerLeft,
                                        child: SizedBox(
                                          width: width * 0.3,
                                          height: width * 0.3,
                                          child: Stack(
                                            alignment: Alignment.topRight,
                                            children: [
                                              Align(
                                                alignment: Alignment.centerLeft,
                                                child: Padding(
                                                  padding: EdgeInsets.symmetric(
                                                      horizontal: width * 0.02),
                                                  child: Container(
                                                    width: width * 0.25,
                                                    height: width * 0.25,
                                                    decoration: BoxDecoration(
                                                        image: DecorationImage(
                                                            image: FileImage(tradeLicense!),
                                                            fit: BoxFit.fill),
                                                        borderRadius:
                                                        BorderRadius.circular(12)),
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
                                                  padding: EdgeInsets.all(width*0.005),
                                                  decoration: BoxDecoration(
                                                      shape: BoxShape.circle,
                                                      color: Colors.white,
                                                      border: Border.all(color: Colors.red)
                                                  ),
                                                  child: const Icon(Icons.delete_outline,size: 15,color: Colors.red,),
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
                                          width: width * 0.3,
                                          height: width * 0.3,
                                          child: Stack(
                                            alignment: Alignment.topRight,
                                            children: [
                                              Align(
                                                alignment: Alignment.centerLeft,
                                                child: Padding(
                                                  padding: EdgeInsets.symmetric(
                                                      horizontal: width * 0.02),
                                                  child: Container(
                                                    width: width * 0.25,
                                                    height: width * 0.25,
                                                    decoration: BoxDecoration(
                                                        image: DecorationImage(
                                                            image: NetworkImage(tradeFile),
                                                            fit: BoxFit.fill),
                                                        borderRadius:
                                                        BorderRadius.circular(12)),
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
                                                  padding: EdgeInsets.all(width*0.005),
                                                  decoration: BoxDecoration(
                                                      shape: BoxShape.circle,
                                                      color: Colors.white,
                                                      border: Border.all(color: Colors.red)
                                                  ),
                                                  child: const Icon(Icons.delete_outline,size: 15,color: Colors.red,),
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                    if (tradeLicense==null && trnFile.isEmpty)
                                      InkWell(
                                        onTap: () {
                                          _pickImage2();
                                        },
                                        child: Container(
                                          child: Column(
                                            children: [
                                              Container(
                                                height: 50,
                                                width: 50,
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                    BorderRadius.circular(50),
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
                                                      fontWeight: FontWeight.w500,
                                                      color: const Color(0xFF707070)))
                                            ],
                                          ),
                                        ),
                                      ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          TextFormField(
                            textInputAction: TextInputAction.next,
                            controller: trnNumberController,
                            keyboardType: TextInputType.name,
                            validator: (value) {
                              if(value!.isEmpty) {
                                return 'Please Enter TRN Number';
                              }
                              return null;
                            },
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12),
                                  borderSide:
                                  const BorderSide(color: Color(0xFF707070))),
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
                          const SizedBox(height: 10,),
                          DottedBorder(
                            borderType: BorderType.RRect,
                            dashPattern: [3, 3, 3],
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
                                  crossAxisAlignment: CrossAxisAlignment.center,
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
                                                alignment: Alignment.centerLeft,
                                                child: Padding(
                                                  padding: EdgeInsets.symmetric(
                                                      horizontal: width * 0.02),
                                                  child: Container(
                                                    width: width * 0.25,
                                                    height: width * 0.25,
                                                    decoration: BoxDecoration(
                                                        image: DecorationImage(
                                                            image: FileImage(trn!),
                                                            fit: BoxFit.fill),
                                                        borderRadius:
                                                        BorderRadius.circular(12)),
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
                                                  padding: EdgeInsets.all(width*0.005),
                                                  decoration: BoxDecoration(
                                                      shape: BoxShape.circle,
                                                      color: Colors.white,
                                                      border: Border.all(color: Colors.red)
                                                  ),
                                                  child: const Icon(Icons.delete_outline,size: 15,color: Colors.red,),
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
                                                alignment: Alignment.centerLeft,
                                                child: Padding(
                                                  padding: EdgeInsets.symmetric(
                                                      horizontal: width * 0.02),
                                                  child: Container(
                                                    width: width * 0.25,
                                                    height: width * 0.25,
                                                    decoration: BoxDecoration(
                                                        image: DecorationImage(
                                                            image: NetworkImage(trnFile),
                                                            fit: BoxFit.fill),
                                                        borderRadius:
                                                        BorderRadius.circular(12)),
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
                                                  padding: EdgeInsets.all(width*0.005),
                                                  decoration: BoxDecoration(
                                                      shape: BoxShape.circle,
                                                      color: Colors.white,
                                                      border: Border.all(color: Colors.red)
                                                  ),
                                                  child: const Icon(Icons.delete_outline,size: 15,color: Colors.red,),
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                    if (trn==null && trnFile.isEmpty)
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
                                                    borderRadius:
                                                    BorderRadius.circular(50),
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
                                                      fontWeight: FontWeight.w500,
                                                      color: const Color(0xFF707070)))
                                            ],
                                          ),
                                        ),
                                      ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          SizedBox(
                            height: height * 0.065,
                          ),
                          Container(
                            height: height * 0.064,
                            width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                color: const Color(0xff116D6E)),
                            child: TextButton(
                                onPressed: () {
                                  if (formKey.currentState!.validate()) {
                                    if (medicalLicense==null && medicalFile.isEmpty) {
                                      Utils.showErrorToast("Please Upload Medical License");
                                    }
                                    else if (tradeLicense==null && tradeFile.isEmpty) {
                                      Utils.showErrorToast("Please Upload Trade License");
                                    }
                                    else if(trn==null && trnFile.isEmpty) {
                                      Utils.showErrorToast("Please Upload TRN");
                                    }
                                    else {
                                      Navigator.pop(context);
                                    }
                                  } else {
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
            ),
          )),
    );
  }

  Future<void> _pickImage1() async {
    final picker = ImagePicker();
    final pickedImage1 = await picker.pickImage(source: ImageSource.gallery);
    setState(() {
      if (pickedImage1 != null) {
        medicalLicense = File(pickedImage1.path);
      }
    });
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
}
