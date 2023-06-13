
// ignore_for_file: sort_child_properties_last

import 'package:dentalapp/clinic_screen/create_quote.dart';
import 'package:dentalapp/clinic_screen/profile_edit.dart';
import 'package:dentalapp/custom_widget/drawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chat_bubble/chat_bubble.dart';
import 'package:google_fonts/google_fonts.dart';

class DasBoardScreen extends StatefulWidget {
  const DasBoardScreen({Key? key}) : super(key: key);

  @override
  State<DasBoardScreen> createState() => _DasBoardScreenState();
}

class _DasBoardScreenState extends State<DasBoardScreen> {
  final GlobalKey<ScaffoldState> _key = GlobalKey();
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
                  height: height * 0.38,
                  width: double.infinity,

                  decoration: const BoxDecoration(
                      color: Color(0xFF116D6E),
                      image: DecorationImage(
                          image: AssetImage("assets/image/Group 12305.png"),
                          fit: BoxFit.fitWidth,
                          alignment: Alignment.bottomCenter,
                          opacity: 0.3)),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 20,
                      horizontal: 20,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: height * 0.05,
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            GestureDetector(
                              onTap: (){
                                _key.currentState!.openDrawer();
                              },
                              child: const Image(
                                  image: AssetImage("assets/image/Menu.png")),
                            ),
                            //   Image.asset("assets/image/Menu.png"),
                            SizedBox(
                              width: width * 0.25,
                            ),
                            Stack(
                              children: [
                                Container(
                                  height: 80,
                                  width: 80,
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                        color: Colors.white, width: 1),
                                    shape: BoxShape.circle,
                                    color: Colors.amberAccent,
                                  ),
                                  child: Center(
                                      child: Text("N",
                                          style: GoogleFonts.lato(
                                              color: Colors.white,
                                              fontSize: 24,
                                              fontWeight:
                                                  FontWeight.w600))),
                                ),
                                Positioned(
                                    bottom: 0,
                                    right: 0,
                                    child: SizedBox(
                                      height: 25,
                                      width: 25,
                                      child: Image.asset(
                                          "assets/image/profileclick.png"),
                                    ))
                              ],
                            ),


                                SizedBox(width: width*0.02,),
                            Padding(
                              padding: const EdgeInsets.only(top: 50),
                              child: ChatBubble(backGroundColor: Colors.white,
                                child:  Text("verified",
                                  style: GoogleFonts.lato(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400,
                                    color: const Color(0xff116D6E),
                                  )),
                                clipper: ChatBubbleClipper4(
                                    type: BubbleType.receiverBubble),
                              ),
                            )
                          ],
                        ),
                        // SizedBox(height: 16,),

                        SizedBox(
                          height: height*0.01,
                        ),
                        Text("User name",
                            style: GoogleFonts.lato(
                              fontSize: 20,
                              fontWeight: FontWeight.w700,
                              color: Colors.white,
                            )),
                        SizedBox(
                          height: height*0.01,
                        ),
                        Text("Since 1992",
                            style: GoogleFonts.lato(
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                              color: Colors.white,
                            )),
                      ],
                    ),
                  )),

              Positioned(
                top: 250,left: 15,
                child: Row(mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Column(
                      children: [
                        GestureDetector(
                          onTap: (){
                            Navigator.push(context,MaterialPageRoute(builder: (context) {
                              return const CreatQuote();
                            },));
                          },
                          child: Card(
                            child: Container(
                              width: 150,
                              height: 150,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                color: Colors.white,
                              ),

                              child: Column(crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SizedBox(height: 40,width: 40,
                                      child: Image.asset('assets/image/newquote.png',fit: BoxFit.fill,)),
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
                        ),
                        Card(
                          child: Container(
                            width: 150,
                            height: 150,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              color: Colors.white,
                            ),

                            child: Column(crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SizedBox(height: 40,width: 40,
                                    child: Image.asset('assets/image/quote.png',fit: BoxFit.fill,)),
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
                        Card(
                          child: Container(
                            width: 150,
                            height: 150,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              color: Colors.white,
                            ),

                            child: Column(crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SizedBox(height: 40,width: 40,
                                    child: Image.asset('assets/image/Notification 3.png',fit: BoxFit.fill,)),
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
                      ],
                    ),
                    const SizedBox(width: 10),
                    Column(
                      children: [
                        GestureDetector(
                          onTap: (){
                            Navigator.push(context,MaterialPageRoute(builder: (context) {
                              return const ProfileEdit();
                            },));
                          },
                          child: Card(
                            child: Container(
                              width: 150,
                              height: 150,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                color: Colors.white,
                              ),

                              child: Column(crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SizedBox(height: 40,width: 40,
                                      child: Image.asset('assets/image/newquote.png',fit: BoxFit.fill,)),
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
                        ),
                        Card(
                          child: Container(
                            width: 150,
                            height: 150,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              color: Colors.white,
                            ),

                            child: Column(crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SizedBox(height: 40,width: 40,
                                    child: Image.asset('assets/image/Message18.png',fit: BoxFit.fill,)),
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

