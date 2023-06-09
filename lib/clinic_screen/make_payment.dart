// ignore_for_file: no_logic_in_create_state, use_build_context_synchronously

import 'dart:convert';
import 'package:dentalapp/clinic_screen/payment_successfully.dart';
import 'package:dentalapp/clinic_screen/payment_webview.dart';
import 'package:dentalapp/custom_widget/button.dart';
import 'package:dentalapp/services/clinic_services/quote_services.dart';
import 'package:dentalapp/util/utils.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart';

class MakePayment extends StatefulWidget {
  final String quoteId;
  final String status;
  final String title;
  final String description;
  final String amount;
  final String labName;
  final String labMobile;
  final List paymentType;
  final bool isAdvance;
  const MakePayment(
      {Key? key,
      required this.quoteId,
      required this.status,
      required this.title,
      required this.description,
      required this.amount,
      required this.labName,
      required this.labMobile,
      required this.paymentType,
      required this.isAdvance})
      : super(key: key);

  @override
  State<MakePayment> createState() => _MakePaymentState(
      quoteId, status, title, description, amount, labName, labMobile, paymentType, isAdvance);
}

class _MakePaymentState extends State<MakePayment> {
  _MakePaymentState(this.quoteId, this.status, this.title, this.description,
      this.amount, this.labName,this.labMobile, this.paymentType, this.isAdvance);
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController mobileController = TextEditingController();
  String quoteId = '';
  String status = '';
  String title = '';
  String description = '';
  String amount = '';
  String labName = '';
  String labMobile = '';
  List paymentType = [];
  bool isAdvance = false;
  final formKey = GlobalKey<FormState>();
  var autoValidate = AutovalidateMode.disabled;
  final formPaymentKey = GlobalKey<FormState>();
  var paymentAutoValidate = AutovalidateMode.disabled;
  QuoteService quoteService = QuoteService();
  TextEditingController cardNumberController = TextEditingController();
  TextEditingController expController = TextEditingController();
  TextEditingController cvvController = TextEditingController();
  TextEditingController bankNameController = TextEditingController();
  TextEditingController chequeNumberController = TextEditingController();

  bool onlinePayment = false;
  bool cash = false;
  bool cheque = false;
  bool onlinePaymentAvailable = false;
  bool cashAvailable = false;
  bool chequeAvailable = false;

  setPaymentMethod() {
    widget.paymentType.forEach((element) {
      if (element == "cash") {
        cashAvailable = true;
      } else if (element == "cheque") {
        chequeAvailable = true;
      } else if (element == "onlinePayment") {
        onlinePaymentAvailable = true;
      }
      setState(() {});
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setPaymentMethod();
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
        body: Form(
          key: formKey,
          autovalidateMode: autoValidate,
          child: SizedBox(
            height: height,
            width: width,
            child: SingleChildScrollView(
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
                          Padding(
                            padding:
                                EdgeInsets.symmetric(horizontal: width * 0.03),
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
                                  "Payment",
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
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: height * 0.02),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text(
                              title,
                              style: GoogleFonts.lato(
                                fontSize: 15,
                                fontWeight: FontWeight.w600,
                                color: const Color(0xff252525),
                              ),
                            ),
                            const Spacer(),
                            QuotesWidget.getQuoteStatus(width, status)
                          ],
                        ),
                        SizedBox(
                          height: height * 0.013,
                        ),
                        SizedBox(
                          width: width * 0.75,
                          child: Text(
                            description,
                            style: GoogleFonts.lato(
                              fontSize: 13,
                              fontWeight: FontWeight.w400,
                              color: const Color(0xff252525),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: height * 0.013,
                        ),
                        Row(
                          children: [
                            Text(
                              "Amount",
                              style: GoogleFonts.lato(
                                fontSize: 15,
                                fontWeight: FontWeight.w600,
                                color: const Color(0xff252525),
                              ),
                            ),
                            const Spacer(),
                            Text(
                              "AED $amount",
                              style: GoogleFonts.lato(
                                fontSize: 15,
                                fontWeight: FontWeight.w600,
                                color: const Color(0xff252525),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: height * 0.013,
                        ),
                        const Divider(
                          thickness: 1,
                          color: Color(0xffE7E7E7),
                        ),
                        SizedBox(
                          height: height * 0.02,
                        ),
                        /// online payment
                        if (onlinePaymentAvailable && !cash && !cheque)
                          Column(
                            children: [
                              InkWell(
                                onTap: () {
                                    setState(() {
                                      onlinePayment = !onlinePayment;
                                      cash = false;
                                      cheque = false;
                                    });
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12),
                                    border: Border.all(
                                        width: 1,
                                        color: onlinePayment
                                            ? const Color(0xff116D6E)
                                            : const Color(0xff707070)),
                                  ),
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: height * 0.02,
                                        vertical: height * 0.018),
                                    child: Row(
                                      children: [
                                        SizedBox(
                                          height: height * 0.035,
                                          child: Image.asset(
                                            color: onlinePayment
                                                ? const Color(0xff116D6E)
                                                : const Color(0xff252525),
                                            "assets/image/payment2.png",
                                            fit: BoxFit.fill,
                                          ),
                                        ),
                                        const SizedBox(
                                          width: 10,
                                        ),
                                        Text(
                                          "Online Make Payment",
                                          style: GoogleFonts.lato(
                                            fontSize: 15,
                                            fontWeight: FontWeight.w600,
                                            color: onlinePayment
                                                ? const Color(0xff116D6E)
                                                : const Color(0xff252525),
                                          ),
                                        ),
                                        const Spacer(),
                                        SizedBox(
                                          height: height * 0.04,
                                          child: Image.asset(
                                            color: onlinePayment
                                                ? const Color(0xff116D6E)
                                                : const Color(0xff252525),
                                            "assets/image/righticon.png",
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              // SizedBox(
                              //   height: height * 0.02,
                              // ),
                              // if(onlinePayment) Column(
                              //         children: [
                              //           TextFormField(
                              //             textInputAction: TextInputAction.next,
                              //             controller: cardNumberController,
                              //             keyboardType: TextInputType.number,
                              //             validator: (value) {
                              //               if (onlinePayment) {
                              //                 if (value!.isEmpty) {
                              //                   return 'Please Enter Card Number';
                              //                 } else if (!CreditNumberSubmitRegexValidator()
                              //                     .isValid(value)) {
                              //                   return "Please Enter Valid Card Number";
                              //                 }
                              //               }
                              //               return null;
                              //             },
                              //             inputFormatters: [
                              //               MaskedTextInputFormatter(
                              //                 mask: 'xxxx xxxx xxxx xxxx',
                              //                 separator: ' ',
                              //               )
                              //             ],
                              //             decoration: InputDecoration(
                              //               border: OutlineInputBorder(
                              //                 borderRadius:
                              //                     BorderRadius.circular(12),
                              //                 borderSide: const BorderSide(
                              //                     color: Color(0xFF707070)),
                              //               ),
                              //               focusedBorder: OutlineInputBorder(
                              //                 borderRadius:
                              //                     BorderRadius.circular(12),
                              //                 borderSide: const BorderSide(
                              //                   color: Color(0xFF707070),
                              //                 ),
                              //               ),
                              //               prefixIcon: Padding(
                              //                 padding: EdgeInsets.symmetric(
                              //                     horizontal: height * 0.02,
                              //                     vertical: height * 0.015),
                              //                 child: SizedBox(
                              //                   height: height * 0.005,
                              //                   child: Image.asset(
                              //                     color: const Color(0xff707070),
                              //                     "assets/image/cardnumber.png",
                              //                     fit: BoxFit.cover,
                              //                   ),
                              //                 ),
                              //               ),
                              //               labelText: 'Card Number',
                              //               labelStyle: const TextStyle(
                              //                   color: Color(0xff707070)),
                              //               hintText: 'Card Number',
                              //               hintStyle: const TextStyle(
                              //                   color: Color(0xFF707070)),
                              //               contentPadding: EdgeInsets.symmetric(
                              //                 horizontal: height * 0.02,
                              //               ),
                              //             ),
                              //           ),
                              //           SizedBox(
                              //             height: height * 0.02,
                              //           ),
                              //           Row(
                              //             children: [
                              //               Expanded(
                              //                 child: TextFormField(
                              //                   textInputAction:
                              //                       TextInputAction.next,
                              //                   controller: expController,
                              //                   decoration: InputDecoration(
                              //                       border: OutlineInputBorder(
                              //                           borderRadius:
                              //                               BorderRadius.circular(
                              //                                   12),
                              //                           borderSide:
                              //                               const BorderSide(
                              //                                   color: Color(
                              //                                       0xFF707070))),
                              //                       focusedBorder: OutlineInputBorder(
                              //                           borderRadius:
                              //                               BorderRadius.circular(
                              //                                   12),
                              //                           borderSide:
                              //                               const BorderSide(
                              //                                   color: Color(
                              //                                       0xFF707070))),
                              //                       labelText: 'MM/YY',
                              //                       hintText: 'MM/YY',
                              //                       counterText: "",
                              //                       contentPadding:
                              //                           EdgeInsets.symmetric(
                              //                         horizontal: height * 0.01,
                              //                       ),
                              //                       prefixIcon: const Image(
                              //                           image: AssetImage(
                              //                               "assets/image/date.png"))),
                              //                   inputFormatters: [
                              //                     MaskedTextInputFormatter(
                              //                       mask: 'xx/xx',
                              //                       separator: '/',
                              //                     )
                              //                   ],
                              //                   validator: (value) {
                              //                     if (onlinePayment) {
                              //                       if (value!.isEmpty) {
                              //                         return 'MM/YY Field is Required*';
                              //                       } else if (!CreditExpirySubmitRegexValidator()
                              //                           .isValid(value)) {
                              //                         return "Invalid";
                              //                       }
                              //                     }
                              //                     return null;
                              //                   },
                              //                 ),
                              //               ),
                              //               SizedBox(
                              //                 width: width * 0.02,
                              //               ),
                              //               Expanded(
                              //                 child: TextFormField(
                              //                   textInputAction:
                              //                       TextInputAction.done,
                              //                   controller: cvvController,
                              //                   keyboardType:
                              //                       TextInputType.number,
                              //                   validator: (value) {
                              //                     if (onlinePayment) {
                              //                       if (value!.isEmpty) {
                              //                         return 'CVV field is required*';
                              //                       } else if (!CreditCvvSubmitRegexValidator()
                              //                           .isValid(value)) {
                              //                         return "Invalid";
                              //                       }
                              //                     }
                              //                     return null;
                              //                   },
                              //                   inputFormatters: [
                              //                     MaskedTextInputFormatter(
                              //                       mask: 'xxx',
                              //                       separator: '',
                              //                     ),
                              //                   ],
                              //                   decoration: InputDecoration(
                              //                     border: OutlineInputBorder(
                              //                       borderRadius:
                              //                           BorderRadius.circular(12),
                              //                       borderSide: const BorderSide(
                              //                           color: Color(0xFF707070)),
                              //                     ),
                              //                     focusedBorder:
                              //                         OutlineInputBorder(
                              //                       borderRadius:
                              //                           BorderRadius.circular(12),
                              //                       borderSide: const BorderSide(
                              //                         color: Color(0xFF707070),
                              //                       ),
                              //                     ),
                              //                     prefixIcon: Container(
                              //                       padding: EdgeInsets.symmetric(horizontal: width *0.035,vertical: 15),
                              //                       child: Image(
                              //                         color: const Color(
                              //                             0xff707070),
                              //                         image: const AssetImage("assets/image/cvv.png"),
                              //                         fit: BoxFit.fill,
                              //                         height: width * 0.002,
                              //                         width: width * 0.001,
                              //                       ),
                              //                     ),
                              //                     labelText: 'CVV',
                              //                     labelStyle: const TextStyle(
                              //                         color: Color(0xff707070)),
                              //                     hintText: 'CVV',
                              //                     hintStyle: const TextStyle(
                              //                         color: Color(0xFF707070)),
                              //                     contentPadding:
                              //                         EdgeInsets.symmetric(
                              //                       horizontal: height * 0.01,
                              //                     ),
                              //                   ),
                              //                 ),
                              //               ),
                              //             ],
                              //           ),
                              //         ],
                              //       )
                              SizedBox(
                                height: height * 0.02,
                              ),
                            ],
                          ),

                        ///cash
                        if (cashAvailable && !onlinePayment && !cheque)
                          Column(
                            children: [
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    onlinePayment = false;
                                    cash = !cash;
                                    cheque = false;
                                  });
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12),
                                    border: Border.all(
                                        width: 1,
                                        color: cash
                                            ? const Color(0xff116D6E)
                                            : const Color(0xff707070)),
                                  ),
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: height * 0.02,
                                        vertical: height * 0.018),
                                    child: Row(
                                      children: [
                                        SizedBox(
                                          height: height * 0.035,
                                          child: Image.asset(
                                            color: cash
                                                ? const Color(0xff116D6E)
                                                : const Color(0xff252525),
                                            "assets/image/cash.png",
                                            fit: BoxFit.fill,
                                          ),
                                        ),
                                        const SizedBox(
                                          width: 10,
                                        ),
                                        Text(
                                          "Cash",
                                          style: GoogleFonts.lato(
                                            fontSize: 15,
                                            fontWeight: FontWeight.w600,
                                            color: cash
                                                ? const Color(0xff116D6E)
                                                : const Color(0xff252525),
                                          ),
                                        ),
                                        const Spacer(),
                                        SizedBox(
                                          height: height * 0.04,
                                          child: Image.asset(
                                            color: cash
                                                ? const Color(0xff116D6E)
                                                : const Color(0xff252525),
                                            "assets/image/righticon.png",
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: height * 0.02,
                              ),
                            ],
                          ),

                        ///cheque
                        if (chequeAvailable && !cash && !onlinePayment)
                          Column(
                            children: [
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    onlinePayment = false;
                                    cash = false;
                                    cheque = !cheque;
                                  });
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12),
                                    border: Border.all(
                                        width: 1,
                                        color: cheque
                                            ? const Color(0xff116D6E)
                                            : const Color(0xff707070)),
                                  ),
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: height * 0.02,
                                        vertical: height * 0.018),
                                    child: Row(
                                      children: [
                                        SizedBox(
                                          height: height * 0.035,
                                          child: Image.asset(
                                            color: cheque
                                                ? const Color(0xff116D6E)
                                                : const Color(0xff252525),
                                            "assets/image/cheque.png",
                                            fit: BoxFit.fill,
                                          ),
                                        ),
                                        const SizedBox(
                                          width: 10,
                                        ),
                                        Text(
                                          "Cheque",
                                          style: GoogleFonts.lato(
                                            fontSize: 15,
                                            fontWeight: FontWeight.w600,
                                            color: cheque
                                                ? const Color(0xff116D6E)
                                                : const Color(0xff252525),
                                          ),
                                        ),
                                        const Spacer(),
                                        SizedBox(
                                          height: height * 0.04,
                                          child: Image.asset(
                                            color: cheque
                                                ? const Color(0xff116D6E)
                                                : const Color(0xff252525),
                                            "assets/image/righticon.png",
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: height * 0.02,
                              ),
                              if(cheque) Column(
                                      children: [
                                        TextFormField(
                                          textInputAction: TextInputAction.next,
                                          controller: bankNameController,
                                          keyboardType: TextInputType.name,
                                          validator: (value) {
                                            if (cheque && value!.isEmpty) {
                                              return 'Please Enter Bank Name';
                                            }
                                            return null;
                                          },
                                          decoration: InputDecoration(
                                            border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(12),
                                              borderSide: const BorderSide(
                                                  color: Color(0xFF707070)),
                                            ),
                                            focusedBorder: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(12),
                                              borderSide: const BorderSide(
                                                color: Color(0xFF707070),
                                              ),
                                            ),
                                            prefixIcon: Padding(
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: height * 0.02,
                                                  vertical: height * 0.015),
                                              child: SizedBox(
                                                height: height * 0.003,
                                                child: Image.asset(
                                                  color: const Color(0xff707070),
                                                  "assets/image/bank.png",
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                            ),
                                            labelText: 'Enter bank name',
                                            labelStyle: const TextStyle(
                                                color: Color(0xff707070)),
                                            hintText: 'Enter bank name',
                                            hintStyle: const TextStyle(
                                                fontSize: 12,
                                                fontWeight: FontWeight.w500,
                                                color: Color(0xFF707070)),
                                            contentPadding: EdgeInsets.symmetric(
                                              horizontal: height * 0.02,
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          height: height * 0.02,
                                        ),
                                        TextFormField(
                                          textInputAction: TextInputAction.next,
                                          controller: chequeNumberController,
                                          keyboardType: TextInputType.name,
                                          validator: (value) {
                                            if (cheque && value!.isEmpty) {
                                              return 'Please Enter Cheque Number';
                                            }
                                            return null;
                                          },
                                          decoration: InputDecoration(
                                            border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(12),
                                              borderSide: const BorderSide(
                                                  color: Color(0xFF707070)),
                                            ),
                                            focusedBorder: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(12),
                                              borderSide: const BorderSide(
                                                color: Color(0xFF707070),
                                              ),
                                            ),
                                            prefixIcon: Padding(
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: height * 0.02,
                                                  vertical: height * 0.015),
                                              child: SizedBox(
                                                height: height * 0.003,
                                                child: Image.asset(
                                                  color: const Color(0xff707070),
                                                  "assets/image/cheque.png",
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                            ),
                                            labelText: 'Cheque number',
                                            labelStyle: const TextStyle(
                                                color: Color(0xff707070)),
                                            hintText: 'Cheque number',
                                            hintStyle: const TextStyle(
                                                fontSize: 12,
                                                fontWeight: FontWeight.w500,
                                                color: Color(0xFF707070)),
                                            contentPadding: EdgeInsets.symmetric(
                                              horizontal: height * 0.02,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                            ],
                          ),

                        SizedBox(
                          height: height * 0.02,
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: height * 0.02),
                    child: commonButton(
                        context, 'Pay $amount', 13, FontWeight.w700, Colors.white,
                        () {
                      if (!onlinePayment && !cash && !cheque) {
                        Utils.showErrorToast("Please Select Payment Method");
                      } else {
                        if (formKey.currentState!.validate()) {
                          if (onlinePayment) {
                            showMyDialog();
                          }
                          else {
                            makePayment();
                          }
                        } else {
                          autoValidate = AutovalidateMode.always;
                        }
                      }
                    }),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  String getPaymentMethodName() {
    if (onlinePayment) {
      return "onlinePayment";
    } else if (cash) {
      return "cash";
    } else if (cheque) {
      return "cheque";
    }
    return "";
  }

  makePayment() async {
    Utils.showLoadingDialog(context);
    var paymentMethod = getPaymentMethodName();
    var body = {
      "quoteId": quoteId,
      "paymentMethod": paymentMethod, //accepts only onlinePayment cash cheque
      (isAdvance ? "advanceAmount" : "amount"): amount,
    };
    Response response =
        await quoteService.makePayment(body: body, isAdvance: isAdvance);
    Navigator.pop(context);
    if (response.statusCode == 200) {
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
          builder: (context) {
            return PaymentSuccessfully(
              amount: amount,
              labName: labName,
              quoteId: quoteId,
            );
          },
        ),
        (route) => false,
      );
    } else if (response.statusCode == 401) {
      Utils.logout(context);
    } else {
      Utils.showErrorToast(jsonDecode(response.body)['message']);
    }
  }

  getPaymentUrl() async {
    Utils.showLoadingDialog(context);
    var body = {
      "name": nameController.text.trim(),
      "amount": amount,
      "phone": mobileController.text.trim(),
      "email": emailController.text.trim(),
      "redirecturl": "https://toothfund.udenz.co/donate/payment/response",
    };
    Response response =
    await quoteService.getPaymentUrl(body: body);
    Navigator.pop(context);
    if (response.statusCode == 200) {
      Map map = jsonDecode(response.body);
      if (map['statuscode']==1) {
        Navigator.pop(context);
        String url = await Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return PaymentWebView(
                url: map['data'],
              );
            },
          ),
        );
        String status = url.split("message=").last;
        if(status == "Success") {
          makePayment();
        } else {
          Utils.showErrorToast("Payment Failed!!!");
        }
      }
    }
  }

  void showMyDialog() {
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
              child: Form(
                key: formPaymentKey,
                autovalidateMode: paymentAutoValidate,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    TextFormField(
                      textInputAction: TextInputAction.next,
                      controller: nameController,
                      keyboardType: TextInputType.name,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please Enter Name';
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
                        labelText: 'Name',
                        labelStyle:
                        const TextStyle(color: Color(0xff707070)),
                        hintText: 'Name',
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
                      controller: emailController,
                      keyboardType: TextInputType.emailAddress,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please Enter Email Address';
                        } else if (!RegExp(
                            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                            .hasMatch(value)) {
                          return "Please Enter Valid Email Address";
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
                        labelText: 'Email Address',
                        labelStyle:
                        const TextStyle(color: Color(0xff707070)),
                        hintText: 'Email Address',
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
                      maxLength: 12,
                      controller: mobileController,
                      keyboardType: TextInputType.number,
                      textInputAction: TextInputAction.done,
                        validator: (value) {
                          if (value == null ||
                              value.isEmpty) {
                            return 'Please Enter Mobile Number';
                          } else if(!RegExp(r'(^(?:[+0]9)?[0-9]{8,12}$)').hasMatch(value)) {
                            return 'Please Enter Valid Mobile Number';
                          }
                          return null;
                        },
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius:
                            BorderRadius.circular(12),
                            borderSide: const BorderSide(
                                color: Color(0xFF707070))),
                        labelText: 'Mobile Number',
                        hintText: 'Mobile Number',
                        counterText: "",
                        hintStyle: const TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                            color: Color(0xFF707070)),
                        contentPadding: const EdgeInsets.only(
                            left: 18, top: 16, bottom: 16),
                      ),
                    ),
                    SizedBox(
                      height: height * 0.02,
                    ),
                    TextButton(
                        style: ButtonStyle(
                          backgroundColor:
                          MaterialStateProperty.all(const Color(0xFF116D6E)),
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
                          if (formPaymentKey.currentState!.validate()) {
                            getPaymentUrl();
                          } else {
                            paymentAutoValidate = AutovalidateMode.always;
                          }
                        },
                        child: Text("Pay",
                            style: GoogleFonts.lato(
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                              color: Colors.white,
                            ))),
                  ],
                ),
              ),
            ));
      },
    );
  }
}
