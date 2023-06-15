import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Payment extends StatefulWidget {
  const Payment({Key? key}) : super(key: key);

  @override
  State<Payment> createState() => _PaymentState();
}

class _PaymentState extends State<Payment> {

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height -
        MediaQuery.of(context).padding.top -
        MediaQuery.of(context).padding.bottom;
    double width = MediaQuery.of(context).size.width -
        MediaQuery.of(context).padding.right -
        MediaQuery.of(context).padding.left;
    return Scaffold(
      body: Column(
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
                        GestureDetector(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: const Icon(Icons.keyboard_backspace,color: Colors.white,)),
                        const Spacer(),
                        Center(child: Text(textAlign: TextAlign.center,"Payments",style: GoogleFonts.lato(fontSize: 26,fontWeight: FontWeight.w600,color: Colors.white,),)),
                        const Spacer(),
                        Container()
                      ],
                    ),
                  ),
                ],
              )
          ),
          SizedBox(
            height: height * 0.02,
          ),
          Padding(
            padding:  EdgeInsets.symmetric(horizontal: height*0.03),
            child: Text(
              "Payments",
              style: GoogleFonts.lato(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: const Color(0xff252525),
              ),
            ),
          ),

          Expanded(
            child: ListView.separated(
              physics: const BouncingScrollPhysics(),
              //shrinkWrap: true,
              itemCount: 4,
              separatorBuilder: (context, index) {
                return  Padding(
                  padding:  EdgeInsets.symmetric(horizontal: height*0.03),
                  child: Divider(
                    thickness: 1,
                    color: Color(0xffE7E7E7),
                  ),
                );
              },
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: (){

                  },
                  child: Padding(
                    padding:  EdgeInsets.symmetric(horizontal: height*0.03),
                    child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [



                        Row(
                          children: [
                            Text(
                              "Lab Name",
                              style: GoogleFonts.lato(
                                fontSize: 13,
                                fontWeight: FontWeight.w600,
                                color: const Color(0xff252525),
                              ),
                            ),
                            Spacer(),
                            Text(
                              "31 Mar 2023",
                              style: GoogleFonts.lato(
                                fontSize: 10,
                                fontWeight: FontWeight.w600,
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
                              "Subtotal :",
                              style: GoogleFonts.lato(
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                                color: const Color(0xff707070),
                              ),
                            ),
                            Spacer(),
                            Text(
                              "AED 500",
                              style: GoogleFonts.lato(
                                fontSize: 13,
                                fontWeight: FontWeight.w600,
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
                              "Payment Mode",
                              style: GoogleFonts.lato(
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                                color: const Color(0xff707070),
                              ),
                            ),
                            Spacer(),
                            Text(
                              "Onlien Payment",
                              style: GoogleFonts.lato(
                                fontSize: 13,
                                fontWeight: FontWeight.w600,
                                color: const Color(0xff252525),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          SizedBox(
            height: height * 0.01,
          ),

        ],
      ),
    );
  }
}
