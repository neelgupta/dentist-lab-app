// ignore_for_file: use_build_context_synchronously

import 'dart:convert';
import 'package:dentalapp/models/lab_profile.dart';
import 'package:dentalapp/util/api_services.dart';
import 'package:dentalapp/util/utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;

class EditLabWorkingHours extends StatefulWidget {
  final LabDatum labData;
  const EditLabWorkingHours({super.key, required this.labData});

  @override
  State<EditLabWorkingHours> createState() => _EditLabWorkingHoursState();
}

class _EditLabWorkingHoursState extends State<EditLabWorkingHours> {
  var openingTime = "01:00";
  var closingTime = "24:00";
  bool onOff = false;
  bool isTimeSelectedStatus = false;
  List<DayDetails> days = [];
  List startTime = [
    "00:00 ",
    "00:15 ",
    "00:30 ",
    "00:45 ",
    "01:00 ",
    "01:15 ",
    "01:30 ",
    "01:45 ",
    "02:00 ",
    "02:15 ",
    "02:30",
    "02:45",
    "03:00",
    "03:15",
    "03:30",
    "03:45",
    "04:00",
    "04:15",
    "04:30",
    "04:45",
    "05:00",
    "05:15",
    "05:30",
    "05:45",
    "06:00",
    "06:15",
    "06:30",
    "06:45",
    "07:00",
    "07:15",
    "07:30",
    "07:45",
    "08:00",
    "08:15",
    "08:30",
    "08:45",
    "09:00",
    "09:15",
    "09:30",
    "09:45",
    "10:00",
    "10:15",
    "10:30",
    "10:45",
    "11:00",
    "11:15",
    "11:30",
    "11:45",
    "12:00",
    "12:15",
    "12:30",
    "12:45",
    "13:00",
    "13:15",
    "13:30",
    "13:45",
    "14:00",
    "14:15",
    "14:30",
    "14:45",
    "15:00",
    "15:15",
    "15:30",
    "15:45",
    "16:00",
    "16:15",
    "16:30",
    "16:45",
    "17:00",
    "17:15",
    "17:30",
    "17:45",
    "18:00",
    "18:15",
    "18:30",
    "18:45",
    "19:00",
    "19:15",
    "19:30",
    "19:45",
    "20:00",
    "20:15",
    "20:30",
    "20:45",
    "21:00",
    "21:15",
    "21:30",
    "21:45",
    "22:00",
    "22:15",
    "22:30",
    "22:45",
    "23:00",
    "23:15",
    "23:30",
    "23:45",
    "24:00",
  ];
  List endTime = [
    "00:00 ",
    "00:15 ",
    "00:30 ",
    "00:45 ",
    "01:00 ",
    "01:15 ",
    "01:30 ",
    "01:45 ",
    "02:00 ",
    "02:15 ",
    "02:30",
    "02:45",
    "03:00",
    "03:15",
    "03:30",
    "03:45",
    "04:00",
    "04:15",
    "04:30",
    "04:45",
    "05:00",
    "05:15",
    "05:30",
    "05:45",
    "06:00",
    "06:15",
    "06:30",
    "06:45",
    "07:00",
    "07:15",
    "07:30",
    "07:45",
    "08:00",
    "08:15",
    "08:30",
    "08:45",
    "09:00",
    "09:15",
    "09:30",
    "09:45",
    "10:00",
    "10:15",
    "10:30",
    "10:45",
    "11:00",
    "11:15",
    "11:30",
    "11:45",
    "12:00",
    "12:15",
    "12:30",
    "12:45",
    "13:00",
    "13:15",
    "13:30",
    "13:45",
    "14:00",
    "14:15",
    "14:30",
    "14:45",
    "15:00",
    "15:15",
    "15:30",
    "15:45",
    "16:00",
    "16:15",
    "16:30",
    "16:45",
    "17:00",
    "17:15",
    "17:30",
    "17:45",
    "18:00",
    "18:15",
    "18:30",
    "18:45",
    "19:00",
    "19:15",
    "19:30",
    "19:45",
    "20:00",
    "20:15",
    "20:30",
    "20:45",
    "21:00",
    "21:15",
    "21:30",
    "21:45",
    "22:00",
    "22:15",
    "22:30",
    "22:45",
    "23:00",
    "23:15",
    "23:30",
    "23:45",
    "24:00",
  ];
  int index = 0;
  List daysName = [
    "Monday",
    "Tuesday",
    "Wednesday",
    "Thursday",
    "Friday",
    "Saturday",
    "Sunday"
  ];

  @override
  void initState() {
    super.initState();
    days = List.generate(
        daysName.length,
        (index) => DayDetails(
            day: daysName[index], startTime: "", endTime: "", isOpen: false));
    for (var i = 0; i < days.length; i++) {
      days[i].day = widget.labData.workingHours!.first.dayDetails![i].day ?? "";
      days[i].startTime =
          widget.labData.workingHours!.first.dayDetails![i].startTime ?? "";
      days[i].endTime =
          widget.labData.workingHours!.first.dayDetails![i].endTime ?? "";
      days[i].isOpen =
          widget.labData.workingHours!.first.dayDetails![i].isOpen ?? false;
    }
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return SafeArea(
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
                          image: AssetImage("assets/image/Group 12305.png"),
                          fit: BoxFit.fitWidth,
                          alignment: Alignment.bottomCenter,
                          opacity: 0.3)),
                  child: Align(
                      alignment: Alignment.center,
                      child: Column(
                        children: [
                          Container(
                            padding: EdgeInsets.only(
                                left: width * 0.05, top: height * 0.03),
                            alignment: Alignment.centerLeft,
                            child: InkWell(
                                onTap: () {
                                  if (isTimeSelectedStatus) {
                                    isTimeSelectedStatus =
                                        !isTimeSelectedStatus;
                                    setState(() {});
                                  } else {
                                    Navigator.pop(context);
                                  }
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
                    horizontal: width * 0.057, vertical: height * 0.027),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 10,
                    ),
                    isTimeSelectedStatus == false
                        ? Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Working time",
                                style: GoogleFonts.lato(
                                    fontSize: 18, fontWeight: FontWeight.w600),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              ListView(
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                children: [
                                  for (int i = 0; i < days.length; i++)
                                    Column(
                                      children: [
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            SizedBox(
                                                width: width * 0.4,
                                                child: Text(
                                                  days[i].day,
                                                  style: GoogleFonts.lato(
                                                      fontSize: 15,
                                                      fontWeight:
                                                          FontWeight.w600),
                                                )),
                                            Text(
                                              days[i].isOpen
                                                  ? "${days[i].startTime} - ${days[i].endTime}"
                                                  : "Closed",
                                              style: GoogleFonts.lato(
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.w400),
                                            ),
                                            const Spacer(),
                                            InkWell(
                                                onTap: () {
                                                  setState(() {
                                                    isTimeSelectedStatus = true;
                                                    index = i;
                                                    onOff = days[i].isOpen;
                                                    openingTime = "00:00";
                                                    closingTime = "00:00";
                                                  });
                                                },
                                                child: const Icon(
                                                  Icons.arrow_forward_ios,
                                                  color: Color(0xFF707070),
                                                  size: 15,
                                                )),
                                          ],
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        const Divider(
                                            color: Color(0xFFE7E7E7),
                                            thickness: 1),
                                      ],
                                    ),
                                ],
                              ),
                              SizedBox(
                                height: height * 0.050,
                              ),
                              Container(
                                height: height * 0.064,
                                width: MediaQuery.of(context).size.width,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12),
                                  color: const Color(0xFF116D6E),
                                ),
                                child: TextButton(
                                    onPressed: () {
                                      updateWorkHours();
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
                          )
                        : Column(
                            children: [
                              SizedBox(
                                height: height * 0.65,
                                width: width,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 10, right: 10),
                                      child: Row(
                                        children: [
                                          Text(days[index].day,
                                              style: GoogleFonts.lato(
                                                  fontWeight: FontWeight.w600,
                                                  fontSize: 18)),
                                          const Spacer(),
                                          Column(
                                            children: [
                                              FlutterSwitch(
                                                width: 55.0,
                                                height: 25.0,
                                                valueFontSize: 12.0,
                                                toggleSize: 18.0,
                                                activeColor:
                                                    const Color(0xff01635D),
                                                value: onOff,
                                                onToggle: (value) {
                                                  setState(() {
                                                    onOff = value;
                                                  });
                                                },
                                              ),
                                              const SizedBox(
                                                height: 5,
                                              ),
                                              onOff
                                                  ? const Text(
                                                      "Open",
                                                      style: TextStyle(
                                                          fontSize: 12,
                                                          color:
                                                              Color(0xff707070),
                                                          fontFamily:
                                                              "spartan"),
                                                    )
                                                  : const Text("Close",
                                                      style: TextStyle(
                                                          fontSize: 12,
                                                          color:
                                                              Color(0xff707070),
                                                          fontFamily:
                                                              "spartan")),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                    const Divider(
                                      color: Color(0xFFE7E7E7),
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        SizedBox(
                                          width: width * 0.30,
                                          height: height * 0.45,
                                          child: CupertinoPicker(
                                            magnification: 1.22,
                                            squeeze: 1.2,
                                            useMagnifier: true,
                                            itemExtent: 40,
                                            onSelectedItemChanged: (index) {
                                              setState(() {
                                                openingTime = startTime[index];
                                              });
                                            },
                                            selectionOverlay:
                                                const CupertinoPickerDefaultSelectionOverlay(
                                              background: Colors.transparent,
                                            ),
                                            children: startTime
                                                .map((text) => Center(
                                                      child: Container(
                                                        alignment:
                                                            Alignment.center,
                                                        decoration:
                                                            const BoxDecoration(),
                                                        child: Text(text,
                                                            style: GoogleFonts.lato(
                                                                fontSize: 16,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500)),
                                                      ),
                                                    ))
                                                .toList(),
                                          ),
                                        ),
                                        const SizedBox(
                                          width: 20,
                                        ),
                                        Text(
                                          "To",
                                          style: GoogleFonts.lato(
                                              fontSize: 17,
                                              fontWeight: FontWeight.w600),
                                        ),
                                        const SizedBox(
                                          width: 20,
                                        ),
                                        SizedBox(
                                          width: width * 0.30,
                                          height: height * 0.45,
                                          child: CupertinoPicker(
                                            magnification: 1.22,
                                            squeeze: 1.2,
                                            useMagnifier: true,
                                            itemExtent: 40,
                                            onSelectedItemChanged: (index) {
                                              setState(() {
                                                closingTime = endTime[index];
                                              });
                                            },
                                            selectionOverlay:
                                                const CupertinoPickerDefaultSelectionOverlay(
                                              background: Colors.transparent,
                                            ),
                                            children: endTime
                                                .map((text) => Center(
                                                      child: Container(
                                                          alignment:
                                                              Alignment.center,
                                                          decoration:
                                                              const BoxDecoration(),
                                                          child: Text(text,
                                                              style: GoogleFonts.lato(
                                                                  fontSize: 16,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500))),
                                                    ))
                                                .toList(),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 20, vertical: 10),
                                      child: Container(
                                        height: height * 0.065,
                                        width:
                                            MediaQuery.of(context).size.width,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(12),
                                            color: const Color(0xFF116D6E)),
                                        child: TextButton(
                                            onPressed: () {
                                              setState(() {
                                                if (onOff) {
                                                  if (openingTime ==
                                                      closingTime) {
                                                    Utils.showErrorToast(
                                                        "Start Time and End Time Cannot be Same");
                                                  } else if (int.parse(
                                                          openingTime
                                                              .replaceAll(
                                                                  ":", "")) >
                                                      int.parse(closingTime
                                                          .replaceAll(
                                                              ":", ""))) {
                                                    Utils.showErrorToast(
                                                        "Start Time cannot be after End Time");
                                                  } else {
                                                    isTimeSelectedStatus =
                                                        false;
                                                    days[index].isOpen = true;
                                                    days[index].startTime =
                                                        openingTime;
                                                    days[index].endTime =
                                                        closingTime;
                                                  }
                                                } else {
                                                  isTimeSelectedStatus = false;
                                                  days[index].isOpen = false;
                                                  days[index].startTime = "";
                                                  days[index].endTime = "";
                                                }
                                              });
                                            },
                                            child: Text("Save",
                                                style: GoogleFonts.lato(
                                                    fontSize: 15,
                                                    fontWeight: FontWeight.w500,
                                                    color: Colors.white))),
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    ));
  }

  updateWorkHours() async {
    Utils.showLoadingDialog(context);
    var postUri = Uri.parse(ApiServices.editLabWorkingHour);
    List workingDays = [];
    for (int i = 0; i < days.length; i++) {
      Map times = {
        "day": days[i].day,
        "startTime": days[i].startTime,
        "endTime": days[i].endTime,
        "isOpen": days[i].isOpen,
      };
      workingDays.add(times);
    }
    var bodyData = {
      "dayDetails": workingDays,
    };

    var response = await http.put(
      postUri,
      body: jsonEncode(bodyData),
      headers: Utils.apiHeader,
    );
    Utils.logAPIResponse(
        body: bodyData,
        response: response,
        apiName: ApiServices.editLabWorkingHour,
        function: "updateWorkHours");
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
