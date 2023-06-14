// ignore_for_file: prefer_const_constructors

import 'package:dentalapp/clinic_screen/make_payment.dart';
import 'package:dentalapp/custom_widget/button.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class QuoteAfterAccept extends StatefulWidget {
  const QuoteAfterAccept({Key? key}) : super(key: key);

  @override
  State<QuoteAfterAccept> createState() => _QuoteAfterAcceptState();
}

class _QuoteAfterAcceptState extends State<QuoteAfterAccept> {
  bool isShareComments=false;
  TextEditingController nameController=TextEditingController();
  TextEditingController commentController=TextEditingController();
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height -
        MediaQuery.of(context).padding.top -
        MediaQuery.of(context).padding.bottom;
    double width = MediaQuery.of(context).size.width -
        MediaQuery.of(context).padding.right -
        MediaQuery.of(context).padding.left;
    return Scaffold(

      body: SingleChildScrollView(
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
                            "Quote Detail",
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
              padding: EdgeInsets.symmetric(horizontal: height * 0.02),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
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
                          color: const Color(0xff219653),
                          borderRadius: BorderRadius.circular(2),
                        ),
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: height * 0.02,
                              vertical: height * 0.01),
                          child: Center(
                            child: Text(
                              "Accepted",
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
                  const Divider(
                    thickness: 1,
                    color: Color(0xffE7E7E7),
                  ),
                  SizedBox(
                    height: height * 0.02,
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
                        "AED 500",
                        style: GoogleFonts.lato(
                          fontSize: 13,
                          fontWeight: FontWeight.w500,
                          color: const Color(0xff252525),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: height * 0.013,
                  ),
                  Row(
                    children: [
                      Text(
                        "Advance 30% (Paid)",
                        style: GoogleFonts.lato(
                          fontSize: 13,
                          fontWeight: FontWeight.w600,
                          color: const Color(0xff707070),
                        ),
                      ),
                      const Spacer(),
                      Text(
                        "AED 75",
                        style: GoogleFonts.lato(
                          fontSize: 13,
                          fontWeight: FontWeight.w500,
                          color: const Color(0xff252525),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: height * 0.013,
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
                        height: height * 0.03,
                        width: width * 0.18,
                        decoration: BoxDecoration(
                          color: const Color(0xff707070),
                          borderRadius: BorderRadius.circular(2),
                        ),
                        child: Center(
                          child: Text(
                            "Normal",
                            style: GoogleFonts.lato(
                              fontSize: 10,
                              fontWeight: FontWeight.w600,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: height * 0.013,
                  ),
                  Row(
                    children: [
                      Text(
                        "Lab Name ",
                        style: GoogleFonts.lato(
                          fontSize: 13,
                          fontWeight: FontWeight.w600,
                          color: const Color(0xff252525),
                        ),
                      ),
                      const Spacer(),
                      Text(
                        "Apt 30",
                        style: GoogleFonts.lato(
                          fontSize: 13,
                          fontWeight: FontWeight.w500,
                          color: const Color(0xff252525),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: height * 0.013,
                  ),
                  Row(
                    children: [
                      const Image(
                        height: 14,
                        width: 12,
                        image: AssetImage(
                          "assets/image/locationgrren.png",
                        ),
                        fit: BoxFit.fill,
                      ),
                      SizedBox(
                        width: width * 0.01,
                      ),
                      Text(
                        "Ottawa, Canada",
                        style: GoogleFonts.lato(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          color: const Color(0xff116D6E),
                        ),
                      ),
                      SizedBox(
                        width: width * 0.03,
                      ),
                      const Image(
                        height: 14,
                        width: 12,
                        image: AssetImage(
                          "assets/image/call.png",
                        ),
                        fit: BoxFit.fill,
                      ),
                      SizedBox(
                        width: width * 0.01,
                      ),
                      Text(
                        "+9675852",
                        style: GoogleFonts.lato(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          color: const Color(0xff116D6E),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: height * 0.013,
                  ),
                  Text(
                    "Toronto. DE 63324",
                    style: GoogleFonts.lato(
                      fontSize: 13,
                      fontWeight: FontWeight.w600,
                      color: const Color(0xff252525),
                    ),
                  ),

                  commonButton(context,'Make Advance Payment', 13,FontWeight.w700,Colors.white, () {

                  }),
                  SizedBox(height: height*0.02,),
                  commonButton(context,'Call Lab', 13,FontWeight.w700,Colors.white, () {

                  }),
                  SizedBox(height: height*0.02,),
                  commonButton(context,'Delivery Accepted', 13,FontWeight.w700,Colors.white, () {

                  }),
                  SizedBox(height: height*0.02,),
                  commonButton(context,'Not As Per Expeactation', 13,FontWeight.w700,Colors.white, () {

                  }),
                  SizedBox(height: height*0.02,),
                  commonButton(context,'Pay 260', 13,FontWeight.w700,Colors.white, () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) {
                            return MakePayment();
                          },));
                  }),
                  SizedBox(height: height*0.02,),
                  commonButton(context,'Share Comment', 13,FontWeight.w700,Colors.white, () {
                    showShareMyDialog();

                  }),
                  SizedBox(height: height*0.02,),
                  InkWell(
                    onTap: (){
                      setState(() {
                        isShareComments = !isShareComments;
                      });
                    },
                    child: SizedBox(
                      width: width,
                      height: height*0.04,
                      child: Row(
                        children: [
                          Text("Comments",
                              style: GoogleFonts.lato(
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                                color: const Color(0xff111111),
                              )),
                          const Spacer(),
                          !isShareComments?Image(
                            height: 7,
                            width: 14,
                            image: AssetImage(
                              "assets/image/upicon.png",),fit: BoxFit.fill,):
                          Image(
                            height: 6,
                            width: 14,
                            image: AssetImage(
                              "assets/image/downicon.png",),fit: BoxFit.fill,),
                            SizedBox(width: width*0.01,),

                        ],
                      ),
                    ),
                  ),
                  !isShareComments
                      ? const SizedBox()
                      : Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: height * 0.01,
                      ),
                      Divider(thickness: 1,color: Color(0xffE7E7E7),),

                      SizedBox(
                        height: height * 0.01,
                      ),

                      Text("Clinic Name",
                          style: GoogleFonts.lato(
                            fontSize: 13,
                            fontWeight: FontWeight.bold,
                            color: const Color(0xff252525),
                          )),
                      SizedBox(
                        height: height * 0.01,
                      ),
                      Text("Lorem Ipsum has been the industry's standard dummy text ever since",
                          style: GoogleFonts.lato(
                            fontSize: 13,
                            fontWeight: FontWeight.w400,
                            color: const Color(0xff111111),
                          )),
                      SizedBox(
                        height: height * 0.01,
                      ),
                      Divider(thickness: 1,color: Color(0xffE7E7E7),),

                      SizedBox(
                        height: height * 0.01,
                      ),

                      Text("Lab Name",
                          style: GoogleFonts.lato(
                            fontSize: 13,
                            fontWeight: FontWeight.bold,
                            color: const Color(0xff252525),
                          )),
                      SizedBox(
                        height: height * 0.01,
                      ),
                      Text("Lorem Ipsum has been the industry's standard dummy text ever since",
                          style: GoogleFonts.lato(
                            fontSize: 13,
                            fontWeight: FontWeight.w400,
                            color: const Color(0xff111111),
                          )),
                      SizedBox(
                        height: height * 0.01,
                      ),


                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void showShareMyDialog() {
    double height = MediaQuery.of(context).size.height -
        MediaQuery.of(context).padding.top -
        MediaQuery.of(context).padding.bottom;
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
            //insetPadding: EdgeInsets.symmetric(horizontal: height*0.03),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(12))),
            title: Container(
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
              ),
              child: StatefulBuilder(
                builder: (context, setState) {
                  return  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [

                      TextFormField(
                        textInputAction: TextInputAction.next,
                        controller: nameController,
                        keyboardType: TextInputType.name,
                        validator: (value) {
                          if(value == null || value.isEmpty){
                            return 'Please Enter Name';
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

                          labelText: 'Name',labelStyle: const TextStyle(color: Color(0xff707070)),
                          hintText: 'Name',
                          hintStyle: const TextStyle(fontSize: 14,fontWeight: FontWeight.w500,color: Color(0xFF707070)),
                          contentPadding:  EdgeInsets.symmetric(vertical: height*0.02,horizontal: height*0.01),
                        ),
                      ),
                      SizedBox(height: height*0.02,),
                      TextFormField(
                        textInputAction: TextInputAction.next,
                        controller: commentController,
                        keyboardType: TextInputType.name,
                        maxLines: 2,
                        validator: (value) {
                          if(value == null || value.isEmpty){
                            return 'Please Enter Comment';
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

                          labelText: 'Comment',labelStyle: const TextStyle(color: Color(0xff707070)),
                          hintText: 'Comment',
                          hintStyle: const TextStyle(fontSize: 14,fontWeight: FontWeight.w500,color: Color(0xFF707070)),
                          contentPadding:  EdgeInsets.symmetric(vertical: height*0.02,horizontal: height*0.01),
                        ),
                      ),
                      SizedBox(height: height*0.02,),
                      TextButton(
                          style: ButtonStyle(
                            backgroundColor:
                            MaterialStateProperty.all(Color(0xFF116D6E)),
                            padding: MaterialStateProperty.all(
                                EdgeInsets.symmetric(horizontal: height*0.035, vertical:height*0.018)),
                            shape: MaterialStateProperty.all(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                          ),
                          onPressed: () {
                          Navigator.pop(context);
                          },
                          child: Text("Share Comment",
                              style: GoogleFonts.lato(
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                                color: Colors.white,
                              ))),
                    ],
                  );
                },

              ),
            ));
      },
    );
  }


}
