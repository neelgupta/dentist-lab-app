import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({Key? key}) : super(key: key);

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
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
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: height*0.010,),
                      Text("Notifications",style: GoogleFonts.lato(fontSize: 18,fontWeight: FontWeight.w600 )),
                      SizedBox(height: height*0.020,),
                      Container(
                        height: height*0.65,
                        width: width,
                        child: ListView.separated(
                          scrollDirection: Axis.vertical,
                            itemBuilder: (context, index) {
                              return Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("job successfully Done",style: GoogleFonts.lato(fontSize: 18,fontWeight: FontWeight.w600 )),
                                  SizedBox(height: height*0.010,),
                                  Text("Lorem Ipsum has been the industry's standard dummy text ever since",
                                      style: GoogleFonts.lato(fontSize: 14,fontWeight: FontWeight.w400,color: Color(0xFFA0A0A0)),
                                    maxLines: 2,),
                                  SizedBox(height: height*0.010,),
                                  Text("31 Mar 2023",style: GoogleFonts.lato(fontSize: 12,fontWeight: FontWeight.w600)),
                                  SizedBox(height: height*0.020,),
                                  Divider(thickness: 1,color: Color(0xFFE7E7E7),)
                                ],
                              );
                            },
                            separatorBuilder: (context, index) {
                              return SizedBox(height: height*0.020,);
                            },
                            itemCount: 6),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ));
  }

}
