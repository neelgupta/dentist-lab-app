import 'package:dentalapp/clinic_screen/payment_successfully.dart';
import 'package:dentalapp/custom_widget/button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class MakePayment extends StatefulWidget {
  const MakePayment({Key? key}) : super(key: key);

  @override
  State<MakePayment> createState() => _MakePaymentState();
}

class _MakePaymentState extends State<MakePayment> {
  TextEditingController cardNumberController=TextEditingController();
  TextEditingController calenderController=TextEditingController();
  TextEditingController cvvController=TextEditingController();
  TextEditingController bankNameController=TextEditingController();
  TextEditingController chequeNumberController=TextEditingController();

  bool onlinemakePayment = true;
  bool cash = false;
  bool cheque= false;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height -
        MediaQuery.of(context).padding.top -
        MediaQuery.of(context).padding.bottom;
    double width = MediaQuery.of(context).size.width -
        MediaQuery.of(context).padding.right -
        MediaQuery.of(context).padding.left;
    return Scaffold(
      body: SizedBox(
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
                        padding: EdgeInsets.symmetric(horizontal: width * 0.03),
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
                            Container()
                          ],
                        ),
                      ),
                    ],
                  )),
              SizedBox(
                height: height * 0.03,
              ),
              Padding(
                padding:  EdgeInsets.symmetric(horizontal: height * 0.02),
                child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          "Title lorem...",
                          style: GoogleFonts.lato(
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                            color: const Color(0xff252525),
                          ),
                        ),
                        const Spacer(),
                        Container(
                          decoration: BoxDecoration(
                            color: const Color(0xff2F80ED),
                            borderRadius: BorderRadius.circular(2),
                          ),
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: height * 0.02,
                                vertical: height * 0.01),
                            child: Center(
                              child: Text(
                                "Delivery Accepted",
                                style: GoogleFonts.lato(
                                  fontSize: 8,
                                  fontWeight: FontWeight.w400,
                                  color: const Color(0xffffffff),
                                ),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: height * 0.013,
                    ),
                    SizedBox(
                      width: width * 0.75,
                      child: Text(
                        "Lorem Ipsum has been the industry's standard dummy text ever since",
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
                        Spacer(),
                        Text(
                          "AED 500",
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

                    GestureDetector(
                      onTap: (){
                         setState(() {
                           onlinemakePayment = true;
                           cash = false;
                           cheque= false;
                         });
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(width: 1, color: onlinemakePayment?Color(0xff116D6E):Color(0xff707070)),

                        ),
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: height*0.02,vertical: height*0.018),
                          child: Row(
                            children: [

                              Container(
                                height: height*0.035,

                                child: Image.asset(color:onlinemakePayment?Color(0xff116D6E): Color(0xff252525),
                                  "assets/image/payment2.png",
                                  fit: BoxFit.fill,
                                ),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                "Online makePayment",
                                style: GoogleFonts.lato(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w600,
                                  color: onlinemakePayment?Color(0xff116D6E): Color(0xff252525),
                                ),
                              ),
                              Spacer(),
                              Container(
                                height: height*0.04,

                                child: Image.asset(color:onlinemakePayment?Color(0xff116D6E): Color(0xff252525),
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

                    /// online payment
          onlinemakePayment?Column(
                      children: [
                        TextFormField(
                          textInputAction: TextInputAction.next,
                          controller: cardNumberController,
                          keyboardType: TextInputType.number,
                          validator: (value) {
                            if(value == null || value.isEmpty){
                              return 'Please Enter Card Number';
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: const BorderSide(color: Color(0xFF707070)),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: const BorderSide(color: Color(0xFF707070), ),
                            ),
                            prefixIcon:Padding(
                              padding:  EdgeInsets.symmetric(horizontal: height*0.02,vertical: height*0.015),
                              child: Container(
                                height: height*0.005,

                                child: Image.asset(color: Color(0xff707070),
                                  "assets/image/cardnumber.png",fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            labelText: 'Card Number',labelStyle: const TextStyle(color: Color(0xff707070)),
                            hintText: 'Card Number',
                            hintStyle: const TextStyle(fontSize: 10,fontWeight: FontWeight.w500,color: Color(0xFF707070)),
                            contentPadding:  EdgeInsets.symmetric(horizontal: height*0.02,),
                          ),
                        ),
                        SizedBox(
                          height: height * 0.02,
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: TextFormField(
                                onTap: () async {
                                  DateTime? pickedDate = await showDatePicker(
                                      context: context,
                                      initialDate: DateTime.now().subtract(const Duration(days: 1)),
                                      firstDate: DateTime(1950),
                                      lastDate: DateTime.now().subtract(const Duration(days: 1)));

                                  if (pickedDate != null) {
                                    cardNumberController.text =
                                        DateFormat('MMMM yyyy').format(pickedDate);
                                  }
                                },
                                textInputAction: TextInputAction.next,
                                controller:cardNumberController,
                                readOnly: true,
                                decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(12),
                                        borderSide: const BorderSide(color: Color(0xFF707070))
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(12),
                                        borderSide: const BorderSide(color: Color(0xFF707070))
                                    ),
                                    labelText: 'MM/YY',
                                    labelStyle: const TextStyle(fontSize: 12,fontWeight: FontWeight.w500,color: Color(0xFF707070)),
                                     hintText: 'MM/YY',
                                    counterText: "",
                                    hintStyle: const TextStyle(fontSize: 12,fontWeight: FontWeight.w500,color: Color(0xFF707070)),
                                    contentPadding:  EdgeInsets.symmetric(horizontal: height*0.015,),
                                    prefixIcon: const Image(image: AssetImage("assets/image/date.png"))
                                ),
                                validator: (value) {
                                  if(value == null || value.isEmpty){
                                    return 'Please Select Establishment Date';
                                  }
                                  return null;
                                },
                              ),
                            ),

                            SizedBox(width: width*0.02,),
                            Expanded(
                              child: TextFormField(
                                textInputAction: TextInputAction.next,
                                controller: cvvController,
                                keyboardType: TextInputType.number,
                                validator: (value) {
                                  if(value == null || value.isEmpty){
                                    return 'Please Enter CVV';
                                  }
                                  return null;
                                },
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(12),
                                    borderSide: const BorderSide(color: Color(0xFF707070)),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(12),
                                    borderSide: const BorderSide(color: Color(0xFF707070), ),
                                  ),
                                  prefixIcon:Padding(
                                    padding:  EdgeInsets.symmetric(horizontal: height*0.02,vertical: height*0.015),
                                    child: Container(
                                      height: height*0.005,

                                      child: Image.asset(color: Color(0xff707070),
                                        "assets/image/cvv.png",fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                  labelText: 'CVV',labelStyle: const TextStyle(color: Color(0xff707070)),
                                  hintText: 'CVV',
                                  hintStyle: const TextStyle(fontSize: 10,fontWeight: FontWeight.w500,color: Color(0xFF707070)),
                                  contentPadding:  EdgeInsets.symmetric(horizontal: height*0.02,),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ):SizedBox(),

                    GestureDetector(
                      onTap: (){
                        setState(() {
                          onlinemakePayment = false;
                          cash =true;
                          cheque= false;
                        });
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(width: 1, color: cash?Color(0xff116D6E):Color(0xff707070)),

                        ),
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: height*0.02,vertical: height*0.018),
                          child: Row(
                            children: [

                              Container(
                                height: height*0.035,

                                child: Image.asset(color: cash?Color(0xff116D6E):Color(0xff252525),
                                  "assets/image/cash.png",
                                  fit: BoxFit.fill,
                                ),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                "Cash",
                                style: GoogleFonts.lato(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w600,
                                  color: cash?Color(0xff116D6E): Color(0xff252525),
                                ),
                              ),
                              Spacer(),
                              Container(
                                height: height*0.04,

                                child: Image.asset(color: cash?Color(0xff116D6E):Color(0xff252525),
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
                    GestureDetector(
                      onTap: (){

                        setState(() {
                          onlinemakePayment = false;
                          cash = false;
                          cheque= true;
                        });
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(width: 1, color: cheque?Color(0xff116D6E):Color(0xff707070)),

                        ),
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: height*0.02,vertical: height*0.018),
                          child: Row(
                            children: [

                              Container(
                                height: height*0.035,

                                child: Image.asset(color: cheque?Color(0xff116D6E):Color(0xff252525),
                                  "assets/image/cheque.png",
                                  fit: BoxFit.fill,
                                ),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                "Cheque",
                                style: GoogleFonts.lato(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w600,
                                  color:  cheque?Color(0xff116D6E):Color(0xff252525),
                                ),
                              ),
                              Spacer(),
                              Container(
                                height: height*0.04,

                                child: Image.asset(color: cheque?Color(0xff116D6E):Color(0xff252525),
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
                    ///cheque
                    cheque?Column(
                      children: [
                        TextFormField(
                          textInputAction: TextInputAction.next,
                          controller: bankNameController,
                          keyboardType: TextInputType.name,

                          validator: (value) {
                            if(value == null || value.isEmpty){
                              return 'Please Enter bank name';
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: const BorderSide(color: Color(0xFF707070)),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: const BorderSide(color: Color(0xFF707070), ),
                            ),
                            prefixIcon:Padding(
                              padding:  EdgeInsets.symmetric(horizontal: height*0.02,vertical: height*0.015),
                              child: Container(
                                height: height*0.003,

                                child: Image.asset(color: Color(0xff707070),
                                  "assets/image/bank.png",fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            labelText: 'Enter bank name',labelStyle: const TextStyle(color: Color(0xff707070)),
                            hintText: 'Enter bank name',
                            hintStyle: const TextStyle(fontSize: 12,fontWeight: FontWeight.w500,color: Color(0xFF707070)),
                            contentPadding:  EdgeInsets.symmetric(horizontal: height*0.02,),
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
                            if(value == null || value.isEmpty){
                              return 'Please Enter Cheque number';
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: const BorderSide(color: Color(0xFF707070)),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: const BorderSide(color: Color(0xFF707070), ),
                            ),
                            prefixIcon:Padding(
                              padding:  EdgeInsets.symmetric(horizontal: height*0.02,vertical: height*0.015),
                              child: Container(
                                height: height*0.003,

                                child: Image.asset(color: Color(0xff707070),
                                  "assets/image/cheque.png",fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            labelText: 'Cheque number',labelStyle: const TextStyle(color: Color(0xff707070)),
                            hintText: 'Cheque number',
                            hintStyle: const TextStyle(fontSize: 12,fontWeight: FontWeight.w500,color: Color(0xFF707070)),
                            contentPadding:  EdgeInsets.symmetric(horizontal: height*0.02,),
                          ),
                        ),
                      ],
                    ):SizedBox(),
                    SizedBox(height: height*0.02,),

                  ],
                ),
              ),
           //   Spacer(),
              Padding(
                padding:  EdgeInsets.symmetric(horizontal: height * 0.02),
                child: commonButton(context,'Pay 500', 13,FontWeight.w700,Colors.white, () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) {
                      return  PaymentSuccessfully();
                    },));
                }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
