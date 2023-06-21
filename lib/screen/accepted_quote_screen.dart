import 'dart:convert';
import 'package:dentalapp/screen/acceptedquote_details_screen.dart';
import 'package:dentalapp/screen/bottom_navigation_bar_screen.dart';
import 'package:dentalapp/services/lab_service/lab_quote_service.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart';
import '../models/lab_all_quote_model.dart';
import '../util/utils.dart';

class AcceptedQuoteScreen extends StatefulWidget {
  const AcceptedQuoteScreen({Key? key}) : super(key: key);

  @override
  State<AcceptedQuoteScreen> createState() => _AcceptedQuoteScreenState();
}

class _AcceptedQuoteScreenState extends State<AcceptedQuoteScreen> {
  bool isLoading = true;
  bool accepted = true;
  bool completed = false;

  List<LabQuoteStatus> labQuoteList = [];
  LabQuote? labQuote;

  getQuoteType() {
    if (accepted) {
      return "accepted";
    } else if (completed) {
      return "completed";
    }
  }

  changeQuoteType(type) {
    setState(() {
      accepted = false;
      completed = false;
      if (type == "Accepted") {
        accepted = true;
      } else if (type == "Completed") {
        completed = true;
      }
      getLabQuoteData(showLoading: true);
    });
  }

  @override
  void initState() {
    super.initState();
    getLabQuoteData(showLoading: true);
  }

  Future<bool> goBack() async {
    Navigator.pushAndRemoveUntil(context, MaterialPageRoute(
      builder: (context) {
        return const BottomNavigatorBarWidget(index: 0);
      },
    ), (route) => false);
    return true;
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return WillPopScope(
      onWillPop: goBack,
      child: SafeArea(
        child: Scaffold(
          body: SizedBox(
            height: height,
            width: width,
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                children: [
                  Container(
                      height: height * 0.15,
                      width: width,
                      alignment: Alignment.center,
                      decoration: const BoxDecoration(
                          color: Color(0xFF116D6E),
                          image: DecorationImage(
                              image: AssetImage("assets/image/Group 12305.png"),
                              fit: BoxFit.fitWidth,
                              alignment: Alignment.bottomCenter,
                              opacity: 0.3)),
                      child: Text("Quote",
                          style: GoogleFonts.lato(
                            fontSize: 30,
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                          ))),
                  SizedBox(
                    height: height * 0.030,
                  ),
                  Container(
                    height: height * 0.065,
                    width: width * 0.88,
                    decoration: BoxDecoration(
                        color: const Color(0xFFEBEFEE),
                        borderRadius: BorderRadius.circular(12)),
                    child: Padding(
                      padding: const EdgeInsets.all(4),
                      child: Row(
                        children: [
                          Expanded(
                            child: InkWell(
                              onTap: () {
                                if (!isLoading) {
                                  changeQuoteType("Accepted");
                                }
                              },
                              child: Container(
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                    color: accepted
                                        ? Colors.white
                                        : const Color(0xFFEBEFEE),
                                    borderRadius: BorderRadius.circular(11),
                                  ),
                                  child: accepted
                                      ? Text("Accepted",
                                          style: GoogleFonts.lato(
                                            fontSize: 15,
                                            fontWeight: FontWeight.w700,
                                            color: const Color(0xFF116D6E),
                                          ))
                                      : Text("Accepted",
                                          style: GoogleFonts.lato(
                                              fontSize: 15,
                                              fontWeight: FontWeight.w700))),
                            ),
                          ),
                          Expanded(
                            child: InkWell(
                              onTap: () {
                                if (!isLoading) {
                                  changeQuoteType("Completed");
                                }
                              },
                              child: Container(
                                  decoration: BoxDecoration(
                                    color: completed
                                        ? Colors.white
                                        : const Color(0xFFEBEFEE),
                                    borderRadius: BorderRadius.circular(11),
                                  ),
                                  alignment: Alignment.center,
                                  child: completed
                                      ? Text("Completed",
                                          style: GoogleFonts.lato(
                                            fontSize: 15,
                                            fontWeight: FontWeight.w700,
                                            color: const Color(0xFF116D6E),
                                          ))
                                      : Text("Completed",
                                          style: GoogleFonts.lato(
                                              fontSize: 15,
                                              fontWeight: FontWeight.w700))),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: height * 0.016,
                  ),
                  isLoading
                      ? Container(
                          alignment: Alignment.center,
                          height: height * 0.5,
                          child: loader())
                      : labQuoteList.isEmpty
                          ? Container(
                              alignment: Alignment.center,
                              height: height * 0.5,
                              child: const Text("No Quotes Found!!!"))
                          : ListView.separated(
                              shrinkWrap: true,
                              physics: const BouncingScrollPhysics(),
                              itemBuilder: (context, index) {
                                return InkWell(
                                  onTap: () {
                                    Navigator.push(context, MaterialPageRoute(
                                      builder: (context) {
                                        return AcceptedQuoteDetailsScreen(
                                            quoteId:
                                                labQuoteList[index].id ?? "");
                                      },
                                    )).then((value) =>
                                        getLabQuoteData(showLoading: true));
                                  },
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: width * 0.055),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        SizedBox(
                                          height: height * 0.01,
                                        ),
                                        Row(
                                          children: [
                                            Text(
                                                labQuoteList[index].title ?? "",
                                                style: GoogleFonts.lato(
                                                    fontSize: 17,
                                                    fontWeight:
                                                        FontWeight.w600)),
                                            const Spacer(),
                                            if (labQuoteList[index].priority ==
                                                "urgent")
                                              Container(
                                                alignment: Alignment.center,
                                                height: height * 0.031,
                                                width: width * 0.17,
                                                decoration: BoxDecoration(
                                                    color:
                                                        const Color(0xFFFF5959),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            15)),
                                                child: Text("Urgent",
                                                    style: GoogleFonts.lato(
                                                        fontSize: 12,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        color: Colors.white)),
                                              )
                                          ],
                                        ),
                                        SizedBox(
                                          height: height * 0.010,
                                        ),
                                        Wrap(
                                          runSpacing: width * 0.01,
                                          spacing: width * 0.03,
                                          children: (labQuoteList[index]
                                                      .serviceDetails ??
                                                  [])
                                              .map((item) {
                                            return Text(item.title ?? "",
                                                style: GoogleFonts.lato(
                                                    color: const Color(
                                                        0xff116D6E)));
                                          }).toList(),
                                        ),
                                        SizedBox(
                                          height: height * 0.010,
                                        ),
                                        Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.end,
                                          children: [
                                            Expanded(
                                              child: Text(
                                                  labQuoteList[index]
                                                          .description ??
                                                      "",
                                                  style: GoogleFonts.lato(
                                                    fontSize: 13,
                                                    fontWeight: FontWeight.w400,
                                                  ),
                                                  maxLines: 2,
                                                  overflow:
                                                      TextOverflow.ellipsis),
                                            ),
                                            SizedBox(
                                              width: width * 0.020,
                                            ),
                                            QuotesWidget.getQuoteStatus(
                                                width,
                                                labQuoteList[index]
                                                    .quoteStatus![0]
                                                    .labStatus),
                                          ],
                                        ),
                                        SizedBox(
                                          height: height * 0.010,
                                        ),
                                        const Divider(
                                          thickness: 1,
                                          color: Color(0xFFE7E7E7),
                                        )
                                      ],
                                    ),
                                  ),
                                );
                              },
                              separatorBuilder: (context, index) {
                                return SizedBox(
                                  height: height * 0.0,
                                );
                              },
                              itemCount: labQuoteList.length),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  getLabQuoteData({bool showLoading = true}) async {
    if (showLoading) {
      setState(() {
        labQuoteList.clear();
        isLoading = true;
      });
    }
    String type = getQuoteType();
    var body = {"type": type};
    Response response = await GetLabQuote.getQuotes(body: body);

    if (response.statusCode == 200) {
      labQuote = LabQuote.fromJson(jsonDecode(response.body));
      if (labQuote != null) {
        labQuoteList.addAll(labQuote!.data!.quotesData ?? []);
      }
    }
    isLoading = false;
    setState(() {});
  }
}
