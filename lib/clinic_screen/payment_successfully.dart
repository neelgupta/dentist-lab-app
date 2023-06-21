import 'package:dentalapp/clinic_screen/bottom_navigation_bar.dart';
import 'package:dentalapp/clinic_screen/payment_status.dart';
import 'package:dentalapp/custom_widget/button.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PaymentSuccessfully extends StatefulWidget {
  final String quoteId;
  final String amount;
  final String labName;
  const PaymentSuccessfully(
      {Key? key,
      required this.quoteId,
      required this.amount,
      required this.labName})
      : super(key: key);

  @override
  State<PaymentSuccessfully> createState() => _PaymentSuccessfullyState();
}

class _PaymentSuccessfullyState extends State<PaymentSuccessfully> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height -
        MediaQuery.of(context).padding.top -
        MediaQuery.of(context).padding.bottom;
    double width = MediaQuery.of(context).size.width -
        MediaQuery.of(context).padding.right -
        MediaQuery.of(context).padding.left;
    return Scaffold(
      body: WillPopScope(
        onWillPop: goBack,
        child: SizedBox(
          height: height,
          width: width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
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
                        padding: EdgeInsets.symmetric(horizontal: width * 0.03),
                        child: Center(
                            child: Text(
                          textAlign: TextAlign.center,
                          "Payment",
                          style: GoogleFonts.lato(
                            fontSize: 26,
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                          ),
                        )),
                      ),
                    ],
                  )),
              const Spacer(),
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: width * 0.057, vertical: height * 0.027),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image(
                        image: const AssetImage("assets/image/Group 12680.png"),
                        height: height * 0.2),
                    SizedBox(height: height * 0.05),
                    Text(
                      "${widget.amount} Paid to ${widget.labName} successfully",
                      textAlign: TextAlign.center,
                      style: GoogleFonts.lato(
                          fontSize: 16, fontWeight: FontWeight.w600),
                    ),
                    SizedBox(
                      height: height * 0.01,
                    ),
                    // Text("Wait for approval",textAlign: TextAlign.center,style: GoogleFonts.lato(color: const Color(0xff707070),fontSize: 14,fontWeight: FontWeight.w400 ),),
                  ],
                ),
              ),
              const Spacer(),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: width * 0.03),
                child: commonButton(context, 'Payment Status', 13,
                    FontWeight.w700, Colors.white, () {
                  Navigator.pushReplacement(context, MaterialPageRoute(
                    builder: (context) {
                      return PaymentStatus(quoteId: widget.quoteId);
                    },
                  ));
                }),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<bool> goBack() async {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const BottomNavigation(index: 0)),
    );
    return true;
  }
}
