import 'package:dentalapp/screen/manage_profile_5.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:numberpicker/numberpicker.dart';
import 'package:time_range_picker/time_range_picker.dart';

class ManageProfile4 extends StatefulWidget {
  const ManageProfile4({Key? key}) : super(key: key);

  @override
  State<ManageProfile4> createState() => _ManageProfile4State();
}

class _ManageProfile4State extends State<ManageProfile4> {

  var openingTime = "09:00";
  var closingTime = "17:00";
  bool switchValue = true;
  List breaktime = [
    "01:00 ",
    "01:15 ",
    "01:30 ",
    "01:45 ",
    "02:00 ",
    "02:15 ",
    "02:30",
    "02:45",
    "03:00",
    "03:15",
    "03:30",
    "03:45",
    "04:00",
    "04:15",
    "04:30",
    "04:45",
    "05:00",
    "05:15",
    "05:30",
    "05:45",
    "06:00",
    "06:15",
    "06:30",
    "06:45",
    "07:00",
    "07:15",
    "07:30",
    "07:45",
    "08:00",
    "08:15",
    "08:30",
    "08:45",
    "09:00",
    "09:15",
    "09:30",
    "09:45",
    "10:00",
    "10:15",
    "10:30",
    "10:45",
    "11:00",
    "11:15",
    "11:30",
    "11:45",
    "12:00",
    "12:15",
    "12:30",
    "12:45",
    "13:00",
    "13:15",
    "13:30",
    "13:45",
    "14:00",
    "14:15",
    "14:30",
    "14:45",
    "15:00",
    "15:15",
    "15:30",
    "15:45",
    "16:00",
    "16:15",
    "16:30",
    "16:45",
    "17:00",
    "17:15",
    "17:30",
    "17:45",
    "18:00",
    "18:15",
    "18:30",
    "18:45",
    "19:00",
    "19:15",
    "19:30",
    "19:45",
    "20:00",
    "20:15",
    "20:30",
    "20:45",
    "21:00",
    "21:15",
    "21:30",
    "21:45",
    "22:00",
    "22:15",
    "22:30",
    "22:45",
    "23:00",
    "23:15",
    "23:30",
    "23:45",
    "24:00",
  ];

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width  = MediaQuery.of(context).size.width;
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
                    height: height*0.25,
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
                            InkWell(
                                onTap: () {
                                  Navigator.pop(context);
                                },
                                child: Image(image: AssetImage("assets/image/left.png"),fit: BoxFit.fill)),
                          ],
                        ),
                        SizedBox(height: 20,),
                        Align(
                          alignment: Alignment.center,
                          child: Container(
                            alignment: Alignment.center,
                            height: 70,
                            width: 70,
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
                    padding: EdgeInsets.symmetric(horizontal: width*0.057,vertical: height*0.027),
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
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                                width: 70,
                                child: Text("Monday",style: GoogleFonts.lato(fontSize: 15,fontWeight: FontWeight.w600),)),
                            Spacer(),
                            Text("9:00 - 17:00",style: GoogleFonts.lato(fontSize: 15,fontWeight: FontWeight.w400),),
                            Spacer(),
                            InkWell(
                              onTap: (){
                                openDialog(context);
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
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              width: 75,
                              child: Text("Tuesday",style: GoogleFonts.lato(fontSize: 15,fontWeight: FontWeight.w600),),
                            ),
                            Spacer(),
                            Text("Closed",style: GoogleFonts.lato(fontSize: 15,fontWeight: FontWeight.w400,color: Color(0xFF707070)),),
                            Spacer(),
                            InkWell(
                                onTap: (){
                                  openDialog(context);
                                },
                                child: Icon(Icons.arrow_forward_ios,color: Color(0xFF707070),size: 15,)),
                            SizedBox(width: 10,),
                          ],
                        ),
                        SizedBox(height: 15,),
                        Divider(color: Color(0xFFE7E7E7),thickness: 1),
                        SizedBox(height: 15,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              width: 77,
                              child: Text("Wednesday",style: GoogleFonts.lato(fontSize: 14,fontWeight: FontWeight.w600),maxLines: 1),
                            ),
                            Spacer(),
                            Text("Closed",style: GoogleFonts.lato(fontSize: 15,fontWeight: FontWeight.w400,color: Color(0xFF707070)),),
                            Spacer(),
                            InkWell(
                                onTap: (){
                                  openDialog(context);
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
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              width: 75,
                              child: Text("Thursday",style: GoogleFonts.lato(fontSize: 15,fontWeight: FontWeight.w600),),
                            ),
                            Spacer(),
                            Text("Closed",style: GoogleFonts.lato(fontSize: 15,fontWeight: FontWeight.w400,color: Color(0xFF707070)),),
                            Spacer(),
                            InkWell(
                                onTap: (){
                                  openDialog(context);
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
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              width: 75,
                              child: Text("Friday",style: GoogleFonts.lato(fontSize: 15,fontWeight: FontWeight.w600),),
                            ),
                            Spacer(),
                            Text("Closed",style: GoogleFonts.lato(fontSize: 15,fontWeight: FontWeight.w400,color: Color(0xFF707070)),),
                            Spacer(),
                            InkWell(
                                onTap: (){
                                  openDialog(context);
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
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              width: 75,
                              child: Text("Saturday",style: GoogleFonts.lato(fontSize: 15,fontWeight: FontWeight.w600),),
                            ),
                            Spacer(),
                            Text("Closed",style: GoogleFonts.lato(fontSize: 15,fontWeight: FontWeight.w400,color: Color(0xFF707070)),),
                            Spacer(),
                            InkWell(
                                onTap: (){
                                  openDialog(context);
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
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              width: 75,
                              child: Text("Sunday",style: GoogleFonts.lato(fontSize: 15,fontWeight: FontWeight.w600),),
                            ),
                            Spacer(),
                            Text("Closed",style: GoogleFonts.lato(fontSize: 15,fontWeight: FontWeight.w400,color: Color(0xFF707070)),),
                            Spacer(),
                            InkWell(
                                onTap: (){
                                  openDialog(context);
                                },
                                child: Icon(Icons.arrow_forward_ios,color: Color(0xFF707070),size: 15,)),
                            SizedBox(width: 10,),
                          ],
                        ),
                        SizedBox(height: 15,),
                        Divider(color: Color(0xFFE7E7E7),thickness: 1),
                        SizedBox(height: 15,),
                        SizedBox(height: height*0.050,),
                        Container(
                          height: height*0.064,
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              color: Color(0xFF116D6E)
                          ),
                          child: TextButton(
                              onPressed: () {
                                Navigator.push(context, MaterialPageRoute(builder: (context) => ManageProfile5(),));
                              },
                              child: Text("Continue",style: GoogleFonts.lato(fontSize: 15,fontWeight: FontWeight.w500,color: Colors.white))),
                        ),
                        SizedBox(height: height*0.025,),
                      ],),
                  )
                ],
              ),
            ),
          ),
        ));
  }
   openDialog (BuildContext context){
    return showDialog(
        context: context,
        builder: (_) => AlertDialog(
          insetPadding: EdgeInsets.zero,
          contentPadding: EdgeInsets.zero,
          clipBehavior: Clip.antiAliasWithSaveLayer,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(10.0))),
          content: Builder(
            builder: (context) {
              var height = MediaQuery.of(context).size.height;
              var width = MediaQuery.of(context).size.width;
              return Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  height:height*0.65,
                  width: width,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        children: [
                          Text("   Tuesday",style: GoogleFonts.lato(fontWeight: FontWeight.w600,fontSize: 18)),
                          Spacer(),
                          Column(
                            children: [
                              Transform.scale(
                                scale: 0.85,
                                child: CupertinoSwitch(
                                  value: switchValue,
                                  activeColor: Color(0xFF116D6E),
                                  onChanged: (bool? value) {
                                    setState(() {
                                      switchValue = value ?? false;
                                    });
                                  },
                                ),
                              ),
                              // switchValue ? Text("open",style: GoogleFonts.lato(fontWeight: FontWeight.w600,fontSize: 13),)
                              //     : Text("close",style: GoogleFonts.lato(fontWeight: FontWeight.w600,fontSize: 13),)
                            ],
                          ),
                        ],
                      ),
                      Divider(
                        color: Color(0xFFE7E7E7),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            width: width*0.30,
                            height: height*0.45,
                            child: CupertinoPicker(
                              magnification: 1.22,
                              squeeze: 1.2,
                              useMagnifier: true,
                              itemExtent: 40,
                              onSelectedItemChanged: (index) {
                                setState(() {
                                  openingTime = breaktime[index];
                                });
                              },
                              selectionOverlay: CupertinoPickerDefaultSelectionOverlay(background: Colors.transparent,),
                              children: breaktime
                                  .map((text) => Center(
                                child: Container(
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                  ),
                                  child: Text(text,style: GoogleFonts.lato(fontSize: 16, fontWeight: FontWeight.w500)),
                                ),
                              ))
                                  .toList(),
                            ),
                          ),
                          SizedBox(width: 20,),
                          Text("To",style: GoogleFonts.lato(fontSize: 17,fontWeight: FontWeight.w600),),
                          SizedBox(width: 20,),
                          SizedBox(
                            width: width*0.30,
                            height: height*0.45,
                            child: CupertinoPicker(
                              squeeze: 1,
                              useMagnifier: true,
                              itemExtent: 40,
                              onSelectedItemChanged: (index) {
                                setState(() {
                                  closingTime = breaktime[index];
                                });
                              },
                              selectionOverlay: CupertinoPickerDefaultSelectionOverlay(background: Colors.transparent,),
                              children: breaktime
                                  .map((text) => Center(
                                child: Container(
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                    ),
                                    child: Text(text,style: GoogleFonts.lato(fontSize: 16, fontWeight: FontWeight.w500))),
                              ))
                                  .toList(),
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
                        child: Container(
                          height: height*0.065,
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              color: Color(0xFF116D6E)
                          ),
                          child: TextButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: Text("Save",style: GoogleFonts.lato(fontSize: 15,fontWeight: FontWeight.w500,color: Colors.white))),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        )
    );
   }
}

