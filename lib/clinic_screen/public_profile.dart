// ignore_for_file: use_build_context_synchronously

import 'dart:convert';

import 'package:dentalapp/models/lab_profile_model.dart';
import 'package:dentalapp/services/clinic_services/quote_services.dart';
import 'package:dentalapp/util/utils.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart';

class PublicProfileScreen extends StatefulWidget {
  final String labId;
  const PublicProfileScreen({Key? key, required this.labId}) : super(key: key);

  @override
  State<PublicProfileScreen> createState() => _PublicProfileScreenState();
}

class _PublicProfileScreenState extends State<PublicProfileScreen> {
  bool isLoading = true;
  bool isLabDetails = false;
  QuoteService quoteService = QuoteService();
  LabProfile? labProfile;
  LabData? labData;
  UserDetails? userDetails;
  List<DayDetail> days = [];
  List<Service> serviceList = [];

  @override
  void initState() {
    super.initState();
    getData();
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
            : labData == null
                ? const Center(
                    child: Text("No Data Found !!! \n\n Please Try Again"),
                  )
                : SizedBox(
                    width: width,
                    height: height,
                    child: Padding(
                      padding: const EdgeInsets.all(20),
                      child: SingleChildScrollView(
                        scrollDirection: Axis.vertical,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: height * 0.01),
                            InkWell(
                                onTap: () {
                                  Navigator.pop(context);
                                },
                                child: const Icon(Icons.keyboard_backspace,
                                    color: Colors.black)),
                            SizedBox(height: height * 0.01),
                            Stack(
                              alignment: Alignment.center,
                              children: [
                                Align(
                                    alignment: Alignment.center,
                                    child: Container(
                                      alignment: Alignment.center,
                                      height: width * 0.22,
                                      width: width * 0.22,
                                      decoration: BoxDecoration(
                                          image: DecorationImage(
                                              image: NetworkImage(
                                                  userDetails!.profileImage ??
                                                      ""),
                                              fit: BoxFit.fill),
                                          shape: BoxShape.circle,
                                          color: const Color(0xFFEBEFEE)),
                                    )),
                              ],
                            ),
                            SizedBox(height: height * 0.02),
                            Text(
                              "Profile Info",
                              style: GoogleFonts.lato(
                                  fontSize: 18, fontWeight: FontWeight.w600),
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
                              userDetails!.firstName ?? "",
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
                              userDetails!.lastName ?? "",
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
                              userDetails!.email ?? "",
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
                                    "Lab Name",
                                    style: GoogleFonts.lato(
                                        fontSize: 13,
                                        fontWeight: FontWeight.w400,
                                        color: const Color(0xFF707070)),
                                  ),
                                  SizedBox(
                                    height: height * 0.007,
                                  ),
                                  Text(
                                    labData!.labName ?? "",
                                    style: GoogleFonts.lato(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  SizedBox(
                                    height: height * 0.020,
                                  ),
                                  Text(
                                    "Mobile Number",
                                    style: GoogleFonts.lato(
                                        fontSize: 13,
                                        fontWeight: FontWeight.w400,
                                        color: const Color(0xFF707070)),
                                  ),
                                  SizedBox(
                                    height: height * 0.007,
                                  ),
                                  Text(
                                    "${labData!.countryCode ?? ""} ${labData!.mobileNumber ?? ""}",
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
                                    labData!.landLineNumber ?? "",
                                    style: GoogleFonts.lato(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w500),
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
                                    userDetails!.email ?? "",
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
                                  Text(labData!.description ?? "",
                                      style: GoogleFonts.lato(
                                          fontSize: 13,
                                          fontWeight: FontWeight.w400,
                                          color: const Color(0xFF707070)),
                                      maxLines: 5,
                                      overflow: TextOverflow.ellipsis,
                                      textAlign: TextAlign.start),
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
                                  if (days.isNotEmpty)
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
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
                                          shrinkWrap: true,
                                          physics:
                                              const NeverScrollableScrollPhysics(),
                                          itemCount: days.length,
                                          itemBuilder: (context, index) {
                                            return Container(
                                              margin: EdgeInsets.symmetric(
                                                  vertical: height * 0.008),
                                              child: Row(
                                                children: [
                                                  Text(
                                                    days[index].day ?? "",
                                                    style: GoogleFonts.lato(
                                                        fontSize: 14,
                                                        fontWeight:
                                                            FontWeight.w400),
                                                  ),
                                                  const Spacer(),
                                                  Text(
                                                    (days[index].isOpen ??
                                                            false)
                                                        ? "${days[index].startTime ?? ""} - ${days[index].endTime ?? ""}"
                                                        : "Closed",
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
                                  // Row(
                                  //   children: [
                                  //     Text("Monday",style: GoogleFonts.lato(fontSize: 14,fontWeight: FontWeight.w400),),
                                  //     const Spacer(),
                                  //     Text("9:00 - 17:00",style: GoogleFonts.lato(fontSize: 14,fontWeight: FontWeight.w400,color: const Color(0xFF707070)),),
                                  //   ],
                                  // ),
                                  // SizedBox(height: height*0.015,),
                                  // Row(
                                  //   children: [
                                  //     Text("Tuesday",style: GoogleFonts.lato(fontSize: 14,fontWeight: FontWeight.w400),),
                                  //     const Spacer(),
                                  //     Text("9:00 - 17:00",style: GoogleFonts.lato(fontSize: 14,fontWeight: FontWeight.w400,color: const Color(0xFF707070)),),
                                  //   ],
                                  // ),
                                  // SizedBox(height: height*0.015,),
                                  // Row(
                                  //   children: [
                                  //     Text("Wednesday",style: GoogleFonts.lato(fontSize: 14,fontWeight: FontWeight.w400),),
                                  //     const Spacer(),
                                  //     Text("Closed",style: GoogleFonts.lato(fontSize: 14,fontWeight: FontWeight.w400,color: const Color(0xFF707070)),),
                                  //   ],
                                  // ),
                                  // SizedBox(height: height*0.015,),
                                  // Row(
                                  //   children: [
                                  //     Text("Thursday",style: GoogleFonts.lato(fontSize: 14,fontWeight: FontWeight.w400),),
                                  //     const Spacer(),
                                  //     Text("Closed",style: GoogleFonts.lato(fontSize: 14,fontWeight: FontWeight.w400,color: const Color(0xFF707070)),),
                                  //   ],
                                  // ),
                                  // SizedBox(height: height*0.015,),
                                  // Row(
                                  //   children: [
                                  //     Text("Friday",style: GoogleFonts.lato(fontSize: 14,fontWeight: FontWeight.w400),),
                                  //     const Spacer(),
                                  //     Text("Closed",style: GoogleFonts.lato(fontSize: 14,fontWeight: FontWeight.w400,color: const Color(0xFF707070)),),
                                  //   ],
                                  // ),
                                  // SizedBox(height: height*0.015,),
                                  // Row(
                                  //   children: [
                                  //     Text("Saturday",style: GoogleFonts.lato(fontSize: 14,fontWeight: FontWeight.w400),),
                                  //     const Spacer(),
                                  //     Text("Closed",style: GoogleFonts.lato(fontSize: 14,fontWeight: FontWeight.w400,color: const Color(0xFF707070)),),
                                  //   ],
                                  // ),
                                  // SizedBox(height: height*0.015,),
                                  // Row(
                                  //   children: [
                                  //     Text("Sunday",style: GoogleFonts.lato(fontSize: 14,fontWeight: FontWeight.w400),),
                                  //     const Spacer(),
                                  //     Text("Closed",style: GoogleFonts.lato(fontSize: 14,fontWeight: FontWeight.w400,color: const Color(0xFF707070)),),
                                  //   ],
                                  // ),
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
                              child: serviceList.isEmpty
                                  ? const Center(
                                      child: Text("No Service Found !!"),
                                    )
                                  : ListView.builder(
                                      itemCount: serviceList.length,
                                      scrollDirection: Axis.horizontal,
                                      itemBuilder: (context, index) {
                                        return Container(
                                            padding: EdgeInsets.symmetric(
                                                horizontal: width * 0.015),
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
                                                          BorderRadius.circular(
                                                              8),
                                                      image: DecorationImage(
                                                          image: NetworkImage(
                                                              serviceList[index]
                                                                  .serviceImages!
                                                                  .first),
                                                          fit: BoxFit.cover)),
                                                ),
                                                SizedBox(
                                                  height: height * 0.012,
                                                ),
                                                Text(
                                                  serviceList[index].title ??
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
                                              ],
                                            ));
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

  getPaymentMethodName() {
    if (labData!.paymentMethod == "cash") {
      return "Cash";
    } else if (labData!.paymentMethod == "cheque") {
      return "Cheque";
    } else if (labData!.paymentMethod == "onlinePayment") {
      return "Online Payment";
    }
  }

  getData() async {
    var body = {"labId": widget.labId};
    Response response = await quoteService.getLabProfile(body: body);

    if (response.statusCode == 200) {
      labProfile = LabProfile.fromJson(jsonDecode(response.body));
      labData = labProfile!.labData!.first;
      userDetails = labProfile!.labData!.first.userDetails!.first;
      if ((labData!.workingHours ?? []).isNotEmpty) {
        days = labData!.workingHours!.first.dayDetails ?? [];
      }
      serviceList = labData!.services ?? [];
    } else if (response.statusCode == 401) {
      Utils.logout(context);
    }
    isLoading = false;
    setState(() {});
  }
}
