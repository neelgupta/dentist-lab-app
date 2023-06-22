import 'package:dentalapp/screen/quote_screen.dart';
import 'package:dentalapp/screen/dashboard_screen.dart';
import 'package:dentalapp/screen/public_profile_screen.dart';
import 'package:dentalapp/util/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:dentalapp/screen/manage_profile_1.dart';
import 'package:dentalapp/screen/manage_profile_2.dart';
import 'package:dentalapp/screen/manage_profile_3.dart';
import 'package:dentalapp/screen/manage_profile_4.dart';
import 'package:dentalapp/screen/manage_profile_5.dart';
import 'package:dentalapp/screen/manage_profile_6.dart';

class LabHome extends StatefulWidget {
  final int index;
  const LabHome({Key? key, required this.index}) : super(key: key);

  @override
  State<LabHome> createState() => _LabHomeState();
}

class _LabHomeState extends State<LabHome> {
  int selectedScreenIndex = 0;

  List selectedScreenList = [
    const DashBoardScreen(),
    const QuoteScreen(),
    const PublicProfileScreen(),
  ];

  void _selectScreen(int index) {
    setState(() {
      selectedScreenIndex = index;
    });
  }

  var screenStatus = "1";
  @override
  void initState() {
    super.initState();
    selectedScreenIndex = widget.index;
    screenStatus = Utils.getScreenStatus();
    SchedulerBinding.instance.addPostFrameCallback((_) {
      if (screenStatus != "7") showMyDialog(context);
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
            selectedItemColor: const Color(0xFF116D6E),
            unselectedItemColor: const Color(0xFFA0A0A0),
            onTap: _selectScreen,
            showUnselectedLabels: true,
            type: BottomNavigationBarType.fixed,
            items: [
              BottomNavigationBarItem(
                icon: Image.asset("assets/image/dasboard.png",
                    height: 20,
                    color: selectedScreenIndex == 0
                        ? const Color(0xFF116D6E)
                        : const Color(0xFFA0A0A0)),
                label: "DashBoard",
              ),
              BottomNavigationBarItem(
                icon: Image.asset("assets/image/category.png",
                    height: 20,
                    color: selectedScreenIndex == 1
                        ? const Color(0xFF116D6E)
                        : const Color(0xFFA0A0A0)),
                label: "Quote",
              ),
              BottomNavigationBarItem(
                icon: Image.asset("assets/image/profile.png",
                    height: 20,
                    color: selectedScreenIndex == 2
                        ? const Color(0xFF116D6E)
                        : const Color(0xFFA0A0A0)),
                label: "Profile",
              ),
            ]),
      ),
    );
  }

  void showMyDialog(BuildContext context) {
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
              borderRadius: BorderRadius.circular(12),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text("Set up your profile with in 6 steps",
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
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => screenStatus == "1"
                                  ? const ManageProfile1()
                                  : screenStatus == "2"
                                      ? const ManageProfile2()
                                      : screenStatus == "3"
                                          ? const ManageProfile3()
                                          : screenStatus == "4"
                                              ? const ManageProfile4()
                                              : screenStatus == "5"
                                                  ? const ManageProfile5()
                                                  : const ManageProfile6(),
                            ));
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
