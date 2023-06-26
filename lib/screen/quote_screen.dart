// ignore_for_file: use_build_context_synchronously

import 'dart:convert';
import 'package:dentalapp/screen/quote_details_screen.dart';
import 'package:dentalapp/screen/lab_home.dart';
import 'package:dentalapp/services/lab_service/lab_quote_service.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart';
import '../models/lab_all_quote_model.dart';
import '../util/utils.dart';

class QuoteScreen extends StatefulWidget {
  const QuoteScreen({Key? key}) : super(key: key);

  @override
  State<QuoteScreen> createState() => _QuoteScreenState();
}

class _QuoteScreenState extends State<QuoteScreen> {
  bool isLoading = true;
  bool isLoadMore = false;
  bool accepted = true;
  bool completed = false;

  int total = 10;

  List<LabQuoteStatus> labQuoteList = [];
  LabQuote? labQuote;
  ScrollController scrollController = ScrollController();

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
      getLabQuoteData();
    });
  }

  @override
  void initState() {
    super.initState();
    getLabQuoteData();

    scrollController.addListener(() {
      if (labQuoteList.length<total) {
        if (scrollController.position.maxScrollExtent ==
            scrollController.position.pixels) {
          if(!isLoadMore) {
            isLoadMore = true;
            getLabQuoteData(showLoading: false);
          }
        }
      }
    });
  }

  Future<bool> goBack() async {
    Navigator.pushAndRemoveUntil(context, MaterialPageRoute(
      builder: (context) {
        return const LabHome(index: 0);
      },
    ), (route) => false);
    return true;
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return RefreshIndicator(
      onRefresh: getLabQuoteData,
      child: WillPopScope(
        onWillPop: goBack,
        child: SafeArea(
          child: Scaffold(
            body: SizedBox(
              height: height,
              width: width,
              child: Column(
                children: [
                  Container(
                      height: height * 0.2,
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
                    padding: const EdgeInsets.all(4),
                    decoration: BoxDecoration(
                        color: const Color(0xFFEBEFEE),
                        borderRadius: BorderRadius.circular(12)),
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
                  SizedBox(
                    height: height * 0.016,
                  ),
                  isLoading
                      ? Container(
                          alignment: Alignment.center,
                          height: height * 0.3,
                          child: loader())
                      : labQuoteList.isEmpty
                          ? Container(
                              alignment: Alignment.center,
                              height: height * 0.3,
                              child: const Text("No Quotes Available!!!"))
                          : Expanded(
                            child: ListView.separated(
                                shrinkWrap: true,
                                controller: scrollController,
                                physics: const BouncingScrollPhysics(),
                                itemBuilder: (context, index) {
                                  return InkWell(
                                    onTap: () {
                                      Navigator.push(context, MaterialPageRoute(
                                        builder: (context) {
                                          return QuoteDetailsScreen(
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
                          ),
                  if(!isLoading && isLoadMore)loader(),
                  SizedBox(height: height * 0.01)
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future getLabQuoteData({bool showLoading = true}) async {
    if (showLoading) {
      labQuoteList.clear();
      isLoading = true;
    }
    isLoadMore = true;
    setState(() {});

    String type = getQuoteType();

    var body = {"type": type, "limit": "5", "offset": labQuoteList.length};
    Response response = await GetLabQuote.getQuotes(body: body);

    if (response.statusCode == 200) {
      labQuote = LabQuote.fromJson(jsonDecode(response.body));
      if (labQuote != null) {
        total = labQuote!.data!.count ?? 0;
        labQuoteList.addAll(labQuote!.data!.quotesData ?? []);
      }
    } else if(response.statusCode == 401) {
      Utils.logout(context);
    }
    isLoadMore = false;
    isLoading = false;
    setState(() {});
  }
}
