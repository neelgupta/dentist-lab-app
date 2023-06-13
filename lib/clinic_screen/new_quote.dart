import 'package:dentalapp/clinic_screen/quote_detail_pendind.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class NewQuote extends StatefulWidget {
  const NewQuote({Key? key}) : super(key: key);

  @override
  State<NewQuote> createState() => _NewQuoteState();
}

class _NewQuoteState extends State<NewQuote> {
  bool quoteNew = true;
  bool quoteAccepted = false;
  bool quoteCompleted = false;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height -
        MediaQuery.of(context).padding.top -
        MediaQuery.of(context).padding.bottom;
    double width = MediaQuery.of(context).size.width -
        MediaQuery.of(context).padding.right -
        MediaQuery.of(context).padding.left;
    return Scaffold(
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
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
                              Navigator.pop(context);
                            },
                            child: const Padding(
                              padding: EdgeInsets.only(left: 20),
                              child: Icon(
                                Icons.keyboard_backspace,
                                color: Colors.white,
                              ),
                            )),
                        SizedBox(
                          width: width / 3.8,
                        ),
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
                      ],
                    ),
                  ],
                )),
            SizedBox(
              height: height * 0.03,
            ),
            Container(
              alignment: Alignment.center,
              height: height * 0.1,
              width: width,
              child: SingleChildScrollView(
                physics: const NeverScrollableScrollPhysics(),
                scrollDirection: Axis.horizontal,
                child: Container(
                  height: height * 0.075,
                  width: width - 30,
                  decoration: BoxDecoration(
                      color: const Color(0xFFEBEFEE),
                      borderRadius: BorderRadius.circular(12)),
                  child: Padding(
                    padding: const EdgeInsets.only(
                        left: 7, right: 7, top: 7, bottom: 7),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Expanded(
                          child: InkWell(
                            onTap: () {
                              setState(() {
                                quoteNew = true;
                                quoteAccepted = false;
                                quoteCompleted = false;
                              });
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: quoteNew
                                    ? const Color(0xffFFFFFF)
                                    : const Color(0xFFEBEFEE),
                              ),
                              child: Center(
                                child: Text(
                                  "New",
                                  style: TextStyle(
                                      color: quoteNew
                                          ? const Color(0xff116D6E)
                                          : const Color(0xff252525),
                                      fontFamily: 'spartan',
                                      fontSize: 15,
                                      fontWeight: FontWeight.w700),
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: width * 0.015,
                        ),
                        Expanded(
                          child: InkWell(
                            onTap: () {
                              setState(() {
                                quoteNew = false;
                                quoteAccepted = true;
                                quoteCompleted = false;
                              });
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: quoteAccepted
                                    ? const Color(0xffFFFFFF)
                                    : const Color(0xFFEBEFEE),
                              ),
                              child: Center(
                                child: Text(
                                  "Accepted",
                                  style: TextStyle(
                                      color: quoteAccepted
                                          ? const Color(0xff116D6E)
                                          : const Color(0xff252525),
                                      fontFamily: 'spartan',
                                      fontSize: 15,
                                      fontWeight: FontWeight.w700),
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: width * 0.015,
                        ),
                        Expanded(
                          child: InkWell(
                            onTap: () {
                              setState(() {
                                quoteNew = false;
                                quoteAccepted = false;
                                quoteCompleted = true;
                              });
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: quoteCompleted
                                    ? const Color(0xffFFFFFF)
                                    : const Color(0xFFEBEFEE),
                              ),
                              child: Center(
                                child: Text(
                                  "Completed",
                                  style: TextStyle(
                                      color: quoteCompleted
                                          ? const Color(0xff116D6E)
                                          : const Color(0xff252525),
                                      fontFamily: 'spartan',
                                      fontSize: 15,
                                      fontWeight: FontWeight.w700),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            quoteNew ? Expanded(child: quoteNewList(context)) : const SizedBox(),
            quoteAccepted ? Expanded(child: quoteAcceptedList(context)) : const SizedBox(),
            quoteCompleted ? Expanded(child: quoteCompletedList(context)) : const SizedBox(),
          ],
        ),
      ),
    );
  }
}
/// New
Widget quoteNewList(BuildContext context) {
  double height = MediaQuery.of(context).size.height -
      MediaQuery.of(context).padding.top -
      MediaQuery.of(context).padding.bottom;
  double width = MediaQuery.of(context).size.width -
      MediaQuery.of(context).padding.right -
      MediaQuery.of(context).padding.left;
  return Padding(
    padding: const EdgeInsets.only(left: 20, right: 20),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Container(
                alignment: Alignment.topLeft,
                child: ListView.separated(
                  physics: const BouncingScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: 7,
                  separatorBuilder: (context, index) {
                    return const Divider(
                      thickness: 1,
                      color: Color(0xffE7E7E7),
                    );
                  },
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        SizedBox(
                          height: height * 0.02,
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: Text(
                                "Title lorem...",
                                maxLines: null,
                                 overflow: TextOverflow.ellipsis, softWrap: false,
                                style: GoogleFonts.lato(
                                  fontSize: 17,
                                  fontWeight: FontWeight.w600,
                                  color: const Color(0xff252525),
                                ),
                              ),
                            ),
                            const Spacer(),
                            Row(
                              children: [
                                Container(
                                  height: height * 0.04,
                                  width: width * 0.22,
                                  decoration: BoxDecoration(
                                      color: const Color(0xffFF5959),
                                      borderRadius: BorderRadius.circular(10)),
                                  child: Center(
                                    child: Text(
                                      "Urgent",
                                      style: GoogleFonts.lato(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              width: width * 0.03,
                            ),
                            GestureDetector(
                                onTap: () {},
                                child: const Image(
                                    height: 24,
                                    width: 24,
                                    image: AssetImage(
                                        "assets/image/editgreen.png"))),
                          ],
                        ),
                        SizedBox(
                          height: height * 0.01,
                        ),
                        Row(
                          children: [
                            Flexible(
                              child: Text(
                                "Service 1 Service 2 Service 3 ",
                                overflow: TextOverflow.ellipsis,
                                style: GoogleFonts.lato(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w400,
                                  color: const Color(0xff116D6E),
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: height * 0.01,
                        ),
                        Text(
                          "Lorem Ipsum has been the industry's standard dummy text ever since",
                          style: GoogleFonts.lato(
                            fontSize: 15,
                            fontWeight: FontWeight.w400,
                            color: const Color(0xff252525),
                          ),
                        ),
                        SizedBox(
                          height: height * 0.015,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "5 Proposals",
                              style: GoogleFonts.lato(
                                fontSize: 15,
                                fontWeight: FontWeight.w400,
                                color: const Color(0xff116D6E),
                              ),
                            ),
                            GestureDetector(
                              onTap: (){
                                ///pending Condition
                                Navigator.push(context, MaterialPageRoute(builder: (context) {
                                  return const QuoteDetailPending();
                                },));
                              },
                              child: Container(
                                height: height * 0.03,

                                decoration: BoxDecoration(
                                  color: const Color(0xffFFD059),
                                  borderRadius: BorderRadius.circular(2),
                                ),
                                child: Center(
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 10,right: 10),
                                    child: Text(
                                      "Pending",
                                      style: GoogleFonts.lato(
                                        fontSize: 10,
                                        fontWeight: FontWeight.w600,
                                        color: const Color(0xff252525),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        )
                      ],
                    );
                  },
                )),
          ),
        ),
        SizedBox(
          height: height * 0.03,
        ),
      ],
    ),
  );
}

///Accepted
Widget quoteAcceptedList(BuildContext context) {
  double height = MediaQuery.of(context).size.height -
      MediaQuery.of(context).padding.top -
      MediaQuery.of(context).padding.bottom;
  double width = MediaQuery.of(context).size.width -
      MediaQuery.of(context).padding.right -
      MediaQuery.of(context).padding.left;
  return Padding(
    padding: const EdgeInsets.only(left: 20, right: 20),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Container(
                alignment: Alignment.topLeft,
                child: ListView.separated(
                  physics: const BouncingScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: 7,
                  separatorBuilder: (context, index) {
                    return const Divider(
                      thickness: 1,
                      color: Color(0xffE7E7E7),
                    );
                  },
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        SizedBox(
                          height: height * 0.02,
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: Text(
                                "Title lorem...",
                                maxLines: null,
                                overflow: TextOverflow.ellipsis, softWrap: false,
                                style: GoogleFonts.lato(
                                  fontSize: 17,
                                  fontWeight: FontWeight.w600,
                                  color: const Color(0xff252525),
                                ),
                              ),
                            ),
                            const Spacer(),
                            Row(
                              children: [
                                Container(
                                  height: height * 0.04,
                                  width: width * 0.22,
                                  decoration: BoxDecoration(
                                      color: const Color(0xffFF5959),
                                      borderRadius: BorderRadius.circular(10)),
                                  child: Center(
                                    child: Text(
                                      "Urgent",
                                      style: GoogleFonts.lato(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                           

                          ],
                        ),
                        SizedBox(
                          height: height * 0.01,
                        ),
                        Row(
                          children: [
                            Flexible(
                              child: Text(
                                "Service 1 Service 2 Service 3 ",
                                overflow: TextOverflow.ellipsis,
                                style: GoogleFonts.lato(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w400,
                                  color: const Color(0xff116D6E),
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: height * 0.01,
                        ),
                        Text(
                          "Lorem Ipsum has been the industry's standard dummy text ever since",
                          style: GoogleFonts.lato(
                            fontSize: 15,
                            fontWeight: FontWeight.w400,
                            color: const Color(0xff252525),
                          ),
                        ),
                        SizedBox(
                          height: height * 0.015,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Text(
                                "Atlanta Lab...",
                                maxLines: null,
                                overflow: TextOverflow.ellipsis, softWrap: false,
                                style: GoogleFonts.lato(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w400,
                                  color: const Color(0xff116D6E),
                                ),
                              ),
                            ),
                            Container(
                              height: height * 0.03,

                              decoration: BoxDecoration(
                                color: const Color(0xffFFD059),
                                borderRadius: BorderRadius.circular(2),
                              ),
                              child: Center(
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 10,right: 10),
                                  child: Text(
                                    "In Progress",
                                    style: GoogleFonts.lato(
                                      fontSize: 10,
                                      fontWeight: FontWeight.w600,
                                      color: const Color(0xff252525),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        )
                      ],
                    );
                  },
                )),
          ),
        ),
        SizedBox(
          height: height * 0.03,
        ),
      ],
    ),
  );
}

///completed


Widget quoteCompletedList(BuildContext context) {
  double height = MediaQuery.of(context).size.height -
      MediaQuery.of(context).padding.top -
      MediaQuery.of(context).padding.bottom;
  double width = MediaQuery.of(context).size.width -
      MediaQuery.of(context).padding.right -
      MediaQuery.of(context).padding.left;
  return Padding(
    padding: const EdgeInsets.only(left: 20, right: 20),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Container(
                alignment: Alignment.topLeft,
                child: ListView.separated(
                  physics: const BouncingScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: 7,
                  separatorBuilder: (context, index) {
                    return const Divider(
                      thickness: 1,
                      color: Color(0xffE7E7E7),
                    );
                  },
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        SizedBox(
                          height: height * 0.02,
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: Text(
                                "Title lorem...",
                                maxLines: null,
                                overflow: TextOverflow.ellipsis, softWrap: false,
                                style: GoogleFonts.lato(
                                  fontSize: 17,
                                  fontWeight: FontWeight.w600,
                                  color: const Color(0xff252525),
                                ),
                              ),
                            ),
                            const Spacer(),
                            Row(
                              children: [
                                Container(
                                  height: height * 0.04,
                                  width: width * 0.22,
                                  decoration: BoxDecoration(
                                      color: const Color(0xffFF5959),
                                      borderRadius: BorderRadius.circular(10)),
                                  child: Center(
                                    child: Text(
                                      "Urgent",
                                      style: GoogleFonts.lato(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),


                          ],
                        ),
                        SizedBox(
                          height: height * 0.01,
                        ),
                        Row(
                          children: [
                            Flexible(
                              child: Text(
                                "Service 1 Service 2 Service 3 ",
                                overflow: TextOverflow.ellipsis,
                                style: GoogleFonts.lato(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w400,
                                  color: const Color(0xff116D6E),
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: height * 0.01,
                        ),
                        Text(
                          "Lorem Ipsum has been the industry's standard dummy text ever since",
                          style: GoogleFonts.lato(
                            fontSize: 15,
                            fontWeight: FontWeight.w400,
                            color: const Color(0xff252525),
                          ),
                        ),
                        SizedBox(
                          height: height * 0.015,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Text(
                                "Atlanta Lab...",
                                maxLines: null,
                                overflow: TextOverflow.ellipsis, softWrap: false,
                                style: GoogleFonts.lato(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w400,
                                  color: const Color(0xff116D6E),
                                ),
                              ),
                            ),

                          ],
                        )
                      ],
                    );
                  },
                )),
          ),
        ),
        SizedBox(
          height: height * 0.03,
        ),
      ],
    ),
  );
}
