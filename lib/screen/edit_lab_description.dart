// ignore_for_file: use_build_context_synchronously

import 'package:dentalapp/models/lab_profile.dart';
import 'package:dentalapp/screen/manage_profile_6.dart';
import 'package:dentalapp/util/api_services.dart';
import 'package:dentalapp/util/utils.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class EditLabDescription extends StatefulWidget {
  final LabDatum labData;
  const EditLabDescription({super.key, required this.labData});

  @override
  State<EditLabDescription> createState() => _EditLabDescriptionState();
}

class _EditLabDescriptionState extends State<EditLabDescription> {
  TextEditingController descriptionController = TextEditingController();
  PaymentMethod selectedPaymentOption = PaymentMethod.none;

  final formKey = GlobalKey<FormState>();
  var autoValidate = AutovalidateMode.disabled;

  @override
  void initState() {
    super.initState();
    descriptionController.text = widget.labData.description ?? "";
    getPaymentMethodName();
  }

  getPaymentMethodName() {
    if (widget.labData.paymentMethod == "cash") {
      selectedPaymentOption = PaymentMethod.cash;
    } else if (widget.labData.paymentMethod == "cheque") {
      selectedPaymentOption = PaymentMethod.cheque;
    } else if (widget.labData.paymentMethod == "onlinePayment") {
      selectedPaymentOption = PaymentMethod.onlinePayment;
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Form(
      key: formKey,
      autovalidateMode: autoValidate,
      child: SafeArea(
          child: Scaffold(
              resizeToAvoidBottomInset: false,
              body: SizedBox(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Container(
                          height: height * 0.24,
                          decoration: const BoxDecoration(
                              color: Color(0xFF116D6E),
                              image: DecorationImage(
                                  image: AssetImage(
                                      "assets/image/Group 12305.png"),
                                  fit: BoxFit.fitWidth,
                                  alignment: Alignment.bottomCenter,
                                  opacity: 0.3)),
                          child: Align(
                              alignment: Alignment.center,
                              child: Column(
                                children: [
                                  Container(
                                    padding: EdgeInsets.only(
                                        left: width * 0.05, top: height * 0.03),
                                    alignment: Alignment.centerLeft,
                                    child: InkWell(
                                        onTap: () {
                                          Navigator.pop(context);
                                        },
                                        child: const Icon(
                                          Icons.keyboard_backspace,
                                          color: Colors.white,
                                        )),
                                  ),
                                  SizedBox(
                                    height: height * 0.03,
                                  ),
                                  Text(
                                    "Edit Description &\n Payment Method",
                                    style: GoogleFonts.lato(
                                      fontSize: 30,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              ))),
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
                            Text(
                              "About Lab",
                              style: GoogleFonts.lato(
                                  fontSize: 18, fontWeight: FontWeight.w600),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            TextFormField(
                              textAlign: TextAlign.start,
                              controller: descriptionController,
                              keyboardType: TextInputType.multiline,
                              minLines:
                                  2, //Normal textInputField will be displayed
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
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(12),
                                    borderSide: const BorderSide(
                                        color: Color(0xFF707070))),
                                labelText: 'Description',
                                labelStyle: const TextStyle(
                                  fontSize: 14,
                                ),
                                hintText: 'Description',
                                hintStyle: const TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500,
                                  color: Color(0xFF707070),
                                ),
                                contentPadding: const EdgeInsets.only(
                                    left: 18, top: 16, bottom: 16),
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            const Divider(
                                color: Color(0xFFE7E7E7), thickness: 2),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(
                              "Payment Methods",
                              style: GoogleFonts.lato(
                                  fontSize: 18, fontWeight: FontWeight.w600),
                            ),
                            const SizedBox(
                              height: 15,
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
                                          color: Color(selectedPaymentOption ==
                                                  PaymentMethod.onlinePayment
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
                                          color: Color(selectedPaymentOption ==
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
                                          color: Color(selectedPaymentOption ==
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
                            Container(
                              height: height * 0.064,
                              width: MediaQuery.of(context).size.width,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12),
                                  color: Color(
                                      descriptionController.text.isNotEmpty
                                          ? 0xFF116D6E
                                          : 0xFFA0A0A0)),
                              child: TextButton(
                                  onPressed: () {
                                    if (formKey.currentState!.validate()) {
                                      if (selectedPaymentOption ==
                                          PaymentMethod.none) {
                                        Utils.showErrorToast(
                                            "Please Select Payment Methods");
                                      } else {
                                        updateDescriptionAndMethods();
                                      }
                                    } else {
                                      autoValidate = AutovalidateMode.always;
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
              ))),
    );
  }

  updateDescriptionAndMethods() async {
    Utils.showLoadingDialog(context);
    var postUri = Uri.parse(ApiServices.editPaymenthod);
    var bodyData = {
      "description": descriptionController.text,
      "paymentMethod": selectedPaymentOption.name.toString()
    };
    var response = await http.put(
      postUri,
      body: jsonEncode(bodyData),
      headers: Utils.apiHeader,
    );
    Utils.logAPIResponse(
        function: "updateDescriptionAndMethods",
        apiName: ApiServices.editPaymenthod,
        response: response,
        body: bodyData);
    Navigator.pop(context);
    if (response.statusCode == 200) {
      Navigator.pop(context);
      Map map = jsonDecode(response.body);
      Utils.showSuccessToast(map['message']);
    } else if (response.statusCode == 401) {
      Utils.logout(context);
    } else {
      Utils.showErrorToast(jsonDecode(response.body)['message']);
    }
  }
}
