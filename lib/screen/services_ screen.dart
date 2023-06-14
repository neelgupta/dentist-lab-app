import 'package:dentalapp/screen/starter_page_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ServicesScreen extends StatefulWidget {
  const ServicesScreen({Key? key}) : super(key: key);

  @override
  State<ServicesScreen> createState() => _ServicesScreenState();
}

class _ServicesScreenState extends State<ServicesScreen> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width  = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: SizedBox(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                    height: height*0.24,
                    decoration: const BoxDecoration(
                        color: Color(0xFF116D6E),
                        image: DecorationImage(image: AssetImage("assets/image/Group 12305.png"),
                            fit: BoxFit.fitWidth,alignment: Alignment.bottomCenter,opacity: 0.3)
                    ),
                    child: Align(
                        alignment: Alignment.center,
                        child: Column(
                          children: [
                            Container(
                              padding: EdgeInsets.only(left: 15,top: 40),
                              alignment: Alignment.centerLeft,
                              child: InkWell(
                                  onTap: () {
                                    Navigator.pop(context);
                                  },
                                  child: Icon(Icons.keyboard_backspace,color: Colors.white,)),
                            ),
                            SizedBox(height: height*0.05,),
                            Text("Services",style: GoogleFonts.lato(fontSize: 32,fontWeight: FontWeight.w600,color: Colors.white,),),
                          ],
                        ))
                ),
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: height*0.010,),
                      Text("Services",style: GoogleFonts.lato(fontSize: 18,fontWeight: FontWeight.w600,),),
                      SizedBox(height: height*0.025,),
                      Row(
                        children: [
                          Image(image: AssetImage("assets/image/Delete .png")),
                          SizedBox(width: 20,),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Dental Prosthetics",style: GoogleFonts.lato(fontSize: 16,fontWeight: FontWeight.w600,),),
                              Text("AED 800",style: GoogleFonts.lato(fontSize: 14,fontWeight: FontWeight.w600,color: Color(0xFFA0A0A0)),)
                            ],
                          ),
                          Spacer(),
                          InkWell(
                            onTap: () {
                              Navigator.push(context, MaterialPageRoute(builder: (context) => StarterPageScreen(),));
                            },
                              child: Icon(Icons.navigate_next,color: Color(0XFF707070),))
                        ],
                      ),
                      SizedBox(height: height*0.016,),
                      Divider(
                        color: Color(0xFFE7E7E7),
                        thickness: 1,
                      ),
                      SizedBox(height: height*0.016,),
                      Row(
                        children: [
                          Image(image: AssetImage("assets/image/Delete .png")),
                          SizedBox(width: 20,),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Orthodontic Appliances",style: GoogleFonts.lato(fontSize: 16,fontWeight: FontWeight.w600,),),
                              Text("AED 3,500",style: GoogleFonts.lato(fontSize: 14,fontWeight: FontWeight.w600,color: Color(0xFFA0A0A0)),)
                            ],
                          ),
                          Spacer(),
                          InkWell(
                              onTap: () {
                                Navigator.push(context, MaterialPageRoute(builder: (context) => StarterPageScreen(),));
                              },
                              child: Icon(Icons.navigate_next,color: Color(0XFF707070),))
                        ],
                      ),
                      SizedBox(height: height*0.016,),
                      Divider(
                        color: Color(0xFFE7E7E7),
                        thickness: 1,
                      ),
                      SizedBox(height: height*0.016,),
                      Row(
                        children: [
                          Image(image: AssetImage("assets/image/Delete .png")),
                          SizedBox(width: 20,),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Implant Restorations",style: GoogleFonts.lato(fontSize: 16,fontWeight: FontWeight.w600,),),
                              Text("AED 2000",style: GoogleFonts.lato(fontSize: 14,fontWeight: FontWeight.w600,color: Color(0xFFA0A0A0)),)
                            ],
                          ),
                          Spacer(),
                          InkWell(
                              onTap: () {
                                Navigator.push(context, MaterialPageRoute(builder: (context) => StarterPageScreen(),));
                              },
                              child: Icon(Icons.navigate_next,color: Color(0XFF707070),))
                        ],
                      ),
                      SizedBox(height: height*0.016,),
                      Divider(
                        color: Color(0xFFE7E7E7),
                        thickness: 1,
                      ),
                      SizedBox(height: height*0.016,),
                      Row(
                        children: [
                          Image(image: AssetImage("assets/image/Delete .png")),
                          SizedBox(width: 20,),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Cosmetic Dentistry",style: GoogleFonts.lato(fontSize: 16,fontWeight: FontWeight.w600,),),
                              Text("AED 1500",style: GoogleFonts.lato(fontSize: 14,fontWeight: FontWeight.w600,color: Color(0xFFA0A0A0)),)
                            ],
                          ),
                          Spacer(),
                          InkWell(
                              onTap: () {
                                Navigator.push(context, MaterialPageRoute(builder: (context) => StarterPageScreen(),));
                              },
                              child: Icon(Icons.navigate_next,color: Color(0XFF707070),))
                        ],
                      ),
                      SizedBox(height: height*0.016,),
                      Divider(
                        color: Color(0xFFE7E7E7),
                        thickness: 1,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
