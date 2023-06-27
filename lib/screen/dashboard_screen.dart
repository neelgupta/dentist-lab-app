// ignore_for_file: use_build_context_synchronously

import 'dart:convert';

import 'package:dentalapp/custom_widget/side_navigation_bar_widget.dart';
import 'package:dentalapp/screen/notification_screen.dart';
import 'package:dentalapp/screen/pending_quote_details.dart';
import 'package:dentalapp/screen/quote_details_screen.dart';
import 'package:dentalapp/services/lab_service/dashboars_feeds.dart';
import 'package:dentalapp/util/utils.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart';
import 'package:intl/intl.dart';
import '../models/lab_getfeeds.dart';

class DashBoardScreen extends StatefulWidget {
  const DashBoardScreen({Key? key}) : super(key: key);

  @override
  State<DashBoardScreen> createState() => _DashBoardScreenState();
}

class _DashBoardScreenState extends State<DashBoardScreen> {
  TextEditingController amountController = TextEditingController();

  LabDashBoardServices labDashBoardServices = LabDashBoardServices();
  GetFeedsModel? getfeed;

  List<Quotesdatum> quoteList = [];

  bool isLoading = true;
  bool isLoadMore = true;
  ScrollController scrollController = ScrollController();
  int total = 10;
  String establishDate = "";
  bool isFeedColor = false;
  Color feedSelected = Colors.white;
  Color feedUnselected = const Color(0xFFEBEFEE);

  void changeColors() {
    setState(() {
      if (isFeedColor) {
        feedSelected = Colors.white;
        feedUnselected = const Color(0xFFEBEFEE);
      } else {
        feedSelected = const Color(0xFFEBEFEE);
        feedUnselected = Colors.white;
      }
      isFeedColor = !isFeedColor;
    });
  }

  final GlobalKey<ScaffoldState> _key = GlobalKey();

  @override
  void initState() {
    super.initState();
    establishDate = Utils.getEstablishDate();
    getFeeds();

    scrollController.addListener(() {
      if (quoteList.length<total) {
        if (scrollController.position.maxScrollExtent ==
            scrollController.position.pixels) {
          if(!isLoadMore) {
            isLoadMore = true;
            getFeeds(showLoading: false);
          }
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        key: _key,
        drawer: const SideNavigationBar(),
        body: SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Column(
            children: [
              Container(
                  decoration: const BoxDecoration(
                      color: Color(0xFF116D6E),
                      image: DecorationImage(
                          image: AssetImage(
                              "assets/image/Group 12305.png"),
                          fit: BoxFit.fitWidth,
                          alignment: Alignment.bottomCenter,
                          opacity: 0.3)),
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                        vertical: height * 0.02,
                        horizontal: width * 0.05),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Row(
                          children: [
                            InkWell(
                                onTap: () {
                                  _key.currentState!.openDrawer();
                                },
                                child: Image(
                                    image: const AssetImage(
                                        "assets/image/Menu.png"),height: width * 0.07,width: width * 0.07,)),
                            const Spacer(),
                            InkWell(
                                onTap: () {
                                  Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            const NotificationScreen(),
                                      ));
                                },
                                child: Image(
                                    image: const AssetImage(
                                        "assets/image/Notification 3.png"),height: width * 0.06,width: width * 0.06,))
                          ],
                        ),
                        SizedBox(
                          height: height * 0.01,
                        ),
                        Container(
                          alignment: Alignment.center,
                          height: width * 0.20,
                          width: width * 0.20,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                  image: NetworkImage(
                                      Utils.getProfileImage()),
                                  fit: BoxFit.fill),
                              border: Border.all(
                                  color: const Color(0xFFFFFFFF))),
                        ),
                        SizedBox(
                          height: height * 0.005,
                        ),
                        Text(
                            "${Utils.getFirstName()} ${Utils.getLastName()}",
                            style: GoogleFonts.lato(
                              fontSize: 24,
                              fontWeight: FontWeight.w700,
                              color: Colors.white,
                            )),
                        SizedBox(
                          height: height * 0.005,
                        ),
                        if (establishDate.isNotEmpty)
                          Text(
                              "Since ${DateFormat('yyyy').format(DateTime.parse(establishDate))}",
                              style: GoogleFonts.lato(
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                color: Colors.white,
                              )),
                      ],
                    ),
                  )),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.symmetric(
                      vertical: height * 0.01, horizontal: width * 0.055),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: height * 0.01,
                      ),
                      Container(
                        height: height * 0.065,
                        width: width * 0.88,
                        decoration: BoxDecoration(
                            color: const Color(0xFFEBEFEE),
                            borderRadius: BorderRadius.circular(30)),
                        child: Padding(
                          padding: const EdgeInsets.all(3),
                          child: Row(
                            children: [
                              Expanded(
                                child: InkWell(
                                  onTap: () {
                                    if (!isLoading) {
                                      changeColors();
                                      getFeeds();
                                    }
                                  },
                                  child: Container(
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                      color: feedSelected,
                                      borderRadius:
                                          BorderRadius.circular(30),
                                    ),
                                    child: Text("Feeds",
                                        style: GoogleFonts.lato(
                                          fontSize: 15,
                                          fontWeight: FontWeight.w700,
                                          color: const Color(0xFF116D6E),
                                        )),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: InkWell(
                                  onTap: () {
                                    if (!isLoading) {
                                      changeColors();
                                      getFeeds();
                                    }
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: feedUnselected,
                                      borderRadius:
                                          BorderRadius.circular(30),
                                    ),
                                    alignment: Alignment.center,
                                    child: Text("Invite",
                                        style: GoogleFonts.lato(
                                          fontSize: 15,
                                          fontWeight: FontWeight.w700,
                                          color: const Color(0xFF116D6E),
                                        )),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: height * 0.02,
                      ),
                      isLoading
                          ? Container()
                          : quoteList.isNotEmpty
                              ? Text("Quote ($total)",
                                  style: GoogleFonts.lato(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                  ))
                              : const SizedBox(),
                      SizedBox(
                        height: height * 0.015,
                      ),
                      isLoading
                          ? Container(
                            height: height * 0.4,
                            alignment: Alignment.center,
                            child: loader()
                          ) : quoteList.isNotEmpty
                              ? Expanded(
                                child: ListView.separated(
                                    controller: scrollController,
                                    physics: const BouncingScrollPhysics(),
                                    itemCount: quoteList.length,
                                    scrollDirection: Axis.vertical,
                                    shrinkWrap: true,
                                    itemBuilder: (context, index) {
                                      return InkWell(
                                        onTap: () {
                                          Navigator.push(context, MaterialPageRoute(builder: (context) {
                                            return PendingQuoteDetails(quoteId: quoteList[index].id ?? "", isSend: quoteList[index].isSend!);
                                          },)).then((value) => getFeeds());
                                        },
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Row(
                                              children: [
                                                Expanded(
                                                  child: Text(
                                                      quoteList[index].title ??
                                                          "",
                                                      style: GoogleFonts.lato(
                                                        fontSize: 16,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                      )),
                                                ),
                                                Text(
                                                    DateFormat('dd MMMM yyyy')
                                                        .format(quoteList[index]
                                                            .createdAt!),
                                                    style: GoogleFonts.lato(
                                                      fontSize: 14,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      color: const Color(
                                                          0xFFA0A0A0),
                                                    )),
                                              ],
                                            ),
                                            SizedBox(
                                              height: height * 0.020,
                                            ),
                                            Text(
                                                quoteList[index].description ??
                                                    "",
                                                style: GoogleFonts.lato(
                                                    fontSize: 14,
                                                    fontWeight: FontWeight.w400,
                                                    color: const Color(
                                                        0xFF707070)),
                                                maxLines: 3,
                                                overflow:
                                                    TextOverflow.ellipsis),
                                            SizedBox(
                                              height: height * 0.015,
                                            ),
                                            const Divider(
                                              thickness: 1,
                                              color: Color(0xFFE7E7E7),
                                            ),
                                          ],
                                        ),
                                      );
                                    },
                                    separatorBuilder: (context, index) {
                                      return SizedBox(
                                        height: height * 0.010,
                                      );
                                    },
                                  ),
                              )
                              : Container(
                                  height: height * 0.4,
                                  alignment: Alignment.center,
                                  child: Text(isFeedColor
                                      ? "No Invite Found!!"
                                      : "No Feeds Found!!"),
                                ),
                      if(!isLoading && isLoadMore) loader(),
                      SizedBox(
                        height: height * 0.005,
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  void showMyDialog(BuildContext context, int index) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
            title: Container(
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(quoteList[index].title ?? "",
                  style: GoogleFonts.lato(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                  textAlign: TextAlign.start),
              const SizedBox(
                height: 10,
              ),
              Text(quoteList[index].description ?? "",
                  style: GoogleFonts.lato(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: const Color(0xFF707070),
                  ),
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.start),
              const SizedBox(
                height: 20,
              ),
              Container(
                height: 55,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  border: Border.all(color: const Color(0xFF707070)),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  child: Row(
                    children: [
                      Text(
                        "AED",
                        style: GoogleFonts.lato(
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                          color: const Color(0xFF707070),
                        ),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      const Padding(
                        padding: EdgeInsets.all(5),
                        child: VerticalDivider(
                          thickness: 1,
                          width: 5,
                          color: Color(0xFF707070),
                        ),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Expanded(
                        child: TextFormField(
                          controller: amountController,
                          keyboardType: TextInputType.number,
                          decoration: const InputDecoration(
                              border: InputBorder.none,
                              hintText: "Add Amount",
                              counterText: "",
                              contentPadding:
                                  EdgeInsets.only(bottom: 8, top: 3, left: 5)),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: TextButton(
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all(const Color(0xFF116D6E)),
                      padding: MaterialStateProperty.all(
                          const EdgeInsets.symmetric(
                              horizontal: 30, vertical: 12)),
                      shape: MaterialStateProperty.all(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                    ),
                    onPressed: () {
                      if (amountController.text.isEmpty) {
                        Utils.showErrorToast("Please Enter Amount");
                      } else {
                        sendProposal(index: index);
                      }
                    },
                    child: Text("Sent",
                        style: GoogleFonts.lato(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ))),
              ),
            ],
          ),
        ));
      },
    );
  }

  getFeeds({bool showLoading = true}) async {
    if (showLoading) {
      quoteList.clear();
      isLoading = true;
    }
    isLoadMore = true;
    setState(() {});
    String typeSelected = isFeedColor ? 'invited' : "";
    var body = {
      "type": typeSelected,
      "limit": "5",
      "offset": quoteList.length
    };

    Response response = await labDashBoardServices.getFeed(body: body);

    if (response.statusCode == 200) {
      getfeed = GetFeedsModel.fromJson(jsonDecode(response.body));
      if (getfeed != null) {
        total = getfeed!.data!.count ?? 0;
        quoteList.addAll(getfeed!.data!.quotesdata ?? []);
      }
    } else if (response.statusCode == 401) {
      Utils.logout(context);
    }
    isLoadMore = false;
    isLoading = false;
    setState(() {});
  }

  sendProposal({index}) async {
    Utils.showLoadingDialog(context);
    var body = {
      "quoteId": quoteList[index].id,
      "amount": amountController.text
    };
    Response response = await labDashBoardServices.sendProposal(body: body);
    Navigator.pop(context);
    if (response.statusCode == 200) {
      setState(() {
        quoteList[index].isSend = "1";
      });
      Navigator.pop(context);
      Utils.showSuccessToast(jsonDecode(response.body)['message']);
    } else if (response.statusCode == 401) {
      Utils.logout(context);
    } else {
      Utils.showErrorToast(jsonDecode(response.body)['message']);
    }
  }
}
