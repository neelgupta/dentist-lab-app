import 'package:dentalapp/custom_widget/button.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

import 'quote_successfully.dart';

class CreatQuote extends StatefulWidget {
  const CreatQuote({Key? key}) : super(key: key);

  @override
  State<CreatQuote> createState() => _CreatQuoteState();
}

class _CreatQuoteState extends State<CreatQuote> {

  TextEditingController title=TextEditingController();
  TextEditingController description=TextEditingController();
  TextEditingController dateInputController = TextEditingController();



  String? place = "expedited";
  bool edit = false;
  bool billing = false;

  String isPriorityRadio="Normal";
  String isChooseRadio="LabList";
  bool method = false;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height -
        MediaQuery.of(context).padding.top -
        MediaQuery.of(context).padding.bottom;
    double width = MediaQuery.of(context).size.width -
        MediaQuery.of(context).padding.right -
        MediaQuery.of(context).padding.left;
    return  Scaffold(

      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: SingleChildScrollView(
          child: Column(
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
                            InkWell(
                                onTap: () {

                                },
                                child: const Icon(Icons.keyboard_backspace,color: Colors.white,)),
                            const Spacer(),
                            Center(child: Text(textAlign: TextAlign.center,"Quote",style: GoogleFonts.lato(fontSize: 28,fontWeight: FontWeight.w600,color: Colors.white,),)),
                            const Spacer(),
                            Container()
                          ],
                        ),
                      ),
                    ],
                  )
              ),
              SizedBox(height: height*0.03,),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: width*0.05),
                child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Crerate Quote",style: GoogleFonts.lato(fontSize: 19,fontWeight: FontWeight.w600),),
                    const Padding(
                      padding: EdgeInsets.only(top: 10),
                      child: Divider(thickness: 1,color: Color(0xffE7E7E7),),
                    ),
                    SizedBox(height: height*0.03,),
                    TextFormField(
                      textInputAction: TextInputAction.next,
                      controller: title,
                      keyboardType: TextInputType.name,
                      validator: (value) {
                        if(value == null || value.isEmpty){
                          return 'Please Enter Title';
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

                        labelText: 'Title',labelStyle: const TextStyle(color: Color(0xff707070)),
                        hintText: 'Title',
                        hintStyle: const TextStyle(fontSize: 15,fontWeight: FontWeight.w500,color: Color(0xFF707070)),
                        contentPadding:  EdgeInsets.symmetric(horizontal: height*0.01),
                      ),
                    ),
                     SizedBox(height: height*0.03,),
                    TextFormField(maxLines: 4,
                      textInputAction: TextInputAction.next,
                      controller: description,
                      keyboardType: TextInputType.name,
                      validator: (value) {
                        if(value == null || value.isEmpty){
                          return 'Please Enter Title';
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

                        labelText: 'Description',labelStyle: const TextStyle(color: Color(0xff707070)),
                        hintText: 'Description',
                        hintStyle: const TextStyle(fontSize: 15,fontWeight: FontWeight.w500,color: Color(0xFF707070)),
                        contentPadding:  EdgeInsets.symmetric(horizontal: height*0.01),
                      ),
                    ),

                    Row(
                      children: [
                        SizedBox(width: width*0.02,),
                        Text(textAlign: TextAlign.center,"Priority :",style: GoogleFonts.lato(fontSize: 15,fontWeight: FontWeight.w500,color: const Color(0xff707070),),),

                        Row(
                          children: [
                            Radio(
                              value: "Normal",
                              activeColor: const Color(0xFF116D6E),
                              groupValue: isPriorityRadio,
                              onChanged: (value) {
                                setState(() {
                                  isPriorityRadio = value!;
                                });
                              },
                            ),
                            Text("Normal",style: GoogleFonts.lato(fontSize: 15,fontWeight: FontWeight.w500,color: const Color(0xFF252525))),
                          ],
                        ),
                        Row(
                          children: [
                            Radio(
                              value: "Urgent",
                              activeColor: const Color(0xFF116D6E),
                              groupValue: isPriorityRadio,
                              onChanged: (value) {
                                setState(() {
                                  isPriorityRadio = value!;
                                });
                              },
                            ),
                            Text("Urgent",style: GoogleFonts.lato(fontSize: 15,fontWeight: FontWeight.w500,color: const Color(0xFF252525))),
                          ],
                        ),
                      ],
                    ),

                    isPriorityRadio=='Urgent'?  Padding(
                      padding:  EdgeInsets.symmetric(vertical: height*0.01),
                      child: TextFormField(
                        textInputAction: TextInputAction.next,
                        controller:dateInputController,
                        readOnly: true,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                                borderSide: const BorderSide(color: Color(0xFF707070))
                            ),
                            labelText: 'Date of establishment',
                            // hintText: '02/10/2023',
                            counterText: "",
                            hintStyle: const TextStyle(fontSize: 13,fontWeight: FontWeight.w500,color: Color(0xFF707070)),
                            contentPadding:   EdgeInsets.symmetric(vertical: height*0.02,horizontal: width*0.02),
                            suffixIcon: InkWell(
                                onTap: () async {
                                  DateTime? pickedDate = await showDatePicker(
                                      context: context,
                                      initialDate: DateTime.now(),
                                      firstDate: DateTime(1950),
                                      lastDate: DateTime(2050));

                                  if (pickedDate != null) {
                                    dateInputController.text =
                                        DateFormat('dd MMMM yyyy').format(pickedDate);
                                  };
                                },
                                child: const Image(image: AssetImage("assets/image/date.png")))
                        ),
                        validator: (value) {
                          if(value == null || value.isEmpty){
                            return 'Please Select Date';
                          }
                          return null;
                        },
                      ),
                    ):const SizedBox(),

                    Row(
                      children: [
                        SizedBox(width: width*0.02,),
                        Text(textAlign: TextAlign.center,"Choose for :",style: GoogleFonts.lato(fontSize: 15,fontWeight: FontWeight.w500,color: const Color(0xff707070),),),

                        Row(
                          children: [
                            Radio(
                              value: "LabList",
                              activeColor: const Color(0xFF116D6E),
                              groupValue: isChooseRadio,
                              onChanged: (value) {
                                setState(() {
                                  isChooseRadio = value!;
                                });
                              },
                            ),
                            Text("Lab List",style: GoogleFonts.lato(fontSize: 15,fontWeight: FontWeight.w500,color: const Color(0xFF252525))),
                          ],
                        ),
                        Row(
                          children: [
                            Radio(
                              value: "Public",
                              activeColor: const Color(0xFF116D6E),
                              groupValue: isChooseRadio,
                              onChanged: (value) {
                                setState(() {
                                  isChooseRadio = value!;
                                });
                              },
                            ),
                            Text("Public",style: GoogleFonts.lato(fontSize: 15,fontWeight: FontWeight.w500,color: const Color(0xFF252525))),
                          ],
                        ),
                      ],
                     ),

                    isChooseRadio=='LabList'?  Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [

                        // InkWell(
                        //   onTap: () {
                        //     setState(() {
                        //       method = !method;
                        //     });
                        //   },
                        //   child: Container(
                        //     alignment: Alignment.centerRight,
                        //     width: width,
                        //     height: height*0.07,
                        //     decoration: BoxDecoration(
                        //       borderRadius: BorderRadius.circular(10),
                        //       border: Border.all(color: Colors.black),
                        //     ),
                        //     child: Row(
                        //       children: [
                        //         Padding(
                        //           padding: const EdgeInsets.only(left: 8),
                        //           child: Text("${s_method}",
                        //               style: const TextStyle(
                        //                   fontSize: 14,
                        //                   color: Colors.black,
                        //                   fontFamily: "spartan")),
                        //         ),
                        //         const Spacer(),
                        //         const Padding(
                        //           padding: EdgeInsets.only(right: 8),
                        //           child: Icon(Icons.keyboard_arrow_down_rounded,size: 30),
                        //         ),
                        //       ],
                        //     ),
                        //   ),
                        // ),
                        // SizedBox(height: height*0.01,),
                        // method == true ? Container(
                        //   width: width,
                        //  // height: height*0.28,
                        //   decoration: BoxDecoration(
                        //     borderRadius: BorderRadius.circular(10),
                        //     border: Border.all(color: Colors.black),
                        //   ),
                        //   child: Padding(
                        //     padding: const EdgeInsets.only(right: 15),
                        //     child: Column(
                        //       children: [
                        //         SizedBox(height: height*0.01,),
                        //         Row(
                        //           children: [
                        //             Radio(
                        //               activeColor: const Color(0xFFDD6A03),
                        //               value: "expedited", groupValue: place, onChanged: (value) {
                        //               setState(() {
                        //                 place = value.toString();
                        //                 s_method = "Lab 1";
                        //                 method = false;
                        //               });
                        //             },),
                        //             Text("Lab 1",style: GoogleFonts.lato(fontSize: 15,fontWeight: FontWeight.w500,color: const Color(0xFF252525))),
                        //
                        //
                        //           ],
                        //         ),
                        //         Row(
                        //           children: [
                        //             Radio(
                        //               activeColor: const Color(0xFFDD6A03),
                        //               value: "regular", groupValue: place, onChanged: (value) {
                        //               setState(() {
                        //                 place = value.toString();
                        //                 s_method = "Lab 2";
                        //                 method = false;
                        //               });
                        //             },),
                        //             Text("Lab 2",style: GoogleFonts.lato(fontSize: 15,fontWeight: FontWeight.w500,color: const Color(0xFF252525))),
                        //
                        //           ],
                        //         ),
                        //         Row(
                        //           children: [
                        //             Radio(
                        //               activeColor: const Color(0xFFDD6A03),
                        //               value: "xpress", groupValue: place, onChanged: (value) {
                        //               setState(() {
                        //                 place = value.toString();
                        //                 s_method = "Lab 3";
                        //                 method = false;
                        //               });
                        //             },),
                        //             Text("Lab 3",style: GoogleFonts.lato(fontSize: 15,fontWeight: FontWeight.w500,color: const Color(0xFF252525))),
                        //
                        //           ],
                        //         ),
                        //
                        //       ],
                        //     ),
                        //   ),
                        // ):const SizedBox(),




                      ]
                    ):SizedBox(),

                    SizedBox(height: height*0.08,),
                    commonButton(context, 'Create', 12,FontWeight.bold, Colors.white, () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) {
                        return const QuoteSuccessfully();
                      },));
                    })
                  ],
                ),
              ),


            ],
          ),
        ),
      ),
    );
  }
}
