import 'package:dentalapp/screen/acceptedquote_details_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AcceptedQuoteScreen extends StatefulWidget {
  const AcceptedQuoteScreen({Key? key}) : super(key: key);

  @override
  State<AcceptedQuoteScreen> createState() => _AcceptedQuoteScreenState();
}

class _AcceptedQuoteScreenState extends State<AcceptedQuoteScreen> {

  bool  isFeedColor = true;
  Color feedSelected = Colors.white;
  Color feedUnselected = Color(0xFFEBEFEE);

  void changeColors() {
    setState(() {
      if (isFeedColor) {
        feedSelected = Colors.white;
        feedUnselected = Color(0xFFEBEFEE);
      } else {
        feedSelected = Color(0xFFEBEFEE);
        feedUnselected = Colors.white;
      }
      isFeedColor = !isFeedColor;
    });
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        body: SizedBox(
          height: height,
          width: width,
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
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
                          Text("Quote",style: GoogleFonts.lato(fontSize: 30,fontWeight: FontWeight.w600,color: Colors.white,)),
                          Spacer(),
                          SizedBox(height: height*0.050,width: width*0.050),
                        ],
                      ),
                    )
                ),
                SizedBox(height: height*0.030,),
                Container(
                  height: height*0.065,
                  width: width*0.88,
                  decoration: BoxDecoration(
                      color: Color(0xFFEBEFEE),
                      borderRadius:BorderRadius.circular(12)
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(4),
                    child: Row(
                      children: [
                        Expanded(
                          child: InkWell(
                            onTap: () {
                              changeColors();
                            },
                            child: Container(
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                color: feedSelected,
                                borderRadius: BorderRadius.circular(11),
                              ),
                              child: !isFeedColor ? Text("Accepted",style: GoogleFonts.lato(fontSize: 15,fontWeight: FontWeight.w700,color: Color(0xFF116D6E),))
                                  : Text("Accepted",style: GoogleFonts.lato(fontSize: 15,fontWeight: FontWeight.w700))
                            ),
                          ),
                        ),
                        Expanded(
                          child: InkWell(
                            onTap: () {
                              changeColors();
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                color:feedUnselected,
                                borderRadius: BorderRadius.circular(11),
                              ),
                              alignment: Alignment.center,
                                child: isFeedColor ? Text("Completed",style: GoogleFonts.lato(fontSize: 15,fontWeight: FontWeight.w700,color: Color(0xFF116D6E),))
                                    : Text("Completed",style: GoogleFonts.lato(fontSize: 15,fontWeight: FontWeight.w700))
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: height*0.03,horizontal: width*0.055),
                  child: Column(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text("Dental Crowns and Bridges",style: GoogleFonts.lato(fontSize: 17,fontWeight: FontWeight.w600 )),
                              Spacer(),
                              Container(
                                alignment: Alignment.center,
                                height: height*0.031,
                                width: width*0.17,
                                decoration: BoxDecoration(
                                  color: Color(0xFFFF5959),
                                  borderRadius: BorderRadius.circular(15)
                                ),
                                child: Text("Urgent",style: GoogleFonts.lato(fontSize: 12,fontWeight: FontWeight.w600,color: Colors.white)),
                              )
                            ],
                          ),
                          SizedBox(height: height*0.010,),
                          Row(
                            children: [
                              Text("Dental Prosthetics",style: GoogleFonts.lato(fontSize: 14,fontWeight: FontWeight.w400,color: Color(0xFF116D6E) )),
                              SizedBox(width: width*0.022,),
                              Text("Orthodontic Appliances",style: GoogleFonts.lato(fontSize: 14,fontWeight: FontWeight.w400,color: Color(0xFF116D6E) )),

                            ],
                          ),
                          SizedBox(height: height*0.010,),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Expanded(
                                child: Container(
                                  child: Text("Lorem Ipsum has been the industry's standard dummy text ever since",
                                      style: GoogleFonts.lato(fontSize: 13,fontWeight: FontWeight.w400,),maxLines: 2,overflow: TextOverflow.ellipsis),
                                ),
                              ),
                              SizedBox(width: width*0.020,),
                              Container(
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  color: Color(0xFF414141),
                                  borderRadius: BorderRadius.circular(5)
                                ),
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(vertical: height*0.0065,horizontal: width*0.032),
                                    child: Text("Waiting For Payment",style: GoogleFonts.lato(fontSize: 12,fontWeight: FontWeight.w400,color: Colors.white)),
                                  )),

                            ],
                          ),
                          SizedBox(height: height*0.010,),
                          Divider(
                            thickness: 1,
                            color: Color(0xFFE7E7E7),
                          )
                        ],
                      ),
                      SizedBox(height: height*0.018,),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Clear Aligners",style: GoogleFonts.lato(fontSize: 17,fontWeight: FontWeight.w600 )),
                          SizedBox(height: height*0.010,),
                          Row(
                            children: [
                              Text("Implant Restorations",style: GoogleFonts.lato(fontSize: 14,fontWeight: FontWeight.w400,color: Color(0xFF116D6E) )),
                              SizedBox(width: width*0.022,),
                              Text("Cosmetic Dentistry",style: GoogleFonts.lato(fontSize: 14,fontWeight: FontWeight.w400,color: Color(0xFF116D6E) )),

                            ],
                          ),
                          SizedBox(height: height*0.010,),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Expanded(
                                child: Container(
                                  child: Text("Lorem Ipsum has been the industry's standard dummy text ever since",
                                      style: GoogleFonts.lato(fontSize: 13,fontWeight: FontWeight.w400,),maxLines: 2,overflow: TextOverflow.ellipsis),
                                ),
                              ),
                              SizedBox(width: width*0.020,),
                              !isFeedColor ? Container(
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                      color: Color(0xFFFFD059),
                                      borderRadius: BorderRadius.circular(5)
                                  ),
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(vertical: height*0.0065,horizontal: width*0.030),
                                    child: Text("Work Started",style: GoogleFonts.lato(fontSize: 12,fontWeight: FontWeight.w400)),
                                  ))
                                  : Container(
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                      color: Color(0xFF414141),
                                      borderRadius: BorderRadius.circular(5)
                                  ),
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(vertical: height*0.0065,horizontal: width*0.032),
                                    child: Text("Waiting For Payment",style: GoogleFonts.lato(fontSize: 12,fontWeight: FontWeight.w400,color: Colors.white)),
                                  ))

                            ],
                          ),
                          SizedBox(height: height*0.010,),
                          Divider(
                            thickness: 1,
                            color: Color(0xFFE7E7E7),
                          )
                        ],
                      ),
                      SizedBox(height: height*0.018,),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Implant Crown",style: GoogleFonts.lato(fontSize: 17,fontWeight: FontWeight.w600 )),
                          SizedBox(height: height*0.010,),
                          Row(
                            children: [
                              Text("Orthodontic Appliances",style: GoogleFonts.lato(fontSize: 14,fontWeight: FontWeight.w400,color: Color(0xFF116D6E) )),
                              SizedBox(width: width*0.022,),
                              Text("Implant Restorations",style: GoogleFonts.lato(fontSize: 14,fontWeight: FontWeight.w400,color: Color(0xFF116D6E) )),

                            ],
                          ),
                          SizedBox(height: height*0.010,),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Expanded(
                                child: Container(
                                  child: Text("Lorem Ipsum has been the industry's standard dummy text ever since",
                                      style: GoogleFonts.lato(fontSize: 13,fontWeight: FontWeight.w400,),maxLines: 2,overflow: TextOverflow.ellipsis),
                                ),
                              ),
                              SizedBox(width: width*0.020,),
                              !isFeedColor ? Container(
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                      color: Color(0xFF414141),
                                      borderRadius: BorderRadius.circular(5)
                                  ),
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(vertical: height*0.0065,horizontal: width*0.032),
                                    child: Text("Delivery Rejected",style: GoogleFonts.lato(fontSize: 12,fontWeight: FontWeight.w400,color: Colors.white)),
                                  ))
                                  : Container(
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                      color: Color(0xFFFFD059),
                                      borderRadius: BorderRadius.circular(5)
                                  ),
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(vertical: height*0.0065,horizontal: width*0.030),
                                    child: Text("Payment Received",style: GoogleFonts.lato(fontSize: 12,fontWeight: FontWeight.w400)),
                                  )),

                            ],
                          ),
                          SizedBox(height: height*0.010,),
                          Divider(
                            thickness: 1,
                            color: Color(0xFFE7E7E7),
                          )
                        ],
                      ),
                      SizedBox(height: height*0.018,),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text("Dentures (Complete)",style: GoogleFonts.lato(fontSize: 17,fontWeight: FontWeight.w600 )),
                              Spacer(),
                              Container(
                                alignment: Alignment.center,
                                height: height*0.031,
                                width: width*0.17,
                                decoration: BoxDecoration(
                                    color: Color(0xFFFF5959),
                                    borderRadius: BorderRadius.circular(15)
                                ),
                                child: Text("Urgent",style: GoogleFonts.lato(fontSize: 12,fontWeight: FontWeight.w600,color: Colors.white)),
                              )
                            ],
                          ),
                          SizedBox(height: height*0.010,),
                          Row(
                            children: [
                              Text("Implant Restorations",style: GoogleFonts.lato(fontSize: 14,fontWeight: FontWeight.w400,color: Color(0xFF116D6E) )),
                              SizedBox(width: width*0.022,),
                              Text("Cosmetic Dentistry",style: GoogleFonts.lato(fontSize: 14,fontWeight: FontWeight.w400,color: Color(0xFF116D6E) )),

                            ],
                          ),
                          SizedBox(height: height*0.010,),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Expanded(
                                child: Container(
                                  child: Text("Lorem Ipsum has been the industry's standard dummy text ever since",
                                      style: GoogleFonts.lato(fontSize: 13,fontWeight: FontWeight.w400,),maxLines: 2,overflow: TextOverflow.ellipsis),
                                ),
                              ),
                              SizedBox(width: width*0.020,),
                              !isFeedColor ? Container(
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                      color: Color(0xFF219653),
                                      borderRadius: BorderRadius.circular(5)
                                  ),
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(vertical: height*0.0065,horizontal: width*0.032),
                                    child: Text("Payment Received",style: GoogleFonts.lato(fontSize: 12,fontWeight: FontWeight.w400,color: Colors.white)),
                                  ))
                                  : Container(
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                      color: Color(0xFF2F80ED),
                                      borderRadius: BorderRadius.circular(5)
                                  ),
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(vertical: height*0.0065,horizontal: width*0.032),
                                    child: Text("Job Successfully Done",style: GoogleFonts.lato(fontSize: 12,fontWeight: FontWeight.w400,color: Colors.white)),
                                  ))

                            ],
                          ),
                          SizedBox(height: height*0.010,),
                          Divider(
                            thickness: 1,
                            color: Color(0xFFE7E7E7),
                          )
                        ],
                      ),
                      SizedBox(height: height*0.018,),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text("Dental Crowns and Bridges",style: GoogleFonts.lato(fontSize: 17,fontWeight: FontWeight.w600 )),
                              Spacer(),
                              Container(
                                alignment: Alignment.center,
                                height: height*0.031,
                                width: width*0.17,
                                decoration: BoxDecoration(
                                    color: Color(0xFFFF5959),
                                    borderRadius: BorderRadius.circular(15)
                                ),
                                child: Text("Urgent",style: GoogleFonts.lato(fontSize: 12,fontWeight: FontWeight.w600,color: Colors.white)),
                              )
                            ],
                          ),
                          SizedBox(height: height*0.010,),
                          Row(
                            children: [
                              Text("Dental Prosthetics",style: GoogleFonts.lato(fontSize: 14,fontWeight: FontWeight.w400,color: Color(0xFF116D6E) )),
                              SizedBox(width: width*0.022,),
                              Text("Orthodontic Appliances",style: GoogleFonts.lato(fontSize: 14,fontWeight: FontWeight.w400,color: Color(0xFF116D6E) )),

                            ],
                          ),
                          SizedBox(height: height*0.010,),
                          InkWell(
                            onTap: () {
                              Navigator.push(context, MaterialPageRoute(builder: (context) => AcceptedQuoteDetailsScreen()));
                            },
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Expanded(
                                  child: Container(
                                    child: Text("Lorem Ipsum has been the industry's standard dummy text ever since",
                                        style: GoogleFonts.lato(fontSize: 13,fontWeight: FontWeight.w400,),maxLines: 2,overflow: TextOverflow.ellipsis),
                                  ),
                                ),
                                SizedBox(width: width*0.020,),
                                !isFeedColor ? Container(
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                        color: Color(0xFF2F80ED),
                                        borderRadius: BorderRadius.circular(5)
                                    ),
                                    child: Padding(
                                      padding: EdgeInsets.symmetric(vertical: height*0.0065,horizontal: width*0.032),
                                      child: Text("Out For Delivery",style: GoogleFonts.lato(fontSize: 12,fontWeight: FontWeight.w400,color: Colors.white)),
                                    ))
                                    : Container(
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                        color: Color(0xFF219653),
                                        borderRadius: BorderRadius.circular(5)
                                    ),
                                    child: Padding(
                                      padding: EdgeInsets.symmetric(vertical: height*0.0065,horizontal: width*0.032),
                                      child: Text("Delivery Success",style: GoogleFonts.lato(fontSize: 12,fontWeight: FontWeight.w400,color: Colors.white)),
                                    )),

                              ],
                            ),
                          ),
                          SizedBox(height: height*0.010,),
                          Divider(
                            thickness: 1,
                            color: Color(0xFFE7E7E7),
                          )
                        ],
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
