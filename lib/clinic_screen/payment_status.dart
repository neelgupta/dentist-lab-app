// ignore_for_file: use_build_context_synchronously

import 'dart:convert';

import 'package:dentalapp/custom_widget/button.dart';
import 'package:dentalapp/models/accepeted_quote_model.dart';
import 'package:dentalapp/services/clinic_services/quote_services.dart';
import 'package:dentalapp/util/utils.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart';

import 'bottom_navigation_bar.dart';

class PaymentStatus extends StatefulWidget {
  final String quoteId;
  const PaymentStatus({Key? key, required this.quoteId}) : super(key: key);

  @override
  State<PaymentStatus> createState() => _PaymentStatusState();
}

class _PaymentStatusState extends State<PaymentStatus> {
  QuoteService quoteService = QuoteService();
  bool isLoading = true;
  AcceptedQuote? acceptedQuote;
  QuoteData? quoteData;
  LabDetails? labDetails;
  OrderDetails? orderDetails;
  QuoteStatus? quoteStatus;

  @override
  void initState() {
    super.initState();
    getQuoteDetail();
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
      child: SafeArea(
        child: Scaffold(
          body: isLoading
              ? Center(child: loader())
              : SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                          height: height * 0.15,
                          decoration: const BoxDecoration(
                              color: Color(0xFF116D6E),
                              image: DecorationImage(
                                  image: AssetImage(
                                      "assets/image/Group 12305.png"),
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
                                "Payment",
                                style: GoogleFonts.lato(
                                  fontSize: 26,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.white,
                                ),
                              )),
                            ],
                          )),
                      SizedBox(
                        height: height * 0.03,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: width * 0.05),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            SizedBox(
                              height: height * 0.65,
                              child: SingleChildScrollView(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        Text(
                                          quoteData!.title ?? "",
                                          style: GoogleFonts.lato(
                                            fontSize: 15,
                                            fontWeight: FontWeight.w600,
                                            color: const Color(0xff252525),
                                          ),
                                        ),
                                        const Spacer(),
                                        QuotesWidget.getQuoteStatus(
                                            width, quoteStatus!.clinicStatus!)
                                      ],
                                    ),
                                    SizedBox(
                                      height: height * 0.02,
                                    ),
                                    SizedBox(
                                      width: width * 0.75,
                                      child: Text(
                                        quoteData!.description ?? "",
                                        style: GoogleFonts.lato(
                                          fontSize: 13,
                                          fontWeight: FontWeight.w400,
                                          color: const Color(0xff252525),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: height * 0.01,
                                    ),
                                    const Divider(
                                      thickness: 1,
                                      color: Color(0xffE7E7E7),
                                    ),
                                    SizedBox(
                                      height: height * 0.01,
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          "Total :",
                                          style: GoogleFonts.lato(
                                            fontSize: 13,
                                            fontWeight: FontWeight.w600,
                                            color: const Color(0xff707070),
                                          ),
                                        ),
                                        const Spacer(),
                                        Text(
                                          "AED ${(orderDetails!.totalAmount ?? 0).toStringAsFixed(2)}",
                                          style: GoogleFonts.lato(
                                            fontSize: 13,
                                            fontWeight: FontWeight.w500,
                                            color: const Color(0xff252525),
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: height * 0.02,
                                    ),
                                    if (quoteStatus!.clinicStatus !=
                                        "advancePending")
                                      Column(
                                        children: [
                                          Row(
                                            children: [
                                              Text(
                                                "Advance 30% (Paid)",
                                                style: GoogleFonts.lato(
                                                  fontSize: 13,
                                                  fontWeight: FontWeight.w600,
                                                  color:
                                                      const Color(0xff707070),
                                                ),
                                              ),
                                              const Spacer(),
                                              Text(
                                                "AED ${(orderDetails!.advanceAmount ?? 0).toStringAsFixed(2)}",
                                                style: GoogleFonts.lato(
                                                  fontSize: 13,
                                                  fontWeight: FontWeight.w500,
                                                  color:
                                                      const Color(0xff252525),
                                                ),
                                              ),
                                            ],
                                          ),
                                          SizedBox(
                                            height: height * 0.02,
                                          ),
                                        ],
                                      ),
                                    Row(
                                      children: [
                                        Text(
                                          "Priority :",
                                          style: GoogleFonts.lato(
                                            fontSize: 13,
                                            fontWeight: FontWeight.w600,
                                            color: const Color(0xff707070),
                                          ),
                                        ),
                                        const Spacer(),
                                        Container(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: width * 0.04,
                                              vertical: 5),
                                          decoration: BoxDecoration(
                                            color: Color(
                                                quoteData!.priority == "normal"
                                                    ? 0xff707070
                                                    : 0xffFF5959),
                                            borderRadius:
                                                BorderRadius.circular(2),
                                          ),
                                          child: Center(
                                            child: Text(
                                              quoteData!.priority == "normal"
                                                  ? "Normal"
                                                  : "Urgent",
                                              style: GoogleFonts.lato(
                                                fontSize: 10,
                                                fontWeight: FontWeight.w600,
                                                color: const Color(0xffFFFFFF),
                                              ),
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                    SizedBox(
                                      height: height * 0.02,
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          "Lab Name ",
                                          style: GoogleFonts.lato(
                                            fontSize: 13,
                                            fontWeight: FontWeight.w600,
                                            color: const Color(0xff252525),
                                          ),
                                        ),
                                        const Spacer(),
                                        Text(
                                          labDetails!.labName ?? "",
                                          style: GoogleFonts.lato(
                                            fontSize: 13,
                                            fontWeight: FontWeight.w500,
                                            color: const Color(0xff252525),
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: height * 0.02,
                                    ),
                                    Row(
                                      children: [
                                        Image(
                                          width: width * 0.03,
                                          image: const AssetImage(
                                            "assets/image/locationgrren.png",
                                          ),
                                          fit: BoxFit.fill,
                                        ),
                                        SizedBox(
                                          width: width * 0.02,
                                        ),
                                        Text(
                                          "${labDetails!.city ?? " "}, ${labDetails!.state ?? ""}, ${labDetails!.country ?? ""}",
                                          style: GoogleFonts.lato(
                                            fontSize: 15,
                                            fontWeight: FontWeight.w400,
                                            color: const Color(0xff116D6E),
                                          ),
                                        ),
                                        SizedBox(
                                          width: width * 0.03,
                                        ),
                                        Image(
                                          width: width * 0.04,
                                          image: const AssetImage(
                                            "assets/image/call.png",
                                          ),
                                          fit: BoxFit.fill,
                                        ),
                                        SizedBox(
                                          width: width * 0.02,
                                        ),
                                        Text(
                                          "${labDetails!.countryCode ?? ""} ${labDetails!.mobileNumber ?? ''}",
                                          style: GoogleFonts.lato(
                                            fontSize: 15,
                                            fontWeight: FontWeight.w400,
                                            color: const Color(0xff116D6E),
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: height * 0.02,
                                    ),
                                    Text(
                                      "${labDetails!.city ?? ""} ${labDetails!.country ?? ""}",
                                      style: GoogleFonts.lato(
                                        fontSize: 13,
                                        fontWeight: FontWeight.w600,
                                        color: const Color(0xff252525),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            commonButton(context, 'Back To Home', 13,
                                FontWeight.w700, Colors.white, () {
                              goBack();
                            })
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
        ),
      ),
    );
  }

  getQuoteDetail() async {
    var body = {"quoteId": widget.quoteId};
    Response response = await quoteService.getAcceptedQuoteDetail(body: body);
    if (response.statusCode == 200) {
      acceptedQuote = AcceptedQuote.fromJson(jsonDecode(response.body));
      quoteData = acceptedQuote!.quoteData!.first;
      quoteStatus = quoteData!.quoteStatus!.first;
      labDetails = quoteData!.labDetails!.first;
      orderDetails = quoteData!.orderDetails!.first;
    } else if (response.statusCode == 401) {
      Utils.logout(context);
    }
    isLoading = false;
    setState(() {});
  }

  Future<bool> goBack() async {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const BottomNavigation(index: 0)),
    );
    return true;
  }
}
