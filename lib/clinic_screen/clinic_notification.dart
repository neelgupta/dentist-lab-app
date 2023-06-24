// ignore_for_file: use_build_context_synchronously

import 'dart:convert';

import 'package:dentalapp/clinic_screen/bottom_navigation_bar.dart';
import 'package:dentalapp/models/notification_model.dart';
import 'package:dentalapp/services/clinic_services/clinic_services.dart';
import 'package:dentalapp/util/utils.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart';
import 'package:intl/intl.dart';

class ClinicNotification extends StatefulWidget {
  const ClinicNotification({Key? key}) : super(key: key);

  @override
  State<ClinicNotification> createState() => _ClinicNotificationState();
}

class _ClinicNotificationState extends State<ClinicNotification> {
  bool isLoading = true;
  bool isLoadMore = false;
  ClinicService clinicService = ClinicService();
  Notifications? notification;
  List<NotificationData> notificationList = [];
  ScrollController scrollController = ScrollController();
  int total = 10;

  @override
  void initState() {
    super.initState();
    getData(isShowLoading: true);
    scrollController.addListener(() {
      if (notificationList.length<total) {
        if (scrollController.position.maxScrollExtent ==
            scrollController.position.pixels) {
          if(!isLoadMore) {
            isLoadMore = true;
            getData();
          }
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return WillPopScope(
      onWillPop: goBack,
      child: SafeArea(
          child: Scaffold(
        body: SizedBox(
          height: height,
          width: width,
          child: Column(
            children: [
              Container(
                  height: height * 0.15,
                  decoration: const BoxDecoration(
                      color: Color(0xFF116D6E),
                      image: DecorationImage(
                          image: AssetImage("assets/image/Group 12305.png"),
                          fit: BoxFit.fitWidth,
                          alignment: Alignment.bottomCenter,
                          opacity: 0.3)),
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: width * 0.020),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        InkWell(
                            onTap: () {
                              goBack();
                            },
                            child: const Icon(
                              Icons.keyboard_backspace,
                              color: Colors.white,
                            )),
                        const Spacer(),
                        Text("Notification",
                            style: GoogleFonts.lato(
                              fontSize: 30,
                              fontWeight: FontWeight.w600,
                              color: Colors.white,
                            )),
                        const Spacer(),
                        const Icon(
                          Icons.keyboard_backspace,
                          color: Colors.transparent,
                        )
                      ],
                    ),
                  )),
              SizedBox(height: height * 0.03),
              Expanded(
                child: isLoading
                    ? Center(child: loader())
                    : notificationList.isEmpty
                        ? const Center(
                            child: Text("No Notification Found !!!",
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.w600)),
                          )
                        : ListView.separated(
                            scrollDirection: Axis.vertical,
                            physics: const BouncingScrollPhysics(),
                            shrinkWrap: true,
                            controller: scrollController,
                            padding:
                                EdgeInsets.symmetric(horizontal: width * 0.05),
                            itemBuilder: (context, index) {
                              return Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(notificationList[index].title ?? "",
                                      style: GoogleFonts.lato(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w600)),
                                  SizedBox(
                                    height: height * 0.010,
                                  ),
                                  Text(
                                    notificationList[index].description ?? "",
                                    style: GoogleFonts.lato(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400,
                                        color: const Color(0xFFA0A0A0)),
                                    maxLines: 2,
                                  ),
                                  SizedBox(
                                    height: height * 0.010,
                                  ),
                                  Text(
                                      DateFormat("dd MMMM yyyy").format(
                                          DateTime.parse(notificationList[index]
                                                  .createdAt ??
                                              DateTime.now().toString())),
                                      style: GoogleFonts.lato(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w600)),
                                  SizedBox(height: height * 0.01),
                                  const Divider(
                                    thickness: 1,
                                    color: Color(0xFFE7E7E7),
                                  )
                                ],
                              );
                            },
                            separatorBuilder: (context, index) {
                              return SizedBox(height: height * 0.01);
                            },
                            itemCount: notificationList.length),
              ),
              if(!isLoading && isLoadMore)loader(),
              SizedBox(
                height: height * 0.005,
              ),
            ],
          ),
        ),
      )),
    );
  }

  getData({isShowLoading = false}) async {
    if(isShowLoading) {
      notificationList.clear();
      isLoading = true;
    }
    isLoadMore = true;
    setState(() {});
    Response response = await clinicService.getNotification(offset: notificationList.length);

    if (response.statusCode == 200) {
      notification = Notifications.fromJson(jsonDecode(response.body));
      total = notification!.data!.count ?? 0;
      notificationList.addAll(notification!.data!.notificationData ?? []);
    } else if (response.statusCode == 401) {
      Utils.logout(context);
    }
    isLoadMore = false;
    isLoading = false;
    setState(() {});
  }

  Future<bool> goBack() async {
    Navigator.pushAndRemoveUntil(context, MaterialPageRoute(
      builder: (context) {
        return const BottomNavigation(index: 0);
      },
    ), (route) => false);
    return true;
  }
}
