import 'package:dentalapp/screen/dashboard_1_screen.dart';
import 'package:dentalapp/screen/public_profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BottomNavigatorBarWidget extends StatefulWidget {
  const BottomNavigatorBarWidget({Key? key}) : super(key: key);

  @override
  State<BottomNavigatorBarWidget> createState() => _BottomNavigatorBarWidgetState();
}

class _BottomNavigatorBarWidgetState extends State<BottomNavigatorBarWidget> {

  int selectedScreenIndex = 0;

  List  selectedScreenList= [
     DashBoard1Screen(),
    SizedBox(),
    SizedBox(),
    PublicProfileScreen(),
    // "Setting",
  ];


  void _selectScreen(int index) {
    setState(() {
      selectedScreenIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              icon: Image.asset("assets/image/Setting.png",
                  height: 20,
                  color: selectedScreenIndex == 1
                      ? const Color(0xFF116D6E)
                      : const Color(0xFFA0A0A0)),
              label: "Setting",
            ),
            BottomNavigationBarItem(
              icon: Image.asset("assets/image/category.png",
                  height: 20,
                  color: selectedScreenIndex == 2
                      ? const Color(0xFF116D6E)
                      : const Color(0xFFA0A0A0)),
              label: "Quote",
            ),
            BottomNavigationBarItem(
              icon: Image.asset("assets/image/profile.png",
                  height: 20,
                  color: selectedScreenIndex == 3
                      ? const Color(0xFF116D6E)
                      : const Color(0xFFA0A0A0)),
              label: "Profile",
            ),

          ]
      ),
    );
  }
}
