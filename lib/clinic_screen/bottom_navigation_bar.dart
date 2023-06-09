import 'package:dentalapp/clinic_screen/dashboard_screen.dart';
import 'package:dentalapp/clinic_screen/new_quote.dart';
import 'package:dentalapp/clinic_screen/profile.dart';
import 'package:dentalapp/clinic_screen/setup_screen/profilesetup_1.dart';
import 'package:dentalapp/clinic_screen/setup_screen/profilesetup_2.dart';
import 'package:dentalapp/clinic_screen/setup_screen/profilesetup_3.dart';
import 'package:dentalapp/util/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';

class BottomNavigation extends StatefulWidget {
  final int index;
  const BottomNavigation({Key? key, required this.index}) : super(key: key);

  @override
  State<BottomNavigation> createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  var screenStatus = "1";
  @override
  void initState() {
    super.initState();
    selectedScreenIndex = widget.index;
    screenStatus = Utils.getScreenStatus();
    SchedulerBinding.instance.addPostFrameCallback((_) {
      if (screenStatus != "4") showMyDialog();
    });
  }

  int selectedScreenIndex = 0;

  List selectedScreenList = [
    const DashBoardScreen(),
    // const SizedBox(),
    const NewQuote(),
    const Profile(),
  ];

  void _selectScreen(int index) {
    setState(() {
      selectedScreenIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: selectedScreenList[selectedScreenIndex],
        bottomNavigationBar: BottomNavigationBar(
            currentIndex: selectedScreenIndex,
            // backgroundColor: const Color(0xff116D6E),
            selectedItemColor: const Color(0xff01635D),
            unselectedItemColor: const Color(0xffA0A0A0),
            onTap: _selectScreen,
            showUnselectedLabels: true,
            type: BottomNavigationBarType.fixed,
            items: [
              BottomNavigationBarItem(
                icon: Image.asset("assets/image/dasboard.png",
                    height: 20,
                    color: selectedScreenIndex == 0
                        ? const Color(0xff01635D)
                        : const Color(0xffA0A0A0)),
                label: "DashBoard",
              ),
              // BottomNavigationBarItem(
              //   icon: Image.asset("assets/image/Setting.png",
              //       height: 20,
              //       color: selectedScreenIndex == 1
              //           ? const Color(0xff01635D)
              //           : const Color(0xffA0A0A0)),
              //   label: "Setting",
              // ),
              BottomNavigationBarItem(
                icon: Image.asset("assets/image/category.png",
                    height: 20,
                    color: selectedScreenIndex == 1
                        ? const Color(0xff01635D)
                        : const Color(0xffA0A0A0)),
                label: "Quote",
              ),
              BottomNavigationBarItem(
                icon: Image.asset("assets/image/profile.png",
                    height: 20,
                    color: selectedScreenIndex == 2
                        ? const Color(0xff01635D)
                        : const Color(0xffA0A0A0)),
                label: "Profile",
              ),
            ]),
      ),
    );
  }

  void showMyDialog() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
            title: WillPopScope(
          onWillPop: () async => false,
          child: Container(
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text("Set up your profile with in 3 steps",
                      style: GoogleFonts.lato(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                      textAlign: TextAlign.center),
                  const SizedBox(
                    height: 20,
                  ),
                  TextButton(
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(const Color(0xFF116D6E)),
                        padding: MaterialStateProperty.all(
                            const EdgeInsets.symmetric(
                                horizontal: 30, vertical: 12)),
                        shape: MaterialStateProperty.all(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                      ),
                      onPressed: () {
                        if (screenStatus == "1") {
                          Navigator.push(context, MaterialPageRoute(
                            builder: (context) {
                              return const ProfileSetup1();
                            },
                          ));
                        } else if (screenStatus == "2") {
                          Navigator.push(context, MaterialPageRoute(
                            builder: (context) {
                              return const ProfileSetup2();
                            },
                          ));
                        } else if (screenStatus == "3") {
                          Navigator.push(context, MaterialPageRoute(
                            builder: (context) {
                              return const ProfileSetup3();
                            },
                          ));
                        }
                      },
                      child: Text("Start Setup",
                          style: GoogleFonts.lato(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                          ))),
                ],
              ),
            ),
          ),
        ));
      },
    );
  }
}
