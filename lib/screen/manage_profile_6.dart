import 'package:dentalapp/screen/email_verified_done_screen.dart';
import 'package:dentalapp/screen/set_up_done_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ManageProfile6 extends StatefulWidget {
  const ManageProfile6({Key? key}) : super(key: key);

  @override
  State<ManageProfile6> createState() => _ManageProfile6State();
}

class _ManageProfile6State extends State<ManageProfile6> {

  String select = "";
  String payment = "";
  bool iscod = false;
  bool ispd = false;
  bool isop = false;
  bool iscash = false;
  bool ischeque = false;


  void updateConditions() {
    if (isop) {
      iscash = false;
      ischeque = false;
    } else if (iscash) {
      isop = false;
      ischeque = false;
    } else if (ischeque) {
      isop = false;
      iscash = false;
    }
  }


  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child:Scaffold(
          resizeToAvoidBottomInset: false,
          body: SizedBox(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                children: [
                  Container(
                    height: 250,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                        image: DecorationImage(image: AssetImage("assets/image/01.png"),fit: BoxFit.fill)
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          children: [
                            SizedBox(width: 20,),
                            Image(image: AssetImage("assets/image/left.png"),fit: BoxFit.fill),
                          ],
                        ),
                        SizedBox(height: 20,),
                        Align(
                          alignment: Alignment.center,
                          child: Container(
                            alignment: Alignment.center,
                            height: 80,
                            width: 80,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50),
                                border: Border.all(color: Colors.white,width: 1),
                                image: DecorationImage(image: AssetImage("assets/image/Ellipse 108.png"),fit: BoxFit.fill)
                            ),
                            child: Text("N",style: GoogleFonts.lato(fontSize: 24,fontWeight: FontWeight.w600,color: Colors.white),),
                          ),
                        ),

                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 10,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("6/",style: GoogleFonts.lato(fontSize: 17,fontWeight: FontWeight.w600),),
                            Text("6",style: GoogleFonts.lato(fontSize: 17,fontWeight: FontWeight.w600,color: Color(0xFFA0A0A0)),),
                          ],
                        ),
                        SizedBox(height: 10,),
                        Text("Delivery Methods",style: GoogleFonts.lato(fontSize: 18,fontWeight: FontWeight.w600),),
                        SizedBox(height: 10,),
                        Text("Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
                          style: GoogleFonts.lato(fontSize: 15,fontWeight: FontWeight.w500,color: Color(0xFF707070)),),
                        SizedBox(height: 20,),
                        iscod ? Container(
                          height: 60,
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                              border: Border.all(color: Color(0xFF116D6E) ),
                              borderRadius:BorderRadius.circular(12)
                          ),
                          child: Row(
                            children: [
                              SizedBox(width: 18,),
                              Image(image: AssetImage("assets/image/cod.png"),color: Color(0xFF116D6E),),
                              SizedBox(width: 12,),
                              Text("COD",style: GoogleFonts.lato(fontSize: 17,fontWeight: FontWeight.w400,color: Color(0xFF116D6E))),
                              Spacer(),
                              Radio(
                                value: 'COD',
                                activeColor: Color(0xFF116D6E),
                                groupValue: select,
                                onChanged: (value) {
                                  setState(() {
                                    select = value!;
                                    ispd = !ispd;
                                  });
                                },
                              ),
                            ],
                          ),
                        ) :
                        Container(
                          height: 60,
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                              border: Border.all(color: Color(0xFF707070) ),
                              borderRadius:BorderRadius.circular(12)
                          ),
                          child: Row(
                            children: [
                              SizedBox(width: 18,),
                              Image(image: AssetImage("assets/image/cod.png")),
                              SizedBox(width: 12,),
                              Text("COD",style: GoogleFonts.lato(fontSize: 17,fontWeight: FontWeight.w400,color: Color(0xFF707070))),
                              Spacer(),
                              Radio(
                                value: 'COD',
                                activeColor: Color(0xFF116D6E),
                                groupValue: select,
                                onChanged: (value) {
                                  setState(() {
                                    select = value!;
                                    iscod = !iscod;
                                    ispd = !ispd;
                                  });
                                },
                              ),
                            ],
                          ),
                        ),

                        SizedBox(height: 20,),
                         ispd ? Container(
                          height: 60,
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                              border: Border.all(color: Color(0xFF116D6E)),
                              borderRadius:BorderRadius.circular(12)
                          ),
                          child: Row(
                            children: [
                              SizedBox(width: 18,),
                              Image(image: AssetImage("assets/image/Dollar Square.png"),color: Color(0xFF116D6E)),
                              SizedBox(width: 12,),
                              Text("Paid Delivery",style: GoogleFonts.lato(fontSize: 17,fontWeight: FontWeight.w400,color: Color(0xFF116D6E))),
                              Spacer(),
                              Radio(
                                value: 'Paid Delivery',
                                activeColor: Color(0xFF116D6E),
                                groupValue: select,
                                onChanged: (value) {
                                  setState(() {
                                    select = value!;
                                    iscod = !iscod;
                                  });
                                },
                              ),
                            ],
                          ),
                        ) :
                         Container(
                           height: 60,
                           width: MediaQuery.of(context).size.width,
                           decoration: BoxDecoration(
                               border: Border.all(color:Color(0xFF707070)),
                               borderRadius:BorderRadius.circular(12)
                           ),
                           child: Row(
                             children: [
                               SizedBox(width: 18,),
                               Image(image: AssetImage("assets/image/Dollar Square.png")),
                               SizedBox(width: 12,),
                               Text("Paid Delivery",style: GoogleFonts.lato(fontSize: 17,fontWeight: FontWeight.w400,color: Color(0xFF707070))),
                               Spacer(),
                               Radio(
                                 value: 'Paid Delivery',
                                 activeColor: Color(0xFF116D6E),
                                 groupValue: select,
                                 onChanged: (value) {
                                   setState(() {
                                     select = value!;
                                     ispd = !ispd;
                                     iscod = !iscod;
                                   });
                                 },
                               ),
                             ],
                           ),
                         ),



                        SizedBox(height: 15,),
                        Divider(color: Color(0xFFE7E7E7),thickness: 2),
                        SizedBox(height: 15,),
                        SizedBox(height: 10,),
                        Text("Payment Methods",style: GoogleFonts.lato(fontSize: 18,fontWeight: FontWeight.w600),),
                        SizedBox(height: 10,),
                        Text("Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
                          style: GoogleFonts.lato(fontSize: 15,fontWeight: FontWeight.w500,color: Color(0xFF707070)),),
                        SizedBox(height: 20,),


                        isop  ? Container(
                          height: 60,
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                              border: Border.all(color: Color(0xFF116D6E)),
                              borderRadius:BorderRadius.circular(12)
                          ),
                          child: Row(
                            children: [
                              SizedBox(width: 18,),
                              Image(image: AssetImage("assets/image/cod.png"),color: Color(0xFF116D6E)),
                              SizedBox(width: 12,),
                              Text("Online Payment",style: GoogleFonts.lato(fontSize: 17,fontWeight: FontWeight.w400,color: Color(0xFF116D6E))),
                              Spacer(),
                              Radio(
                                value: 'Online Payment',
                                activeColor: Color(0xFF116D6E),
                                groupValue: payment,
                                onChanged: (value) {
                                  setState(() {
                                    payment = value!;
                                    updateConditions();
                                  });
                                },
                              ),
                            ],
                          ),
                        ) :
                        Container(
                          height: 60,
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                              border: Border.all(color: Color(0xFF707070)),
                              borderRadius:BorderRadius.circular(12)
                          ),
                          child: Row(
                            children: [
                              SizedBox(width: 18,),
                              Image(image: AssetImage("assets/image/cod.png")),
                              SizedBox(width: 12,),
                              Text("Online Payment",style: GoogleFonts.lato(fontSize: 17,fontWeight: FontWeight.w400,color: Color(0xFF707070))),
                              Spacer(),
                              Radio(
                                value: 'Online Payment',
                                activeColor: Color(0xFF116D6E),
                                groupValue: payment,
                                onChanged: (value) {
                                  setState(() {
                                    payment = value!;
                                    updateConditions();
                                  });
                                },
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 20,),


                        iscash ?
                        Container(
                          height: 60,
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                              border: Border.all(color: Color(0xFF116D6E)),
                              borderRadius:BorderRadius.circular(12)
                          ),
                          child: Row(
                            children: [
                              SizedBox(width: 18,),
                              const Image(image: AssetImage("assets/image/Dollar Square.png"),color: Color(0xFF116D6E)),
                              SizedBox(width: 12,),
                              Text("Cash",style: GoogleFonts.lato(fontSize: 17,fontWeight: FontWeight.w400,color: Color(0xFF116D6E))),
                              Spacer(),
                              Radio(
                                value: 'Cash',
                                activeColor: Color(0xFF116D6E),
                                groupValue: payment,
                                onChanged: (value) {
                                  setState(() {
                                    payment = value!;
                                    updateConditions();
                                  });
                                },
                              ),
                            ],
                          ),
                        ) :
                        Container(
                          height: 60,
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                              border: Border.all(color: Color(0xFF707070)),
                              borderRadius:BorderRadius.circular(12)
                          ),
                          child: Row(
                            children: [
                              SizedBox(width: 18,),
                              const Image(image: AssetImage("assets/image/Dollar Square.png")),
                              SizedBox(width: 12,),
                              Text("Cash",style: GoogleFonts.lato(fontSize: 17,fontWeight: FontWeight.w400,color: Color(0xFF707070))),
                              Spacer(),
                              Radio(
                                value: 'Cash',
                                activeColor: Color(0xFF116D6E),
                                groupValue: payment,
                                onChanged: (value) {
                                  setState(() {
                                    payment = value!;
                                    updateConditions();
                                  });
                                },
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 20,),

                        ischeque ?
                        Container(
                          height: 60,
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                              border: Border.all(color: Color(0xFF116D6E)),
                              borderRadius:BorderRadius.circular(12)
                          ),
                          child: Row(
                            children: [
                              SizedBox(width: 18,),
                              const Image(image: AssetImage("assets/image/Ticket 2.png"),color: Color(0xFF116D6E)),
                              SizedBox(width: 12,),
                              Text("Cheque",style: GoogleFonts.lato(fontSize: 17,fontWeight: FontWeight.w400,color: Color(0xFF116D6E))),
                              Spacer(),
                              Radio(
                                value: 'Cheque',
                                activeColor: Color(0xFF116D6E),
                                groupValue: payment,
                                onChanged: (value) {
                                  setState(() {
                                    payment = value!;
                                    updateConditions();
                                  });
                                },
                              ),
                            ],
                          ),
                        ) :
                        Container(
                          height: 60,
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                              border: Border.all(color: Color(0xFF707070)),
                              borderRadius:BorderRadius.circular(12)
                          ),
                          child: Row(
                            children: [
                              SizedBox(width: 18,),
                              const Image(image: AssetImage("assets/image/Ticket 2.png")),
                              SizedBox(width: 12,),
                              Text("Cheque",style: GoogleFonts.lato(fontSize: 17,fontWeight: FontWeight.w400,color: Color(0xFF707070))),
                              Spacer(),
                              Radio(
                                value: 'Cheque',
                                activeColor: Color(0xFF116D6E),
                                groupValue: payment,
                                onChanged: (value) {
                                  setState(() {
                                    payment = value!;
                                    updateConditions();
                                  });
                                },
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 20,),
                        Container(
                          height: 50,
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              color: Color(0xFFA0A0A0)
                          ),
                          child: TextButton(
                              onPressed: () {
                                 Navigator.push(context, MaterialPageRoute(builder: (context) => SetUpDoneScreen(),));
                              },
                              child: Text("Continue",style: GoogleFonts.lato(fontSize: 15,fontWeight: FontWeight.w500,color: Colors.white))),
                        ),
                        SizedBox(height: 20,),
                      ],),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
