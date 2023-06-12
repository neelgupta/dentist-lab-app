// ignore_for_file: deprecated_member_use

import 'dart:io';

import 'package:dentalapp/custom_widget/drawer.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';

class ProfileEdit extends StatefulWidget {
  const ProfileEdit({Key? key}) : super(key: key);

  @override
  State<ProfileEdit> createState() => _ProfileEditState();
}

class _ProfileEditState extends State<ProfileEdit> {
  final GlobalKey<ScaffoldState> _key = GlobalKey();
  File? _image1;
  File? _image2;
  bool showPickOption1 = true;
  bool showPickOption2 = true;
  bool isAddiTonalInfo = false;
  bool isManagerDetail = false;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height -
        MediaQuery.of(context).padding.top -
        MediaQuery.of(context).padding.bottom;
    double width = MediaQuery.of(context).size.width -
        MediaQuery.of(context).padding.right -
        MediaQuery.of(context).padding.left;
    return Scaffold(
      key: _key,
      drawer: const CustomDrawer(),
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: height * 0.3,
                width: double.infinity,
                decoration: const BoxDecoration(
                    color: Colors.white,
                    image: DecorationImage(
                        image: AssetImage("assets/image/Group 12305.png"),
                        fit: BoxFit.fitWidth,
                        alignment: Alignment.bottomCenter,
                        opacity: 0.3)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                        height: height * 0.3,
                        width: double.infinity,
                        decoration: const BoxDecoration(
                            color: Color(0xFF116D6E),
                            image: DecorationImage(
                                image:
                                    AssetImage("assets/image/Group 12305.png"),
                                fit: BoxFit.fitWidth,
                                alignment: Alignment.bottomCenter,
                                opacity: 0.3)),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                            vertical: 20,
                            horizontal: 20,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SizedBox(
                                height: height * 0.05,
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      _key.currentState!.openDrawer();
                                    },
                                    child: const Image(
                                        image: AssetImage(
                                            "assets/image/Menu.png")),
                                  ),
                                  //   Image.asset("assets/image/Menu.png"),
                                  SizedBox(
                                    width: width * 0.25,
                                  ),
                                  Stack(
                                    children: [
                                      Container(
                                        height: height * 0.1,
                                        width: 80,
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                              color: Colors.white, width: 1),
                                          shape: BoxShape.circle,
                                          color:
                                              const Color.fromRGBO(55, 255, 255, 0.5),
                                        ),
                                        child: Center(
                                            child: Text("N",
                                                style: GoogleFonts.lato(
                                                    color: Colors.white,
                                                    fontSize: 24,
                                                    fontWeight:
                                                        FontWeight.w600))),
                                      ),
                                      Positioned(
                                          bottom: 0,
                                          right: 0,
                                          child: SizedBox(
                                            height: 25,
                                            width: 25,
                                            child: Image.asset(
                                                "assets/image/profileclick.png"),
                                          ))
                                    ],
                                  ),
                                ],
                              ),
                              // SizedBox(height: 16,),

                              SizedBox(
                                height: height * 0.01,
                              ),
                              Text("User name",
                                  style: GoogleFonts.lato(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w700,
                                    color: Colors.white,
                                  )),
                              SizedBox(
                                height: height * 0.01,
                              ),
                              Text("Since 1992",
                                  style: GoogleFonts.lato(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.white,
                                  )),
                            ],
                          ),
                        )),
                  ],
                ),
              ),
              SizedBox(
                height: height * 0.03,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text("Profile Info",
                            style: GoogleFonts.lato(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: const Color(0xff111111),
                            )),
                        const Spacer(),
                        GestureDetector(
                          onTap: () {},
                          child: Text("Edit",
                              style: GoogleFonts.lato(
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                                color: const Color(0xff116D6E),
                              )),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: height * 0.03,
                    ),

                    ///Mobile Number
                    Text("Mobile Number",
                        style: GoogleFonts.lato(
                          fontSize: 13,
                          fontWeight: FontWeight.w400,
                          color: const Color(0xff707070),
                        )),
                    SizedBox(
                      height: height * 0.01,
                    ),
                    Text("1234567890",
                        style: GoogleFonts.lato(
                          fontSize: 15,
                          fontWeight: FontWeight.w400,
                          color: const Color(0xff111111),
                        )),

                    ///Lan Line
                    SizedBox(
                      height: height * 0.03,
                    ),
                    Text("Land Line Number",
                        style: GoogleFonts.lato(
                          fontSize: 13,
                          fontWeight: FontWeight.w400,
                          color: const Color(0xff707070),
                        )),
                    SizedBox(
                      height: height * 0.01,
                    ),
                    Text("1234567890",
                        style: GoogleFonts.lato(
                          fontSize: 15,
                          fontWeight: FontWeight.w400,
                          color: const Color(0xff111111),
                        )),

                    ///Email
                    SizedBox(
                      height: height * 0.03,
                    ),
                    Text("Email",
                        style: GoogleFonts.lato(
                          fontSize: 13,
                          fontWeight: FontWeight.w400,
                          color: const Color(0xff707070),
                        )),
                    SizedBox(
                      height: height * 0.01,
                    ),
                    Text("admin@gmail.com",
                        style: GoogleFonts.lato(
                          fontSize: 15,
                          fontWeight: FontWeight.w400,
                          color: const Color(0xff111111),
                        )),

                    ///Location
                    SizedBox(
                      height: height * 0.03,
                    ),
                    Text("Location",
                        style: GoogleFonts.lato(
                          fontSize: 13,
                          fontWeight: FontWeight.w400,
                          color: const Color(0xff707070),
                        )),
                    SizedBox(
                      height: height * 0.01,
                    ),
                    Text("123 - Atlanta Shopping mall, Surat, india.",
                        style: GoogleFonts.lato(
                          fontSize: 15,
                          fontWeight: FontWeight.w400,
                          color: const Color(0xff111111),
                        )),
                    Padding(
                      padding: EdgeInsets.only(
                          top: height * 0.01, bottom: height * 0.01),
                      child: const Divider(
                        thickness: 1,
                        color: Color(0xffE7E7E7),
                      ),
                    ),

                    ///ALL Additional Info
                    Row(
                      children: [
                        Text("Additional info",
                            style: GoogleFonts.lato(
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                              color: const Color(0xff111111),
                            )),
                        const Spacer(),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              isAddiTonalInfo = !isAddiTonalInfo;
                            });
                          },
                          child: Icon(
                              isAddiTonalInfo
                                  ? Icons.keyboard_arrow_down_rounded
                                  : Icons.keyboard_arrow_up_rounded,
                              size: 25,
                              color: const Color(0xff111111)),
                        ),
                      ],
                    ),

                    isAddiTonalInfo == false
                        ? const SizedBox()
                        : Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: height * 0.02,
                              ),
                              Row(
                                children: [
                                  Text("Licensing Authority",
                                      style: GoogleFonts.lato(
                                        fontSize: 13,
                                        fontWeight: FontWeight.w400,
                                        color: const Color(0xff707070),
                                      )),
                                  const Spacer(),
                                  GestureDetector(
                                    onTap: () {},
                                    child: Text("Edit",
                                        style: GoogleFonts.lato(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w400,
                                          color: const Color(0xff116D6E),
                                        )),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: height * 0.012,
                              ),
                              Text("Licensing Authority",
                                  style: GoogleFonts.lato(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w400,
                                    color: const Color(0xff111111),
                                  )),
                              SizedBox(
                                height: height * 0.03,
                              ),
                              Text("Medical License Number",
                                  style: GoogleFonts.lato(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w400,
                                    color: const Color(0xff707070),
                                  )),
                              SizedBox(
                                height: height * 0.01,
                              ),
                              Text("1234567890",
                                  style: GoogleFonts.lato(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w400,
                                    color: const Color(0xff111111),
                                  )),
                              SizedBox(
                                height: height * 0.03,
                              ),
                              DottedBorder(
                                borderType: BorderType.RRect,
                                dashPattern: const [3, 3, 3],
                                radius: const Radius.circular(12),
                                color: const Color(0xFF116D6E),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(12),
                                  child: Container(
                                    height: height * 0.13,
                                    width: MediaQuery.of(context).size.width,
                                    color: const Color(0xFFF5F7F7),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        if (_image1 != null)
                                          Align(
                                            alignment: Alignment.centerLeft,
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 10),
                                              child: Container(
                                                width: 120,
                                                height: 80,
                                                decoration: BoxDecoration(
                                                    image: DecorationImage(
                                                        image:
                                                            FileImage(_image1!),
                                                        fit: BoxFit.fill),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            12)),
                                              ),
                                            ),
                                          ),
                                        if (showPickOption1)
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
                                                          BorderRadius
                                                              .circular(50),
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
                              SizedBox(
                                height: height * 0.03,
                              ),
                              Text("Trade License Number",
                                  style: GoogleFonts.lato(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w400,
                                    color: const Color(0xff707070),
                                  )),
                              SizedBox(
                                height: height * 0.01,
                              ),
                              Text("1234567890",
                                  style: GoogleFonts.lato(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w400,
                                    color: const Color(0xff111111),
                                  )),
                              SizedBox(
                                height: height * 0.03,
                              ),
                              DottedBorder(
                                borderType: BorderType.RRect,
                                dashPattern: const [3, 3, 3],
                                radius: const Radius.circular(12),
                                color: const Color(0xFF116D6E),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(12),
                                  child: Container(
                                    height: height * 0.13,
                                    width: MediaQuery.of(context).size.width,
                                    color: const Color(0xFFF5F7F7),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        if (_image2 != null)
                                          Align(
                                            alignment: Alignment.centerLeft,
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 10),
                                              child: Container(
                                                width: 120,
                                                height: 80,
                                                decoration: BoxDecoration(
                                                    image: DecorationImage(
                                                        image:
                                                            FileImage(_image2!),
                                                        fit: BoxFit.fill),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            12)),
                                              ),
                                            ),
                                          ),
                                        if (showPickOption2)
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
                              SizedBox(
                                height: height * 0.03,
                              ),
                            ],
                          ),
                    Padding(
                      padding: EdgeInsets.only(
                          top: height * 0.015, bottom: height * 0.015),
                      child: const Divider(
                        thickness: 1,
                        color: Color(0xffE7E7E7),
                      ),
                    ),
                    Row(
                      children: [
                        Text("Manager Details",
                            style: GoogleFonts.lato(
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                              color: const Color(0xff111111),
                            )),
                        const Spacer(),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              isManagerDetail = !isManagerDetail;

                            });
                          },
                          child: Icon(
                              isManagerDetail
                                  ? Icons.keyboard_arrow_down_rounded
                                  : Icons.keyboard_arrow_up_rounded,
                              size: 25,
                              color: const Color(0xff111111)),
                        ),
                      ],
                    ),

                    ///Manager Details
                    isManagerDetail == true
                        ? Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: height * 0.02,
                              ),
                              Row(
                                children: [
                                  Text("Clinic Manager Details",
                                      style: GoogleFonts.lato(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w600,
                                        color: const Color(0xff111111),
                                      )),
                                  const Spacer(),
                                  GestureDetector(
                                    onTap: () {},
                                    child: Text("Edit",
                                        style: GoogleFonts.lato(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w400,
                                          color: const Color(0xff116D6E),
                                        )),
                                  ),
                                ],
                              ),

                              SizedBox(
                                height: height * 0.03,
                              ),
                              Text("Name",
                                  style: GoogleFonts.lato(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w400,
                                    color: const Color(0xff707070),
                                  )),
                              SizedBox(
                                height: height * 0.01,
                              ),
                              Text("Manager Name",
                                  style: GoogleFonts.lato(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w400,
                                    color: const Color(0xff111111),
                                  )),
                              SizedBox(
                                height: height * 0.02,
                              ),

                              ///Contact Number
                              Text("Contact Number",
                                  style: GoogleFonts.lato(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w400,
                                    color: const Color(0xff707070),
                                  )),
                              SizedBox(
                                height: height * 0.01,
                              ),
                              Text("1234567890",
                                  style: GoogleFonts.lato(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w400,
                                    color: const Color(0xff111111),
                                  )),
                              SizedBox(
                                height: height * 0.02,
                              ),

                              ///Email
                              Text("Email",
                                  style: GoogleFonts.lato(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w400,
                                    color: const Color(0xff707070),
                                  )),
                              SizedBox(
                                height: height * 0.01,
                              ),
                              Text("Manager@gmail.com",
                                  style: GoogleFonts.lato(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w400,
                                    color: const Color(0xff111111),
                                  )),

                              ///License
                              SizedBox(
                                height: height * 0.02,
                              ),
                              Text("License Number",
                                  style: GoogleFonts.lato(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w400,
                                    color: const Color(0xff707070),
                                  )),
                              SizedBox(
                                height: height * 0.01,
                              ),
                              Text("1234567890",
                                  style: GoogleFonts.lato(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w400,
                                    color: const Color(0xff111111),
                                  )),
                              SizedBox(
                                height: height * 0.03,
                              ),
                              DottedBorder(
                                borderType: BorderType.RRect,
                                dashPattern: const [3, 3, 3],
                                radius: const Radius.circular(12),
                                color: const Color(0xFF116D6E),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(12),
                                  child: Container(
                                    height: height * 0.13,
                                    width: MediaQuery.of(context).size.width,
                                    color: const Color(0xFFF5F7F7),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        if (_image1 != null)
                                          Align(
                                            alignment: Alignment.centerLeft,
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 10),
                                              child: Container(
                                                width: 120,
                                                height: 80,
                                                decoration: BoxDecoration(
                                                    image: DecorationImage(
                                                        image:
                                                            FileImage(_image1!),
                                                        fit: BoxFit.fill),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            12)),
                                              ),
                                            ),
                                          ),
                                        if (showPickOption1)
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
                                                          BorderRadius
                                                              .circular(50),
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
                              SizedBox(
                                height: height * 0.015,
                              ),
                              const Divider(
                                thickness: 1,
                                color: Color(0xffE7E7E7),
                              ),
                              SizedBox(
                                height: height * 0.02,
                              ),
                              Row(
                                children: [
                                  Text("Financial Manager Details",
                                      style: GoogleFonts.lato(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w600,
                                        color: const Color(0xff111111),
                                      )),
                                  const Spacer(),
                                  GestureDetector(
                                    onTap: () {},
                                    child: Text("Edit",
                                        style: GoogleFonts.lato(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w400,
                                          color: const Color(0xff116D6E),
                                        )),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: height * 0.02,
                              ),
                              Text("Name",
                                  style: GoogleFonts.lato(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w400,
                                    color: const Color(0xff707070),
                                  )),
                              SizedBox(
                                height: height * 0.01,
                              ),
                              Text("Financial Manager Name",
                                  style: GoogleFonts.lato(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w400,
                                    color: const Color(0xff111111),
                                  )),
                              SizedBox(
                                height: height * 0.02,
                              ),
                              Text("Contact Number",
                                  style: GoogleFonts.lato(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w400,
                                    color: const Color(0xff707070),
                                  )),
                              SizedBox(
                                height: height * 0.01,
                              ),
                              Text("1234567890",
                                  style: GoogleFonts.lato(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w400,
                                    color: const Color(0xff111111),
                                  )),
                              SizedBox(
                                height: height * 0.02,
                              ),
                              Text("Email",
                                  style: GoogleFonts.lato(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w400,
                                    color: const Color(0xff707070),
                                  )),
                              SizedBox(
                                height: height * 0.01,
                              ),
                              Text("Manager@gmail.com",
                                  style: GoogleFonts.lato(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w400,
                                    color: const Color(0xff111111),
                                  )),
                            ],
                          )
                        : const SizedBox(),
                    Padding(
                      padding: EdgeInsets.only(top: height * 0.01),
                      child: const Divider(
                        thickness: 1,
                        color: Color(0xffE7E7E7),
                      ),
                    ),
                    SizedBox(
                      height: height * 0.02,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _pickImage1() async {
    final picker = ImagePicker();
    final pickedImage1 = await picker.getImage(source: ImageSource.gallery);
    setState(() {
      if (pickedImage1 != null) {
        _image1 = File(pickedImage1.path);
        showPickOption1 = false;
      }
      // imageFile = pickedImage;
    });
  }

  Future<void> _pickImage2() async {
    final picker = ImagePicker();
    final pickedImage2 = await picker.getImage(source: ImageSource.gallery);
    setState(() {
      if (pickedImage2 != null) {
        _image2 = File(pickedImage2.path);
        showPickOption2 = false;
      }
      // imageFile = pickedImage;
    });
  }
}
