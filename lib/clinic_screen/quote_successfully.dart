// ignore_for_file: prefer_const_constructors

import 'package:dentalapp/clinic_screen/bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class QuoteSuccessfully extends StatefulWidget {
  const QuoteSuccessfully({Key? key}) : super(key: key);

  @override
  State<QuoteSuccessfully> createState() => _QuoteSuccessfullyState();
}

class _QuoteSuccessfullyState extends State<QuoteSuccessfully> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height -
        MediaQuery.of(context).padding.top -
        MediaQuery.of(context).padding.bottom;
    double width = MediaQuery.of(context).size.width -
        MediaQuery.of(context).padding.right -
        MediaQuery.of(context).padding.left;
    return WillPopScope(
      onWillPop: goBack,
      child: SafeArea(
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          body: SizedBox(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
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
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: height * 0.02,
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            InkWell(
                                onTap: () {
                                  Navigator.pushAndRemoveUntil(context,
                                      MaterialPageRoute(
                                    builder: (context) {
                                      return const BottomNavigation(index: 0);
                                    },
                                  ), (route) => false);
                                },
                                child: Padding(
                                  padding: EdgeInsets.only(left: width * 0.03),
                                  child: const Icon(
                                    Icons.keyboard_backspace,
                                    color: Colors.white,
                                  ),
                                )),
                            const Spacer(),
                            Center(
                                child: Text(
                              textAlign: TextAlign.center,
                              "Quote",
                              style: GoogleFonts.lato(
                                fontSize: 28,
                                fontWeight: FontWeight.w600,
                                color: Colors.white,
                              ),
                            )),
                            const Spacer(),
                            Padding(
                              padding: EdgeInsets.only(left: width * 0.03),
                              child: const Icon(
                                Icons.keyboard_backspace,
                                color: Colors.transparent,
                              ),
                            ),
                          ],
                        ),
                      ],
                    )),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: width * 0.1),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: height * 0.18,
                      ),
                      Image(
                          image: AssetImage("assets/image/Group 12680.png"),
                          height: height * 0.25),
                      SizedBox(
                        height: height * 0.05,
                      ),
                      Text(
                        "Quote successfully Live",
                        style: GoogleFonts.lato(
                            fontSize: 18, fontWeight: FontWeight.w600),
                      ),
                      SizedBox(
                        height: height * 0.02,
                      ),
                    ],
                  ),
                ),
                const Spacer(),
                Container(
                  height: height * 0.064,
                  width: width * 0.9,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: const Color(0xff116D6E)),
                  child: TextButton(
                      onPressed: () {
                        Navigator.pushAndRemoveUntil(context, MaterialPageRoute(
                          builder: (context) {
                            return const BottomNavigation(index: 0);
                          },
                        ), (route) => false);
                      },
                      child: Text("Back To Home",
                          style: GoogleFonts.lato(
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                              color: Colors.white))),
                ),
                SizedBox(
                  height: height * 0.05,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<bool> goBack() async {
    Navigator.pushAndRemoveUntil(context, MaterialPageRoute(
      builder: (context) {
        return const BottomNavigation(
          index: 0,
        );
      },
    ), (route) => false);
    return true;
  }
}
