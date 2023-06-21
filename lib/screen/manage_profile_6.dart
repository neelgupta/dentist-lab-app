// ignore_for_file: constant_identifier_names, use_build_context_synchronously

import 'package:dentalapp/clinic_screen/setup_screen/sucessfulsetup_screen.dart';
import 'package:dentalapp/util/api_services.dart';
import 'package:dentalapp/util/utils.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

enum PaymentMethod { onlinePayment, cash, cheque, none }

enum DeliveryMethods { COD, paidDelivery, none }

class ManageProfile6 extends StatefulWidget {
  const ManageProfile6({Key? key}) : super(key: key);

  @override
  State<ManageProfile6> createState() => _ManageProfile6State();
}

class _ManageProfile6State extends State<ManageProfile6> {
  PaymentMethod selectedPaymentOption = PaymentMethod.none;
  DeliveryMethods selectedDeliveryOption = DeliveryMethods.none;

  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return SafeArea(
        child: Scaffold(
            resizeToAvoidBottomInset: false,
            body: !isLoading
                ? SizedBox(
                    height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width,
                    child: SingleChildScrollView(
                      scrollDirection: Axis.vertical,
                      child: Column(
                        children: [
                          Container(
                            height: height * 0.25,
                            width: MediaQuery.of(context).size.width,
                            decoration: const BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage("assets/image/01.png"),
                                    fit: BoxFit.fill)),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Row(
                                  children: [
                                    const SizedBox(
                                      width: 20,
                                    ),
                                    InkWell(
                                        onTap: () {
                                          Navigator.pop(context);
                                        },
                                        child: const Image(
                                            image: AssetImage(
                                                "assets/image/left.png"),
                                            fit: BoxFit.fill)),
                                  ],
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                Align(
                                  alignment: Alignment.center,
                                  child: Container(
                                    alignment: Alignment.center,
                                    height: 70,
                                    width: 70,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(50),
                                        border: Border.all(
                                            color: Colors.white, width: 1),
                                        image: const DecorationImage(
                                            image: AssetImage(
                                                "assets/image/Ellipse 108.png"),
                                            fit: BoxFit.fill)),
                                    child: Text(
                                      "N",
                                      style: GoogleFonts.lato(
                                          fontSize: 24,
                                          fontWeight: FontWeight.w600,
                                          color: Colors.white),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: width * 0.057,
                                vertical: height * 0.027),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "6/",
                                      style: GoogleFonts.lato(
                                          fontSize: 17,
                                          fontWeight: FontWeight.w600),
                                    ),
                                    Text(
                                      "6",
                                      style: GoogleFonts.lato(
                                          fontSize: 17,
                                          fontWeight: FontWeight.w600,
                                          color: const Color(0xFFA0A0A0)),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  "Delivery Methods",
                                  style: GoogleFonts.lato(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w600),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
                                  style: GoogleFonts.lato(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500,
                                      color: const Color(0xFF707070)),
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                Container(
                                  height: height * 0.065,
                                  width: MediaQuery.of(context).size.width,
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          color: Color(selectedDeliveryOption ==
                                                  DeliveryMethods.COD
                                              ? 0xFF116D6E
                                              : 0xFF707070)),
                                      borderRadius: BorderRadius.circular(12)),
                                  child: Row(
                                    children: [
                                      const SizedBox(
                                        width: 18,
                                      ),
                                      Image(
                                          image: const AssetImage(
                                              "assets/image/cod.png"),
                                          color: Color(selectedDeliveryOption ==
                                                  DeliveryMethods.COD
                                              ? 0xFF116D6E
                                              : 0xFF707070)),
                                      const SizedBox(
                                        width: 12,
                                      ),
                                      Text("COD",
                                          style: GoogleFonts.lato(
                                              fontSize: 17,
                                              fontWeight: FontWeight.w400,
                                              color: Color(
                                                  selectedDeliveryOption ==
                                                          DeliveryMethods.COD
                                                      ? 0xFF116D6E
                                                      : 0xFF707070))),
                                      const Spacer(),
                                      Radio(
                                        value: DeliveryMethods.COD,
                                        activeColor: const Color(0xFF116D6E),
                                        groupValue: selectedDeliveryOption,
                                        onChanged: (value) {
                                          setState(() {
                                            selectedDeliveryOption = value!;
                                          });
                                        },
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                Container(
                                  height: height * 0.065,
                                  width: MediaQuery.of(context).size.width,
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          color: Color(selectedDeliveryOption ==
                                                  DeliveryMethods.paidDelivery
                                              ? 0xFF116D6E
                                              : 0xFF707070)),
                                      borderRadius: BorderRadius.circular(12)),
                                  child: Row(
                                    children: [
                                      const SizedBox(
                                        width: 18,
                                      ),
                                      Image(
                                          image: const AssetImage(
                                              "assets/image/Dollar Square.png"),
                                          color: Color(selectedDeliveryOption ==
                                                  DeliveryMethods.paidDelivery
                                              ? 0xFF116D6E
                                              : 0xFF707070)),
                                      const SizedBox(
                                        width: 12,
                                      ),
                                      Text("Paid Delivery",
                                          style: GoogleFonts.lato(
                                              fontSize: 17,
                                              fontWeight: FontWeight.w400,
                                              color: Color(
                                                  selectedDeliveryOption ==
                                                          DeliveryMethods
                                                              .paidDelivery
                                                      ? 0xFF116D6E
                                                      : 0xFF707070))),
                                      const Spacer(),
                                      Radio(
                                        value: DeliveryMethods.paidDelivery,
                                        activeColor: const Color(0xFF116D6E),
                                        groupValue: selectedDeliveryOption,
                                        onChanged: (value) {
                                          setState(() {
                                            selectedDeliveryOption = value!;
                                          });
                                        },
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                const Divider(
                                    color: Color(0xFFE7E7E7), thickness: 2),
                                const SizedBox(
                                  height: 25,
                                ),
                                Text(
                                  "Payment Methods",
                                  style: GoogleFonts.lato(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w600),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
                                  style: GoogleFonts.lato(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500,
                                      color: const Color(0xFF707070)),
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                Container(
                                  height: height * 0.065,
                                  width: MediaQuery.of(context).size.width,
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          color: Color(selectedPaymentOption ==
                                                  PaymentMethod.onlinePayment
                                              ? 0xFF116D6E
                                              : 0xFF707070)),
                                      borderRadius: BorderRadius.circular(12)),
                                  child: Row(
                                    children: [
                                      const SizedBox(
                                        width: 18,
                                      ),
                                      Image(
                                          image: const AssetImage(
                                              "assets/image/cod.png"),
                                          color: Color(selectedPaymentOption ==
                                                  PaymentMethod.onlinePayment
                                              ? 0xFF116D6E
                                              : 0xFF707070)),
                                      const SizedBox(
                                        width: 12,
                                      ),
                                      Text("Online Payment",
                                          style: GoogleFonts.lato(
                                              fontSize: 17,
                                              fontWeight: FontWeight.w400,
                                              color: Color(
                                                  selectedPaymentOption ==
                                                          PaymentMethod
                                                              .onlinePayment
                                                      ? 0xFF116D6E
                                                      : 0xFF707070))),
                                      const Spacer(),
                                      Radio(
                                        value: PaymentMethod.onlinePayment,
                                        activeColor: const Color(0xFF116D6E),
                                        groupValue: selectedPaymentOption,
                                        onChanged: (value) {
                                          setState(() {
                                            selectedPaymentOption = value!;
                                          });
                                        },
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                Container(
                                  height: height * 0.065,
                                  width: MediaQuery.of(context).size.width,
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          color: Color(selectedPaymentOption ==
                                                  PaymentMethod.cash
                                              ? 0xFF116D6E
                                              : 0xFF707070)),
                                      borderRadius: BorderRadius.circular(12)),
                                  child: Row(
                                    children: [
                                      const SizedBox(
                                        width: 18,
                                      ),
                                      Image(
                                          image: const AssetImage(
                                              "assets/image/Dollar Square.png"),
                                          color: Color(selectedPaymentOption ==
                                                  PaymentMethod.cash
                                              ? 0xFF116D6E
                                              : 0xFF707070)),
                                      const SizedBox(
                                        width: 12,
                                      ),
                                      Text("Cash",
                                          style: GoogleFonts.lato(
                                              fontSize: 17,
                                              fontWeight: FontWeight.w400,
                                              color: Color(
                                                  selectedPaymentOption ==
                                                          PaymentMethod.cash
                                                      ? 0xFF116D6E
                                                      : 0xFF707070))),
                                      const Spacer(),
                                      Radio(
                                        value: PaymentMethod.cash,
                                        activeColor: const Color(0xFF116D6E),
                                        groupValue: selectedPaymentOption,
                                        onChanged: (value) {
                                          setState(() {
                                            selectedPaymentOption = value!;
                                          });
                                        },
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                Container(
                                  height: height * 0.065,
                                  width: MediaQuery.of(context).size.width,
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          color: Color(selectedPaymentOption ==
                                                  PaymentMethod.cheque
                                              ? 0xFF116D6E
                                              : 0xFF707070)),
                                      borderRadius: BorderRadius.circular(12)),
                                  child: Row(
                                    children: [
                                      const SizedBox(
                                        width: 18,
                                      ),
                                      Image(
                                          image: const AssetImage(
                                              "assets/image/Ticket 2.png"),
                                          color: Color(selectedPaymentOption ==
                                                  PaymentMethod.cheque
                                              ? 0xFF116D6E
                                              : 0xFF707070)),
                                      const SizedBox(
                                        width: 12,
                                      ),
                                      Text("Cheque",
                                          style: GoogleFonts.lato(
                                              fontSize: 17,
                                              fontWeight: FontWeight.w400,
                                              color: Color(
                                                  selectedPaymentOption ==
                                                          PaymentMethod.cheque
                                                      ? 0xFF116D6E
                                                      : 0xFF707070))),
                                      const Spacer(),
                                      Radio(
                                        value: PaymentMethod.cheque,
                                        activeColor: const Color(0xFF116D6E),
                                        groupValue: selectedPaymentOption,
                                        onChanged: (value) {
                                          setState(() {
                                            selectedPaymentOption = value!;
                                          });
                                        },
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: height * 0.035,
                                ),
                                SizedBox(
                                  height: height * 0.066,
                                  width: MediaQuery.of(context).size.width,
                                  child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                          backgroundColor: Color(
                                              selectedDeliveryOption !=
                                                          DeliveryMethods
                                                              .none &&
                                                      selectedPaymentOption !=
                                                          PaymentMethod.none
                                                  ? 0xFF116D6E
                                                  : 0xFFA0A0A0)),
                                      onPressed: () {
                                        if (selectedDeliveryOption ==
                                            DeliveryMethods.none) {
                                          Utils.showErrorToast(
                                              "Please Select Delivery Methods");
                                        } else if (selectedPaymentOption ==
                                            PaymentMethod.none) {
                                          Utils.showErrorToast(
                                              "Please Select Payment Methods");
                                        } else {
                                          manageProfile6();
                                        }
                                      },
                                      child: Text("Continue",
                                          style: GoogleFonts.lato(
                                              fontSize: 15,
                                              fontWeight: FontWeight.w500,
                                              color: Colors.white))),
                                ),
                                SizedBox(
                                  height: height * 0.025,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                : const Center(
                    child: CircularProgressIndicator(),
                  )));
  }

  manageProfile6() async {
    Utils.showLoadingDialog(context);
    var postUri = Uri.parse(ApiServices.manageProfile6Api);
    var bodyData = {
      "deliveryMethod": selectedDeliveryOption.name.toString(),
      "paymentMethod": selectedPaymentOption.name.toString()
    };
    var response = await http.post(
      postUri,
      body: jsonEncode(bodyData),
      headers: Utils.apiHeader,
    );
    Utils.logAPIResponse(
        function: "manageProfile6",
        apiName: ApiServices.manageProfile6Api,
        response: response,
        body: bodyData);
    Navigator.pop(context);
    if (response.statusCode == 200) {
      Map map = jsonDecode(response.body);
      if (map["status"] == 200) {
        Utils.setScreenStatus("7");
        Utils.showSuccessToast(map['message']);
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
            builder: (context) => const SuccessfulProfileSetUp(),
          ),
          (route) => false,
        );
      } else if (response.statusCode == 401) {
        Utils.logout(context);
      } else {
        Utils.showErrorToast(map['message']);
      }
    } else {
      Utils.showErrorToast(jsonDecode(response.body)['message']);
    }
  }
}
