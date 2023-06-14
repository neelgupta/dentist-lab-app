import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Item {
  String name;
  String description;

  Item({required this.name, required this.description});
}

class AcceptedQuoteDetailsScreen extends StatefulWidget {
  const AcceptedQuoteDetailsScreen({Key? key}) : super(key: key);

  @override
  State<AcceptedQuoteDetailsScreen> createState() => _AcceptedQuoteDetailsScreenState();
}

class _AcceptedQuoteDetailsScreenState extends State<AcceptedQuoteDetailsScreen> {

   List<Item> detailsList = [];
  String titleComment = "";
  String description = "";

  bool isCommentVisible= false;
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  void showComment() {
    setState(() {
      isCommentVisible = !isCommentVisible;
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
                            Text("Quote Detail",style: GoogleFonts.lato(fontSize: 30,fontWeight: FontWeight.w600,color: Colors.white,)),
                            Spacer(),
                            SizedBox(height: height*0.050,width: width*0.050),
                          ],
                        ),
                      )
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
                                Text("Dental Crowns and Bridges",style: GoogleFonts.lato(fontSize: 16,fontWeight: FontWeight.w600 )),
                                Spacer(),
                                Container(
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                        color: Color(0xFF414141),
                                        borderRadius: BorderRadius.circular(5)
                                    ),
                                    child: Padding(
                                      padding: EdgeInsets.symmetric(vertical: height*0.0061,horizontal: width*0.025),
                                      child: Text("Delivery Rejected",style: GoogleFonts.lato(fontSize: 11,fontWeight: FontWeight.w400,color: Colors.white)),
                                    ))
                              ],
                            ),
                            SizedBox(height: height*0.010,),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Container(
                                  width: width*0.7,
                                  child: Text("Lorem Ipsum has been the industry's standard dummy text ever since",
                                      style: GoogleFonts.lato(fontSize: 13,fontWeight: FontWeight.w400,),maxLines: 2,overflow: TextOverflow.ellipsis),
                                ),
                                SizedBox(width: width*0.020,),

                              ],
                            ),
                            SizedBox(height: height*0.020,),
                            Divider(
                              thickness: 1,
                              color: Color(0xFFE7E7E7),
                            ),
                            SizedBox(height: height*0.020,),
                            Row(
                              children: [
                                Text("Subtotal :",style: GoogleFonts.lato(fontSize: 15,fontWeight: FontWeight.w500,color: Color(0xFF707070))),
                                Spacer(),
                                Text("AED 500",style: GoogleFonts.lato(fontSize: 15,fontWeight: FontWeight.w500,color: Color(0xFF252525))),

                              ],
                            ),
                            SizedBox(height: height*0.020,),
                            Row(
                              children: [
                                Text("Advance 30% (Paid)",style: GoogleFonts.lato(fontSize: 15,fontWeight: FontWeight.w500,color: Color(0xFF707070))),
                                Spacer(),
                                Text("AED 75",style: GoogleFonts.lato(fontSize: 15,fontWeight: FontWeight.w500,color: Color(0xFF252525))),
                              ],
                            ),
                            SizedBox(height: height*0.020,),
                            Row(
                              children: [
                                Text("Priority :",style: GoogleFonts.lato(fontSize: 15,fontWeight: FontWeight.w500,color: Color(0xFF707070))),
                                Spacer(),
                                Container(
                                  decoration: BoxDecoration(
                                    color: Color(0xFF707070),
                                    borderRadius: BorderRadius.circular(5)
                                  ),
                                    child: Padding(
                                      padding: EdgeInsets.symmetric(horizontal: width*0.05,vertical: height*0.006),
                                      child: Text("Normal",style: GoogleFonts.lato(fontSize: 13,fontWeight: FontWeight.w500,color: Colors.white)),
                                    )),
                              ],
                            ),
                            SizedBox(height: height*0.022,),
                            Row(
                              children: [
                                Text("Clinic Name ",style: GoogleFonts.lato(fontSize: 15,fontWeight: FontWeight.w600,)),
                                Spacer(),
                                Text("Apt 30",style: GoogleFonts.lato(fontSize: 15,fontWeight: FontWeight.w600,)),
                              ],
                            ),
                            SizedBox(height: height*0.020,),
                            Row(
                              children: [
                                Row(
                                  children: [
                                    Image(image: AssetImage("assets/image/finalLocation.png")),
                                    SizedBox(width: width*0.015,),
                                    Text("Ottawa, Canada",style: GoogleFonts.lato(fontSize: 12,fontWeight: FontWeight.w400,color: Color(0xFF116D6E))),
                                  ],
                                ),
                                SizedBox(width: width*0.030,),
                                Row(
                                  children: [
                                    Image(image: AssetImage("assets/image/phone.png")),
                                    SizedBox(width: width*0.015,),
                                    Text("+9675852",style: GoogleFonts.lato(fontSize: 12,fontWeight: FontWeight.w400,color: Color(0xFF116D6E))),
                                  ],
                                )
                              ],
                            ),
                            SizedBox(height: height*0.020,),
                            Text("Toronto. DE 63324",style: GoogleFonts.lato(fontSize: 15,fontWeight: FontWeight.w500,color: Color(0xFF252525))),
                            isCommentVisible ? SizedBox(height: height*0.022,) : SizedBox(height: height*0.2,),
                            Container(
                              height: height*0.064,
                              width: MediaQuery.of(context).size.width,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12),
                                  color: Color(0xFF116D6E)
                              ),
                              child: TextButton(
                                  onPressed: () {
                                    showCommentBox(context);
                                    // Navigator.push(context, MaterialPageRoute(builder: (context) => DashboardScreen(),));
                                  },
                                  child: Text("Share Comment",style: GoogleFonts.lato(fontSize: 15,fontWeight: FontWeight.w500,color: Colors.white))),
                            ),
                            SizedBox(height: height*0.025,),
                            InkWell(
                              onTap: () {
                                showComment();
                              },
                              child: Row(
                                children: [
                                  Text("Comments",style: GoogleFonts.lato(fontSize: 18,fontWeight: FontWeight.w600 )),
                                  Spacer(),
                                  !isCommentVisible ? Icon(Icons.expand_more_rounded) : Icon(Icons.expand_less_rounded)
                                ],
                              ),
                            ),
                            SizedBox(height: height*0.010,),
                            Visibility(
                              visible: isCommentVisible,
                              child: Container(
                                width: width,
                                height: height*0.5,
                                child: ListView.separated(
                                  scrollDirection: Axis.vertical,
                                    itemBuilder: (context, index) {
                                      return Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Divider(
                                            thickness: 1,
                                            color: Color(0xFFE7E7E7),
                                          ),
                                          SizedBox(height: height*0.010,),
                                          Text("${detailsList[index].name}",style: GoogleFonts.lato(fontSize: 15,fontWeight: FontWeight.w700 )),
                                          SizedBox(height: height*0.010,),
                                          Row(
                                            crossAxisAlignment: CrossAxisAlignment.end,
                                            children: [
                                              Container(
                                                width: width*0.7,
                                                child: Text("${detailsList[index].description}",
                                                    style: GoogleFonts.lato(fontSize: 13,fontWeight: FontWeight.w400,),maxLines: 2,overflow: TextOverflow.ellipsis),
                                              ),
                                              SizedBox(width: width*0.020,),
                                            ],
                                          ),
                                          SizedBox(height: height*0.010,),
                                        ],
                                      );
                                    },
                                    separatorBuilder: (context, index) {
                                      return SizedBox(height: height*0.010,);
                                    },
                                    itemCount: detailsList.length),
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
  void showCommentBox(BuildContext context){
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
            title: Container(
              height: height*0.3,
              width: width,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
              ),
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.only(left: width*0.030),
                    decoration: BoxDecoration(
                      border: Border.all(color: Color(0xFF707070)),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: TextFormField(
                      onChanged: (value) {
                        setState(() {
                          titleComment = value;
                        });
                      },
                      controller: titleController,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Name",
                      ),
                    ),
                  ),
                  SizedBox(height: height*0.015,),
                  Container(
                    padding: EdgeInsets.only(left: width*0.030),
                    decoration: BoxDecoration(
                      border: Border.all(color: Color(0xFF707070)),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: TextFormField(
                      onChanged: (value) {
                        setState(() {
                          description = value;
                        });
                      },
                      controller: descriptionController,
                      maxLines: 3,
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "Comment"
                      ),
                    ),
                  ),
                  Spacer(),
                  TextButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(const Color(0xFF116D6E)),
                        padding: MaterialStateProperty.all( EdgeInsets.symmetric(horizontal: width*0.09,vertical: height*0.018)),
                        shape: MaterialStateProperty.all(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                      ),
                      onPressed: () {
                        detailsList.add(Item(name: titleComment, description: description));
                        Navigator.pop(context);
                        showComment();
                      },
                      child: Text("Share Comment",style: GoogleFonts.lato(fontSize: 14,fontWeight: FontWeight.w600,color: Colors.white,))),
                ],
              ),
            )
        );
      },
    );
  }
}

