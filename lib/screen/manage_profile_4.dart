import 'dart:convert';
import 'package:dentalapp/screen/manage_profile_5.dart';
import 'package:dentalapp/util/api_services.dart';
import 'package:dentalapp/util/utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;

class ManageProfile4 extends StatefulWidget {
  const ManageProfile4({Key? key}) : super(key: key);

  @override
  State<ManageProfile4> createState() => _ManageProfile4State();
}

class _ManageProfile4State extends State<ManageProfile4> {

  var openingTime = "01:00";
  var closingTime = "24:00";
  bool onOff = false;
  bool isTimeSelectedStatus=false;
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
  List daysName = ["Monday","Tuesday","Wednesday","Thursday","Friday","Saturday","Sunday"];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    days = List.generate(daysName.length, (index) => DayDetails(day: daysName[index], startTime: "", endTime: "", isOpen: false));
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width  = MediaQuery.of(context).size.width;
    return SafeArea(
        child:Scaffold(
          resizeToAvoidBottomInset: true,
          body: SizedBox(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                children: [
                  Container(
                    height: height*0.25,
                    width: MediaQuery.of(context).size.width,
                    decoration: const BoxDecoration(
                        image: DecorationImage(image: AssetImage("assets/image/01.png"),fit: BoxFit.fill)
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          children: [
                            const SizedBox(width: 20,),
                            InkWell(
                                onTap: () {
                                  Navigator.pop(context);
                                },
                                child: const Image(image: AssetImage("assets/image/left.png"),fit: BoxFit.fill)),
                          ],
                        ),
                        const SizedBox(height: 20,),
                        Align(
                          alignment: Alignment.center,
                          child: Container(
                            alignment: Alignment.center,
                            height: 70,
                            width: 70,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50),
                                border: Border.all(color: Colors.white,width: 1),
                                image: const DecorationImage(image: AssetImage("assets/image/Ellipse 108.png"),fit: BoxFit.fill)),
                                //image:  DecorationImage(image: NetworkImage(Utils.getProfileImage()),fit: BoxFit.fill)),
                            child: Text("N",style: GoogleFonts.lato(fontSize: 24,fontWeight: FontWeight.w600,color: Colors.white),),
                          ),
                        ),

                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: width*0.057,vertical: height*0.027),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 10,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("4/",style: GoogleFonts.lato(fontSize: 17,fontWeight: FontWeight.w600),),
                            Text("6",style: GoogleFonts.lato(fontSize: 17,fontWeight: FontWeight.w600,color: const Color(0xFFA0A0A0)),),
                          ],
                        ),

                        isTimeSelectedStatus==false?Column(crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Working time",style: GoogleFonts.lato(fontSize: 18,fontWeight: FontWeight.w600),),
                            const SizedBox(height: 30,),
                            ListView(
                              shrinkWrap: true,
                              children: [
                                for(int i=0; i<days.length; i++)
                                  Column(
                                    children: [
                                      const SizedBox(height: 10,),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          SizedBox(
                                              width: width * 0.4,
                                              child: Text(days[i].day,style: GoogleFonts.lato(fontSize: 15,fontWeight: FontWeight.w600),)),
                                          Text(days[i].isOpen?"${days[i].startTime} - ${days[i].endTime}":"Closed",style: GoogleFonts.lato(fontSize: 15,fontWeight: FontWeight.w400),),
                                          const Spacer(),
                                          InkWell(
                                              onTap: (){
                                                setState(() {
                                                  isTimeSelectedStatus=true;
                                                  index = i;
                                                  onOff = days[i].isOpen;
                                                  openingTime = "00:00";
                                                  closingTime = "00:00";
                                                });
                                              },
                                              child: const Icon(Icons.arrow_forward_ios,color: Color(0xFF707070),size: 15,)),
                                        ],
                                      ),
                                      const SizedBox(height: 10,),
                                      const Divider(color: Color(0xFFE7E7E7),thickness: 1),
                                    ],
                                  ),
                              ],
                            ),
                            // Row(
                            //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            //   children: [
                            //     SizedBox(
                            //         width: 70,
                            //         child: Text("Monday",style: GoogleFonts.lato(fontSize: 15,fontWeight: FontWeight.w600),)),
                            //     const Spacer(),
                            //     Text("9:00 - 17:00",style: GoogleFonts.lato(fontSize: 15,fontWeight: FontWeight.w400),),
                            //     const Spacer(),
                            //     InkWell(
                            //         onTap: (){
                            //           setState(() {
                            //             isTimeSelectedStatus=true;
                            //           });
                            //         },
                            //         child: const Icon(Icons.arrow_forward_ios,color: Color(0xFF707070),size: 15,)),
                            //     const SizedBox(width: 10,),
                            //   ],
                            // ),
                            // const SizedBox(height: 10,),
                            // const Divider(color: Color(0xFFE7E7E7),thickness: 1),
                            // const SizedBox(height: 10,),
                            // Row(
                            //   crossAxisAlignment: CrossAxisAlignment.center ,
                            //   mainAxisAlignment: MainAxisAlignment.center,
                            //   children: [
                            //     Container(
                            //       width: 75,
                            //       child: Text("Tuesday",style: GoogleFonts.lato(fontSize: 15,fontWeight: FontWeight.w600),),
                            //     ),
                            //     const Spacer(),
                            //     Text("Closed",style: GoogleFonts.lato(fontSize: 15,fontWeight: FontWeight.w400,color: const Color(0xFF707070)),),
                            //     const Spacer(),
                            //     InkWell(
                            //         onTap: (){
                            //           setState(() {
                            //             isTimeSelectedStatus=true;
                            //           });
                            //         },
                            //         child: const Icon(Icons.arrow_forward_ios,color: Color(0xFF707070),size: 15,)),
                            //     const SizedBox(width: 10,),
                            //   ],
                            // ),
                            // const SizedBox(height: 10,),
                            // const Divider(color: Color(0xFFE7E7E7),thickness: 1),
                            // const SizedBox(height: 10,),
                            // Row(
                            //   mainAxisAlignment: MainAxisAlignment.center,
                            //   children: [
                            //     Container(
                            //       width: 77,
                            //       child: Text("Wednesday",style: GoogleFonts.lato(fontSize: 14,fontWeight: FontWeight.w600),maxLines: 1),
                            //     ),
                            //     const Spacer(),
                            //     Text("Closed",style: GoogleFonts.lato(fontSize: 15,fontWeight: FontWeight.w400,color: const Color(0xFF707070)),),
                            //     const Spacer(),
                            //     InkWell(
                            //         onTap: (){
                            //           setState(() {
                            //             isTimeSelectedStatus=true;
                            //           });
                            //         },
                            //         child: const Icon(Icons.arrow_forward_ios,color: Color(0xFF707070),size: 15,)),
                            //     const SizedBox(width: 10,),
                            //   ],
                            // ),
                            // const SizedBox(height: 10,),
                            // const Divider(color: Color(0xFFE7E7E7),thickness: 1),
                            // const SizedBox(height: 10,),
                            // Row(
                            //   crossAxisAlignment: CrossAxisAlignment.center ,
                            //   mainAxisAlignment: MainAxisAlignment.center,
                            //   children: [
                            //     Container(
                            //       width: 75,
                            //       child: Text("Thursday",style: GoogleFonts.lato(fontSize: 15,fontWeight: FontWeight.w600),),
                            //     ),
                            //     const Spacer(),
                            //     Text("Closed",style: GoogleFonts.lato(fontSize: 15,fontWeight: FontWeight.w400,color: const Color(0xFF707070)),),
                            //     const Spacer(),
                            //     InkWell(
                            //         onTap: (){
                            //           setState(() {
                            //             isTimeSelectedStatus=true;
                            //           });
                            //         },
                            //         child: const Icon(Icons.arrow_forward_ios,color: Color(0xFF707070),size: 15,)),
                            //     const SizedBox(width: 10,),
                            //   ],
                            // ),
                            // const SizedBox(height: 10,),
                            // const Divider(color: Color(0xFFE7E7E7),thickness: 1),
                            // const SizedBox(height: 10,),
                            // Row(
                            //   crossAxisAlignment: CrossAxisAlignment.center ,
                            //   mainAxisAlignment: MainAxisAlignment.center,
                            //   children: [
                            //     Container(
                            //       width: 75,
                            //       child: Text("Friday",style: GoogleFonts.lato(fontSize: 15,fontWeight: FontWeight.w600),),
                            //     ),
                            //     const Spacer(),
                            //     Text("Closed",style: GoogleFonts.lato(fontSize: 15,fontWeight: FontWeight.w400,color: const Color(0xFF707070)),),
                            //     const Spacer(),
                            //     InkWell(
                            //         onTap: (){
                            //           setState(() {
                            //             isTimeSelectedStatus=true;
                            //           });
                            //         },
                            //         child: const Icon(Icons.arrow_forward_ios,color: Color(0xFF707070),size: 15,)),
                            //     const SizedBox(width: 10,),
                            //   ],
                            // ),
                            // const SizedBox(height: 10,),
                            // const Divider(color: Color(0xFFE7E7E7),thickness: 1),
                            // const SizedBox(height: 10,),
                            // Row(
                            //   crossAxisAlignment: CrossAxisAlignment.center ,
                            //   mainAxisAlignment: MainAxisAlignment.center,
                            //   children: [
                            //     Container(
                            //       width: 75,
                            //       child: Text("Saturday",style: GoogleFonts.lato(fontSize: 15,fontWeight: FontWeight.w600),),
                            //     ),
                            //     const Spacer(),
                            //     Text("Closed",style: GoogleFonts.lato(fontSize: 15,fontWeight: FontWeight.w400,color: const Color(0xFF707070)),),
                            //     const Spacer(),
                            //     InkWell(
                            //         onTap: (){
                            //           setState(() {
                            //             isTimeSelectedStatus=true;
                            //           });
                            //         },
                            //         child: const Icon(Icons.arrow_forward_ios,color: Color(0xFF707070),size: 15,)),
                            //     const SizedBox(width: 10,),
                            //   ],
                            // ),
                            // const SizedBox(height: 10,),
                            // const Divider(color: Color(0xFFE7E7E7),thickness: 1),
                            // const SizedBox(height: 10,),
                            // Row(
                            //   crossAxisAlignment: CrossAxisAlignment.center ,
                            //   mainAxisAlignment: MainAxisAlignment.center,
                            //   children: [
                            //     Container(
                            //       width: 75,
                            //       child: Text("Sunday",style: GoogleFonts.lato(fontSize: 15,fontWeight: FontWeight.w600),),
                            //     ),
                            //     const Spacer(),
                            //     Text("Closed",style: GoogleFonts.lato(fontSize: 15,fontWeight: FontWeight.w400,color: const Color(0xFF707070)),),
                            //     const Spacer(),
                            //     InkWell(
                            //         onTap: (){
                            //           setState(() {
                            //             isTimeSelectedStatus=true;
                            //           });
                            //         },
                            //         child: const Icon(Icons.arrow_forward_ios,color: Color(0xFF707070),size: 15,)),
                            //     const SizedBox(width: 10,),
                            //   ],
                            // ),
                            // const SizedBox(height: 10,),
                            // const Divider(color: Color(0xFFE7E7E7),thickness: 1),
                            // const SizedBox(height: 10,),
                            SizedBox(height: height*0.050,),
                            Container(
                              height: height*0.064,
                              width: MediaQuery.of(context).size.width,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12),
                                  color: const Color(0xFF116D6E),
                              ),
                              child: TextButton(
                                  onPressed: () {
                                    manageProfile4();
                                  },
                                  child: Text("Continue",style: GoogleFonts.lato(fontSize: 15,fontWeight: FontWeight.w500,color: Colors.white))),
                            ),
                            SizedBox(height: height*0.025,),
                          ],
                        ):
                              Column(
                                children: [
                                  Container(
                                    height:height*0.65,
                                    width: width,
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                        Padding(
                                          padding:  EdgeInsets.symmetric(horizontal: height*0.02),
                                          child: Row(crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Text(days[index].day,style: GoogleFonts.lato(fontWeight: FontWeight.w600,fontSize: 18)),
                                              const Spacer(),
                                              Column(
                                                children: [
                                                  FlutterSwitch(
                                                    width: 55.0,
                                                    height: 25.0,
                                                    valueFontSize: 12.0,
                                                    toggleSize: 18.0,
                                                    activeColor: const Color(0xff01635D),
                                                    value:  onOff,
                                                    onToggle: (value) {
                                                      setState(() {
                                                        onOff = value;
                                                      });
                                                    },
                                                  ),
                                                  const SizedBox(
                                                    height: 5,
                                                  ),
                                                  onOff ? const Text("Open",
                                                    style: TextStyle(fontSize: 12, color: Color(0xff707070),fontFamily: "spartan"),
                                                  ) : const Text("Close", style: TextStyle(fontSize: 12, color: Color(0xff707070), fontFamily: "spartan")),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                        const Divider(
                                          color: Color(0xFFE7E7E7),
                                        ),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            SizedBox(
                                              width: width*0.30,
                                              height: height*0.45,
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
                                                selectionOverlay: const CupertinoPickerDefaultSelectionOverlay(background: Colors.transparent,),
                                                children: startTime
                                                    .map((text) => Center(
                                                  child: Container(
                                                    alignment: Alignment.center,
                                                    decoration: const BoxDecoration(
                                                    ),
                                                    child: Text(text,style: GoogleFonts.lato(fontSize: 16, fontWeight: FontWeight.w500)),
                                                  ),
                                                ))
                                                    .toList(),
                                              ),
                                            ),
                                            const SizedBox(width: 20,),
                                            Text("To",style: GoogleFonts.lato(fontSize: 17,fontWeight: FontWeight.w600),),
                                            const SizedBox(width: 20,),
                                            SizedBox(
                                              width: width*0.30,
                                              height: height*0.45,
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
                                                selectionOverlay: const CupertinoPickerDefaultSelectionOverlay(background: Colors.transparent,),
                                                children: endTime.map((text) => Center(
                                                  child: Container(
                                                      alignment: Alignment.center,
                                                      decoration: const BoxDecoration(
                                                      ),
                                                      child: Text(text,style: GoogleFonts.lato(fontSize: 16, fontWeight: FontWeight.w500))),
                                                ))
                                                    .toList(),
                                              ),
                                            ),
                                          ],
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
                                          child: Container(
                                            height: height*0.065,
                                            width: MediaQuery.of(context).size.width,
                                            decoration: BoxDecoration(
                                                borderRadius: BorderRadius.circular(12),
                                                color: const Color(0xFF116D6E)
                                            ),
                                            child: TextButton(
                                                onPressed: () {
                                                  setState(() {
                                                    if(onOff) {
                                                      if(openingTime==closingTime) {
                                                        Utils.showErrorToast("Start Time and End Time Cannot be Same");
                                                      } else if(int.parse(openingTime.replaceAll(":", ""))>int.parse(closingTime.replaceAll(":", ""))) {
                                                        Utils.showErrorToast("Start Time cannot be after End Time");
                                                      } else {
                                                        isTimeSelectedStatus = false;
                                                        days[index].isOpen = true;
                                                        days[index].startTime = openingTime;
                                                        days[index].endTime = closingTime; 
                                                      }
                                                    } else {
                                                      isTimeSelectedStatus = false;
                                                      days[index].isOpen = false;
                                                      days[index].startTime = "";
                                                      days[index].endTime = "";
                                                    }
                                                  });
                                                },
                                                child: Text("Save",style: GoogleFonts.lato(fontSize: 15,fontWeight: FontWeight.w500,color: Colors.white))),
                                          ),
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                      ],),
                  )
                ],
              ),
            ),
          ),
        ));
  }

  manageProfile4() async {
    Utils.showLoadingDialog(context);
    var postUri = Uri.parse(ApiServices.manageProfile4Api);
    List workingDays = [];
    for(int i = 0;i < days.length; i++) {
      Map times = {
        "day" : days[i].day,
        "startTime" : days[i].startTime,
        "endTime" : days[i].endTime,
        "isOpen" : days[i].isOpen,
      };
      workingDays.add(times);
    }
    var bodyData = {
      "dayDetails": workingDays,
    };

    var response = await http.post(
      postUri,
      body: jsonEncode(bodyData),
      headers: Utils.apiHeader,
    );
    Utils.logAPIResponse(body: bodyData,response: response,apiName: ApiServices.manageProfile4Api,function: "manageProfile4");
    Navigator.pop(context);
    if (response.statusCode == 200) {
      Map map = jsonDecode(response.body);
      if (map["status"] == 200) {
        Utils.setScreenStatus("5");
        Navigator.push(context, MaterialPageRoute(builder: (context) => ManageProfile5(),));
        Utils.showErrorToast(map['message']);
      } else {
        Utils.showErrorToast(map['message']);
      }
    } else if (response.statusCode == 401) {
      Utils.logout(context);
    } else{
      Utils.showErrorToast(jsonDecode(response.body)['message']);
    }
  }
}

