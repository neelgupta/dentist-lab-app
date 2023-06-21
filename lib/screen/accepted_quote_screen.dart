import 'dart:convert';
import 'package:dentalapp/services/lab_service/lab_quote_service.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart';
import '../models/lab_all_quote_model.dart';
import '../util/utils.dart';
import 'acceptedquote_details_screen.dart';

class AcceptedQuoteScreen extends StatefulWidget {
  const AcceptedQuoteScreen({Key? key}) : super(key: key);

  @override
  State<AcceptedQuoteScreen> createState() => _AcceptedQuoteScreenState();
}

class _AcceptedQuoteScreenState extends State<AcceptedQuoteScreen> {

  bool isLoading = true;
  bool accepted = true;
  bool completed = false;

  List<Quotedatum> labQuoteList = [];
  LabQuoteStatus ? labQuoteStatus;

  getQuoteType() {
    if(accepted) {
      return "Accepted";
    } else if(completed) {
      return "Completed";
    }
  }
  changeQuoteType(type) {
    setState(() {
      accepted = false;
      completed = false;
      if(type == "Accepted") {
        accepted = true;
      } else if(type == "Completed") {
        completed = true;
      }
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getLabQuoteData();
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
                    decoration: const BoxDecoration(
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
                              changeQuoteType("Accepted");
                              getLabQuoteData();
                            },
                            child: Container(
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                color: accepted ? Colors.white : Color(0xFFEBEFEE),
                                borderRadius: BorderRadius.circular(11),
                              ),
                              child: accepted ? Text("Accepted",style: GoogleFonts.lato(fontSize: 15,fontWeight: FontWeight.w700,color: Color(0xFF116D6E),))
                                  : Text("Accepted",style: GoogleFonts.lato(fontSize: 15,fontWeight: FontWeight.w700))
                            ),
                          ),
                        ),
                        Expanded(
                          child: InkWell(
                            onTap: () {
                                changeQuoteType("Completed");
                                getLabQuoteData();
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                color: completed ? Colors.white : Color(0xFFEBEFEE),
                                borderRadius: BorderRadius.circular(11),
                              ),
                              alignment: Alignment.center,
                                child: completed ? Text("Completed",style: GoogleFonts.lato(fontSize: 15,fontWeight: FontWeight.w700,color: Color(0xFF116D6E),))
                                    : Text("Completed",style: GoogleFonts.lato(fontSize: 15,fontWeight: FontWeight.w700))
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(height: height*0.016,),
                Container(
                  height: height,
                  child: !isLoading? ListView.separated(
                      physics: const BouncingScrollPhysics(),
                      itemBuilder: (context, index) {
                        return  Padding(
                          padding: EdgeInsets.symmetric(horizontal: width*0.055),
                          child: InkWell(
                            onTap: () {
                              Navigator.push(context, MaterialPageRoute(builder:
                                  (context) => AcceptedQuoteDetailsScreen(quoteId:labQuoteList[index].id!),));
                              },
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(height: height*0.01,),
                                Row(
                                  children: [
                                         Text("${labQuoteList[index].title}"
                                        ,style: GoogleFonts.lato(fontSize: 17,fontWeight: FontWeight.w600 )),
                                    Spacer(),
                                    if(labQuoteList[index].priority=="urgent")
                                    Container(
                                      alignment: Alignment.center,
                                      height: height*0.031,
                                      width: width*0.17,
                                      decoration: BoxDecoration(
                                          color: Color(0xFFFF5959),
                                          borderRadius: BorderRadius.circular(15)
                                      ),
                                      child: Text("Urgent",style: GoogleFonts.lato(fontSize: 12,fontWeight: FontWeight.w600,color: Colors.white)),
                                    ),
                                    if(labQuoteList[index].priority=="normal")
                                      SizedBox(),
                                  ],
                                ),
                                SizedBox(height: height*0.010,),
                                Row(
                                  children: [
                                    Text("${labQuoteList[index].serviceDetails![0].title}",style: GoogleFonts.lato(fontSize: 14,fontWeight: FontWeight.w400,color: Color(0xFF116D6E) )),
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
                                        child: Text("${labQuoteList[index].description}",
                                            style: GoogleFonts.lato(fontSize: 13,fontWeight: FontWeight.w400,),maxLines: 2,overflow: TextOverflow.ellipsis),
                                      ),
                                    ),
                                    SizedBox(width: width*0.020,),
                                    if(labQuoteList[index].quoteStatus![0].labStatus=="deliveryRejected")
                                      Container(
                                        alignment: Alignment.center,
                                        decoration: BoxDecoration(
                                            color: Color(0xFF414141),
                                            borderRadius: BorderRadius.circular(5)
                                        ),
                                        child: Padding(
                                          padding: EdgeInsets.symmetric(vertical: height*0.0065,horizontal: width*0.032),
                                          child: Text("${labQuoteList[index].quoteStatus![0].labStatus}",style: GoogleFonts.lato(fontSize: 12,fontWeight: FontWeight.w400,color: Colors.white)),
                                        )),
                                    if(labQuoteList[index].quoteStatus![0].labStatus=="workStarted")
                                      Container(
                                          alignment: Alignment.center,
                                          decoration: BoxDecoration(
                                              color: Color(0xFFFFD059),
                                              borderRadius: BorderRadius.circular(5)
                                          ),
                                          child: Padding(
                                            padding: EdgeInsets.symmetric(vertical: height*0.0065,horizontal: width*0.032),
                                            child: Text("${labQuoteList[index].quoteStatus![0].labStatus}",style: GoogleFonts.lato(fontSize: 12,fontWeight: FontWeight.w400)),
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
                          ),
                        );
                      },
                      separatorBuilder: (context, index) {
                        return SizedBox(height: height*0.0,);
                      },
                       itemCount: labQuoteList.length) :
                  Center(child: loader()),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  getLabQuoteData({bool showLoading = true}) async {
    if(showLoading) {
      setState(() {
        labQuoteList.clear();
        isLoading = true;
      });
    }
    String type = getQuoteType();
    var body = {
       "type": type
    };
    Response response = await GetLabQuote.getQuotes(body: body);

    if(response.statusCode==200) {
      LabQuoteStatus labQuoteStatus = LabQuoteStatus.fromJson(jsonDecode(response.body));

      if(labQuoteStatus.success == true && labQuoteStatus.data != null){
        labQuoteList.addAll(labQuoteStatus!.data!.quotedata ?? []);
      }
    }
    if(showLoading) {
      setState(() {
        isLoading = false;
      });
    }
  }

}