import 'package:dentalapp/screen/manage_profile_5.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:time_range_picker/time_range_picker.dart';

class ManageProfile4 extends StatefulWidget {
  const ManageProfile4({Key? key}) : super(key: key);

  @override
  State<ManageProfile4> createState() => _ManageProfile4State();
}

class _ManageProfile4State extends State<ManageProfile4> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child:Scaffold(
          resizeToAvoidBottomInset: true,
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
                            Text("4/",style: GoogleFonts.lato(fontSize: 17,fontWeight: FontWeight.w600),),
                            Text("6",style: GoogleFonts.lato(fontSize: 17,fontWeight: FontWeight.w600,color: Color(0xFFA0A0A0)),),
                          ],
                        ),
                        SizedBox(height: 10,),
                        Text("Working time",style: GoogleFonts.lato(fontSize: 18,fontWeight: FontWeight.w600),),
                        SizedBox(height: 30,),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center ,
                          children: [
                            Text("Monday",style: GoogleFonts.lato(fontSize: 16,fontWeight: FontWeight.w600),),
                            Spacer(),
                            Text("9:00 - 17:00",style: GoogleFonts.lato(fontSize: 15,fontWeight: FontWeight.w400),),
                            Spacer(),
                            InkWell(
                              onTap: ()async {
                                TimeRange result = await showTimeRangePicker(
                                context: context,
                                );
                                print("result " + result.toString());
                                },
                                child: Icon(Icons.arrow_forward_ios,color: Color(0xFF707070),size: 15,)),
                            SizedBox(width: 10,),
                          ],
                        ),
                        SizedBox(height: 15,),
                        Divider(color: Color(0xFFE7E7E7),thickness: 1),
                        SizedBox(height: 15,),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center ,
                          children: [
                            Text("Tuesday",style: GoogleFonts.lato(fontSize: 16,fontWeight: FontWeight.w600),),
                            Spacer(),
                            Text("Closed",style: GoogleFonts.lato(fontSize: 15,fontWeight: FontWeight.w400,color: Color(0xFF707070)),),
                            Spacer(),
                            InkWell(
                                onTap: ()async {
                                  TimeRange result = await showTimeRangePicker(
                                    context: context,
                                  );
                                  print("result " + result.toString());
                                },
                                child: Icon(Icons.arrow_forward_ios,color: Color(0xFF707070),size: 15,)),
                            SizedBox(width: 10,),
                          ],
                        ),
                        SizedBox(height: 15,),
                        Divider(color: Color(0xFFE7E7E7),thickness: 1),
                        SizedBox(height: 15,),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center ,
                          children: [
                            Text("Wednesday",style: GoogleFonts.lato(fontSize: 16,fontWeight: FontWeight.w600),),
                            Spacer(),
                            Text("Closed",style: GoogleFonts.lato(fontSize: 15,fontWeight: FontWeight.w400,color: Color(0xFF707070)),),
                            Spacer(),
                            InkWell(
                                onTap: ()async {
                                  TimeRange result = await showTimeRangePicker(
                                    context: context,
                                  );
                                  print("result " + result.toString());
                                },
                                child: Icon(Icons.arrow_forward_ios,color: Color(0xFF707070),size: 15,)),
                            SizedBox(width: 10,),
                          ],
                        ),
                        SizedBox(height: 15,),
                        Divider(color: Color(0xFFE7E7E7),thickness: 1),
                        SizedBox(height: 15,),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center ,
                          children: [
                            Text("Thursday",style: GoogleFonts.lato(fontSize: 16,fontWeight: FontWeight.w600),),
                            Spacer(),
                            Text("Closed",style: GoogleFonts.lato(fontSize: 15,fontWeight: FontWeight.w400,color: Color(0xFF707070)),),
                            Spacer(),
                            InkWell(
                                onTap: ()async {
                                  TimeRange result = await showTimeRangePicker(
                                    context: context,
                                  );
                                  print("result " + result.toString());
                                },
                                child: Icon(Icons.arrow_forward_ios,color: Color(0xFF707070),size: 15,)),
                            SizedBox(width: 10,),
                          ],
                        ),
                        SizedBox(height: 15,),
                        Divider(color: Color(0xFFE7E7E7),thickness: 1),
                        SizedBox(height: 15,),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center ,
                          children: [
                            Text("Friday",style: GoogleFonts.lato(fontSize: 16,fontWeight: FontWeight.w600),),
                            Spacer(),
                            Text("Closed",style: GoogleFonts.lato(fontSize: 15,fontWeight: FontWeight.w400,color: Color(0xFF707070)),),
                            Spacer(),
                            InkWell(
                                onTap: ()async {
                                  TimeRange result = await showTimeRangePicker(
                                    context: context,
                                  );
                                  print("result " + result.toString());
                                },
                                child: Icon(Icons.arrow_forward_ios,color: Color(0xFF707070),size: 15,)),
                            SizedBox(width: 10,),
                          ],
                        ),
                        SizedBox(height: 15,),
                        Divider(color: Color(0xFFE7E7E7),thickness: 1),
                        SizedBox(height: 15,),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center ,
                          children: [
                            Text("Saturday",style: GoogleFonts.lato(fontSize: 16,fontWeight: FontWeight.w600),),
                            Spacer(),
                            Text("Closed",style: GoogleFonts.lato(fontSize: 15,fontWeight: FontWeight.w400,color: Color(0xFF707070)),),
                            Spacer(),
                            InkWell(
                                onTap: ()async {
                                  TimeRange result = await showTimeRangePicker(
                                    context: context,
                                  );
                                  print("result " + result.toString());
                                },
                                child: Icon(Icons.arrow_forward_ios,color: Color(0xFF707070),size: 15,)),
                            SizedBox(width: 10,),
                          ],
                        ),
                        SizedBox(height: 15,),
                        Divider(color: Color(0xFFE7E7E7),thickness: 1),
                        SizedBox(height: 15,),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center ,
                          children: [
                            Text("Sunday",style: GoogleFonts.lato(fontSize: 16,fontWeight: FontWeight.w600),),
                            Spacer(),
                            Text("Closed",style: GoogleFonts.lato(fontSize: 15,fontWeight: FontWeight.w400,color: Color(0xFF707070)),),
                            Spacer(),
                            InkWell(
                                onTap: ()async {
                                  TimeRange result = await showTimeRangePicker(
                                    context: context,
                                  );
                                  print("result " + result.toString());
                                },
                                child: Icon(Icons.arrow_forward_ios,color: Color(0xFF707070),size: 15,)),
                            SizedBox(width: 10,),
                          ],
                        ),
                        SizedBox(height: 15,),
                        Divider(color: Color(0xFFE7E7E7),thickness: 1),
                        SizedBox(height: 15,),
                        SizedBox(height: 30,),
                        Container(
                          height: 50,
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              color: Color(0xFFA0A0A0)
                          ),
                          child: TextButton(
                              onPressed: () {
                                Navigator.push(context, MaterialPageRoute(builder: (context) => ManageProfile5(),));
                              },
                              child: Text("Continue",style: GoogleFonts.lato(fontSize: 15,fontWeight: FontWeight.w500,color: Color(0xFF116D6E)))),
                        ),
                        SizedBox(height: 40,),
                      ],),
                  )
                ],
              ),
            ),
          ),
        ));
  }
}
