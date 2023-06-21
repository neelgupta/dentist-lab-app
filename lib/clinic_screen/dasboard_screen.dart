
// ignore_for_file: sort_child_properties_last

import 'package:dentalapp/clinic_screen/Bottom_Navibar.dart';
import 'package:dentalapp/clinic_screen/clinic_notification.dart';
import 'package:dentalapp/clinic_screen/create_quote.dart';
import 'package:dentalapp/clinic_screen/payment_history.dart';
import 'package:dentalapp/clinic_screen/profile_edit.dart';
import 'package:dentalapp/custom_widget/drawer.dart';
import 'package:dentalapp/util/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chat_bubble/chat_bubble.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class DasBoardScreen extends StatefulWidget {
  const DasBoardScreen({Key? key}) : super(key: key);

  @override
  State<DasBoardScreen> createState() => _DasBoardScreenState();
}

class _DasBoardScreenState extends State<DasBoardScreen> {
  final GlobalKey<ScaffoldState> _key = GlobalKey();
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
    double height = MediaQuery.of(context).size.height -
        MediaQuery.of(context).padding.top -
        MediaQuery.of(context).padding.bottom;
    double width = MediaQuery.of(context).size.width -
        MediaQuery.of(context).padding.right -
        MediaQuery.of(context).padding.left;
    return Scaffold(key: _key,drawer: const CustomDrawer(),
      body: SingleChildScrollView(
        physics: const NeverScrollableScrollPhysics(),
        child: Container(
          height: height * 0.98,
          width: double.infinity,
          decoration: const BoxDecoration(
              color: Colors.white,
              image: DecorationImage(
                  image: AssetImage("assets/image/Group 12305.png"),
                  fit: BoxFit.fitWidth,
                  alignment: Alignment.bottomCenter,
                  opacity: 0.3)),
          child: Stack(
            children: [
              Container(
                  height: height * 0.3,
                  width: double.infinity,
                  decoration: const BoxDecoration(
                      color: Color(0xFF116D6E),
                      image: DecorationImage(
                          image: AssetImage("assets/image/Group 12305.png"),
                          fit: BoxFit.fitWidth,
                          alignment: Alignment.bottomCenter,
                          opacity: 0.3)),
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: width * 0.05,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: height * 0.03,
                        ),
                        Align(
                          alignment: Alignment.topLeft,
                          child: GestureDetector(
                            onTap: (){
                              _key.currentState!.openDrawer();
                            },
                            child: Image(
                                image: const AssetImage("assets/image/Menu.png"),height: width * 0.07),
                          ),
                        ),
                        Stack(
                          children: [
                            Container(
                              height: width * 0.2,
                              width: width * 0.2,
                              decoration: BoxDecoration(
                                border: Border.all(
                                    color: Colors.white, width: 1),
                                shape: BoxShape.circle,
                                image: DecorationImage(image: NetworkImage(profileImage),fit: BoxFit.fill)
                              )),
                            Positioned(
                                bottom: 0,
                                right: 0,
                                child: SizedBox(
                                  height: width * 0.06,
                                  width: width * 0.06,
                                  child: Image.asset(
                                      "assets/image/profileclick.png"),
                                ))
                          ],
                        ),
                        SizedBox(
                          height: height*0.01,
                        ),
                        Text("$firstName $lastName",
                            style: GoogleFonts.lato(
                              fontSize: 20,
                              fontWeight: FontWeight.w700,
                              color: Colors.white,
                            )),
                        SizedBox(
                          height: height*0.005,
                        ),
                        if(establishDate.isNotEmpty)Text("Since ${DateFormat('yyyy').format(DateTime.parse(establishDate))}",
                            style: GoogleFonts.lato(
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                              color: Colors.white,
                            )),
                      ],
                    ),
                  )),

              Align(
                alignment: Alignment.bottomCenter,
                child: Column(
                  children: [
                    Expanded(child: Container()),
                    Row(mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Column(
                          children: [
                            InkWell(
                              onTap: (){
                                Navigator.push(context,MaterialPageRoute(builder: (context) {
                                  return const CreateQuote();
                                },));
                              },
                              child: Container(
                                width: width * 0.35,
                                height: width * 0.35,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12),
                                  color: Colors.white,
                                  boxShadow: <BoxShadow>[
                                    BoxShadow(
                                        color: const Color(0xff116D6E).withOpacity(0.5),
                                        blurRadius: 2.0,
                                        spreadRadius: 1.0,
                                        offset: const Offset(0.0, 3.0)
                                    ),
                                  ],
                                ),

                                child: Column(crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    SizedBox(height: 40,width: 40,
                                        child: Image.asset('assets/image/newQuoteIcon.png',fit: BoxFit.fill,)),
                                    SizedBox(height: height*0.01,),
                                    Text("New Quote",
                                        style: GoogleFonts.lato(
                                          fontSize: 20,
                                          fontWeight: FontWeight.w400,
                                          color: const Color(0xff116D6E),
                                        )),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(height: height*0.02,),
                            InkWell(
                              onTap: () {
                                Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) {
                                  return const BottomNavigation(index: 1);
                                },), (route) => false);
                              },
                              child: Container(
                                width: width * 0.35,
                                height: width * 0.35,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12),
                                  color: Colors.white,
                                  boxShadow: <BoxShadow>[
                                    BoxShadow(
                                        color: const Color(0xff116D6E).withOpacity(0.5),
                                        blurRadius: 2.0,
                                        spreadRadius: 1.0,
                                        offset: const Offset(0.0, 3.0)
                                    ),
                                  ],
                                ),

                                child: Column(crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    SizedBox(height: 40,width: 40,
                                        child: Image.asset('assets/image/quoteIcon.png',fit: BoxFit.fill,)),
                                    SizedBox(height: height*0.01,),
                                    Text("Quote",
                                        style: GoogleFonts.lato(
                                          fontSize: 20,
                                          fontWeight: FontWeight.w400,
                                          color: const Color(0xff116D6E),
                                        )),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(height: height*0.02,),
                            InkWell(
                              onTap: () {
                                Navigator.push(context, MaterialPageRoute(builder: (context) {
                                  return const ClinicNotification();
                                },));
                              },
                              child: Container(
                                width: width * 0.35,
                                height: width * 0.35,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12),
                                  color: Colors.white,
                                  boxShadow: <BoxShadow>[
                                    BoxShadow(
                                        color: const Color(0xff116D6E).withOpacity(0.5),
                                        blurRadius: 2.0,
                                        spreadRadius: 1.0,
                                        offset: const Offset(0.0, 3.0)
                                    ),
                                  ],
                                ),
                                child: Column(crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    SizedBox(height: 40,width: 40,
                                        child: Image.asset('assets/image/notificationIcon.png',fit: BoxFit.fill,)),
                                    SizedBox(height: height*0.01,),
                                    Text("Notifications",
                                        style: GoogleFonts.lato(
                                          fontSize: 20,
                                          fontWeight: FontWeight.w400,
                                          color: const Color(0xff116D6E),
                                        )),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(height: height*0.14,)
                          ],
                        ),
                        SizedBox(width: width * 0.05),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            InkWell(
                              onTap: (){
                                Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) {
                                  return const BottomNavigation(index: 2);
                                },), (route) => false);
                              },
                              child: Container(
                                width: width * 0.35,
                                height: width * 0.35,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12),
                                  color: Colors.white,
                                  boxShadow: <BoxShadow>[
                                    BoxShadow(
                                        color: const Color(0xff116D6E).withOpacity(0.5),
                                        blurRadius: 2.0,
                                        spreadRadius: 1.0,
                                        offset: const Offset(0.0, 3.0)
                                    ),
                                  ],
                                ),

                                child: Column(crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    SizedBox(height: 40,width: 40,
                                        child: Image.asset('assets/image/profileIcon.png',fit: BoxFit.fill,)),
                                    SizedBox(height: height*0.01,),
                                    Text("Profile",
                                        style: GoogleFonts.lato(
                                          fontSize: 20,
                                          fontWeight: FontWeight.w400,
                                          color: const Color(0xff116D6E),
                                        )),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(height: height * 0.02,),
                            InkWell(
                              onTap: (){
                                Navigator.push(context,MaterialPageRoute(builder: (context) {
                                  return const PaymentHistory();
                                },));

                              },
                              child: Container(
                                width: width * 0.35,
                                height: width * 0.35,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12),
                                  color: Colors.white,
                                  boxShadow: <BoxShadow>[
                                    BoxShadow(
                                        color: const Color(0xff116D6E).withOpacity(0.5),
                                        blurRadius: 2.0,
                                        spreadRadius: 1.0,
                                        offset: const Offset(0.0, 3.0)
                                    ),
                                  ],
                                ),

                                child: Column(crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    SizedBox(height: 40,width: 40,
                                        child: Image.asset('assets/image/paymentIcon.png',fit: BoxFit.fill,)),
                                    SizedBox(height: height*0.01,),
                                    Text("Payment",
                                        style: GoogleFonts.lato(
                                          fontSize: 20,
                                          fontWeight: FontWeight.w400,
                                          color: const Color(0xff116D6E),
                                        )),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(height: height*0.1,)
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

}

