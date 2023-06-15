import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PaymentReceivedScreen extends StatefulWidget {
  const PaymentReceivedScreen({Key? key}) : super(key: key);

  @override
  State<PaymentReceivedScreen> createState() => _PaymentReceivedScreenState();
}

class _PaymentReceivedScreenState extends State<PaymentReceivedScreen> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        body: SizedBox(
          height: height,
          width: width,
          child: Column(
            children: [
              Container(
                  height: height*0.15,
                  decoration: BoxDecoration(
                      color: Color(0xFF116D6E),
                      image: DecorationImage(image: AssetImage("assets/image/Group 12305.png"),
                          fit: BoxFit.fitWidth,alignment: Alignment.bottomCenter,opacity: 0.3)
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: width*0.020),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          child: InkWell(
                              onTap: () {
                                Navigator.pop(context);
                              },
                              child: Icon(Icons.keyboard_backspace,color: Colors.white,)),
                        ),
                        Spacer(),
                        Text("Payment",style: GoogleFonts.lato(fontSize: 30,fontWeight: FontWeight.w600,color: Colors.white,)),
                        Spacer(),
                        SizedBox(height: height*0.050,width: width*0.050),
                      ],
                    ),
                  )
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: width*0.035,vertical: height*0.027),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children:  [
                    SizedBox(height: height*0.11,),
                    Image(image: AssetImage("assets/image/Group 12680.png")),
                    SizedBox(height: height*0.030,),
                    Text("500 AED\nPayment received successfully",style: GoogleFonts.lato(fontSize: 19,fontWeight: FontWeight.w600 ),textAlign: TextAlign.center),
                    SizedBox(height: height*0.010,),
                    Text("Confirm Your Payment", style: GoogleFonts.lato(fontSize: 15,fontWeight: FontWeight.w500,
                            color: Color(0xFF707070) ),maxLines: 4,textAlign: TextAlign.center),
                  ],
                ),
              ),
              Spacer(),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: width*0.057,vertical: height*0.020),
                child: Container(
                  height: height*0.064,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: Color(0xFF116D6E)
                  ),
                  child: TextButton(
                      onPressed: () {
                        // Navigator.push(context, MaterialPageRoute(builder: (context) => AcceptedQuoteScreen(),));
                      },
                      child: Text("Payment Confirmation",style: GoogleFonts.lato(fontSize: 15,fontWeight: FontWeight.w500,color: Colors.white))),
                ),
              ),
              SizedBox(height: height*0.022,),
            ],
          ),
        ),
      ),
    );
  }
}
