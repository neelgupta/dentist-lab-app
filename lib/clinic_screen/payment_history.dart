import 'dart:convert';

import 'package:dentalapp/models/payment_history_clinic_model.dart';
import 'package:dentalapp/services/clinic_services/clinic_services.dart';
import 'package:dentalapp/util/utils.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart';

class PaymentHistory extends StatefulWidget {
  const PaymentHistory({Key? key}) : super(key: key);

  @override
  State<PaymentHistory> createState() => _PaymentHistoryState();
}

class _PaymentHistoryState extends State<PaymentHistory> {
  bool isLoading = true;
  ClinicService clinicService = ClinicService();
  Payment? payment;
  List<PaymentData> history = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getHistory();
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
        body: isLoading?Center(child: loader(),):Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
                height: height*0.15,
                decoration: const BoxDecoration(
                    color: Color(0xFF116D6E),
                    image: DecorationImage(image: AssetImage("assets/image/Group 12305.png"),
                        fit: BoxFit.fitWidth,alignment: Alignment.bottomCenter,opacity: 0.3)
                ),
                child: Column(mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(height: height*0.02,),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: width * 0.03),
                      child: Row(crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          GestureDetector(
                              onTap: () {
                                Navigator.pop(context);
                              },
                              child: const Icon(Icons.keyboard_backspace,color: Colors.white,)),
                          const Spacer(),
                          Center(child: Text(textAlign: TextAlign.center,"Payments",style: GoogleFonts.lato(fontSize: 26,fontWeight: FontWeight.w600,color: Colors.white,),)),
                          const Spacer(),
                          const Icon(Icons.keyboard_backspace,color: Colors.transparent,)
                        ],
                      ),
                    ),
                  ],
                )
            ),
            SizedBox(
              height: height * 0.02,
            ),
            Expanded(
              child: history.isEmpty?const Center(child: Text("No Payment History Found !!!",style: TextStyle(fontSize: 16,fontWeight: FontWeight.w600))):ListView.separated(
                physics: const BouncingScrollPhysics(),
                //shrinkWrap: true,
                itemCount: history.length,
                separatorBuilder: (context, index) {
                  return  Padding(
                    padding:  EdgeInsets.symmetric(horizontal: width*0.07,vertical: 2),
                    child: const Divider(
                      thickness: 1,
                      color: Color(0xffE7E7E7),
                    ),
                  );
                },
                itemBuilder: (context, index) {
                  return GestureDetector(
                    child: Padding(
                      padding:  EdgeInsets.symmetric(horizontal: width*0.07),
                      child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: height * 0.005,
                          ),
                          Row(
                            children: [
                              Text(
                                "Lab Name",
                                style: GoogleFonts.lato(
                                  fontSize: 13,
                                  fontWeight: FontWeight.w500,
                                  color: const Color(0xff252525),
                                ),
                              ),
                              const Spacer(),
                              Text(
                                history[index].labDetails!.first.labName ?? "",
                                style: GoogleFonts.lato(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                  color: const Color(0xff252525),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: height * 0.015,
                          ),
                          Row(
                            children: [
                              Text(
                                "Subtotal",
                                style: GoogleFonts.lato(
                                  fontSize: 13,
                                  fontWeight: FontWeight.w400,
                                  color: const Color(0xff707070),
                                ),
                              ),
                              const Spacer(),
                              Text(
                                "AED ${history[index].totalAmount}",
                                style: GoogleFonts.lato(
                                  fontSize: 13,
                                  fontWeight: FontWeight.w400,
                                  color: const Color(0xff252525),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: height * 0.015,
                          ),
                          Row(
                            children: [
                              Text(
                                "Payment Mode",
                                style: GoogleFonts.lato(
                                  fontSize: 13,
                                  fontWeight: FontWeight.w400,
                                  color: const Color(0xff707070),
                                ),
                              ),
                              const Spacer(),
                              Text(
                                getPaymentMethodName(history[index].paymentMethod ?? ""),
                                style: GoogleFonts.lato(
                                  fontSize: 13,
                                  fontWeight: FontWeight.w400,
                                  color: const Color(0xff252525),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            SizedBox(
              height: height * 0.01,
            ),
          ],
        ),
      ),
    );
  }

  getHistory() async{
    Response response = await clinicService.getPaymentHistory();

    if(response.statusCode == 200) {
      payment = Payment.fromJson(jsonDecode(response.body));
      history.addAll(payment!.paymentData ?? []);
    }

    isLoading = false;
    setState(() {});
  }

  String getPaymentMethodName(status) {
    if(status == 'cheque') {
      return "Cheque";
    } else if(status == 'cash') {
      return "Cash";
    } else if (status == "onlinePayment"){
      return "Online Payment";
    }
    return "";
  }
}
