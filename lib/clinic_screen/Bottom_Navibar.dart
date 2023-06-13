import 'package:dentalapp/clinic_screen/create_quote.dart';
import 'package:dentalapp/clinic_screen/dasboard_screen.dart';
import 'package:dentalapp/clinic_screen/profile_edit.dart';
import 'package:dentalapp/clinic_screen/setup_screen/profilesetup_1.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';

class BottomNavigation extends StatefulWidget {
  const BottomNavigation({Key? key}) : super(key: key);

  @override
  State<BottomNavigation> createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
     SchedulerBinding.instance.addPostFrameCallback((_) {
      showMyDialog();
      // your dialong goes here
    }
    );
  }


  int selectedScreenIndex = 0;

  List  selectedScreenList= [
    ProfileEdit(),
    SizedBox(),
    CreatQuote(),
    // "Setting",
     DasBoardScreen(),
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
          selectedItemColor: const Color(0xff01635D),
          unselectedItemColor: const Color(0xffA0A0A0),
          onTap: _selectScreen,
          showUnselectedLabels: true,
          type: BottomNavigationBarType.fixed,
          items: [
            BottomNavigationBarItem(
              icon: Image.asset("assets/image/profile.png",
                  height: 20,
                  color: selectedScreenIndex == 0
                      ? const Color(0xff01635D)
                      : const Color(0xffA0A0A0)),
              label: "Profile",
            ),
            BottomNavigationBarItem(
              icon: Image.asset("assets/image/Setting.png",
                  height: 20,
                  color: selectedScreenIndex == 1
                      ? Color(0xff01635D)
                      : Color(0xffA0A0A0)),
              label: "Setting",
            ),
            BottomNavigationBarItem(
              icon: Image.asset("assets/image/category.png",
                  height: 20,
                  color: selectedScreenIndex == 2
                      ? Color(0xff01635D)
                      : Color(0xffA0A0A0)),
              label: "Quote",
            ),
            BottomNavigationBarItem(

              icon: Image.asset("assets/image/dasboard.png",
                  height: 20,
                  color: selectedScreenIndex == 3
                      ? Color(0xff01635D)
                      : Color(0xffA0A0A0)),
              label: "DashBoard",
            ),

          ]
             ),
    );
  }

  void showMyDialog() {
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
                  padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text("Set up your profile with in 3 steps",style: GoogleFonts.lato(fontSize: 18,fontWeight: FontWeight.w600,),textAlign: TextAlign.center),
                      SizedBox(height: 20,),
                      Text("Lorem ipsum dolor sit, consecteturamet adipiscing."
                          " Pellentesque tristique elit in nibh ultricies rhoncus.",
                          style: GoogleFonts.lato(fontSize: 14,fontWeight: FontWeight.w400,color: Color(0xFF707070),),
                          maxLines: 3,overflow: TextOverflow.ellipsis,textAlign: TextAlign.center),
                      SizedBox(height: 30,),
                      TextButton(
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(Color(0xFF116D6E)),
                            padding: MaterialStateProperty.all(EdgeInsets.symmetric(horizontal: 30,vertical: 12)),
                            shape: MaterialStateProperty.all(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                          ),
                          onPressed: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context) {
                              return  const profileSetup1();
                            },));
                          },
                          child: Text("Start Setup",style: GoogleFonts.lato(fontSize: 14,fontWeight: FontWeight.w600,color: Colors.white,))),
                    ],
                  ),
                ),
              )
          );
        },
      );
  }


}
