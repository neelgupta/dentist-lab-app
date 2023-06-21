// ignore_for_file: unrelated_type_equality_checks, use_build_context_synchronously

import 'dart:convert';

import 'package:dentalapp/models/lab_profile.dart';
import 'package:dentalapp/screen/bottom_navigation_bar_screen.dart';
import 'package:dentalapp/services/lab_service/lab_profile_service.dart';
import 'package:dentalapp/util/utils.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'dart:io';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

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
  bool isAdditionalEnable = false;

  @override
  void initState() {
    super.initState();
    labGetProfileData();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return WillPopScope(
      onWillPop: goBack,
      child: SafeArea(
        child: Scaffold(
          body: isLoading
              ? Center(
                  child: loader(),
                )
              : labProfileData == null
                  ? const Center(
                      child: Text("No Data Found !! \n\n Please Try Again"),
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
                              Align(
                                  alignment: Alignment.bottomLeft,
                                  child: InkWell(
                                    onTap: () {
                                      goBack();
                                    },
                                    child: const Icon(Icons.keyboard_backspace,
                                        color: Colors.black),
                                  )),
                              Align(
                                alignment: Alignment.center,
                                child: SizedBox(
                                  height: width * 0.22,
                                  width: width * 0.22,
                                  child: Stack(
                                    alignment: Alignment.bottomRight,
                                    children: [
                                      Align(
                                        alignment: Alignment.center,
                                        child: Container(
                                          alignment: Alignment.center,
                                          height: width * 0.22,
                                          width: width * 0.22,
                                          decoration: BoxDecoration(
                                              image: profile != null
                                                  ? DecorationImage(
                                                      fit: BoxFit.cover,
                                                      image: FileImage(
                                                          File(profile!)))
                                                  : DecorationImage(
                                                      image: NetworkImage(
                                                          labProfileData!
                                                                  .labData![0]
                                                                  .userDetails![
                                                                      0]
                                                                  .profileImage ??
                                                              ""),
                                                      fit: BoxFit.fill),
                                              shape: BoxShape.circle,
                                              color: const Color(0xFFEBEFEE)),
                                        ),
                                      ),
                                      InkWell(
                                        onTap: () {
                                          openBottomSheet();
                                        },
                                        child: Container(
                                          height: width * 0.07,
                                          width: width * 0.07,
                                          decoration: const BoxDecoration(
                                              color: Color(0xFF116D6E),
                                              shape: BoxShape.circle,
                                              image: DecorationImage(
                                                  image: AssetImage(
                                                      "assets/image/imagepickicon.png"))),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: height * 0.04,
                              ),
                              Row(
                                children: [
                                  Text(
                                    "Profile Info",
                                    style: GoogleFonts.lato(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w600),
                                  ),
                                  const Spacer(),
                                  InkWell(
                                      onTap: () {
                                        Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                  builder: (context) =>
                                                      EditProfileScreen(
                                                          userDetails:
                                                              labProfileData!
                                                                  .labData![0]
                                                                  .userDetails![0]),
                                                ))
                                            .then(
                                                (value) => labGetProfileData());
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
                                labProfileData!.labData![0].userDetails![0]
                                        .firstName ??
                                    "",
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
                                labProfileData!
                                        .labData![0].userDetails![0].lastName ??
                                    "",
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
                              Row(
                                children: [
                                  Text(
                                    "About Lab",
                                    style: GoogleFonts.lato(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w600),
                                  ),
                                  const Spacer(),
                                  InkWell(
                                      onTap: () {
                                        setState(() {
                                          isLabDetails = !isLabDetails;
                                        });
                                      },
                                      child: !isLabDetails
                                          ? const Icon(
                                              Icons.expand_more_rounded)
                                          : const Icon(
                                              Icons.expand_less_rounded))
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
                                      labProfileData!.labData![0].labName ?? "",
                                      style: GoogleFonts.lato(
                                          fontSize: 15,
                                          fontWeight: FontWeight.w500),
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
                                      "${labProfileData!.labData![0].countryCode} ${labProfileData!.labData![0].mobileNumber.toString()}",
                                      style: GoogleFonts.lato(
                                          fontSize: 15,
                                          fontWeight: FontWeight.w500),
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
                                      labProfileData!.labData![0].landLineNumber
                                          .toString(),
                                      style: GoogleFonts.lato(
                                          fontSize: 15,
                                          fontWeight: FontWeight.w500),
                                    ),
                                    SizedBox(
                                      height: height * 0.020,
                                    ),
                                    Text(
                                      "Country",
                                      style: GoogleFonts.lato(
                                          fontSize: 13,
                                          fontWeight: FontWeight.w400,
                                          color: const Color(0xFF707070)),
                                    ),
                                    SizedBox(
                                      height: height * 0.007,
                                    ),
                                    Text(
                                      labProfileData!.labData![0].country ??
                                          "",
                                      style: GoogleFonts.lato(
                                          fontSize: 15,
                                          fontWeight: FontWeight.w500),
                                    ),
                                    SizedBox(
                                      height: height * 0.020,
                                    ),
                                    Text(
                                      "City",
                                      style: GoogleFonts.lato(
                                          fontSize: 13,
                                          fontWeight: FontWeight.w400,
                                          color: const Color(0xFF707070)),
                                    ),
                                    SizedBox(
                                      height: height * 0.007,
                                    ),
                                    Text(
                                      labProfileData!.labData![0]
                                          .city ??
                                          "",
                                      style: GoogleFonts.lato(
                                          fontSize: 15,
                                          fontWeight: FontWeight.w500),
                                    ),
                                    SizedBox(
                                      height: height * 0.020,
                                    ),
                                    Text(
                                      "Address",
                                      style: GoogleFonts.lato(
                                          fontSize: 13,
                                          fontWeight: FontWeight.w400,
                                          color: const Color(0xFF707070)),
                                    ),
                                    SizedBox(
                                      height: height * 0.007,
                                    ),
                                    Text(
                                      labProfileData!.labData![0]
                                          .address ??
                                          "",
                                      style: GoogleFonts.lato(
                                          fontSize: 15,
                                          fontWeight: FontWeight.w500),
                                    ),
                                    SizedBox(
                                      height: height * 0.020,
                                    ),
                                    Text(
                                      "P.O.Box",
                                      style: GoogleFonts.lato(
                                          fontSize: 13,
                                          fontWeight: FontWeight.w400,
                                          color: const Color(0xFF707070)),
                                    ),
                                    SizedBox(
                                      height: height * 0.007,
                                    ),
                                    Text(
                                      labProfileData!.labData![0]
                                          .poBox ??
                                          "",
                                      style: GoogleFonts.lato(
                                          fontSize: 15,
                                          fontWeight: FontWeight.w500),
                                    ),
                                    SizedBox(
                                      height: height * 0.020,
                                    ),
                                    Text(
                                      "Date Of Establish",
                                      style: GoogleFonts.lato(
                                          fontSize: 13,
                                          fontWeight: FontWeight.w400,
                                          color: const Color(0xFF707070)),
                                    ),
                                    SizedBox(
                                      height: height * 0.007,
                                    ),
                                    Text(
                                      DateFormat("dd/MM/yyyy").format(DateTime.parse(labProfileData!.labData![0].dateOfEstablishment ??
                                          DateTime.now().toString())),
                                      style: GoogleFonts.lato(
                                          fontSize: 15,
                                          fontWeight: FontWeight.w500),
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
                                          fontSize: 18,
                                          fontWeight: FontWeight.w600),
                                    ),
                                    SizedBox(
                                      height: height * 0.015,
                                    ),
                                    Text(
                                        labProfileData!
                                                .labData![0].description ??
                                            "",
                                        style: GoogleFonts.lato(
                                            fontSize: 15,
                                            fontWeight: FontWeight.w400,
                                            color: const Color(0xFF707070)),
                                        maxLines: 5,
                                        overflow: TextOverflow.ellipsis,
                                        textAlign: TextAlign.start),
                                    SizedBox(
                                      height: height * 0.02,
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
                                          getDeliveryMethodName(),
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
                                          getPaymentMethodName(),
                                          style: GoogleFonts.lato(
                                              fontSize: 13,
                                              fontWeight: FontWeight.w400,
                                              color: const Color(0xFF707070)),
                                        ),
                                      ],
                                    ),
                                    if ((labProfileData!
                                                    .labData![0].workingHours ??
                                                [])
                                            .isNotEmpty &&
                                        (labProfileData!
                                                    .labData![0]
                                                    .workingHours![0]
                                                    .dayDetails ??
                                                [])
                                            .isNotEmpty)
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
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
                                                fontSize: 18,
                                                fontWeight: FontWeight.w600),
                                          ),
                                          SizedBox(
                                            height: height * 0.015,
                                          ),
                                          ListView.builder(
                                            physics:
                                                const NeverScrollableScrollPhysics(),
                                            shrinkWrap: true,
                                            itemCount: labProfileData!
                                                .labData![0]
                                                .workingHours![0]
                                                .dayDetails!
                                                .length,
                                            itemBuilder: (context, index) {
                                              return Container(
                                                margin: EdgeInsets.symmetric(
                                                    vertical: height * 0.008),
                                                child: Row(
                                                  children: [
                                                    Text(
                                                      labProfileData!
                                                              .labData![0]
                                                              .workingHours![0]
                                                              .dayDetails![
                                                                  index]
                                                              .day ??
                                                          "",
                                                      style: GoogleFonts.lato(
                                                          fontSize: 14,
                                                          fontWeight:
                                                              FontWeight.w400),
                                                    ),
                                                    const Spacer(),
                                                    Text(
                                                      (labProfileData!
                                                                  .labData![0]
                                                                  .workingHours![
                                                                      0]
                                                                  .dayDetails![
                                                                      index]
                                                                  .isOpen ??
                                                              false)
                                                          ? "${labProfileData!.labData![0].workingHours![0].dayDetails![index].startTime ?? ""} - ${labProfileData!.labData![0].workingHours![0].dayDetails![index].endTime ?? ""}"
                                                          : "Close",
                                                      style: GoogleFonts.lato(
                                                          fontSize: 14,
                                                          fontWeight:
                                                              FontWeight.w400,
                                                          color: const Color(
                                                              0xFF707070)),
                                                    ),
                                                  ],
                                                ),
                                              );
                                            },
                                          ),
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
                              Row(
                                children: [
                                  Text(
                                    "Additional Details",
                                    style: GoogleFonts.lato(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w600),
                                  ),
                                  const Spacer(),
                                  InkWell(
                                      onTap: () {
                                        setState(() {
                                          isAdditionalEnable = !isAdditionalEnable;
                                        });
                                      },
                                      child: !isAdditionalEnable
                                          ? const Icon(
                                          Icons.expand_more_rounded)
                                          : const Icon(
                                          Icons.expand_less_rounded))
                                ],
                              ),
                              if(isAdditionalEnable)additionalDetailsWidget(),
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
                                height: (width * 0.4 + height * 0.07),
                                child: labProfileData!
                                        .labData![0].labServices!.isEmpty
                                    ? const Center(
                                        child: Text("No Service Found !!"),
                                      )
                                    : ListView.builder(
                                        itemCount: labProfileData!
                                            .labData![0].labServices!.length,
                                        scrollDirection: Axis.horizontal,
                                        itemBuilder: (context, index) {
                                          return Card(
                                            elevation: 2,
                                            margin: EdgeInsets.symmetric(
                                                horizontal: width * 0.025),
                                            child: Container(
                                                decoration: BoxDecoration(
                                                    color: Colors.white,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            12)),
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.min,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Container(
                                                      height: width * 0.4,
                                                      width: width * 0.4,
                                                      decoration: BoxDecoration(
                                                          borderRadius:
                                                              const BorderRadius
                                                                      .vertical(
                                                                  top: Radius
                                                                      .circular(
                                                                          8)),
                                                          image: DecorationImage(
                                                              image: NetworkImage(
                                                                  labProfileData!
                                                                      .labData![
                                                                          0]
                                                                      .labServices![
                                                                          index]
                                                                      .serviceImags!
                                                                      .first),
                                                              fit: BoxFit
                                                                  .cover)),
                                                    ),
                                                    SizedBox(
                                                      height: height * 0.012,
                                                    ),
                                                    Padding(
                                                      padding: EdgeInsets.only(
                                                          left: width * 0.02),
                                                      child: Text(
                                                        labProfileData!
                                                                .labData![0]
                                                                .labServices![
                                                                    index]
                                                                .title ??
                                                            '',
                                                        maxLines: 1,
                                                        style: GoogleFonts.lato(
                                                          fontSize: 14,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                        ),
                                                        textAlign:
                                                            TextAlign.center,
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      height: height * 0.008,
                                                    ),
                                                    Padding(
                                                      padding: EdgeInsets.only(
                                                          left: width * 0.02),
                                                      child: Text(
                                                          "AED ${labProfileData!.labData![0].labServices![index].price.toString()}",
                                                          maxLines: 1,
                                                          style: GoogleFonts.lato(
                                                              fontSize: 13,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w400,
                                                              color: const Color(
                                                                  0xFF707070))),
                                                    ),
                                                    SizedBox(
                                                      height: height * 0.008,
                                                    ),
                                                  ],
                                                )),
                                          );
                                        },
                                      ),
                              ),
                              SizedBox(
                                height: height * 0.020,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
        ),
      ),
    );
  }

  Widget additionalDetailsWidget() {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Column(
      crossAxisAlignment:
      CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: height * 0.02,
        ),
        Row(
          children: [
            Text("Medical License Number",
                style: GoogleFonts.lato(
                  fontSize: 13,
                  fontWeight:
                  FontWeight.w400,
                  color: const Color(
                      0xff707070),
                )),
            const Spacer(),
            GestureDetector(
              onTap: () {

              },
              child: Text("Edit",
                  style: GoogleFonts.lato(
                    fontSize: 16,
                    fontWeight:
                    FontWeight.w400,
                    color: const Color(
                        0xff116D6E),
                  )),
            ),
          ],
        ),
        SizedBox(
          height: height * 0.012,
        ),
        Text(
            (labProfileData!.labData![0].medicalLicenseNumber ?? ""),
            style: GoogleFonts.lato(
              fontSize: 15,
              fontWeight: FontWeight.w400,
              color:
              const Color(0xff111111),
            )),
        SizedBox(
          height: height * 0.03,
        ),
        Text("Medical License",
            style: GoogleFonts.lato(
              fontSize: 15,
              fontWeight: FontWeight.w400,
              color:
              const Color(0xff707070),
            )),
        SizedBox(
          height: height * 0.01,
        ),
        DottedBorder(
          borderType: BorderType.RRect,
          dashPattern: const [3, 3, 3],
          radius:
          const Radius.circular(12),
          color: const Color(0xFF116D6E),
          child: ClipRRect(
            borderRadius:
            BorderRadius.circular(12),
            child: Container(
              height: width * 0.3,
              width:
              MediaQuery.of(context)
                  .size
                  .width,
              color:
              const Color(0xFFF5F7F7),
              child: Column(
                mainAxisAlignment:
                MainAxisAlignment
                    .center,
                crossAxisAlignment:
                CrossAxisAlignment
                    .center,
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
                        width:
                        width * 0.25,
                        height:
                        width * 0.25,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: NetworkImage(labProfileData!.labData!.first.licensFile ?? ""),
                                fit: BoxFit
                                    .fill),
                            borderRadius:
                            BorderRadius
                                .circular(
                                12)),
                      ),
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
              color:
              const Color(0xff707070),
            )),
        SizedBox(
          height: height * 0.01,
        ),
        Text(
            labProfileData!.labData!.first
                .tradeLicenceNumber ??
                "",
            style: GoogleFonts.lato(
              fontSize: 15,
              fontWeight: FontWeight.w400,
              color:
              const Color(0xff111111),
            )),
        SizedBox(
          height: height * 0.03,
        ),
        Text("Trade License",
            style: GoogleFonts.lato(
              fontSize: 15,
              fontWeight: FontWeight.w400,
              color:
              const Color(0xff707070),
            )),
        SizedBox(
          height: height * 0.01,
        ),
        DottedBorder(
          borderType: BorderType.RRect,
          dashPattern: const [3, 3, 3],
          radius:
          const Radius.circular(12),
          color: const Color(0xFF116D6E),
          child: ClipRRect(
            borderRadius:
            BorderRadius.circular(12),
            child: Container(
              height: width * 0.3,
              width:
              MediaQuery.of(context)
                  .size
                  .width,
              color:
              const Color(0xFFF5F7F7),
              child: Column(
                mainAxisAlignment:
                MainAxisAlignment
                    .center,
                crossAxisAlignment:
                CrossAxisAlignment
                    .center,
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
                        width:
                        width * 0.25,
                        height:
                        width * 0.25,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: NetworkImage(
                                    labProfileData!.labData!.first.tradeFile ??
                                        ""),
                                fit: BoxFit
                                    .fill),
                            borderRadius:
                            BorderRadius
                                .circular(
                                12)),
                      ),
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
        Text("TRN Number",
            style: GoogleFonts.lato(
              fontSize: 15,
              fontWeight: FontWeight.w400,
              color:
              const Color(0xff707070),
            )),
        SizedBox(
          height: height * 0.01,
        ),
        Text(
            labProfileData!.labData!.first.tRNNumber ??
                "",
            style: GoogleFonts.lato(
              fontSize: 15,
              fontWeight: FontWeight.w400,
              color:
              const Color(0xff111111),
            )),
        SizedBox(
          height: height * 0.03,
        ),
        Text("TRN",
            style: GoogleFonts.lato(
              fontSize: 15,
              fontWeight: FontWeight.w400,
              color:
              const Color(0xff707070),
            )),
        SizedBox(
          height: height * 0.01,
        ),
        DottedBorder(
          borderType: BorderType.RRect,
          dashPattern: const [3, 3, 3],
          radius:
          const Radius.circular(12),
          color: const Color(0xFF116D6E),
          child: ClipRRect(
            borderRadius:
            BorderRadius.circular(12),
            child: Container(
              height: width * 0.3,
              width:
              MediaQuery.of(context)
                  .size
                  .width,
              color:
              const Color(0xFFF5F7F7),
              child: Column(
                mainAxisAlignment:
                MainAxisAlignment
                    .center,
                crossAxisAlignment:
                CrossAxisAlignment
                    .center,
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
                        width:
                        width * 0.25,
                        height:
                        width * 0.25,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: NetworkImage(
                                    labProfileData!.labData!.first.tRNFile ??
                                        ""),
                                fit: BoxFit
                                    .fill),
                            borderRadius:
                            BorderRadius
                                .circular(
                                12)),
                      ),
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
        Text("Total Number of device used",
            style: GoogleFonts.lato(
              fontSize: 15,
              fontWeight: FontWeight.w400,
              color:
              const Color(0xff707070),
            )),
        SizedBox(
          height: height * 0.01,
        ),
        Text(
            labProfileData!.labData!.first.deviceUsed ??
                "",
            style: GoogleFonts.lato(
              fontSize: 15,
              fontWeight: FontWeight.w400,
              color:
              const Color(0xff111111),
            )),
        SizedBox(
          height: height * 0.03,
        ),
        Text("List of Devices",
            style: GoogleFonts.lato(
              fontSize: 15,
              fontWeight: FontWeight.w400,
              color:
              const Color(0xff707070),
            )),
        SizedBox(
          height: height * 0.01,
        ),
        DottedBorder(
          borderType: BorderType.RRect,
          dashPattern: const [3, 3, 3],
          radius:
          const Radius.circular(12),
          color: const Color(0xFF116D6E),
          child: ClipRRect(
            borderRadius:
            BorderRadius.circular(12),
            child: Container(
              height: width * 0.3,
              width:
              MediaQuery.of(context)
                  .size
                  .width,
              color:
              const Color(0xFFF5F7F7),
              child: Column(
                mainAxisAlignment:
                MainAxisAlignment
                    .center,
                crossAxisAlignment:
                CrossAxisAlignment
                    .center,
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
                        width:
                        width * 0.25,
                        height:
                        width * 0.25,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: NetworkImage(
                                    labProfileData!.labData!.first.devicesFile ??
                                        ""),
                                fit: BoxFit
                                    .fill),
                            borderRadius:
                            BorderRadius
                                .circular(
                                12)),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  openBottomSheet() {
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
                        updateProfileImage();
                      });
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
                        updateProfileImage();
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

  Future<bool> goBack() async {
    Navigator.pushAndRemoveUntil(context, MaterialPageRoute(
      builder: (context) {
        return const BottomNavigatorBarWidget(index: 0);
      },
    ), (route) => false);
    return true;
  }

  getDeliveryMethodName() {
    if (labProfileData!.labData![0].deliveryMethod == "COD") {
      return "COD";
    } else if (labProfileData!.labData![0].deliveryMethod == "paidDelivery") {
      return "Paid Delivery";
    }
  }

  getPaymentMethodName() {
    if (labProfileData!.labData![0].paymentMethod == "cash") {
      return "Cash";
    } else if (labProfileData!.labData![0].paymentMethod == "cheque") {
      return "Cheque";
    } else if (labProfileData!.labData![0].paymentMethod == "onlinePayment") {
      return "Online Payment";
    }
  }

  labGetProfileData() async {
    setState(() {
      isLoading = true;
    });
    Response response = await labProfile.getLabProfile();

    var resBody = jsonDecode(response.body);

    if (response.statusCode == 200) {
      labProfileData = LabProfileModel.fromJson(jsonDecode(response.body));
      Utils.setFirstName(
          labProfileData!.labData![0].userDetails![0].firstName ?? "");
      Utils.setLastName(
          labProfileData!.labData![0].userDetails![0].lastName ?? "");
      Utils.setProfileImage(
          labProfileData!.labData![0].userDetails![0].profileImage ?? "");
      profile = null;
    } else if (response.statusCode == 401) {
      Utils.logout(context);
    } else {
      labProfileData = null;
      Utils.showErrorToast(resBody["message"]);
    }
    isLoading = false;
    setState(() {});
  }

  updateProfileImage() async {
    Utils.showLoadingDialog(context);
    Response response = await labProfile.updateImage(profile);
    Navigator.pop(context);
    if (response.statusCode == 200) {
      labGetProfileData();
      Utils.showSuccessToast(jsonDecode(response.body)["message"]);
    } else if (response.statusCode == 401) {
      Utils.logout(context);
    } else {
      Utils.showErrorToast(jsonDecode(response.body)["message"]);
    }
  }
}
