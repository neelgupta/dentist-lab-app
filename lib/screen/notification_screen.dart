import 'dart:convert';

import 'package:dentalapp/models/lab_notification_model.dart';
import 'package:dentalapp/util/utils.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart';
import 'package:intl/intl.dart';

import '../services/lab_service/lab_service.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({Key? key}) : super(key: key);

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {

  LabService getDataNotification=LabService();
  bool  isLoading = true;
  LabNotification? labNotification;

  List<Datum> notificationList = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getNotification();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return SafeArea(
        child: Scaffold(
          body: Column(crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                  height: height*0.15,
                  decoration: const BoxDecoration(
                      color: Color(0xFF116D6E),
                      image: DecorationImage(image: AssetImage("assets/image/Group 12305.png"),
                          fit: BoxFit.fitWidth,alignment: Alignment.bottomCenter,opacity: 0.3)
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: width*0.020),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        InkWell(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: const Icon(Icons.keyboard_backspace,color: Colors.white,)),
                        const Spacer(),
                        Text("Notifications",style: GoogleFonts.lato(fontSize: 30,fontWeight: FontWeight.w600,color: Colors.white,)),
                        const Spacer(),
                        SizedBox(height: height*0.050,width: width*0.050),
                      ],
                    ),
                  )
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: width*0.035,vertical: height*0.027),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: height*0.010,),
                    Text("Notifications",style: GoogleFonts.lato(fontSize: 18,fontWeight: FontWeight.w600 )),
                    SizedBox(height: height*0.020,),

                  ],
                ),
              ),
              Expanded(
                child: isLoading?Center(child: loader()):notificationList.isEmpty?const Center(child: Text("No Data Found !!!"),) :ListView.separated(
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    physics: const BouncingScrollPhysics(),
                    padding: EdgeInsets.symmetric(horizontal: width * 0.05),
                    itemBuilder: (context, index) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(notificationList[index].title??"",style: GoogleFonts.lato(fontSize: 18,fontWeight: FontWeight.w600 )),
                          SizedBox(height: height*0.010,),
                          Text(notificationList[index].description??"",
                            style: GoogleFonts.lato(fontSize: 14,fontWeight: FontWeight.w400,color: const Color(0xFFA0A0A0)),
                            maxLines: 2,),
                          SizedBox(height: height*0.010,),
                          Text(DateFormat("dd MMMM yyyy").format(DateTime.parse(notificationList[index].createdAt ?? DateTime.now().toString())),style: GoogleFonts.lato(fontSize: 12,fontWeight: FontWeight.w600)),
                          SizedBox(height: height*0.020,),
                          const Divider(thickness: 1,color: Color(0xFFE7E7E7),)
                        ],
                      );
                    },
                    separatorBuilder: (context, index) {
                      return SizedBox(height: height*0.020,);
                    },
                    itemCount: notificationList.length),
              ),
              SizedBox(height: height*0.01),
            ],
          ),
        ));
  }


  getNotification() async {
    Response response = await getDataNotification.getNotification();

    if(response.statusCode == 200) {
      labNotification = LabNotification.fromJson(jsonDecode(response.body));
      notificationList =labNotification!.data ??[];

    }
    isLoading = false;
    setState(() {});
  }


}
