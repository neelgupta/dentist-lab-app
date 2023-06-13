import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class QuoteDetailPending extends StatefulWidget {
  const QuoteDetailPending({Key? key}) : super(key: key);

  @override
  State<QuoteDetailPending> createState() => _QuoteDetailPendingState();
}

class _QuoteDetailPendingState extends State<QuoteDetailPending> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height -
        MediaQuery.of(context).padding.top -
        MediaQuery.of(context).padding.bottom;
    double width = MediaQuery.of(context).size.width -
        MediaQuery.of(context).padding.right -
        MediaQuery.of(context).padding.left;
    return Scaffold(
      body: SizedBox(
        height: height,
        width: width,
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
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        InkWell(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: const Padding(
                              padding: EdgeInsets.only(left: 20),
                              child: Icon(
                                Icons.keyboard_backspace,
                                color: Colors.white,
                              ),
                            )),
                        SizedBox(
                          width: width / 6,
                        ),
                        Center(
                            child: Text(
                              textAlign: TextAlign.center,
                              "Quote Detail",
                              style: GoogleFonts.lato(
                                fontSize: 28,
                                fontWeight: FontWeight.w600,
                                color: Colors.white,
                              ),
                            )),
                      ],
                    ),
                  ],
                )),
            SizedBox(
              height: height * 0.03,
            ),

            Padding(
              padding: const EdgeInsets.only(left: 20,right: 20),
              child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Title lorem...",
                        style: GoogleFonts.lato(
                          fontSize: 17,
                          fontWeight: FontWeight.w600,
                          color: const Color(0xff252525),
                        ),
                      ),
                      GestureDetector(
                        onTap: (){
                          ///pending Condition
                          Navigator.push(context, MaterialPageRoute(builder: (context) {
                            return const QuoteDetailPending();
                          },));
                        },
                        child: Container(
                          height: height * 0.03,

                          decoration: BoxDecoration(
                            color: const Color(0xffFFD059),
                            borderRadius: BorderRadius.circular(2),
                          ),
                          child: Center(
                            child: Padding(
                              padding: const EdgeInsets.only(left: 10,right: 10),
                              child: Text(
                                "Panding",
                                style: GoogleFonts.lato(
                                  fontSize: 10,
                                  fontWeight: FontWeight.w600,
                                  color: const Color(0xff252525),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: height*0.02,),
                  Row(
                    //mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(
                        width: width*0.75,
                        child: Text(
                          "Lorem Ipsum has been the industry's standard dummy text ever since",
                          style: GoogleFonts.lato(
                            fontSize: 13,
                            fontWeight: FontWeight.w400,
                            color: const Color(0xff252525),
                          ),
                        ),
                      ),
                      Spacer(),
                      GestureDetector(
                          onTap: () {},
                          child: const Image(
                              height: 7,
                              width: 14,
                              image: AssetImage(
                                  "assets/image/upicon.png",),fit: BoxFit.fill,)),
                    ],
                  ),
                  const Padding( 
                    padding: EdgeInsets.only(top: 10),
                    child: Divider(thickness: 1,color: Color(0xffE7E7E7),),
                  ),
                  SizedBox(height: height*0.01,),




                ],
              ),
            ),

            Padding(
              padding: const EdgeInsets.only(left: 20,right: 20),
              child: Text(
                "Praposals (5)",
                style: GoogleFonts.lato(
                  fontSize: 17,
                  fontWeight: FontWeight.w600,
                  color: const Color(0xff111111),
                ),
              ),
            ),

            Expanded(
              child: ListView.builder(physics: const BouncingScrollPhysics(),
                shrinkWrap: true,
                itemCount: 5,
                itemBuilder: (context, index) {
                  return Card(child:
                  Padding(
                    padding: const EdgeInsets.only(left: 10,top: 15,right: 10,bottom: 15),
                    child: Column(
                      children: [
                        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Atlanta lab",
                              style: GoogleFonts.lato(
                                fontSize: 15,
                                fontWeight: FontWeight.w500,
                                color: const Color(0xff252525),
                              ),
                            ),
                            Text(
                              "AED 500",
                              style: GoogleFonts.lato(
                                fontSize: 15,
                                fontWeight: FontWeight.w500,
                                color: const Color(0xff252525),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: height*0.01,),
                        Row(
                          children: [
                            const Image(
                              height: 16,
                              width: 12,
                              image: AssetImage(
                                "assets/image/locationgrren.png",),fit: BoxFit.fill,),
                            SizedBox(width: width*0.01,),
                            Text(
                              "Ottawa, Canada",
                              style: GoogleFonts.lato(
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                                color: const Color(0xff116D6E),
                              ),
                            ),
                            SizedBox(width: width*0.02,),
                            const Image(
                              height: 16,
                              width: 12,
                              image: AssetImage(
                                "assets/image/call.png",),fit: BoxFit.fill,),
                            SizedBox(width: width*0.01,),
                            Text(
                              "+9675852",
                              style: GoogleFonts.lato(
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                                color: const Color(0xff116D6E),
                              ),
                            ),
                            const Spacer(),
                            Container(
                              width: 70,
                              height: 30,
                              decoration: BoxDecoration(
                                color: const Color(0xff219653),
                                borderRadius: BorderRadius.circular(2),
                              ),
                              child:    Center(
                                child: Text(
                                  "Accept",
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
                        SizedBox(height: height*0.01,),
                        Row(

                          children: [
                            Expanded(
                              child: Container(

                                child: Text(
                                  "Lorem Ipsum has been the industry's standard dummy text ever since",
                                  maxLines: 2, overflow: TextOverflow.ellipsis, softWrap: false,
                                  style: GoogleFonts.lato(
                                    fontSize: 13,
                                    fontWeight: FontWeight.w400,
                                    color: const Color(0xff252525),
                                  ),
                                ),
                              ),
                            ),
                            // Spacer(),
                            Text(
                              "Show Profile",
                              style: GoogleFonts.lato(
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                color: const Color(0xff116D6E),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),);
                },),
            ),
          ],
        ),
      ),
    );
  }
}
