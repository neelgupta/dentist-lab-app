// ignore_for_file: use_build_context_synchronously

import 'dart:convert';

import 'package:dentalapp/custom_widget/button.dart';
import 'package:dentalapp/models/accepeted_quote_model.dart';
import 'package:dentalapp/models/comment_model.dart';
import 'package:dentalapp/services/clinic_services/quote_services.dart';
import 'package:dentalapp/util/utils.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart';

class Item {
  String name;
  String description;

  Item({required this.name, required this.description});
}

class QuoteDetailsScreen extends StatefulWidget {
  final String quoteId;
  const QuoteDetailsScreen({Key? key, required this.quoteId}) : super(key: key);

  @override
  State<QuoteDetailsScreen> createState() => _QuoteDetailsScreenState();
}

class _QuoteDetailsScreenState extends State<QuoteDetailsScreen> {
  final formKey = GlobalKey<FormState>();
  var autoValidate = AutovalidateMode.disabled;
  bool isShareComments = false;
  TextEditingController titleController = TextEditingController();
  TextEditingController commentController = TextEditingController();
  QuoteService quoteService = QuoteService();
  bool isLoading = true;
  AcceptedQuote? acceptedQuote;
  QuoteData? quoteData;
  PropsalDetails? propsalDetails;
  ClinicDetail? clinicDetails;
  OrderDetails? orderDetails;
  QuoteStatus? quoteStatus;
  Comments? comments;
  List<CommentData> commentList = [];

  @override
  void initState() {
    super.initState();
    getQuoteDetail();
    getComments();
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
        body: isLoading
            ? Center(child: loader())
            : SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                        height: height * 0.2,
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
                    quoteData == null
                        ? Container(
                            height: height * 0.5,
                            alignment: Alignment.center,
                            child: const Text(
                                "No Data Found !!! \n\n Please Try Again"),
                          )
                        : Padding(
                            padding:
                                EdgeInsets.symmetric(horizontal: width * 0.05),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                SizedBox(
                                  height: height * 0.65,
                                  child: SingleChildScrollView(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
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
                                                width, quoteStatus!.labStatus!)
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
                                              "Subtotal :",
                                              style: GoogleFonts.lato(
                                                fontSize: 13,
                                                fontWeight: FontWeight.w600,
                                                color: const Color(0xff707070),
                                              ),
                                            ),
                                            const Spacer(),
                                            Text(
                                              "AED ${orderDetails!.totalAmount}",
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
                                        if (quoteStatus!.labStatus !=
                                            "waitForPayment")
                                          Column(
                                            children: [
                                              Row(
                                                children: [
                                                  Text(
                                                    "Advance 30% (Paid)",
                                                    style: GoogleFonts.lato(
                                                      fontSize: 13,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      color: const Color(
                                                          0xff707070),
                                                    ),
                                                  ),
                                                  const Spacer(),
                                                  Text(
                                                    "AED ${orderDetails!.advanceAmount}",
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
                                                    quoteData!.priority ==
                                                            "normal"
                                                        ? 0xff707070
                                                        : 0xffFF5959),
                                                borderRadius:
                                                    BorderRadius.circular(2),
                                              ),
                                              child: Center(
                                                child: Text(
                                                  quoteData!.priority ==
                                                          "normal"
                                                      ? "Normal"
                                                      : "Urgent",
                                                  style: GoogleFonts.lato(
                                                    fontSize: 10,
                                                    fontWeight: FontWeight.w600,
                                                    color:
                                                        const Color(0xffFFFFFF),
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
                                              "Clinic Name ",
                                              style: GoogleFonts.lato(
                                                fontSize: 13,
                                                fontWeight: FontWeight.w600,
                                                color: const Color(0xff252525),
                                              ),
                                            ),
                                            const Spacer(),
                                            Text(
                                              clinicDetails!.clinicName ?? "",
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
                                              "${clinicDetails!.city ?? " "}, ${clinicDetails!.country ?? ""}",
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
                                              "${clinicDetails!.countryCode ?? ""} ${clinicDetails!.mobileNumber ?? ""}",
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
                                          "${clinicDetails!.city ?? ""} ${clinicDetails!.country ?? ""}",
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
                                quoteStatus!.labStatus == "waitForPayment" ||
                                        quoteStatus!.labStatus ==
                                            "outForDelivery" ||
                                        quoteStatus!.labStatus ==
                                            "deliverySuccess"
                                    ? commonButton(context, 'Call Clinic', 13,
                                        FontWeight.w700, Colors.white, () {
                                        makePhoneCall();
                                      })
                                    : quoteStatus!.labStatus == "workStarted"
                                        ? SingleChildScrollView(
                                            child: Column(
                                              children: [
                                                commonButton(
                                                    context,
                                                    'Call Clinic',
                                                    13,
                                                    FontWeight.w700,
                                                    Colors.white, () {
                                                  makePhoneCall();
                                                }),
                                                SizedBox(
                                                  height: height * 0.02,
                                                ),
                                                commonButton(
                                                    context,
                                                    'Out For Delivery',
                                                    13,
                                                    FontWeight.w700,
                                                    Colors.white, () {
                                                  completeWork();
                                                }),
                                              ],
                                            ),
                                          )
                                        : quoteStatus!.clinicStatus ==
                                                'deliveryRejected'
                                            ? Column(
                                                children: [
                                                  commonButton(
                                                      context,
                                                      'Share Comment',
                                                      13,
                                                      FontWeight.w700,
                                                      Colors.white, () {
                                                    showShareMyDialog();
                                                  }),
                                                  if (commentList.isNotEmpty)
                                                    Column(
                                                      children: [
                                                        SizedBox(
                                                          height: height * 0.02,
                                                        ),
                                                        InkWell(
                                                          onTap: () {
                                                            setState(() {
                                                              isShareComments =
                                                                  !isShareComments;
                                                            });
                                                          },
                                                          child: SizedBox(
                                                            width: width,
                                                            height:
                                                                height * 0.04,
                                                            child: Row(
                                                              children: [
                                                                Text("Comments",
                                                                    style:
                                                                        GoogleFonts
                                                                            .lato(
                                                                      fontSize:
                                                                          18,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w600,
                                                                      color: const Color(
                                                                          0xff111111),
                                                                    )),
                                                                const Spacer(),
                                                                !isShareComments
                                                                    ? const Image(
                                                                        height:
                                                                            7,
                                                                        width:
                                                                            14,
                                                                        image:
                                                                            AssetImage(
                                                                          "assets/image/upicon.png",
                                                                        ),
                                                                        fit: BoxFit
                                                                            .fill,
                                                                      )
                                                                    : const Image(
                                                                        height:
                                                                            6,
                                                                        width:
                                                                            14,
                                                                        image:
                                                                            AssetImage(
                                                                          "assets/image/downicon.png",
                                                                        ),
                                                                        fit: BoxFit
                                                                            .fill,
                                                                      ),
                                                                SizedBox(
                                                                  width: width *
                                                                      0.01,
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                        !isShareComments
                                                            ? const SizedBox()
                                                            : ListView.builder(
                                                                shrinkWrap:
                                                                    true,
                                                                physics:
                                                                    const NeverScrollableScrollPhysics(),
                                                                itemCount:
                                                                    commentList
                                                                        .length,
                                                                itemBuilder:
                                                                    (context,
                                                                        index) {
                                                                  return Column(
                                                                    crossAxisAlignment:
                                                                        CrossAxisAlignment
                                                                            .start,
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .start,
                                                                    children: [
                                                                      if (index ==
                                                                          0)
                                                                        Padding(
                                                                          padding:
                                                                              EdgeInsets.only(top: height * 0.01),
                                                                          child:
                                                                              const Divider(
                                                                            thickness:
                                                                                1,
                                                                            color:
                                                                                Color(0xffE7E7E7),
                                                                          ),
                                                                        ),
                                                                      SizedBox(
                                                                        height: height *
                                                                            0.01,
                                                                      ),
                                                                      Text(
                                                                          commentList[index].isMessage == "clinic"
                                                                              ? commentList[index].clinicDetails!.first.clinicName ??
                                                                                  ""
                                                                              : commentList[index].labDetails!.first.labName ??
                                                                                  "",
                                                                          style:
                                                                              GoogleFonts.lato(
                                                                            fontSize:
                                                                                13,
                                                                            fontWeight:
                                                                                FontWeight.bold,
                                                                            color:
                                                                                const Color(0xff252525),
                                                                          )),
                                                                      SizedBox(
                                                                        height: height *
                                                                            0.01,
                                                                      ),
                                                                      Text(
                                                                          commentList[index].comment ??
                                                                              '',
                                                                          style:
                                                                              GoogleFonts.lato(
                                                                            fontSize:
                                                                                13,
                                                                            fontWeight:
                                                                                FontWeight.w400,
                                                                            color:
                                                                                const Color(0xff111111),
                                                                          )),
                                                                      SizedBox(
                                                                        height: height *
                                                                            0.01,
                                                                      ),
                                                                      const Divider(
                                                                        thickness:
                                                                            1,
                                                                        color: Color(
                                                                            0xffE7E7E7),
                                                                      ),
                                                                    ],
                                                                  );
                                                                },
                                                              ),
                                                      ],
                                                    ),
                                                ],
                                              )
                                            : Container()
                              ],
                            ),
                          ),
                  ],
                ),
              ),
      ),
    );
  }

  void showShareMyDialog() {
    double height = MediaQuery.of(context).size.height -
        MediaQuery.of(context).padding.top -
        MediaQuery.of(context).padding.bottom;
    double width = MediaQuery.of(context).size.width;
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
            insetPadding: EdgeInsets.symmetric(horizontal: width * 0.05),
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(10))),
            title: Container(
              width: width,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
              ),
              child: StatefulBuilder(
                builder: (context, setState) {
                  return Form(
                    key: formKey,
                    autovalidateMode: autoValidate,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        TextFormField(
                          textInputAction: TextInputAction.next,
                          controller: titleController,
                          keyboardType: TextInputType.name,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please Enter Title';
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide:
                                  const BorderSide(color: Color(0xFF707070)),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide: const BorderSide(
                                color: Color(0xFF707070),
                              ),
                            ),
                            labelText: 'Title',
                            labelStyle:
                                const TextStyle(color: Color(0xff707070)),
                            hintText: 'Title',
                            hintStyle: const TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                color: Color(0xFF707070)),
                            contentPadding: EdgeInsets.symmetric(
                                vertical: height * 0.02,
                                horizontal: width * 0.03),
                          ),
                        ),
                        SizedBox(
                          height: height * 0.02,
                        ),
                        TextFormField(
                          textInputAction: TextInputAction.next,
                          controller: commentController,
                          keyboardType: TextInputType.name,
                          maxLines: 3,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please Enter Comment';
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                            alignLabelWithHint: true,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide:
                                  const BorderSide(color: Color(0xFF707070)),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide: const BorderSide(
                                color: Color(0xFF707070),
                              ),
                            ),
                            labelText: 'Comment',
                            labelStyle:
                                const TextStyle(color: Color(0xff707070)),
                            hintText: 'Comment',
                            hintStyle: const TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                color: Color(0xFF707070)),
                            contentPadding: EdgeInsets.symmetric(
                                vertical: height * 0.02,
                                horizontal: width * 0.03),
                          ),
                        ),
                        SizedBox(
                          height: height * 0.02,
                        ),
                        TextButton(
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all(
                                  const Color(0xFF116D6E)),
                              padding: MaterialStateProperty.all(
                                  EdgeInsets.symmetric(
                                      horizontal: width * 0.1,
                                      vertical: height * 0.02)),
                              shape: MaterialStateProperty.all(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                              ),
                            ),
                            onPressed: () {
                              if (formKey.currentState!.validate()) {
                                addComments();
                              } else {
                                autoValidate = AutovalidateMode.always;
                              }
                            },
                            child: Text("Share Comment",
                                style: GoogleFonts.lato(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.white,
                                ))),
                      ],
                    ),
                  );
                },
              ),
            ));
      },
    );
  }

  getQuoteDetail() async {
    var body = {"quoteId": widget.quoteId};
    Response response = await quoteService.getAcceptedQuoteDetail(body: body);
    if (response.statusCode == 200) {
      acceptedQuote = AcceptedQuote.fromJson(jsonDecode(response.body));
      quoteData = acceptedQuote!.quoteData!.first;
      quoteStatus = quoteData!.quoteStatus!.first;
      propsalDetails = quoteData!.propsalDetails!.first;
      clinicDetails = quoteData!.clinicDetails!.first;
      orderDetails = quoteData!.orderDetails!.first;
    } else if (response.statusCode == 401) {
      Utils.logout(context);
    }
    isLoading = false;
    setState(() {});
  }

  makePhoneCall() {
    Utils.makePhoneCall(
        "${clinicDetails!.countryCode ?? ""} ${clinicDetails!.mobileNumber ?? ''}");
  }

  deliveryAcceptReject({isAccept = true}) async {
    Utils.showLoadingDialog(context);
    var body = {"quoteId": widget.quoteId};
    Response response =
        await quoteService.acceptRejectDelivery(body: body, isAccept: isAccept);
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

  addComments() async {
    Utils.showLoadingDialog(context);
    var body = {
      "quoteId": widget.quoteId,
      "title": titleController.text,
      "comment": commentController.text
    };
    Response response = await quoteService.addComments(body: body);
    Navigator.pop(context);
    if (response.statusCode == 200) {
      titleController.text = "";
      commentController.text = "";
      Navigator.pop(context);
      getComments();
      Utils.showSuccessToast(jsonDecode(response.body)['message']);
    } else if (response.statusCode == 401) {
      Utils.logout(context);
    } else {
      Utils.showErrorToast(jsonDecode(response.body)['message']);
    }
  }

  getComments() async {
    commentList.clear();
    var body = {
      "quoteId": widget.quoteId,
    };
    Response response = await quoteService.getComments(body: body);
    if (response.statusCode == 200) {
      comments = Comments.fromJson(jsonDecode(response.body));
      commentList.addAll(comments!.commentData ?? []);
    } else if (response.statusCode == 401) {
      Utils.logout(context);
    }
    setState(() {});
  }

  completeWork() async {
    Utils.showLoadingDialog(context);
    var body = {"quoteId": widget.quoteId};
    Response response = await quoteService.completeWork(body: body);
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
