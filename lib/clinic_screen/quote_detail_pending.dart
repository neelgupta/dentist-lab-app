// ignore_for_file: use_build_context_synchronously

import 'dart:convert';

import 'package:dentalapp/clinic_screen/public_profile.dart';
import 'package:dentalapp/models/pending_quote_model.dart';
import 'package:dentalapp/services/clinic_services/quote_services.dart';
import 'package:dentalapp/util/utils.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart';

class QuoteDetailPending extends StatefulWidget {
  final String quoteId;
  const QuoteDetailPending({Key? key, required this.quoteId}) : super(key: key);

  @override
  State<QuoteDetailPending> createState() => _QuoteDetailPendingState();
}

class _QuoteDetailPendingState extends State<QuoteDetailPending> {
  bool isPendingAllDetail = false;
  QuoteService quoteService = QuoteService();
  PendingQuote? pendingQuote;
  List<Propsaldata> proposals = [];
  QuotesData? quotesData;
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    getPendingDetails();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height -
        MediaQuery.of(context).padding.top -
        MediaQuery.of(context).padding.bottom;
    double width = MediaQuery.of(context).size.width -
        MediaQuery.of(context).padding.right -
        MediaQuery.of(context).padding.left;
    return SafeArea(
      child: Scaffold(
        body: SizedBox(
          height: height,
          width: width,
          child: isLoading
              ? Center(child: loader())
              : Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                        height: height * 0.15,
                        decoration: const BoxDecoration(
                            color: Color(0xFF116D6E),
                            image: DecorationImage(
                                image:
                                    AssetImage("assets/image/Group 12305.png"),
                                fit: BoxFit.fitWidth,
                                alignment: Alignment.bottomCenter,
                                opacity: 0.3)),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              height: height * 0.02,
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: width * 0.03),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  GestureDetector(
                                      onTap: () {
                                        Navigator.pop(context);
                                      },
                                      child: const Icon(
                                        Icons.keyboard_backspace,
                                        color: Colors.white,
                                      )),
                                  const Spacer(),
                                  Center(
                                      child: Text(
                                    textAlign: TextAlign.center,
                                    "Quote Detail",
                                    style: GoogleFonts.lato(
                                      fontSize: 26,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.white,
                                    ),
                                  )),
                                  const Spacer(),
                                  const Icon(
                                    Icons.keyboard_backspace,
                                    color: Colors.transparent,
                                  )
                                ],
                              ),
                            ),
                          ],
                        )),
                    SizedBox(
                      height: height * 0.03,
                    ),
                    Expanded(
                      child: quotesData == null
                          ? const Center(
                              child: Text(
                                  "No Data Found !!! \n\n Please Try Again"),
                            )
                          : Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                isPendingAllDetail
                                    ? Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: height * 0.02),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text(
                                                  quotesData!.title ?? "",
                                                  style: GoogleFonts.lato(
                                                    fontSize: 15,
                                                    fontWeight: FontWeight.w600,
                                                    color:
                                                        const Color(0xff252525),
                                                  ),
                                                ),
                                                GestureDetector(
                                                    onTap: () {
                                                      setState(() {
                                                        isPendingAllDetail =
                                                            false;
                                                      });
                                                    },
                                                    child: const Image(
                                                      height: 7,
                                                      width: 14,
                                                      image: AssetImage(
                                                        "assets/image/downicon.png",
                                                      ),
                                                      fit: BoxFit.fill,
                                                    )),
                                              ],
                                            ),
                                            SizedBox(
                                              height: height * 0.015,
                                            ),
                                            SizedBox(
                                              width: width * 0.75,
                                              child: Text(
                                                quotesData!.description ?? "",
                                                style: GoogleFonts.lato(
                                                  fontSize: 13,
                                                  fontWeight: FontWeight.w400,
                                                  color:
                                                      const Color(0xff252525),
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              height: height * 0.02,
                                            ),
                                            Wrap(
                                              runSpacing: width * 0.01,
                                              spacing: width * 0.03,
                                              children:
                                                  (quotesData!.serviceDetails ??
                                                          [])
                                                      .map((item) {
                                                return Text(item.title ?? "",
                                                    style: GoogleFonts.lato(
                                                        color: const Color(
                                                            0xff116D6E)));
                                              }).toList(),
                                            ),
                                            SizedBox(
                                              height: height * 0.005,
                                            ),
                                            Row(
                                              children: [
                                                Text(
                                                  "Priority :",
                                                  style: GoogleFonts.lato(
                                                    fontSize: 13,
                                                    fontWeight: FontWeight.w600,
                                                    color:
                                                        const Color(0xff707070),
                                                  ),
                                                ),
                                                const Spacer(),
                                                Container(
                                                  padding: EdgeInsets.symmetric(
                                                      horizontal: width * 0.04,
                                                      vertical: 5),
                                                  decoration: BoxDecoration(
                                                    color: Color(
                                                        quotesData!.priority ==
                                                                "normal"
                                                            ? 0xff707070
                                                            : 0xffFF5959),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            2),
                                                  ),
                                                  child: Center(
                                                    child: Text(
                                                      quotesData!.priority ==
                                                              "normal"
                                                          ? "Normal"
                                                          : "Urgent",
                                                      style: GoogleFonts.lato(
                                                        fontSize: 10,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        color: const Color(
                                                            0xffFFFFFF),
                                                      ),
                                                    ),
                                                  ),
                                                )
                                              ],
                                            ),
                                            SizedBox(
                                              height: height * 0.01,
                                            ),
                                            Row(
                                              children: [
                                                Text(
                                                  "Status :",
                                                  style: GoogleFonts.lato(
                                                    fontSize: 13,
                                                    fontWeight: FontWeight.w600,
                                                    color:
                                                        const Color(0xff707070),
                                                  ),
                                                ),
                                                const Spacer(),
                                                QuotesWidget.getQuoteStatus(
                                                    width, "pending")
                                              ],
                                            ),
                                            SizedBox(
                                              height: height * 0.01,
                                            ),
                                            Row(
                                              children: [
                                                Text(
                                                  "Choose for :",
                                                  style: GoogleFonts.lato(
                                                    fontSize: 13,
                                                    fontWeight: FontWeight.w600,
                                                    color:
                                                        const Color(0xff707070),
                                                  ),
                                                ),
                                                const Spacer(),
                                                SizedBox(
                                                  height: height * 0.03,
                                                  width: width * 0.18,
                                                  child: Center(
                                                    child: Text(
                                                      quotesData!.chooseFor ==
                                                              "public"
                                                          ? "Public"
                                                          : "Lab List",
                                                      style: GoogleFonts.lato(
                                                        fontSize: 10,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        color: const Color(
                                                            0xff252525),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            const Padding(
                                              padding: EdgeInsets.only(top: 10),
                                              child: Divider(
                                                thickness: 1,
                                                color: Color(0xffE7E7E7),
                                              ),
                                            ),
                                            SizedBox(
                                              height: height * 0.01,
                                            ),
                                          ],
                                        ),
                                      )
                                    : Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: height * 0.02),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text(
                                                  quotesData!.title ?? "",
                                                  style: GoogleFonts.lato(
                                                    fontSize: 15,
                                                    fontWeight: FontWeight.w600,
                                                    color:
                                                        const Color(0xff252525),
                                                  ),
                                                ),
                                                QuotesWidget.getQuoteStatus(
                                                    width, "pending")
                                              ],
                                            ),
                                            SizedBox(
                                              height: height * 0.02,
                                            ),
                                            Row(
                                              children: [
                                                SizedBox(
                                                  width: width * 0.75,
                                                  child: Text(
                                                    quotesData!.description ??
                                                        '',
                                                    style: GoogleFonts.lato(
                                                      fontSize: 13,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      color: const Color(
                                                          0xff252525),
                                                    ),
                                                  ),
                                                ),
                                                const Spacer(),
                                                GestureDetector(
                                                    onTap: () {
                                                      setState(() {
                                                        isPendingAllDetail =
                                                            true;
                                                      });
                                                    },
                                                    child: const Image(
                                                      height: 7,
                                                      width: 14,
                                                      image: AssetImage(
                                                        "assets/image/upicon.png",
                                                      ),
                                                      fit: BoxFit.fill,
                                                    )),
                                              ],
                                            ),
                                            const Padding(
                                              padding: EdgeInsets.only(top: 10),
                                              child: Divider(
                                                thickness: 1,
                                                color: Color(0xffE7E7E7),
                                              ),
                                            ),
                                            SizedBox(
                                              height: height * 0.01,
                                            ),
                                          ],
                                        ),
                                      ),
                                Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: height * 0.02),
                                  child: Text(
                                    "Proposals (${proposals.length})",
                                    style: GoogleFonts.lato(
                                      fontSize: 17,
                                      fontWeight: FontWeight.w600,
                                      color: const Color(0xff111111),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: ListView.builder(
                                    physics: const BouncingScrollPhysics(),
                                    shrinkWrap: true,
                                    itemCount: proposals.length,
                                    itemBuilder: (context, index) {
                                      return Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: height * 0.02),
                                        child: Card(
                                          child: Padding(
                                            padding: EdgeInsets.symmetric(
                                                horizontal: height * 0.02,
                                                vertical: height * 0.01),
                                            child: Column(
                                              children: [
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Text(
                                                      proposals[index]
                                                              .labDetails![0]
                                                              .labName ??
                                                          "",
                                                      style: GoogleFonts.lato(
                                                        fontSize: 20,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        color: const Color(
                                                            0xff252525),
                                                      ),
                                                    ),
                                                    Text(
                                                      "AED ${proposals[index].amount ?? "0"}",
                                                      style: GoogleFonts.lato(
                                                        fontSize: 13,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        color: const Color(
                                                            0xff252525),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                SizedBox(
                                                  height: height * 0.01,
                                                ),
                                                Row(
                                                  children: [
                                                    const Image(
                                                      height: 14,
                                                      width: 12,
                                                      image: AssetImage(
                                                        "assets/image/locationgrren.png",
                                                      ),
                                                      fit: BoxFit.fill,
                                                    ),
                                                    SizedBox(
                                                      width: width * 0.01,
                                                    ),
                                                    Text(
                                                      "${proposals[index].labDetails![0].city ?? ""}, ${proposals[index].labDetails![0].country ?? ""}",
                                                      style: GoogleFonts.lato(
                                                        fontSize: 12,
                                                        fontWeight:
                                                            FontWeight.w400,
                                                        color: const Color(
                                                            0xff116D6E),
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      width: width * 0.02,
                                                    ),
                                                    const Image(
                                                      height: 14,
                                                      width: 12,
                                                      image: AssetImage(
                                                        "assets/image/call.png",
                                                      ),
                                                      fit: BoxFit.fill,
                                                    ),
                                                    SizedBox(
                                                      width: width * 0.01,
                                                    ),
                                                    Text(
                                                      "${proposals[index].labDetails![0].countryCode ?? ""} ${proposals[index].labDetails![0].mobileNumber ?? ""}",
                                                      style: GoogleFonts.lato(
                                                        fontSize: 12,
                                                        fontWeight:
                                                            FontWeight.w400,
                                                        color: const Color(
                                                            0xff116D6E),
                                                      ),
                                                    ),
                                                    const Spacer(),
                                                    InkWell(
                                                      onTap: () {
                                                        acceptProposal(
                                                            proposalId:
                                                                proposals[index]
                                                                    .id);
                                                      },
                                                      child: Container(
                                                        padding: EdgeInsets
                                                            .symmetric(
                                                                horizontal:
                                                                    width *
                                                                        0.03,
                                                                vertical: 3),
                                                        decoration:
                                                            BoxDecoration(
                                                          color: const Color(
                                                              0xff219653),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(2),
                                                        ),
                                                        child: Center(
                                                          child: Text(
                                                            "Accept",
                                                            style: GoogleFonts
                                                                .lato(
                                                              fontSize: 10,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600,
                                                              color:
                                                                  Colors.white,
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    )
                                                  ],
                                                ),
                                                SizedBox(
                                                  height: height * 0.01,
                                                ),
                                                Row(
                                                  children: [
                                                    Expanded(
                                                      child: Text(
                                                        proposals[index]
                                                                .labDetails![0]
                                                                .description ??
                                                            "",
                                                        maxLines: 2,
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                        softWrap: false,
                                                        style: GoogleFonts.lato(
                                                          fontSize: 13,
                                                          fontWeight:
                                                              FontWeight.w400,
                                                          color: const Color(
                                                              0xff252525),
                                                        ),
                                                      ),
                                                    ),
                                                    // Spacer(),
                                                    InkWell(
                                                      onTap: () {
                                                        Navigator.push(context,
                                                            MaterialPageRoute(
                                                          builder: (context) {
                                                            return PublicProfileScreen(
                                                                labId: proposals[
                                                                            index]
                                                                        .labDetails![
                                                                            0]
                                                                        .id ??
                                                                    "");
                                                          },
                                                        ));
                                                      },
                                                      child: Text(
                                                        "Show Profile",
                                                        style: GoogleFonts.lato(
                                                          fontSize: 14,
                                                          fontWeight:
                                                              FontWeight.w400,
                                                          color: const Color(
                                                              0xff116D6E),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      );
                                    },
                                  ),
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

  getPendingDetails() async {
    var body = {"quoteId": widget.quoteId};
    Response response = await quoteService.getPendingQuoteDetail(body: body);

    if (response.statusCode == 200) {
      pendingQuote = PendingQuote.fromJson(jsonDecode(response.body));
      proposals.addAll(pendingQuote!.data!.propsaldata ?? []);
      quotesData = (pendingQuote!.data!.quotesData ?? []).first;
    } else if (response.statusCode == 401) {
      Utils.logout(context);
    }
    isLoading = false;
    setState(() {});
  }

  acceptProposal({required proposalId}) async {
    Utils.showLoadingDialog(context);
    var body = {"proposalId": proposalId, "quoteId": widget.quoteId};
    Response response = await quoteService.acceptProposal(body: body);
    Navigator.pop(context);
    if (response.statusCode == 200) {
      Navigator.pop(context);
      Utils.showSuccessToast(jsonDecode(response.body)['message']);
    } else if (response.statusCode == 401) {
      Utils.logout(context);
    } else {
      Utils.showErrorToast(jsonDecode(response.body)['message']);
    }
  }
}
