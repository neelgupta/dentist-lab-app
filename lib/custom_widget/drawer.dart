// ignore_for_file: non_constant_identifier_names

import 'dart:math';

import 'package:dentalapp/clinic_screen/Bottom_Navibar.dart';
import 'package:dentalapp/clinic_screen/clinic_notification.dart';
import 'package:dentalapp/clinic_screen/payment_history.dart';
import 'package:dentalapp/screen/login_screen.dart';
import 'package:dentalapp/util/utils.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class CustomDrawer extends StatefulWidget {
  const CustomDrawer({Key? key}) : super(key: key);

  @override
  State<CustomDrawer> createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {
  var selectedIndex = 0;
  String firstName = "";
  String lastName = "";
  String profileImage = "";
  String establishDate = "";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      firstName = Utils.getFirstName();
      lastName = Utils.getLastName();
      profileImage = Utils.getProfileImage();
      establishDate = Utils.getEstablishDate();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.white,
      child: Container(
        // margin: const EdgeInsets.all(20),
        child: CustomDrawer(),
      ),
    );
  }

  Widget CustomDrawer() {
    double height = MediaQuery.of(context).size.height -
        MediaQuery.of(context).padding.top -
        MediaQuery.of(context).padding.bottom;
    double width = MediaQuery.of(context).size.width -
        MediaQuery.of(context).padding.right -
        MediaQuery.of(context).padding.left;
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 25),
            child: Container(
              height: height * 0.15,
              alignment: Alignment.center,
              width: width,
              decoration: const BoxDecoration(
                  color: Colors.white,
                  border: Border(
                      bottom: BorderSide(width: 1, color: Color(0xffE7E7E7)))),
              child: Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      height: width * 0.16,
                      width: width * 0.16,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: const Color(0xff116D6E),
                          border: Border.all(color: Colors.black),
                          image: DecorationImage(image: NetworkImage(profileImage),fit: BoxFit.fill)
                      ),
                    ),
                    SizedBox(
                      width: width * 0.02,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "$firstName $lastName",
                          style: const TextStyle(
                              color: Color(0xff252525),
                              fontSize: 16,
                              fontWeight: FontWeight.w700),
                        ),
                        if(establishDate.isNotEmpty)Text("Since ${DateFormat('yyyy').format(DateTime.parse(establishDate))}",
                            style: GoogleFonts.lato(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                            )
                        ),
                      ],
                    ),
                    const Spacer(),
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: SizedBox(
                          height: 15,
                          width: 15,
                          child: Image.asset('assets/image/close.png',
                              fit: BoxFit.fill)),
                    )
                  ],
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) {
                return const BottomNavigation(index: 0);
              },), (route) => false);
            },
            child: SizedBox(
              height: height * 0.07,
              child: Padding(
                padding: const EdgeInsets.only(left: 30, right: 20),
                child: Row(
                  children: [
                    SizedBox(
                      height: height * 0.06,
                      width: width * 0.07,
                      child: Image.asset("assets/image/d_home.png",
                          color: selectedIndex == 0
                              ? const Color(0xff116D6E)
                              : Colors.black),
                    ),
                    SizedBox(width: width * 0.05),
                    Text(
                      "Home",
                      style: TextStyle(
                          color: selectedIndex == 0
                              ? const Color(0xff116D6E)
                              : Colors.black,
                          fontSize: 16),
                    ),
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(height: 5),
          GestureDetector(
            onTap: () {
              Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) {
                return const BottomNavigation(index: 0);
              },), (route) => false);
            },
            child: Padding(
              padding: const EdgeInsets.only(left: 30, right: 20),
              child: Row(
                children: [
                  SizedBox(
                    height: height * 0.06,
                    width: width * 0.07,
                    child: Image.asset("assets/image/drawerdashboard.png",
                        color: selectedIndex == 3
                            ? const Color(0xff116D6E)
                            : Colors.black),
                  ),
                  SizedBox(width: width * 0.05),
                  Text(
                    "Dashboard",
                    style: TextStyle(
                        color: selectedIndex == 3
                            ? const Color(0xff116D6E)
                            : Colors.black,
                        fontSize: 16),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 5),
          GestureDetector(
            onTap: () {
              Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) {
                return const BottomNavigation(index: 1);
              },), (route) => false);
            },
            child: Padding(
              padding: const EdgeInsets.only(left: 30, right: 20),
              child: Row(
                children: [
                  SizedBox(
                    height: height * 0.06,
                    width: width * 0.07,
                    child: Image.asset("assets/image/drawerquote.png",
                        color: selectedIndex == 2
                            ? const Color(0xff116D6E)
                            : Colors.black),
                  ),
                  SizedBox(width: width * 0.05),
                  Text(
                    "Quote",
                    style: TextStyle(
                        color: selectedIndex == 2
                            ? const Color(0xff116D6E)
                            : Colors.black,
                        fontSize: 16),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 5),
          GestureDetector(
            onTap: () {
              Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) {
                return const BottomNavigation(index: 2);
              },), (route) => false);
            },
            child: Padding(
              padding: const EdgeInsets.only(left: 30, right: 20),
              child: Row(
                children: [
                  SizedBox(
                    height: height * 0.06,
                    width: width * 0.07,
                    child: Image.asset("assets/image/d_profile.png",
                        color: selectedIndex == 1
                            ? const Color(0xff116D6E)
                            : Colors.black),
                  ),
                  SizedBox(width: width * 0.05),
                  Text(
                    "Profile",
                    style: TextStyle(
                        color: selectedIndex == 1
                            ? const Color(0xff116D6E)
                            : Colors.black,
                        fontSize: 16),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 5),
          GestureDetector(
            onTap: () {
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
                return const PaymentHistory();
              },));
            },
            child: Padding(
              padding: const EdgeInsets.only(left: 30, right: 20),
              child: Row(
                children: [
                  SizedBox(
                    height: height * 0.06,
                    width: width * 0.07,
                    child: Image.asset("assets/image/d_payment.png",
                        color: selectedIndex == 4
                            ? const Color(0xff116D6E)
                            : Colors.black),
                  ),
                  SizedBox(width: width * 0.05),
                  Text(
                    "Payments",
                    style: TextStyle(
                        color: selectedIndex == 4
                            ? const Color(0xff116D6E)
                            : Colors.black,
                        fontSize: 16),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 5),
          GestureDetector(
            onTap: () {
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
                return const ClinicNotification();
              },));
            },
            child: Padding(
              padding: const EdgeInsets.only(left: 30, right: 20),
              child: Row(
                children: [
                  SizedBox(
                    height: height * 0.06,
                    width: width * 0.07,
                    child: Image.asset("assets/image/d_notificatin.png",
                        color: selectedIndex == 5
                            ? const Color(0xff116D6E)
                            : Colors.black),
                  ),
                  SizedBox(width: width * 0.05),
                  Text(
                    "Notifications",
                    style: TextStyle(
                        color: selectedIndex == 5
                            ? const Color(0xff116D6E)
                            : Colors.black,
                        fontSize: 16),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 5),
          // GestureDetector(
          //   onTap: () {
          //
          //   },
          //   child: Padding(
          //     padding: const EdgeInsets.only(left: 30, right: 20),
          //     child: Row(
          //       children: [
          //         SizedBox(
          //           height: height * 0.06,
          //           width: width * 0.07,
          //           child: Image.asset("assets/image/d_setting.png",
          //               color: selectedIndex == 7
          //                   ? const Color(0xff116D6E)
          //                   : Colors.black),
          //         ),
          //         SizedBox(width: width * 0.05),
          //         Text(
          //           "Setting",
          //           style: TextStyle(
          //               color: selectedIndex == 7
          //                   ? const Color(0xff116D6E)
          //                   : Colors.black,
          //               fontSize: 16),
          //         ),
          //       ],
          //     ),
          //   ),
          // ),
          // const SizedBox(height: 5),
          const Spacer(),
          GestureDetector(
            onTap: () {
              setState(() {
                showMyDialog();
              });
            },
            child: Container(
              height: height * 0.07,
              width: width,
              margin: const EdgeInsets.only(left: 30, right: 30, bottom: 40),
              decoration: BoxDecoration(
                color: const Color(0xff116D6E),
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Center(
                child: Text(
                  "Logout",
                  style: TextStyle(color: Color(0xffFFFFFF), fontSize: 16),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  void showMyDialog() {
    double height = MediaQuery.of(context).size.height -
        MediaQuery.of(context).padding.top -
        MediaQuery.of(context).padding.bottom;
    double width = MediaQuery.of(context).size.width -
        MediaQuery.of(context).padding.right -
        MediaQuery.of(context).padding.left;
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
            title: Container(
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 100,

                  child: Image.asset("assets/image/logout.png",fit: BoxFit.fill,),
                ),
                const SizedBox(
                  height: 20,
                ),
                Text("are you sure you want to log out ?",
                    style: GoogleFonts.lato(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: const Color(0xFF707070),
                    ),
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.center),
                const SizedBox(
                  height: 20,
                ),
                TextButton(
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all(const Color(0xFF116D6E)),
                      padding: MaterialStateProperty.all(
                          const EdgeInsets.symmetric(horizontal: 30, vertical: 12)),
                      shape: MaterialStateProperty.all(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                    ),
                    onPressed: () async {
                      Utils.setLoginStatus(false);
                      Utils.setToken(" ");
                      Utils.setUserType(" ");
                      Utils.showSuccessToast("Logout Successfully");
                      Utils.setScreenStatus("0");
                      await Utils.prefs!.clear();
                      Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) {
                        return const LoginScreen();
                      },), (route) => false);
                    },
                    child: Text("Logout",
                        style: GoogleFonts.lato(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ))),
              ],
            ),
          ),
        ));
      },
    );
  }
}
