import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class QuoteSuccessfully extends StatefulWidget {
  const QuoteSuccessfully({Key? key}) : super(key: key);

  @override
  State<QuoteSuccessfully> createState() => _QuoteSuccessfullyState();
}

class _QuoteSuccessfullyState extends State<QuoteSuccessfully> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height -
        MediaQuery.of(context).padding.top -
        MediaQuery.of(context).padding.bottom;
    double width = MediaQuery.of(context).size.width -
        MediaQuery.of(context).padding.right -
        MediaQuery.of(context).padding.left;
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: SizedBox(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
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
                Padding(
                  padding:EdgeInsets.symmetric(horizontal: width*0.05),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children:  [
                      SizedBox(height: height*0.22,),
                      const Image(image: AssetImage("assets/image/Group 12680.png")),
                      SizedBox(height: height*0.05,),
                      Text("Quote successfully Live",style: GoogleFonts.lato(fontSize: 18,fontWeight: FontWeight.w600 ),),
                      SizedBox(height: height*0.02,),
                      Text("Lorem Ipsum has been the industry's standard dummy text ever since",textAlign: TextAlign.center,style: GoogleFonts.lato(fontSize: 16.5,fontWeight: FontWeight.w500,color: const Color(0xFF707070) ),),
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
