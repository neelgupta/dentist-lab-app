// ignore_for_file: use_build_context_synchronously

import 'dart:convert';

import 'package:dentalapp/models/lab_pending_quote_model.dart';
import 'package:dentalapp/services/clinic_services/quote_services.dart';
import 'package:dentalapp/services/lab_service/dashboars_feeds.dart';
import 'package:dentalapp/util/utils.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart';

class PendingQuoteDetails extends StatefulWidget {
  final String quoteId;
  final String isSend;
  const PendingQuoteDetails({super.key, required this.quoteId,required this.isSend});

  @override
  State<PendingQuoteDetails> createState() => _PendingQuoteDetailsState(isSend);
}

class _PendingQuoteDetailsState extends State<PendingQuoteDetails> {
  _PendingQuoteDetailsState(this.isSend);
  String isSend = "0";
  TextEditingController amountController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController commentController = TextEditingController();
  QuoteService quoteService = QuoteService();
  LabDashBoardServices labDashBoardServices = LabDashBoardServices();
  bool isLoading = true;
  LabPendingQuotes? labPendingQuotes;
  QuoteData? quoteData;
  ClinicDetail? clinicDetails;
  List quoteImages = [];
  List workCompleteTimes = ["Less than 1 day","Less than 7 days","Less than 15 days","Less than 30 days","More than 30 days"];
  String? workTime;
  final formKey = GlobalKey<FormState>();
  var autoValidate = AutovalidateMode.disabled;
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
    return SafeArea(
      child: Scaffold(
        body: isLoading
            ? Center(child: loader())
            : Column(
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
            labPendingQuotes == null
                ? Container(
              height: height * 0.5,
              alignment: Alignment.center,
              child: const Text(
                  "No Data Found !!! \n\n Please Try Again"),
            )
                : Padding(
              padding:
              EdgeInsets.symmetric(horizontal: width * 0.05),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment:
                  CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Title",
                      style: GoogleFonts.lato(
                        fontSize: 13,
                        fontWeight: FontWeight.w600,
                        color: const Color(0xff707070),
                      ),
                    ),
                    SizedBox(
                      height: height * 0.01,
                    ),
                    Text(
                      quoteData!.title ?? "",
                      style: GoogleFonts.lato(
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                        color: const Color(0xff252525),
                      ),
                    ),
                    SizedBox(
                      height: height * 0.02,
                    ),
                    Text(
                      "Description",
                      style: GoogleFonts.lato(
                        fontSize: 13,
                        fontWeight: FontWeight.w600,
                        color: const Color(0xff707070),
                      ),
                    ),
                    SizedBox(
                      height: height * 0.01,
                    ),
                    Text(
                      quoteData!.description ?? "",
                      style: GoogleFonts.lato(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: const Color(0xff252525),
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
                    Text(
                      "Services",
                      style: GoogleFonts.lato(
                        fontSize: 13,
                        fontWeight: FontWeight.w600,
                        color: const Color(0xff707070),
                      ),
                    ),
                    SizedBox(
                      height: height * 0.01,
                    ),
                    Wrap(
                      runSpacing: width * 0.01,
                      spacing: width * 0.03,
                      children: (quoteData!.serviceDetails ?? [])
                          .map((item) {
                        return Text(item.title ?? "",
                            style: GoogleFonts.lato(
                                color: const Color(0xff116D6E)));
                      }).toList(),
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
                          "Clinic Name :",
                          style: GoogleFonts.lato(
                            fontSize: 13,
                            fontWeight: FontWeight.w600,
                            color: const Color(0xff707070),
                          ),
                        ),
                        Expanded(
                          child: Text(
                            clinicDetails!.clinicName ?? "",
                            textAlign: TextAlign.end,
                            style: GoogleFonts.lato(
                              fontSize: 13,
                              fontWeight: FontWeight.w500,
                              color: const Color(0xff252525),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: height * 0.02,
                    ),
                    Row(
                      children: [
                        Text(
                          "Clinic Address :",
                          style: GoogleFonts.lato(
                            fontSize: 13,
                            fontWeight: FontWeight.w600,
                            color: const Color(0xff707070),
                          ),
                        ),
                        SizedBox(
                          width: width * 0.02,
                        ),
                        Expanded(
                          child: Text(
                            "${clinicDetails!.city ?? ""}, ${clinicDetails!.state ?? ""}, ${clinicDetails!.country ?? ""}",
                            textAlign: TextAlign.end,
                            style: GoogleFonts.lato(
                              fontSize: 13,
                              fontWeight: FontWeight.w500,
                              color: const Color(0xff252525),
                            ),
                          ),
                        ),
                      ],
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
                    Text(
                      "Images",
                      style: GoogleFonts.lato(
                        fontSize: 13,
                        fontWeight: FontWeight.w600,
                        color: const Color(0xff707070),
                      ),
                    ),
                    SizedBox(
                      height: height * 0.01,
                    ),
                    SizedBox(
                      height: width * 0.33,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: quoteImages.length,
                        itemBuilder: (context, index) {
                        return Container(
                          height: width * 0.3,
                          width: width * 0.3,
                          margin: EdgeInsets.symmetric(horizontal: width * 0.02),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            image: DecorationImage(image: NetworkImage(quoteImages[index]))
                          ),
                        );
                      },),
                    ),
                    SizedBox(
                      height: height * 0.02,
                    ),
                    if (isSend == "0")
                      InkWell(
                        onTap: () {
                          workTime = null;
                          showMyDialog(context);
                        },
                        child: Container(
                          height: 50,
                          width: width,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color: const Color(0xFF116D6E)
                          ),
                          child: Text("Sent Proposal",
                              style: GoogleFonts.lato(
                                fontSize: 14,
                                fontWeight:
                                FontWeight.w600,
                                color: Colors.white,
                              )),
                        ),
                      ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void showMyDialog(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (context, setState1) {
            return Form(
              key: formKey,
              autovalidateMode: autoValidate,
              child: AlertDialog(
                  title: Container(
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(quoteData!.title ?? "",
                            style: GoogleFonts.lato(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                            textAlign: TextAlign.start),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(quoteData!.description ?? "",
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
                        TextFormField(
                          controller: amountController,
                          keyboardType: TextInputType.number,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please Enter Service Price';
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                              labelText: "Add Amount",
                              hintText: "Add Amount",
                              hintStyle: TextStyle(fontSize: 12,color: Color(0xFF707070)),
                              labelStyle: TextStyle(fontSize: 12,color: Color(0xFF707070)),
                              counterText: "",
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12),
                                  borderSide: const BorderSide(
                                      color: Color(0xFF707070))),
                              prefixIcon: Container(
                                width: width * 0.07,
                                margin: EdgeInsets.symmetric(
                                    horizontal: width * 0.01, vertical: 5),
                                decoration: const BoxDecoration(
                                    border: Border(
                                        right: BorderSide(
                                            color: Color(0xFF707070)))),
                                alignment: Alignment.center,
                                child: const Text(
                                  "AED",
                                  style: TextStyle(fontSize: 12,color: Color(0xFF707070)),
                                ),
                              )),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                          textAlign: TextAlign.start,
                          controller: descriptionController,
                          keyboardType: TextInputType.multiline,
                          minLines: 2,
                          //Normal textInputField will be displayed
                          maxLines: 6,
                          textAlignVertical: TextAlignVertical.top,
                          textInputAction: TextInputAction.next,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please Enter Description';
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                            alignLabelWithHint: true,
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                                borderSide:
                                const BorderSide(color: Color(0xFF707070))),
                            labelText: 'Cover Letter',
                            labelStyle: const TextStyle(
                              fontSize: 14,
                            ),
                            hintText: 'Cover Letter',
                            hintStyle: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: Color(0xFF707070),
                            ),
                            contentPadding: const EdgeInsets.only(
                                left: 18, top: 16, bottom: 16, right: 5),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Container(
                          height: 50,
                          width: width,
                          decoration: BoxDecoration(
                              border: Border.all(
                                  color: const Color(0xFF707070)),
                              borderRadius: BorderRadius.circular(10)),
                          child: ButtonTheme(
                            alignedDropdown: true,
                            child: DropdownButtonHideUnderline(
                              child: DropdownButton(
                                menuMaxHeight: height * .4,
                                borderRadius: BorderRadius.circular(10),
                                value: workTime,
                                icon: const Icon(Icons.keyboard_arrow_down,
                                    color: Color(0xFF707070)),
                                hint: const Text(
                                  "Delivered in",
                                  style:
                                  TextStyle(color: Color(0xFF707070)),
                                ),
                                items: workCompleteTimes
                                    .map((item) {
                                      return DropdownMenuItem(
                                        value: item,
                                        child: SizedBox(
                                            width: width * 0.5,
                                            child: Text(item)),
                                      );
                                    }).toList(),
                                onChanged: (value) {
                                  workTime = value.toString();
                                  setState1(() {});
                                },
                              ),
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
                                if (formKey.currentState!.validate()) {
                                  if (amountController.text.isEmpty) {
                                    Utils.showErrorToast("Please Enter Amount");
                                  } else if(workTime == null) {
                                    Utils.showErrorToast("Please Select Delivered Time");
                                  }else {
                                    sendProposal();
                                  }
                                } else {
                                  autoValidate = AutovalidateMode.always;
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
                  )),
            );
          }
        );
      },
    );
  }

  getQuoteDetail() async {
    Response response = await quoteService.getSingleQuoteDetail(quotId: widget.quoteId);
    if (response.statusCode == 200) {
      labPendingQuotes = LabPendingQuotes.fromJson(jsonDecode(response.body));
      if ((labPendingQuotes!.quoteData ?? []).isNotEmpty) {
        quoteData = labPendingQuotes!.quoteData!.first;
        if ((quoteData!.clinicDetails ?? []).isNotEmpty) {
          clinicDetails = quoteData!.clinicDetails!.first;
        }
        quoteImages = quoteData!.quoteImages ?? [];
      }
    } else if (response.statusCode == 401) {
      Utils.logout(context);
    }
    isLoading = false;
    setState(() {});
  }

  sendProposal() async {
    Utils.showLoadingDialog(context);
    var body = {
      "quoteId": widget.quoteId,
      "amount": amountController.text,
      "coverLetter" : descriptionController.text,
      "deliverIn": workTime
    };
    Response response = await labDashBoardServices.sendProposal(body: body);
    Navigator.pop(context);
    if (response.statusCode == 200) {
      setState(() {
        isSend = "1";
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
