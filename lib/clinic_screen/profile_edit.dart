// ignore_for_file: deprecated_member_use

import 'dart:convert';
import 'package:dentalapp/clinic_screen/edit_additional_info.dart';
import 'package:dentalapp/clinic_screen/edit_clinic_details.dart';
import 'package:dentalapp/clinic_screen/edit_clinic_manager_details.dart';
import 'package:dentalapp/clinic_screen/edit_profile.dart';
import 'package:dentalapp/custom_widget/drawer.dart';
import 'package:dentalapp/models/clinic_profile.dart';
import 'package:dentalapp/services/clinic_services/client_profile_service.dart';
import 'package:dentalapp/util/utils.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart';
import 'package:intl/intl.dart';

class ProfileEdit extends StatefulWidget {
  const ProfileEdit({Key? key}) : super(key: key);

  @override
  State<ProfileEdit> createState() => _ProfileEditState();
}

class _ProfileEditState extends State<ProfileEdit> {
  final GlobalKey<ScaffoldState> _key = GlobalKey();
  bool isAboutClinic = false;
  bool isAddiTonalInfo = false;
  bool isManagerDetail = false;
  bool isLoading = true;

  ClientProfile clientProfile =  ClientProfile();
  ClinicProfile? clinicProfile;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getProfileData();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height -
        MediaQuery.of(context).padding.top -
        MediaQuery.of(context).padding.bottom;
    double width = MediaQuery.of(context).size.width -
        MediaQuery.of(context).padding.right -
        MediaQuery.of(context).padding.left;
    return SafeArea(
      child: Scaffold(
        key: _key,
        drawer: const CustomDrawer(),
        body: isLoading?Center(child: loader()):SizedBox(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: clinicProfile==null?const Expanded(child: Center(child: Text("NO Data Found !!! \n\n Please Try Again"))):SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                    height: height * 0.3,
                    padding: EdgeInsets.symmetric(
                      vertical: height * 0.01,
                      horizontal: width*0.02,
                    ),
                    width: double.infinity,
                    decoration: const BoxDecoration(
                        color: Color(0xFF116D6E),
                        image: DecorationImage(
                            image:
                                AssetImage("assets/image/Group 12305.png"),
                            fit: BoxFit.fitWidth,
                            alignment: Alignment.bottomCenter,
                            opacity: 0.3)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: height * 0.01,
                        ),
                        GestureDetector(
                          onTap: () {
                            _key.currentState!.openDrawer();
                          },
                          child: const Image(
                              image: AssetImage(
                                  "assets/image/Menu.png")),
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
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

                        SizedBox(
                          height: height * 0.01,
                        ),
                        Align(
                          alignment: Alignment.center,
                          child: Text("${clinicProfile!.data!.userId!.firstName ?? ""} ${clinicProfile!.data!.userId!.lastName ?? ""}",
                              style: GoogleFonts.lato(
                                fontSize: 20,
                                fontWeight: FontWeight.w700,
                                color: Colors.white,
                              )),
                        ),
                        SizedBox(
                          height: height * 0.01,
                        ),
                        Align(
                          alignment: Alignment.center,
                          child: Text("Since ${DateFormat('yyyy').format(DateTime.parse(clinicProfile!.data!.dateOfEstablishment!))}",
                              style: GoogleFonts.lato(
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                                color: Colors.white,
                              )),
                        ),
                      ],
                    )),
                SizedBox(
                  height: height * 0.03,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: width*0.05),
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
                            onTap: () {
                              Navigator.push(context, MaterialPageRoute(builder: (context) {
                                return EditProfile(firstName: clinicProfile!.data!.userId!.firstName ?? "",lastName: clinicProfile!.data!.userId!.lastName ?? "",email: clinicProfile!.data!.userId!.email ?? "",);
                              },));
                            },
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

                      /// First Name
                      Text("First Name",
                          style: GoogleFonts.lato(
                            fontSize: 13,
                            fontWeight: FontWeight.w400,
                            color: const Color(0xff707070),
                          )),
                      SizedBox(
                        height: height * 0.005,
                      ),
                      Text(clinicProfile!.data!.userId!.firstName ?? "",
                          style: GoogleFonts.lato(
                            fontSize: 15,
                            fontWeight: FontWeight.w400,
                            color: const Color(0xff111111),
                          )),
                      SizedBox(
                        height: height * 0.025,
                      ),

                      /// Last Name
                      Text("Last Name",
                          style: GoogleFonts.lato(
                            fontSize: 13,
                            fontWeight: FontWeight.w400,
                            color: const Color(0xff707070),
                          )),
                      SizedBox(
                        height: height * 0.005,
                      ),
                      Text(clinicProfile!.data!.userId!.lastName ?? "",
                          style: GoogleFonts.lato(
                            fontSize: 15,
                            fontWeight: FontWeight.w400,
                            color: const Color(0xff111111),
                          )),
                      SizedBox(
                        height: height * 0.025,
                      ),

                      /// Email
                      Text("Email",
                          style: GoogleFonts.lato(
                            fontSize: 13,
                            fontWeight: FontWeight.w400,
                            color: const Color(0xff707070),
                          )),
                      SizedBox(
                        height: height * 0.005,
                      ),
                      Text(clinicProfile!.data!.userId!.email ?? "",
                          style: GoogleFonts.lato(
                            fontSize: 15,
                            fontWeight: FontWeight.w400,
                            color: const Color(0xff111111),
                          )),

                      Padding(
                        padding: EdgeInsets.only(
                            top: height * 0.015, bottom: height * 0.015),
                        child: const Divider(
                          thickness: 1,
                          color: Color(0xffE7E7E7),
                        ),
                      ),
                      ///About Clinic
                      InkWell(
                        onTap: (){
                          setState(() {
                            isAboutClinic = !isAboutClinic;
                          });
                        },
                        child: Row(
                          children: [
                            Text("About Clinic",
                                style: GoogleFonts.lato(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600,
                                  color: const Color(0xff111111),
                                )),
                            const Spacer(),
                            Icon(
                                !isAboutClinic
                                    ? Icons.keyboard_arrow_down_rounded
                                    : Icons.keyboard_arrow_up_rounded,
                                size: 25,
                                color: const Color(0xff111111)),
                          ],
                        ),
                      ),

                      isAboutClinic
                          ? Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: height * 0.02,
                          ),
                          Row(
                            children: [
                              Text("Clinic Name",
                                  style: GoogleFonts.lato(
                                    fontSize: 13,
                                    fontWeight: FontWeight.w400,
                                    color: const Color(0xff707070),
                                  )),
                              const Spacer(),
                              GestureDetector(
                                onTap: () {
                                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                                    return EditClinicDetails(clinicData: clinicProfile!.data!,);
                                  },));
                                },
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
                          Text((clinicProfile!.data!.clinicName ?? "") ,
                              style: GoogleFonts.lato(
                                fontSize: 15,
                                fontWeight: FontWeight.w400,
                                color: const Color(0xff111111),
                              )),
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
                          Text(clinicProfile!.data!.mobileNumber ?? "",
                              style: GoogleFonts.lato(
                                fontSize: 15,
                                fontWeight: FontWeight.w400,
                                color: const Color(0xff111111),
                              )),

                          ///Land Line
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
                          Text(clinicProfile!.data!.landLineNumber ?? "",
                              style: GoogleFonts.lato(
                                fontSize: 15,
                                fontWeight: FontWeight.w400,
                                color: const Color(0xff111111),
                              )),

                          ///Country
                          SizedBox(
                            height: height * 0.03,
                          ),
                          Text("Country",
                              style: GoogleFonts.lato(
                                fontSize: 13,
                                fontWeight: FontWeight.w400,
                                color: const Color(0xff707070),
                              )),
                          SizedBox(
                            height: height * 0.01,
                          ),
                          Text(clinicProfile!.data!.country ?? "",
                              style: GoogleFonts.lato(
                                fontSize: 15,
                                fontWeight: FontWeight.w400,
                                color: const Color(0xff111111),
                              )),

                          ///City
                          SizedBox(
                            height: height * 0.03,
                          ),
                          Text("City",
                              style: GoogleFonts.lato(
                                fontSize: 13,
                                fontWeight: FontWeight.w400,
                                color: const Color(0xff707070),
                              )),
                          SizedBox(
                            height: height * 0.01,
                          ),
                          Text(clinicProfile!.data!.city ?? "",
                              style: GoogleFonts.lato(
                                fontSize: 15,
                                fontWeight: FontWeight.w400,
                                color: const Color(0xff111111),
                              )),

                          ///Address
                          SizedBox(
                            height: height * 0.03,
                          ),
                          Text("Address",
                              style: GoogleFonts.lato(
                                fontSize: 13,
                                fontWeight: FontWeight.w400,
                                color: const Color(0xff707070),
                              )),
                          SizedBox(
                            height: height * 0.01,
                          ),
                          Text(clinicProfile!.data!.address ?? "",
                              style: GoogleFonts.lato(
                                fontSize: 15,
                                fontWeight: FontWeight.w400,
                                color: const Color(0xff111111),
                              )),

                          ///P.O.Box
                          SizedBox(
                            height: height * 0.03,
                          ),
                          Text("P.O.Box",
                              style: GoogleFonts.lato(
                                fontSize: 13,
                                fontWeight: FontWeight.w400,
                                color: const Color(0xff707070),
                              )),
                          SizedBox(
                            height: height * 0.01,
                          ),
                          Text(clinicProfile!.data!.poBox ?? "",
                              style: GoogleFonts.lato(
                                fontSize: 15,
                                fontWeight: FontWeight.w400,
                                color: const Color(0xff111111),
                              )),

                          ///Date of Establishment
                          SizedBox(
                            height: height * 0.03,
                          ),
                          Text("Date of Establishment",
                              style: GoogleFonts.lato(
                                fontSize: 13,
                                fontWeight: FontWeight.w400,
                                color: const Color(0xff707070),
                              )),
                          SizedBox(
                            height: height * 0.01,
                          ),
                          Text(DateFormat('dd/MM/yyyy').format(DateTime.parse(clinicProfile!.data!.dateOfEstablishment ?? DateTime.now().toString())),
                              style: GoogleFonts.lato(
                                fontSize: 15,
                                fontWeight: FontWeight.w400,
                                color: const Color(0xff111111),
                              )),
                        ],
                      )
                          : const SizedBox(),
                      Padding(
                        padding: EdgeInsets.only(
                            top: height * 0.015, bottom: height * 0.015),
                        child: const Divider(
                          thickness: 1,
                          color: Color(0xffE7E7E7),
                        ),
                      ),

                      ///ALL Additional Info
                      InkWell(
                        onTap: (){
                        setState(() {
                          isAddiTonalInfo = !isAddiTonalInfo;
                        });
                      },
                        child: Row(
                          children: [
                            Text("Additional info",
                                style: GoogleFonts.lato(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600,
                                  color: const Color(0xff111111),
                                )),
                            const Spacer(),
                            Icon(
                                !isAddiTonalInfo
                                    ? Icons.keyboard_arrow_down_rounded
                                    : Icons.keyboard_arrow_up_rounded,
                                size: 25,
                                color: const Color(0xff111111)),
                          ],
                        ),
                      ),

                      isAddiTonalInfo
                          ? Column(
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
                                      onTap: () {
                                        Navigator.push(context, MaterialPageRoute(builder: (context) {
                                          return EditAdditionalInfo(data: clinicProfile!.data!);
                                        },));
                                      },
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
                                Text((clinicProfile!.data!.licensingAuthority ?? "") ,
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
                                Text(clinicProfile!.data!.medicalLicenseNumber ?? "",
                                    style: GoogleFonts.lato(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w400,
                                      color: const Color(0xff111111),
                                    )),
                                SizedBox(
                                  height: height * 0.03,
                                ),
                                Text("Medical License",
                                    style: GoogleFonts.lato(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w400,
                                      color: const Color(0xff707070),
                                    )),
                                SizedBox(
                                  height: height * 0.01,
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
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                            Align(
                                              alignment: Alignment.centerLeft,
                                              child: Padding(
                                                padding:
                                                    EdgeInsets.symmetric(
                                                        horizontal: width * 0.02),
                                                child: Container(
                                                  width: width * 0.25,
                                                  height: width * 0.25,
                                                  decoration: BoxDecoration(
                                                      image: DecorationImage(
                                                          image:
                                                              NetworkImage(clinicProfile!.data!.licensFile ?? ""),
                                                          fit: BoxFit.fill),
                                                      borderRadius:
                                                          BorderRadius.circular(
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
                                      color: const Color(0xff707070),
                                    )),
                                SizedBox(
                                  height: height * 0.01,
                                ),
                                Text(clinicProfile!.data!.tradeLicenceNumber ?? "",
                                    style: GoogleFonts.lato(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w400,
                                      color: const Color(0xff111111),
                                    )),
                                SizedBox(
                                  height: height * 0.03,
                                ),
                                Text("Trade License",
                                    style: GoogleFonts.lato(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w400,
                                      color: const Color(0xff707070),
                                    )),
                                SizedBox(
                                  height: height * 0.01,
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
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                            Align(
                                              alignment: Alignment.centerLeft,
                                              child: Padding(
                                                padding: EdgeInsets.symmetric(
                                                        horizontal: width * 0.02),
                                                child: Container(
                                                  width: width * 0.25,
                                                  height:  width * 0.25,
                                                  decoration: BoxDecoration(
                                                      image: DecorationImage(
                                                          image:
                                                          NetworkImage(clinicProfile!.data!.tradeFile ?? ""),
                                                          fit: BoxFit.fill),
                                                      borderRadius:
                                                          BorderRadius.circular(
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
                                      color: const Color(0xff707070),
                                    )),
                                SizedBox(
                                  height: height * 0.01,
                                ),
                                Text(clinicProfile!.data!.tRNNumber ?? "",
                                    style: GoogleFonts.lato(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w400,
                                      color: const Color(0xff111111),
                                    )),
                                SizedBox(
                                  height: height * 0.03,
                                ),
                                Text("TRN",
                                    style: GoogleFonts.lato(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w400,
                                      color: const Color(0xff707070),
                                    )),
                                SizedBox(
                                  height: height * 0.01,
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
                                        mainAxisAlignment:
                                        MainAxisAlignment.center,
                                        crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                        children: [
                                          Align(
                                            alignment: Alignment.centerLeft,
                                            child: Padding(
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: width * 0.02),
                                              child: Container(
                                                width: width * 0.25,
                                                height:  width * 0.25,
                                                decoration: BoxDecoration(
                                                    image: DecorationImage(
                                                        image:
                                                        NetworkImage(clinicProfile!.data!.trnFile ?? ""),
                                                        fit: BoxFit.fill),
                                                    borderRadius:
                                                    BorderRadius.circular(
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
                            )
                          : const SizedBox(),
                      Padding(
                        padding: EdgeInsets.only(
                            top: height * 0.015, bottom: height * 0.015),
                        child: const Divider(
                          thickness: 1,
                          color: Color(0xffE7E7E7),
                        ),
                      ),
                      InkWell(
                        onTap: (){
                          setState(() {
                            isManagerDetail = !isManagerDetail;

                          });
                        },
                        child: Row(
                          children: [
                            Text("Manager Details",
                                style: GoogleFonts.lato(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600,
                                  color: const Color(0xff111111),
                                )),
                            const Spacer(),
                            Icon(
                                !isManagerDetail
                                    ? Icons.keyboard_arrow_down_rounded
                                    : Icons.keyboard_arrow_up_rounded,
                                size: 25,
                                color: const Color(0xff111111)),
                          ],
                        ),
                      ),

                      ///Manager Details
                      isManagerDetail
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
                                      onTap: () {
                                        Navigator.push(context, MaterialPageRoute(builder: (context) {
                                          return EditClinicManagerDetail(data: clinicProfile!.data!,);
                                        },));
                                      },
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
                                Text(clinicProfile!.data!.clinicMangerName ?? "",
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
                                Text(clinicProfile!.data!.clinicMangerNumber ?? "",
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
                                Text(clinicProfile!.data!.clinicMangerEmail ?? "",
                                    style: GoogleFonts.lato(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w400,
                                      color: const Color(0xff111111),
                                    )),
                                SizedBox(height: height * 0.02),

                                const Divider(
                                  thickness: 1,
                                  color: Color(0xffE7E7E7),
                                ),

                                /// Medical Director Details
                                SizedBox(
                                  height: height * 0.02,
                                ),
                                Row(
                                  children: [
                                    Text("Medical Director Details",
                                        style: GoogleFonts.lato(
                                          fontSize: 15,
                                          fontWeight: FontWeight.w600,
                                          color: const Color(0xff111111),
                                        )),
                                    // const Spacer(),
                                    // GestureDetector(
                                    //   onTap: () {},
                                    //   child: Text("Edit",
                                    //       style: GoogleFonts.lato(
                                    //         fontSize: 16,
                                    //         fontWeight: FontWeight.w400,
                                    //         color: const Color(0xff116D6E),
                                    //       )),
                                    // ),
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
                                Text(clinicProfile!.data!.medicalDirectorName ?? "",
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
                                Text(clinicProfile!.data!.medicalDirectorNumber ?? "",
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
                                Text(clinicProfile!.data!.medicalDirectorEmail ?? "",
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
                                Text(clinicProfile!.data!.directorLicensNumber ?? "",
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
                                      height: width * 0.3,
                                      width: MediaQuery.of(context).size.width,
                                      color: const Color(0xFFF5F7F7),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                            Align(
                                              alignment: Alignment.centerLeft,
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 10),
                                                child: Container(
                                                  width: width * 0.25,
                                                  height: width * 0.25,
                                                  decoration: BoxDecoration(
                                                      image: DecorationImage(
                                                          image:
                                                          NetworkImage(clinicProfile!.data!.directorLicensFile ?? ""),
                                                          fit: BoxFit.fill),
                                                      borderRadius:
                                                          BorderRadius.circular(
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
                                    // const Spacer(),
                                    // GestureDetector(
                                    //   onTap: () {},
                                    //   child: Text("Edit",
                                    //       style: GoogleFonts.lato(
                                    //         fontSize: 16,
                                    //         fontWeight: FontWeight.w400,
                                    //         color: const Color(0xff116D6E),
                                    //       )),
                                    // ),
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
                                Text(clinicProfile!.data!.finacialMangerName ?? "",
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
                                Text(clinicProfile!.data!.finacialMangerNumber ?? "",
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
                                Text(clinicProfile!.data!.finacialMangerEmail ?? "",
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
      ),
    );
  }

  getProfileData() async {
    Response response = await clientProfile.getClinicProfile();

    if(response.statusCode == 200) {
      clinicProfile = ClinicProfile.fromJson(jsonDecode(response.body));
    }
    isLoading = false;
    setState(() {});
  }
}
