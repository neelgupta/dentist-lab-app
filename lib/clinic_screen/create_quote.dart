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



  String s_method = "Lab 1";
  String? place = "expedited";
  bool edit = false;
  bool billing = false;

  String isPriorityRadio="Normal";
  String isChooseRadio="Lab List";
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
                      Row(crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          InkWell(
                              onTap: () {
                                Navigator.pop(context);
                              },
                              child: const Padding(
                                padding: EdgeInsets.only(left: 20),
                                child: Icon(Icons.keyboard_backspace,color: Colors.white,),
                              )),
                          SizedBox(width: width/3.8,),
                          Center(child: Text(textAlign: TextAlign.center,"Quote",style: GoogleFonts.lato(fontSize: 28,fontWeight: FontWeight.w600,color: Colors.white,),)),

                        ],
                      ),
                    ],
                  )
              ),
              SizedBox(height: height*0.03,),
              Padding(
                padding: const EdgeInsets.only(left: 20,right: 20),
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
                            borderSide: BorderSide(color: Color(0xFF707070)),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: const BorderSide(color: Color(0xFF707070), ),
                        ),

                        labelText: 'Title',labelStyle: TextStyle(color: Color(0xff707070)),
                        hintText: 'Title',
                        hintStyle: const TextStyle(fontSize: 15,fontWeight: FontWeight.w500,color: Color(0xFF707070)),
                        contentPadding: const EdgeInsets.only(left: 18,top: 16,bottom: 16),
                      ),
                    ),
                     SizedBox(height: height*0.03,),
                    TextFormField(maxLines: 3,
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
                          borderSide: BorderSide(color: Color(0xFF707070)),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: const BorderSide(color: Color(0xFF707070), ),
                        ),

                        labelText: 'Description',labelStyle: TextStyle(color: Color(0xff707070)),
                        hintText: 'Description',
                        hintStyle: const TextStyle(fontSize: 15,fontWeight: FontWeight.w500,color: Color(0xFF707070)),
                        contentPadding: const EdgeInsets.only(left: 18,top: 16,bottom: 16),
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
                              activeColor: Color(0xFF116D6E),
                              groupValue: isPriorityRadio,
                              onChanged: (value) {
                                setState(() {
                                  isPriorityRadio = value!;
                                });
                              },
                            ),
                            Text("Normal",style: GoogleFonts.lato(fontSize: 15,fontWeight: FontWeight.w500,color: Color(0xFF252525))),
                          ],
                        ),
                        Row(
                          children: [
                            Radio(
                              value: "Urgent",
                              activeColor: Color(0xFF116D6E),
                              groupValue: isPriorityRadio,
                              onChanged: (value) {
                                setState(() {
                                  isPriorityRadio = value!;
                                });
                              },
                            ),
                            Text("Urgent",style: GoogleFonts.lato(fontSize: 15,fontWeight: FontWeight.w500,color: Color(0xFF252525))),
                          ],
                        ),
                      ],
                    ),

                    isPriorityRadio=='Urgent'?  Padding(
                      padding: const EdgeInsets.only(top: 10,bottom: 10),
                      child: TextFormField(
                        textInputAction: TextInputAction.next,
                        controller:dateInputController,
                        readOnly: true,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                                borderSide: BorderSide(color: Color(0xFF707070))
                            ),
                            labelText: 'Date of establishment',
                            // hintText: '02/10/2023',
                            counterText: "",
                            hintStyle: TextStyle(fontSize: 15,fontWeight: FontWeight.w500,color: Color(0xFF707070)),
                            contentPadding: EdgeInsets.only(left: 18,top: 16,bottom: 16),
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
                                child: Image(image: AssetImage("assets/image/date.png")))
                        ),
                        validator: (value) {
                          if(value == null || value.isEmpty){
                            return 'Please Select Date';
                          }
                          return null;
                        },
                      ),
                    ):SizedBox(),

                    Row(
                      children: [
                        SizedBox(width: width*0.02,),
                        Text(textAlign: TextAlign.center,"Choose for :",style: GoogleFonts.lato(fontSize: 15,fontWeight: FontWeight.w500,color: const Color(0xff707070),),),

                        Row(
                          children: [
                            Radio(
                              value: "Lab List",
                              activeColor: Color(0xFF116D6E),
                              groupValue: isChooseRadio,
                              onChanged: (value) {
                                setState(() {
                                  isChooseRadio = value!;
                                });
                              },
                            ),
                            Text("Lab List",style: GoogleFonts.lato(fontSize: 15,fontWeight: FontWeight.w500,color: Color(0xFF252525))),
                          ],
                        ),
                        Row(
                          children: [
                            Radio(
                              value: "Public",
                              activeColor: Color(0xFF116D6E),
                              groupValue: isChooseRadio,
                              onChanged: (value) {
                                setState(() {
                                  isChooseRadio = value!;
                                });
                              },
                            ),
                            Text("Public",style: GoogleFonts.lato(fontSize: 15,fontWeight: FontWeight.w500,color: Color(0xFF252525))),
                          ],
                        ),
                      ],
                    ),

                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: height*0.03,),

                        SizedBox(height: height*0.02,),
                        InkWell(
                          onTap: () {
                            setState(() {
                              method = !method;
                            });
                          },
                          child: Container(
                            alignment: Alignment.centerRight,
                            width: width,
                            height: height*0.07,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(color: Colors.black),
                            ),
                            child: Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left: 8),
                                  child: Text("${s_method}",
                                      style: TextStyle(
                                          fontSize: 14,
                                          color: Colors.black,
                                          fontFamily: "spartan")),
                                ),
                                Spacer(),
                                Padding(
                                  padding: const EdgeInsets.only(right: 8),
                                  child: Icon(Icons.keyboard_arrow_down_rounded,size: 30),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(height: height*0.01,),
                        method == true ? Container(
                          width: width,
                         // height: height*0.28,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: Colors.black),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(right: 15),
                            child: Column(
                              children: [
                                SizedBox(height: height*0.01,),
                                Row(
                                  children: [
                                    Radio(
                                      activeColor: Color(0xFFDD6A03),
                                      value: "expedited", groupValue: place, onChanged: (value) {
                                      setState(() {
                                        place = value.toString();
                                        s_method = "Lab 1";
                                        method = false;
                                      });
                                    },),
                                    Text("Lab 1",style: GoogleFonts.lato(fontSize: 15,fontWeight: FontWeight.w500,color: Color(0xFF252525))),


                                  ],
                                ),
                                Row(
                                  children: [
                                    Radio(
                                      activeColor: Color(0xFFDD6A03),
                                      value: "regular", groupValue: place, onChanged: (value) {
                                      setState(() {
                                        place = value.toString();
                                        s_method = "Lab 2";
                                        method = false;
                                      });
                                    },),
                                    Text("Lab 2",style: GoogleFonts.lato(fontSize: 15,fontWeight: FontWeight.w500,color: Color(0xFF252525))),

                                  ],
                                ),
                                Row(
                                  children: [
                                    Radio(
                                      activeColor: Color(0xFFDD6A03),
                                      value: "xpress", groupValue: place, onChanged: (value) {
                                      setState(() {
                                        place = value.toString();
                                        s_method = "Lab 3";
                                        method = false;
                                      });
                                    },),
                                    Text("Lab 3",style: GoogleFonts.lato(fontSize: 15,fontWeight: FontWeight.w500,color: Color(0xFF252525))),

                                  ],
                                ),

                              ],
                            ),
                          ),
                        ):SizedBox(),
                          InkWell(
                              onTap: () {
                                 Navigator.push(context, MaterialPageRoute(builder: (context) {
                                  return QuoteSuccessfully();
                                },));
                              },child: Text("Quote sucess")),


                      ]
                    )
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
