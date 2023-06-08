// ignore_for_file: non_constant_identifier_names

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomDrawer extends StatefulWidget {
  const CustomDrawer({Key? key}) : super(key: key);

  @override
  State<CustomDrawer> createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {
  var selectedIndex = 0;

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
    double height = MediaQuery
        .of(context)
        .size
        .height -
        MediaQuery
            .of(context)
            .padding
            .top -
        MediaQuery
            .of(context)
            .padding
            .bottom;
    double width = MediaQuery
        .of(context)
        .size
        .width -
        MediaQuery
            .of(context)
            .padding
            .right -
        MediaQuery
            .of(context)
            .padding
            .left;
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
                      bottom: BorderSide(width: 1, color: Color(0xffE7E7E7)))
              ),
              child: Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: Row(mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(8),
                      height: 60,
                      width: 60,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: const Color(0xff116D6E),
                          border: Border.all(color: Colors.black)),
                      child: Center(
                        child: Container(
                          padding: const EdgeInsets.all(5),
                          child: const Text("N", style: TextStyle(
                              color: Colors.white, fontSize: 22),),
                        ),
                      ),
                    ),
                    SizedBox(width: width * 0.02,),
                    Column(mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text("User name", style: TextStyle(color: Color(
                            0xff252525), fontSize: 16, fontWeight: FontWeight
                            .w700),),
                        Text("Since 1992", style: TextStyle(color: Color(
                            0xff252525), fontSize: 13, fontWeight: FontWeight
                            .w400),),
                      ],
                    ),
                    const Spacer(),
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: SizedBox(height: 15, width: 15,
                          child: Image.asset(
                              'assets/image/close.png', fit: BoxFit.fill)),
                    )
                  ],
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {

              setState(() {
                selectedIndex = 0;
                log(selectedIndex);
              });
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
                      child: Image.asset("assets/image/d_home.png",color:  selectedIndex ==0?Color(0xff116D6E):Colors.black),
                    ),
                    SizedBox(width: width * 0.05),
                     Text("Home", style: TextStyle(
                        color: selectedIndex==0?Color(0xff116D6E):Colors.black, fontSize: 16),),
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(height: 5),
          GestureDetector(
            onTap: () {
              // Get.offAndToNamed(Routes.BOTTOM_NAVIGATIONBAR);
              setState(() {
                selectedIndex = 1;
                log(selectedIndex);
              });
            },
            child: Padding(
              padding: const EdgeInsets.only(left: 30, right: 20),
              child: Row(
                children: [
                  SizedBox(
                    height: height * 0.06,
                    width: width * 0.07,
                    child: Image.asset("assets/image/d_profile.png",color: selectedIndex==1?const Color(0xff116D6E):Colors.black),
                  ),
                  SizedBox(width: width * 0.05),
                   Text("Profile",
                    style: TextStyle(color: selectedIndex==1?Color(0xff116D6E):Colors.black, fontSize: 16),),
                ],
              ),
            ),
          ),
          const SizedBox(height: 5),
          GestureDetector(
            onTap: () {
              //  Get.offAndToNamed(Routes.BOTTOM_NAVIGATIONBAR);
              setState(() {
                selectedIndex = 2;
                log(selectedIndex);
              });
            },
            child: Padding(
              padding: const EdgeInsets.only(left: 30, right: 20),
              child: Row(
                children: [
                  SizedBox(
                    height: height * 0.06,
                    width: width * 0.07,
                    child: Image.asset("assets/image/drawerquote.png",color: selectedIndex==2?const Color(0xff116D6E):Colors.black),
                  ),
                  SizedBox(width: width * 0.05),
                   Text("Quote",
                    style: TextStyle(color: selectedIndex==2?const Color(0xff116D6E):Colors.black, fontSize: 16),),
                ],
              ),
            ),
          ),
          const SizedBox(height: 5),
          GestureDetector(
            onTap: () {
              setState(() {
                selectedIndex = 3;
              });
    },
            child: Padding(
              padding: const EdgeInsets.only(left: 30, right: 20),
              child: Row(
                children: [
                  SizedBox(
                    height: height * 0.06,
                    width: width * 0.07,
                    child: Image.asset("assets/image/drawerdashboard.png",color: selectedIndex==3?const Color(0xff116D6E):Colors.black),
                  ),
                  SizedBox(width: width * 0.05),
                   Text("Dashboard",
                    style: TextStyle(color:selectedIndex==3?const Color(0xff116D6E):Colors.black, fontSize: 16),),
                ],
              ),
            ),
          ),
          const SizedBox(height: 5),
          GestureDetector(
            onTap: () {

              setState(() {
                selectedIndex = 4;
                log(selectedIndex);
              });
            },
            child: Padding(
              padding: const EdgeInsets.only(left: 30, right: 20),
              child: Row(
                children: [
                  SizedBox(
                    height: height * 0.06,
                    width: width * 0.07,
                    child: Image.asset("assets/image/d_payment.png",color: selectedIndex==4?const Color(0xff116D6E):Colors.black),
                  ),
                  SizedBox(width: width * 0.05),
                   Text("Payments",
                    style: TextStyle(color: selectedIndex==4?const Color(0xff116D6E):Colors.black, fontSize: 16),),
                ],
              ),
            ),
          ),
          const SizedBox(height: 5),
          GestureDetector(
            onTap: () {
              setState(() {
                selectedIndex = 5;
              });
            },
            child: Padding(
              padding: const EdgeInsets.only(left: 30, right: 20),
              child: Row(
                children: [
                  SizedBox(
                    height: height * 0.06,
                    width: width * 0.07,
                    child: Image.asset("assets/image/d_notificatin.png",color: selectedIndex==5?const Color(0xff116D6E):Colors.black),
                  ),
                  SizedBox(width: width * 0.05),
                   Text("Notifications",
                    style: TextStyle(color: selectedIndex==5?const Color(0xff116D6E):Colors.black, fontSize: 16),),
                ],
              ),
            ),
          ),
          const SizedBox(height: 5),
          GestureDetector(
            onTap: () {
              setState(() {
                selectedIndex = 6;
              });
            },
            child: Padding(
              padding: const EdgeInsets.only(left: 30, right: 20),
              child: Row(
                children: [
                  SizedBox(
                    height: height * 0.06,
                    width: width * 0.07,
                    child: Image.asset("assets/image/d_message.png",color: selectedIndex==6?const Color(0xff116D6E):Colors.black),
                  ),
                  SizedBox(width: width * 0.05),
                   Text("Messages",
                    style: TextStyle(color: selectedIndex==6?const Color(0xff116D6E):Colors.black, fontSize: 16),),
                ],
              ),
            ),
          ),
          const SizedBox(height: 5),
          GestureDetector(
            onTap: () {
              setState(() {
                selectedIndex = 7;
              });
            },
            child: Padding(
              padding: const EdgeInsets.only(left: 30, right: 20),
              child: Row(
                children: [
                  SizedBox(
                    height: height * 0.06,
                    width: width * 0.07,
                    child: Image.asset("assets/image/d_setting.png",color:selectedIndex==7?const Color(0xff116D6E):Colors.black),
                  ),
                  SizedBox(width: width * 0.05),
                   Text("Setting",
                    style: TextStyle(color: selectedIndex==7?const Color(0xff116D6E):Colors.black, fontSize: 16),),

                ],
              ),
            ),
          ),
          const SizedBox(height: 5),
          const Spacer(),
          Container(height: height*0.07,width: width,
              margin: const EdgeInsets.only(left: 30,right: 30,bottom: 40),
              decoration:  BoxDecoration(
                color: const Color(0xff116D6E),
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Center(
                child: Text("Logout",
                  style: TextStyle(color: Color(0xffFFFFFF), fontSize: 16),),
              ),

          )


        ],
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
