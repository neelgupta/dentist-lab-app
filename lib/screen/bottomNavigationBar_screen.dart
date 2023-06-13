import 'package:dentalapp/screen/dashboard_1_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BottomNavigatorBarWidget extends StatefulWidget {
  const BottomNavigatorBarWidget({Key? key}) : super(key: key);

  @override
  State<BottomNavigatorBarWidget> createState() => _BottomNavigatorBarWidgetState();
}

class _BottomNavigatorBarWidgetState extends State<BottomNavigatorBarWidget> {

  int selectedScreenIndex = 3;

  List  selectedScreenList= [
    SizedBox(),
    SizedBox(),
    SizedBox(),
    DashBoard1Screen()
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
          backgroundColor: Color(0xFF116D6E),
          currentIndex: selectedScreenIndex,
          // backgroundColor: const Color(0xff116D6E),
          selectedItemColor: const Color(0xFF219653),
          unselectedItemColor: const Color(0xffFFFFFF),
          onTap: _selectScreen,
          showUnselectedLabels: true,
          type: BottomNavigationBarType.fixed,
          items: [
            BottomNavigationBarItem(
              backgroundColor: Colors.white,
              icon: Image.asset("assets/image/profile.png",
                  height: 20,
                  color: selectedScreenIndex == 0
                      ? const Color(0xFF219653)
                      : const Color(0xffFFFFFF)),
              label: "Profile",
            ),
            BottomNavigationBarItem(
              icon: Image.asset("assets/image/Setting.png",
                  height: 20,
                  color: selectedScreenIndex == 1
                      ? Color(0xFF219653)
                      : Color(0xffFFFFFF)),
              label: "Setting",
            ),
            BottomNavigationBarItem(
              icon: Image.asset("assets/image/category.png",
                  height: 20,
                  color: selectedScreenIndex == 2
                      ? Color(0xFF219653)
                      : Color(0xffFFFFFF)),
              label: "Quote",
            ),
            BottomNavigationBarItem(
              icon: Image.asset("assets/image/dasboard.png",
                  height: 20,
                  color: selectedScreenIndex == 3
                      ? Color(0xFF219653)
                      : Color(0xffFFFFFF)),
              label: "DashBoard",
            ),

          ]
      ),
    );
  }
}
