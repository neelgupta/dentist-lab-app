// ignore_for_file: unrelated_type_equality_checks

import 'dart:convert';

import 'package:dentalapp/models/lab_profile.dart';
import 'package:dentalapp/services/lab_service/lab_profile_service.dart';
import 'package:dentalapp/util/utils.dart';
import 'package:flutter/material.dart';
import 'dart:io';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart';
import 'package:image_picker/image_picker.dart';

import 'edit_profile_screen.dart';

class PublicProfileScreen extends StatefulWidget {
  const PublicProfileScreen({Key? key}) : super(key: key);

  @override
  State<PublicProfileScreen> createState() => _PublicProfileScreenState();
}

class _PublicProfileScreenState extends State<PublicProfileScreen> {
  String? profile;
  bool isLoading = true;

  LabProfile labProfile = LabProfile();
  LabProfileModel? labProfileData;

  static Future<String> pickImages(ImageSource imageSource) async {
    ImagePicker imagePicker = ImagePicker();
    XFile? file = await imagePicker.pickImage(source: imageSource);
    if (file != null) {
      return file.path;
    } else {
      return "";
    }
  }

  bool isLabDetails = false;

  void showAboutLab() {
    setState(() {
      isLabDetails = !isLabDetails;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    labGetProfileData();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        body: isLoading
            ? Center(
                child: loader(),
              )
            : SizedBox(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Align(
                            alignment: Alignment.bottomLeft,
                            child: Icon(Icons.keyboard_backspace,
                                color: Colors.black)),
                        Stack(
                          alignment: Alignment.center,
                          children: [
                            Align(
                              alignment: Alignment.center,
                              child: Container(
                                alignment: Alignment.center,
                                height: height * 0.22,
                                width: width * 0.22,
                                decoration: BoxDecoration(
                                    image: profile != null
                                        ? DecorationImage(
                                            fit: BoxFit.cover,
                                            image: FileImage(File(profile!)))
                                        : const DecorationImage(
                                            image: AssetImage(
                                                "assets/image/profileBG.png")),
                                    shape: BoxShape.circle,
                                    color: Color(0xFFEBEFEE)),
                                child: profile == null
                                    ? Text("N",
                                        style: GoogleFonts.lato(
                                            fontSize: 24,
                                            fontWeight: FontWeight.w600,
                                            color: const Color(0xFF116D6E)))
                                    : const SizedBox(),
                              ),
                            ),
                            Positioned(
                              top: height * 0.105,
                              left: width * 0.47,
                              child: InkWell(
                                onTap: () {
                                  Openbottomsheet();
                                },
                                child: Container(
                                  height: height * 0.080,
                                  width: width * 0.080,
                                  decoration: const BoxDecoration(
                                      color: Color(0xFF116D6E),
                                      shape: BoxShape.circle,
                                      image: DecorationImage(
                                          image: AssetImage(
                                              "assets/image/imagepickicon.png"))),
                                ),
                              ),
                            )
                          ],
                        ),
                        SizedBox(
                          height: height * 0.04,
                        ),
                        Row(
                          children: [
                            Text(
                              "Profile Info",
                              style: GoogleFonts.lato(
                                  fontSize: 18, fontWeight: FontWeight.w600),
                            ),
                            const Spacer(),
                            InkWell(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            const EditProfileScreen(),
                                      ));
                                },
                                child: Text(
                                  "Edit",
                                  style: GoogleFonts.lato(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600,
                                      color: const Color(0xFF116D6E)),
                                )),
                          ],
                        ),
                        SizedBox(
                          height: height * 0.025,
                        ),
                        Text(
                          "First Name",
                          style: GoogleFonts.lato(
                              fontSize: 13,
                              fontWeight: FontWeight.w400,
                              color: const Color(0xFF707070)),
                        ),
                        SizedBox(
                          height: height * 0.007,
                        ),
                        Text(
                          labProfileData!.labData![0].userDetails![0].firstName ?? "",
                          style: GoogleFonts.lato(
                              fontSize: 15, fontWeight: FontWeight.w500),
                        ),
                        SizedBox(
                          height: height * 0.020,
                        ),
                        Text(
                          "Last Name",
                          style: GoogleFonts.lato(
                              fontSize: 13,
                              fontWeight: FontWeight.w400,
                              color: const Color(0xFF707070)),
                        ),
                        SizedBox(
                          height: height * 0.007,
                        ),
                        Text(
                          labProfileData!.labData![0].userDetails![0].lastName ?? "",
                          style: GoogleFonts.lato(
                              fontSize: 15, fontWeight: FontWeight.w500),
                        ),
                        SizedBox(
                          height: height * 0.020,
                        ),
                        Text(
                          "Email",
                          style: GoogleFonts.lato(
                              fontSize: 13,
                              fontWeight: FontWeight.w400,
                              color: const Color(0xFF707070)),
                        ),
                        SizedBox(
                          height: height * 0.007,
                        ),
                        Text(
                          labProfileData!.labData![0].userDetails![0].email ??
                              "",
                          style: GoogleFonts.lato(
                              fontSize: 15, fontWeight: FontWeight.w500),
                        ),
                        SizedBox(
                          height: height * 0.020,
                        ),
                        const Divider(
                          thickness: 1,
                          color: Color(0xFFE7E7E7),
                        ),
                        SizedBox(
                          height: height * 0.020,
                        ),
                        Row(
                          children: [
                            Text(
                              "About Lab",
                              style: GoogleFonts.lato(
                                  fontSize: 18, fontWeight: FontWeight.w600),
                            ),
                            const Spacer(),
                            InkWell(
                                onTap: () {
                                  showAboutLab();
                                },
                                child: !isLabDetails
                                    ? const Icon(Icons.expand_more_rounded)
                                    : const Icon(Icons.expand_less_rounded))
                          ],
                        ),
                        Visibility(
                          visible: isLabDetails,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: height * 0.020,
                              ),
                              Text(
                                'Lab Name',
                                style: GoogleFonts.lato(
                                    fontSize: 13,
                                    fontWeight: FontWeight.w400,
                                    color: const Color(0xFF707070)),
                              ),
                              SizedBox(
                                height: height * 0.007,
                              ),
                              Text(
                                labProfileData!.labData![0].labName ??"",
                                style: GoogleFonts.lato(
                                    fontSize: 15, fontWeight: FontWeight.w500),
                              ),
                              SizedBox(
                                height: height * 0.020,
                              ),
                              Text(
                                'Mobile Number',
                                style: GoogleFonts.lato(
                                    fontSize: 13,
                                    fontWeight: FontWeight.w400,
                                    color: const Color(0xFF707070)),
                              ),
                              SizedBox(
                                height: height * 0.007,
                              ),
                              Text(
                                labProfileData!.labData![0].mobileNumber.toString(),
                                style: GoogleFonts.lato(
                                    fontSize: 15, fontWeight: FontWeight.w500),
                              ),
                              SizedBox(
                                height: height * 0.020,
                              ),
                              Text(
                                "Land Line Number",
                                style: GoogleFonts.lato(
                                    fontSize: 13,
                                    fontWeight: FontWeight.w400,
                                    color: const Color(0xFF707070)),
                              ),
                              SizedBox(
                                height: height * 0.007,
                              ),
                              Text(
                                "12345 67890",
                                style: GoogleFonts.lato(
                                    fontSize: 15, fontWeight: FontWeight.w500),
                              ),
                              SizedBox(
                                height: height * 0.020,
                              ),
                              Text(
                                "Email",
                                style: GoogleFonts.lato(
                                    fontSize: 13,
                                    fontWeight: FontWeight.w400,
                                    color: const Color(0xFF707070)),
                              ),
                              SizedBox(
                                height: height * 0.007,
                              ),
                              Text(
                                labProfileData!
                                        .labData![0].userDetails![0].email ??
                                    "",
                                style: GoogleFonts.lato(
                                    fontSize: 15, fontWeight: FontWeight.w500),
                              ),
                              SizedBox(
                                height: height * 0.020,
                              ),
                              const Divider(
                                thickness: 1,
                                color: Color(0xFFE7E7E7),
                              ),
                              SizedBox(
                                height: height * 0.020,
                              ),
                              Text(
                                "Description",
                                style: GoogleFonts.lato(
                                    fontSize: 18, fontWeight: FontWeight.w600),
                              ),
                              SizedBox(
                                height: height * 0.020,
                              ),
                              Text(
                                  labProfileData!.labData![0].description ?? "",
                                  style: GoogleFonts.lato(
                                      fontSize: 13,
                                      fontWeight: FontWeight.w400,
                                      color: const Color(0xFF707070)),
                                  maxLines: 5,
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.start),
                              SizedBox(
                                height: height * 0.025,
                              ),
                              Row(
                                children: [
                                  Text(
                                    "Delivery Methods",
                                    style: GoogleFonts.lato(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600),
                                  ),
                                  const Spacer(),
                                  Text(
                                    labProfileData!
                                            .labData![0].deliveryMethod ??
                                        "",
                                    style: GoogleFonts.lato(
                                        fontSize: 13,
                                        fontWeight: FontWeight.w400,
                                        color: const Color(0xFF707070)),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: height * 0.015,
                              ),
                              Row(
                                children: [
                                  Text(
                                    "Payment Methods",
                                    style: GoogleFonts.lato(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600),
                                  ),
                                  const Spacer(),
                                  Text(
                                    labProfileData!.labData![0].paymentMethod ??
                                        "",
                                    style: GoogleFonts.lato(
                                        fontSize: 13,
                                        fontWeight: FontWeight.w400,
                                        color: const Color(0xFF707070)),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: height * 0.020,
                              ),
                              const Divider(
                                thickness: 1,
                                color: Color(0xFFE7E7E7),
                              ),
                              SizedBox(
                                height: height * 0.020,
                              ),
                              Text(
                                "Working time",
                                style: GoogleFonts.lato(
                                    fontSize: 18, fontWeight: FontWeight.w600),
                              ),
                              SizedBox(
                                height: height * 0.015,
                              ),
                              Row(
                                children: [
                                  Text(
                                    labProfileData!.labData![0].workingHours![0]
                                            .dayDetails![0].day ??
                                        '',
                                    style: GoogleFonts.lato(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400),
                                  ),
                                  const Spacer(),
                                  labProfileData!.labData![0].workingHours![0]
                                          .dayDetails![0].isOpen==true? Text(
                                          "${labProfileData!.labData![0].workingHours![0].dayDetails![0].startTime}-${labProfileData!.labData![0].workingHours![0].dayDetails![0].endTime}",
                                          style: GoogleFonts.lato(
                                              fontSize: 14,
                                              fontWeight: FontWeight.w400,
                                              color: const Color(0xFF707070)),
                                        )
                                      : Text(
                                          "Close",
                                          style: GoogleFonts.lato(
                                              fontSize: 14,
                                              fontWeight: FontWeight.w400,
                                              color: const Color(0xFF707070)),
                                        )
                                ],
                              ),
                              SizedBox(
                                height: height * 0.015,
                              ),
                              Row(
                                children: [
                                  Text(
                                    labProfileData!.labData![0].workingHours![0]
                                            .dayDetails![1].day ??
                                        '',
                                    style: GoogleFonts.lato(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400),
                                  ),
                                  const Spacer(),
                                  labProfileData!.labData![0].workingHours![0]
                                          .dayDetails![1].isOpen==true? Text(
                                          "${labProfileData!.labData![0].workingHours![0].dayDetails![1].startTime}-${labProfileData!.labData![0].workingHours![0].dayDetails![1].endTime}",
                                          style: GoogleFonts.lato(
                                              fontSize: 14,
                                              fontWeight: FontWeight.w400,
                                              color: const Color(0xFF707070)),
                                        )
                                      : Text(
                                          "Close",
                                          style: GoogleFonts.lato(
                                              fontSize: 14,
                                              fontWeight: FontWeight.w400,
                                              color: const Color(0xFF707070)),
                                        )
                                ],
                              ),
                              SizedBox(
                                height: height * 0.015,
                              ),
                              Row(
                                children: [
                                  Text(
                                    labProfileData!.labData![0].workingHours![0]
                                            .dayDetails![2].day ??
                                        '',
                                    style: GoogleFonts.lato(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400),
                                  ),
                                  const Spacer(),
                          labProfileData!.labData![0].workingHours![0]
                                      .dayDetails![2].isOpen==true?
                                    Text(
                                      "${labProfileData!.labData![0].workingHours![0].dayDetails![2].startTime}-${labProfileData!.labData![0].workingHours![0].dayDetails![2].endTime}",
                                      style: GoogleFonts.lato(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w400,
                                          color: const Color(0xFF707070)),
                                    )
                                  :
                                    Text(
                                      "Close",
                                      style: GoogleFonts.lato(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w400,
                                          color: const Color(0xFF707070)),
                                    )
                                ],
                              ),
                              SizedBox(
                                height: height * 0.015,
                              ),
                              Row(
                                children: [
                                  Text(
                                    labProfileData!.labData![0].workingHours![0]
                                            .dayDetails![3].day ??
                                        '',
                                    style: GoogleFonts.lato(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400),
                                  ),
                                  const Spacer(),
                                  labProfileData!.labData![0].workingHours![0]
                                          .dayDetails![3].isOpen==true? Text(
                                          "${labProfileData!.labData![0].workingHours![0].dayDetails![3].startTime}-${labProfileData!.labData![0].workingHours![0].dayDetails![3].endTime}",
                                          style: GoogleFonts.lato(
                                              fontSize: 14,
                                              fontWeight: FontWeight.w400,
                                              color: const Color(0xFF707070)),
                                        )
                                      : Text(
                                          "Close",
                                          style: GoogleFonts.lato(
                                              fontSize: 14,
                                              fontWeight: FontWeight.w400,
                                              color: const Color(0xFF707070)),
                                        )
                                ],
                              ),
                              SizedBox(
                                height: height * 0.015,
                              ),
                              Row(
                                children: [
                                  Text(
                                    labProfileData!.labData![0].workingHours![0]
                                            .dayDetails![4].day ??
                                        '',
                                    style: GoogleFonts.lato(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400),
                                  ),
                                  const Spacer(),
                                  labProfileData!.labData![0].workingHours![0]
                                          .dayDetails![4].isOpen ==true? Text(
                                          "${labProfileData!.labData![0].workingHours![0].dayDetails![4].startTime}-${labProfileData!.labData![0].workingHours![0].dayDetails![4].endTime}",
                                          style: GoogleFonts.lato(
                                              fontSize: 14,
                                              fontWeight: FontWeight.w400,
                                              color: const Color(0xFF707070)),
                                        )
                                      : Text(
                                          "Close",
                                          style: GoogleFonts.lato(
                                              fontSize: 14,
                                              fontWeight: FontWeight.w400,
                                              color: const Color(0xFF707070)),
                                        )
                                ],
                              ),
                              SizedBox(
                                height: height * 0.015,
                              ),
                              Row(
                                children: [
                                  Text(
                                    labProfileData!.labData![0].workingHours![0]
                                            .dayDetails![5].day ??
                                        '',
                                    style: GoogleFonts.lato(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400),
                                  ),
                                  const Spacer(),
                                  labProfileData!.labData![0].workingHours![0]
                                          .dayDetails![5].isOpen==true? Text(
                                          "${labProfileData!.labData![0].workingHours![0].dayDetails![5].startTime}-${labProfileData!.labData![0].workingHours![0].dayDetails![5].endTime}",
                                          style: GoogleFonts.lato(
                                              fontSize: 14,
                                              fontWeight: FontWeight.w400,
                                              color: const Color(0xFF707070)),
                                        )
                                      : Text(
                                          "Close",
                                          style: GoogleFonts.lato(
                                              fontSize: 14,
                                              fontWeight: FontWeight.w400,
                                              color: const Color(0xFF707070)),
                                        )
                                ],
                              ),
                              SizedBox(
                                height: height * 0.015,
                              ),
                              Row(
                                children: [
                                  Text(
                                    labProfileData!.labData![0].workingHours![0]
                                            .dayDetails![6].day ??
                                        '',
                                    style: GoogleFonts.lato(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400),
                                  ),
                                  const Spacer(),
                                  labProfileData!.labData![0].workingHours![0]
                                          .dayDetails![6].isOpen ==true? Text(
                                          "${labProfileData!.labData![0].workingHours![0].dayDetails![6].startTime}-${labProfileData!.labData![0].workingHours![0].dayDetails![6].endTime}",
                                          style: GoogleFonts.lato(
                                              fontSize: 14,
                                              fontWeight: FontWeight.w400,
                                              color: const Color(0xFF707070)),
                                        )
                                      : Text(
                                          "Close",
                                          style: GoogleFonts.lato(
                                              fontSize: 14,
                                              fontWeight: FontWeight.w400,
                                              color: const Color(0xFF707070)),
                                        )
                                ],
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: height * 0.020,
                        ),
                        const Divider(
                          thickness: 1,
                          color: Color(0xFFE7E7E7),
                        ),
                        SizedBox(
                          height: height * 0.020,
                        ),
                        Text(
                          "Services",
                          style: GoogleFonts.lato(
                              fontSize: 18, fontWeight: FontWeight.w600),
                        ),
                        SizedBox(
                          height: height * 0.020,
                        ),
                        SizedBox(
                          height: height * 0.26,
                          child: labProfileData!.labData![0].labServices!.isEmpty ? Center(child: Text("No List data"),) :  ListView.builder(
                            itemCount:
                                labProfileData!.labData![0].labServices!.length,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: width * 0.015),
                                child: Container(
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius:
                                        BorderRadius.circular(12)),
                                    child: Column(
                                      crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          height: height * 0.18,
                                          width: width * 0.38,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                              BorderRadius.circular(8),
                                              image: DecorationImage(
                                                  image: NetworkImage(
                                                      labProfileData!
                                                          .labData![0]
                                                          .labServices![
                                                      index]
                                                          .serviceImags![
                                                      index] ??''),
                                                  fit: BoxFit.cover)),
                                        ),
                                        SizedBox(
                                          height: height * 0.012,
                                        ),
                                        Text(
                                          labProfileData!.labData![0]
                                              .labServices![index].title ??
                                              '',
                                          style: GoogleFonts.lato(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w600,
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                        SizedBox(
                                          height: height * 0.008,
                                        ),
                                        Text(
                                            labProfileData!.labData![0]
                                                .labServices![index].price
                                                .toString(),
                                            style: GoogleFonts.lato(
                                                fontSize: 13,
                                                fontWeight: FontWeight.w400,
                                                color:
                                                const Color(0xFF707070))),
                                      ],
                                    )),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
      ),
    );
  }

  Openbottomsheet() {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return showModalBottomSheet(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      context: context,
      builder: (context) {
        return Container(
          width: width,
          height: MediaQuery.of(context).size.height * 0.37,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: const Color(0xFFF5F7FF),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(
                horizontal: width * 0.040, vertical: height * 0.020),
            child: Column(
              children: [
                InkWell(
                  onTap: () async {
                    Navigator.pop(context);
                    String imagePath = await pickImages(ImageSource.gallery);
                    if (imagePath.isNotEmpty) {
                      setState(() {
                        profile = imagePath;
                      });
                      print(imagePath);
                    }
                  },
                  child: Row(
                    children: [
                      Container(
                        height: 50,
                        width: 50,
                        decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: Color(0xFFEBEFEE),
                            image: DecorationImage(
                                image: AssetImage(
                                    "assets/image/galleryImage.png"))),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Text(
                        "Choose from gallery",
                        style: GoogleFonts.lato(
                            fontSize: 18, fontWeight: FontWeight.w600),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: height * 0.020,
                ),
                const Divider(
                  color: Color(0xFFE7E7E7),
                  thickness: 1,
                ),
                SizedBox(
                  height: height * 0.020,
                ),
                InkWell(
                  onTap: () async {
                    Navigator.pop(context);
                    String imagePath = await pickImages(ImageSource.camera);
                    if (imagePath.isNotEmpty) {
                      setState(() {
                        profile = imagePath;
                      });
                    }
                  },
                  child: Row(
                    children: [
                      Container(
                        height: 50,
                        width: 50,
                        decoration: const BoxDecoration(
                            color: Color(0xFFEBEFEE),
                            shape: BoxShape.circle,
                            image: DecorationImage(
                                image: AssetImage(
                                    "assets/image/cameraProfile.png"))),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Text(
                        "Take photo",
                        style: GoogleFonts.lato(
                            fontSize: 18, fontWeight: FontWeight.w600),
                      )
                    ],
                  ),
                ),
                const Spacer(),
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: const Color(0xFF414141))),
                  child: TextButton(
                    onPressed: () {},
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: width * 0.35),
                      child: Text(
                        "Cancel",
                        style: GoogleFonts.lato(
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                            color: const Color(0xFF414141)),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }

  labGetProfileData() async {
    Response response = await labProfile.getLabProfile();


    var resBody = jsonDecode(response.body);
    if(resBody["status"] == 200){

    if (response.statusCode == 200) {
      labProfileData = LabProfileModel.fromJson(jsonDecode(response.body));
    }
    }else{
      Utils.showErrorToast(resBody["message"]);
    }
    isLoading = false;
    setState(() {});
  }
}
