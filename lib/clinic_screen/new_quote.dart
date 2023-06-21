// ignore_for_file: use_build_context_synchronously

import 'dart:convert';

import 'package:dentalapp/clinic_screen/bottom_navigation_bar.dart';
import 'package:dentalapp/clinic_screen/create_quote.dart';
import 'package:dentalapp/clinic_screen/quote_after_acceept.dart';
import 'package:dentalapp/clinic_screen/quote_detail_pending.dart';
import 'package:dentalapp/models/quotes_model.dart';
import 'package:dentalapp/services/clinic_services/quote_services.dart';
import 'package:dentalapp/util/utils.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart';

class NewQuote extends StatefulWidget {
  const NewQuote({Key? key}) : super(key: key);

  @override
  State<NewQuote> createState() => _NewQuoteState();
}

class _NewQuoteState extends State<NewQuote> {
  bool isLoading = true;
  bool quoteNew = true;
  bool quoteAccepted = false;
  bool quoteCompleted = false;
  QuoteService quoteService = QuoteService();

  Quotes? quotes;
  List<QuotesData> quotesList = [];

  getSelectedQuoteType() {
    if (quoteNew) {
      return "new";
    } else if (quoteAccepted) {
      return "accepted";
    } else if (quoteCompleted) {
      return "completed";
    }
  }

  @override
  void initState() {
    super.initState();
    getQuoteData();
  }

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
      child: Scaffold(
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
                                if (!isLoading) {
                                  changeQuoteType("new");
                                }
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
                                if (!isLoading) {
                                  changeQuoteType("accepted");
                                }
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
                                if (!isLoading) {
                                  changeQuoteType("completed");
                                }
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
              isLoading
                  ? Expanded(child: Center(child: loader()))
                  : quoteNew
                      ? Expanded(
                          child: quotesList.isNotEmpty
                              ? quoteNewList(context)
                              : const Center(
                                  child: Text("No New Quotes Found!!")))
                      : quoteAccepted
                          ? Expanded(
                              child: quotesList.isNotEmpty
                                  ? quoteAcceptedList(context)
                                  : const Center(
                                      child:
                                          Text("No Accepted Quotes Found!!")))
                          : quoteCompleted
                              ? Expanded(
                                  child: quotesList.isNotEmpty
                                      ? quoteCompletedList(context)
                                      : const Center(
                                          child: Text(
                                              "No Completed Quotes Found!!")))
                              : const SizedBox(),
            ],
          ),
        ),
      ),
    );
  }

  changeQuoteType(type) {
    setState(() {
      quoteNew = false;
      quoteAccepted = false;
      quoteCompleted = false;
      if (type == "new") {
        quoteNew = true;
      } else if (type == "accepted") {
        quoteAccepted = true;
      } else if (type == "completed") {
        quoteCompleted = true;
      }
      getQuoteData();
    });
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
      padding: EdgeInsets.symmetric(horizontal: width * 0.05),
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
                    itemCount: quotesList.length,
                    separatorBuilder: (context, index) {
                      return const Divider(
                        thickness: 1,
                        color: Color(0xffE7E7E7),
                      );
                    },
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          ///pending Condition
                          Navigator.push(context, MaterialPageRoute(
                            builder: (context) {
                              return QuoteDetailPending(
                                  quoteId: quotesList[index].id!);
                            },
                          )).then((value) => getQuoteData(showLoading: true));
                        },
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: height * 0.02,
                            ),
                            Row(
                              children: [
                                Expanded(
                                  child: Text(
                                    quotesList[index].title ?? "",
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    softWrap: false,
                                    style: GoogleFonts.lato(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w600,
                                      color: const Color(0xff252525),
                                    ),
                                  ),
                                ),
                                const Spacer(),
                                if (quotesList[index].priority == "urgent")
                                  Container(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: width * 0.03, vertical: 5),
                                    decoration: BoxDecoration(
                                        color: const Color(0xffFF5959),
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    child: Center(
                                      child: Text(
                                        "Urgent",
                                        style: GoogleFonts.lato(
                                          fontSize: 10,
                                          fontWeight: FontWeight.w600,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  ),
                                SizedBox(
                                  width: width * 0.03,
                                ),
                                quotesList[index].proposal == "0"
                                    ? GestureDetector(
                                        onTap: () {
                                          Navigator.push(context,
                                              MaterialPageRoute(
                                            builder: (context) {
                                              return CreateQuote(
                                                  quotesData:
                                                      quotesList[index]);
                                            },
                                          )).then((value) =>
                                              getQuoteData(showLoading: true));
                                        },
                                        child: Image(
                                            width: width * 0.05,
                                            image: const AssetImage(
                                                "assets/image/editgreen.png")))
                                    : Container(),
                              ],
                            ),
                            SizedBox(
                              height: height * 0.01,
                            ),
                            Wrap(
                              runSpacing: width * 0.01,
                              spacing: width * 0.03,
                              children: (quotesList[index].serviceDetails ?? [])
                                  .map((item) {
                                return Text(item.title ?? "",
                                    style: GoogleFonts.lato(
                                        color: const Color(0xff116D6E)));
                              }).toList(),
                            ),
                            SizedBox(
                              height: height * 0.02,
                            ),
                            Text(
                              quotesList[index].description ?? "",
                              style: GoogleFonts.lato(
                                fontSize: 13,
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
                                  "${quotesList[index].proposal} Proposals",
                                  style: GoogleFonts.lato(
                                    fontSize: 13,
                                    fontWeight: FontWeight.w400,
                                    color: const Color(0xff116D6E),
                                  ),
                                ),
                                QuotesWidget.getQuoteStatus(
                                    width,
                                    quotesList[index]
                                        .quoteStatus![0]
                                        .clinicStatus),
                              ],
                            )
                          ],
                        ),
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
      padding: EdgeInsets.symmetric(horizontal: width * 0.05),
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
                    itemCount: quotesList.length,
                    separatorBuilder: (context, index) {
                      return const Divider(
                        thickness: 1,
                        color: Color(0xffE7E7E7),
                      );
                    },
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(
                            builder: (context) {
                              return QuoteAfterAccept(
                                quoteId: quotesList[index].id!,
                              );
                            },
                          )).then((value) => getQuoteData(showLoading: true));
                        },
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: height * 0.02,
                            ),
                            Row(
                              children: [
                                Expanded(
                                  child: Text(
                                    quotesList[index].title ?? "",
                                    maxLines: null,
                                    overflow: TextOverflow.ellipsis,
                                    softWrap: false,
                                    style: GoogleFonts.lato(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w600,
                                      color: const Color(0xff252525),
                                    ),
                                  ),
                                ),
                                const Spacer(),
                                if (quotesList[index].priority == "urgent")
                                  Container(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: width * 0.03, vertical: 5),
                                    decoration: BoxDecoration(
                                        color: const Color(0xffFF5959),
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    child: Center(
                                      child: Text(
                                        "Urgent",
                                        style: GoogleFonts.lato(
                                          fontSize: 10,
                                          fontWeight: FontWeight.w600,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  ),
                              ],
                            ),
                            SizedBox(
                              height: height * 0.01,
                            ),
                            Wrap(
                              runSpacing: width * 0.01,
                              spacing: width * 0.03,
                              children: (quotesList[index].serviceDetails ?? [])
                                  .map((item) {
                                return Text(item.title ?? "",
                                    style: GoogleFonts.lato(
                                        color: const Color(0xff116D6E)));
                              }).toList(),
                            ),
                            SizedBox(
                              height: height * 0.02,
                            ),
                            Text(
                              quotesList[index].description ?? "",
                              style: GoogleFonts.lato(
                                fontSize: 13,
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
                                    quotesList[index].labsDetails![0].labName ??
                                        "",
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    softWrap: false,
                                    style: GoogleFonts.lato(
                                      fontSize: 13,
                                      fontWeight: FontWeight.w400,
                                      color: const Color(0xff116D6E),
                                    ),
                                  ),
                                ),
                                QuotesWidget.getQuoteStatus(
                                    width,
                                    quotesList[index]
                                        .quoteStatus![0]
                                        .clinicStatus),
                              ],
                            )
                          ],
                        ),
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
      padding: EdgeInsets.symmetric(horizontal: width * 0.05),
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
                    itemCount: quotesList.length,
                    separatorBuilder: (context, index) {
                      return const Divider(
                        thickness: 1,
                        color: Color(0xffE7E7E7),
                      );
                    },
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(
                            builder: (context) {
                              return QuoteAfterAccept(
                                quoteId: quotesList[index].id!,
                              );
                            },
                          )).then((value) => getQuoteData(showLoading: true));
                        },
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: height * 0.02,
                            ),
                            Row(
                              children: [
                                Expanded(
                                  child: Text(
                                    quotesList[index].title ?? "",
                                    maxLines: null,
                                    overflow: TextOverflow.ellipsis,
                                    softWrap: false,
                                    style: GoogleFonts.lato(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w600,
                                      color: const Color(0xff252525),
                                    ),
                                  ),
                                ),
                                const Spacer(),
                                if (quotesList[index].priority == "urgent")
                                  Container(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: width * 0.03, vertical: 5),
                                    decoration: BoxDecoration(
                                        color: const Color(0xffFF5959),
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    child: Center(
                                      child: Text(
                                        "Urgent",
                                        style: GoogleFonts.lato(
                                          fontSize: 10,
                                          fontWeight: FontWeight.w600,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  ),
                              ],
                            ),
                            SizedBox(
                              height: height * 0.01,
                            ),
                            Wrap(
                              runSpacing: width * 0.01,
                              spacing: width * 0.03,
                              children: (quotesList[index].serviceDetails ?? [])
                                  .map((item) {
                                return Text(item.title ?? "",
                                    style: GoogleFonts.lato(
                                        color: const Color(0xff116D6E)));
                              }).toList(),
                            ),
                            SizedBox(
                              height: height * 0.02,
                            ),
                            Text(
                              quotesList[index].description ?? "",
                              style: GoogleFonts.lato(
                                fontSize: 13,
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
                                    quotesList[index].labsDetails![0].labName ??
                                        "",
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    softWrap: false,
                                    style: GoogleFonts.lato(
                                      fontSize: 13,
                                      fontWeight: FontWeight.w400,
                                      color: const Color(0xff116D6E),
                                    ),
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
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

  getQuoteData({bool showLoading = true}) async {
    if (showLoading) {
      setState(() {
        quotesList.clear();
        isLoading = true;
      });
    }
    String type = getSelectedQuoteType();
    var body = {"type": type};
    Response response = await quoteService.getQuotes(body: body);

    if (response.statusCode == 200) {
      quotes = Quotes.fromJson(jsonDecode(response.body));
      quotesList.addAll(quotes!.data!.quotesData ?? []);
    } else if (response.statusCode == 401) {
      Utils.logout(context);
    }

    if (showLoading) {
      setState(() {
        isLoading = false;
      });
    }
  }

  Future<bool> goBack() async {
    Navigator.pushAndRemoveUntil(context, MaterialPageRoute(
      builder: (context) {
        return const BottomNavigation(index: 0);
      },
    ), (route) => false);
    return true;
  }
}
