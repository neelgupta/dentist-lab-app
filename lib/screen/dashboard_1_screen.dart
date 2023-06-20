import 'dart:convert';

import 'package:dentalapp/screen/notification_screen.dart';
import 'package:dentalapp/services/lab_service/dashboars_feeds.dart';
import 'package:dentalapp/util/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart';
import 'package:intl/intl.dart';
import '../models/lab_getfeeds.dart';
import '../widget/side_navigation_bar_widget.dart';

class DashBoard1Screen extends StatefulWidget {
  const DashBoard1Screen({Key? key}) : super(key: key);

  @override
  State<DashBoard1Screen> createState() => _DashBoard1ScreenState();
}

class _DashBoard1ScreenState extends State<DashBoard1Screen> {
  LabDashBoard feedsData=LabDashBoard();
  LabDashBoard sentProposal=LabDashBoard();
  GetfeedsModel? getfeed;

  List<Quotesdatum> quoteList = [];

  bool  isLoading = true;
  String status = "";

  bool isFeedColor = false;
  Color feedSelected = Colors.white;
  Color feedUnselected = const Color(0xFFEBEFEE);

  TextEditingController addAmountController=TextEditingController();
  bool addAmountStatus = false;
  void changeColors() {
    setState(() {
      if (isFeedColor) {
        feedSelected = Colors.white;
        feedUnselected = const Color(0xFFEBEFEE);
      } else {
        feedSelected = const Color(0xFFEBEFEE);
        feedUnselected = Colors.white;
      }
      isFeedColor = !isFeedColor;
    });
  }

  final GlobalKey<ScaffoldState> _key = GlobalKey();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    SchedulerBinding.instance.addPostFrameCallback((_) {
    }
    );
    getFeeds();

  }




  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        key: _key,
        drawer: const SideNavigationBar(),
          body: SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Stack(
                children: [
                  Column(
                    children: [
                      Column(
                        children: [
                          Container(
                              decoration: const BoxDecoration(
                                  color: Color(0xFF116D6E),
                                  image: DecorationImage(image: AssetImage("assets/image/Group 12305.png"),
                                      fit: BoxFit.fitWidth,alignment: Alignment.bottomCenter,opacity: 0.3)
                              ),
                              child: Padding(
                                padding: EdgeInsets.symmetric(vertical: height*0.03,horizontal: width*0.055),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Row(
                                      children:   [
                                        InkWell(
                                          onTap: () {
                                            _key.currentState!.openDrawer();
                                          },
                                            child: const Image(image: AssetImage("assets/image/Menu.png"))),
                                        const Spacer(),
                                        InkWell(
                                          onTap: () {
                                             Navigator.push(context, MaterialPageRoute(builder: (context) => const NotificationScreen(),));
                                          },
                                            child: const Image(image: AssetImage("assets/image/Notification 3.png")))
                                      ],
                                    ),
                                    SizedBox(height: height*0.016,),
                                    Container(
                                      alignment: Alignment.center,
                                      height: height*0.090,
                                      width: width*0.20,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                          color: const Color(0xFF116D6E).withOpacity(0.5),
                                          border: Border.all(color: const Color(0xFFFFFFFF))
                                      ),
                                      child: Text("N",style: GoogleFonts.lato(color: Colors.white,fontSize: 24,fontWeight: FontWeight.w600)),
                                    ),
                                    const SizedBox(height: 15,),
                                    Text("User name",style: GoogleFonts.lato(fontSize: 24,fontWeight: FontWeight.w700,color: Colors.white,)),
                                    const SizedBox(height: 8,),
                                    Text("Since 1992",style: GoogleFonts.lato(fontSize: 14,fontWeight: FontWeight.w400,color: Colors.white,)),
                                  ],
                                ),
                              )
                          ),
                        ],
                      ),
                      Padding(
                        padding:  EdgeInsets.symmetric(vertical: height*0.030,horizontal: width*0.055),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              height: height*0.065,
                              width: width*0.88,
                              decoration: BoxDecoration(
                                  color: const Color(0xFFEBEFEE),
                                  borderRadius:BorderRadius.circular(30)
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(3),
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: InkWell(
                                        onTap: () {
                                          changeColors();
                                          getFeeds();
                                        },
                                        child: Container(
                                          alignment: Alignment.center,
                                          decoration: BoxDecoration(
                                            color: feedSelected,
                                            borderRadius: BorderRadius.circular(30),
                                          ),
                                          child: Text("Feeds",style: GoogleFonts.lato(fontSize: 15,fontWeight: FontWeight.w700,color: const Color(0xFF116D6E),)),
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: InkWell(
                                        onTap: () {
                                          changeColors();
                                          getFeeds();
                                        },
                                        child: Container(
                                          decoration: BoxDecoration(
                                            color:feedUnselected,
                                            borderRadius: BorderRadius.circular(30),
                                          ),
                                          alignment: Alignment.center,
                                          child: Text("Invite",style: GoogleFonts.lato(fontSize: 15,fontWeight: FontWeight.w700,color: const Color(0xFF116D6E),)),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(height: height*0.023,),
                           isFeedColor ? getfeed != null?Text("Quote (${getfeed!.data!.count?? 0})",style: GoogleFonts.lato(fontSize: 16,fontWeight: FontWeight.w600,)):const SizedBox() :  getfeed != null?Text("Quote (${getfeed!.data!.count?? 0})",style: GoogleFonts.lato(fontSize: 16,fontWeight: FontWeight.w600,)):const SizedBox(),
                            SizedBox(height: height*0.020,),
                           isFeedColor ? quoteList.isNotEmpty?SizedBox(
                              height: height*0.45,
                              width: width,
                              child: isLoading ? Center(child: loader(),): ListView.separated(
                                itemCount: quoteList.length,
                                  scrollDirection: Axis.vertical,

                                  itemBuilder: (context, index) {

                                    return Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          children: [
                                            Text(quoteList[index].title ?? "",style: GoogleFonts.lato(fontSize: 16,fontWeight: FontWeight.w600,)),
                                            const Spacer(),
                                            Text(DateFormat('dd MMMM yyyy').format(quoteList[index].createdAt!),style: GoogleFonts.lato(fontSize: 14,fontWeight: FontWeight.w400,color: const Color(0xFFA0A0A0),)),
                                          ],
                                        ),
                                        SizedBox(height: height*0.020,),
                                        Text(quoteList[index].description ?? "",
                                            style: GoogleFonts.lato(fontSize: 14,fontWeight: FontWeight.w400,color: const Color(0xFF707070)),
                                            maxLines: 3,overflow: TextOverflow.ellipsis),
                                        SizedBox(height: height*0.015,),
                                        TextButton(
                                            style: ButtonStyle(
                                              backgroundColor: MaterialStateProperty.all(const Color(0xFF116D6E)),
                                              padding: MaterialStateProperty.all(const EdgeInsets.symmetric(horizontal: 25,vertical: 12)),
                                              shape: MaterialStateProperty.all(
                                                RoundedRectangleBorder(
                                                  borderRadius: BorderRadius.circular(12),
                                                ),
                                              ),
                                            ),
                                            onPressed: () {
                                              showMyDialog(context: context,titleText: quoteList[index].title.toString(),descText: quoteList[index].description.toString(),quoteId: quoteList[index].id.toString());
                                              setState(() {});
                                            },
                                            child: Text("Sent Proposal",style: GoogleFonts.lato(fontSize: 14,fontWeight: FontWeight.w600,color: Colors.white,))),
                                        SizedBox(height: height*0.010,),
                                        const Divider(thickness: 1,color: Color(0xFFE7E7E7),),
                                      ],
                                    );
                                  },
                                  separatorBuilder: (context, index) {
                                    return SizedBox(height: height*0.010,);
                                  },
                                ),
                            ):const Center(child: Text("No Invite Found!!"),) :
                           quoteList.isNotEmpty?SizedBox(
                             height: height*0.45,
                             width: width,
                             child:  isLoading ? Center(child: loader(),): ListView.separated(
                               itemCount: quoteList.length,
                               scrollDirection: Axis.vertical,

                               itemBuilder: (context, index) {

                                 return Column(
                                   crossAxisAlignment: CrossAxisAlignment.start,
                                   children: [
                                     Row(
                                       children: [
                                         Text(quoteList[index].title ?? "",style: GoogleFonts.lato(fontSize: 16,fontWeight: FontWeight.w600,)),
                                         const Spacer(),
                                         Text(DateFormat('dd MMMM yyyy').format(quoteList[index].createdAt!),style: GoogleFonts.lato(fontSize: 14,fontWeight: FontWeight.w400,color: const Color(0xFFA0A0A0),)),
                                       ],
                                     ),
                                     SizedBox(height: height*0.020,),
                                     Text(quoteList[index].description ?? "",
                                         style: GoogleFonts.lato(fontSize: 14,fontWeight: FontWeight.w400,color: const Color(0xFF707070)),
                                         maxLines: 3,overflow: TextOverflow.ellipsis),
                                     SizedBox(height: height*0.015,),
                                     TextButton(
                                         style: ButtonStyle(
                                           backgroundColor: MaterialStateProperty.all(const Color(0xFF116D6E)),
                                           padding: MaterialStateProperty.all(const EdgeInsets.symmetric(horizontal: 25,vertical: 12)),
                                           shape: MaterialStateProperty.all(
                                             RoundedRectangleBorder(
                                               borderRadius: BorderRadius.circular(12),
                                             ),
                                           ),
                                         ),
                                         onPressed: () {
                                           showMyDialog(context: context,titleText: quoteList[index].title.toString(),descText: quoteList[index].description.toString(),quoteId: quoteList[index].id.toString());
                                           setState(() {});
                                         },
                                         child: Text("Sent Proposal",style: GoogleFonts.lato(fontSize: 14,fontWeight: FontWeight.w600,color: Colors.white,))),
                                     SizedBox(height: height*0.010,),
                                     const Divider(thickness: 1,color: Color(0xFFE7E7E7),),
                                   ],
                                 );
                               },
                               separatorBuilder: (context, index) {
                                 return SizedBox(height: height*0.010,);
                               },
                             ),
                           ): const Center(child: Text("No Feeds Found!!")),
                          ],
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
      ),
    );




  }
  void showMyDialog({
    required String titleText,
    required String descText,
    required String quoteId,
    required BuildContext context,
  }){
    addAmountController.clear();
    status="";
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
            title: Container(
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
              ),
              child: StatefulBuilder(
                builder: (context, setState) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                          titleText, style: GoogleFonts.lato(fontSize: 16,fontWeight: FontWeight.w600,),textAlign: TextAlign.start),
                      const SizedBox(height: 10,),
                      Text(descText, style: GoogleFonts.lato(fontSize: 14,fontWeight: FontWeight.w400,color: const Color(0xFF707070),),
                          maxLines: 3,overflow: TextOverflow.ellipsis,textAlign: TextAlign.start),
                      const SizedBox(height: 20,),
                      Container(
                        height: 55,
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          border: Border.all(color: const Color(0xFF707070)),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 5),
                          child: Row(
                            children: [
                              Text("AED",style: GoogleFonts.lato(fontSize: 15,fontWeight: FontWeight.w500,color: const Color(0xFF707070),),),
                              const SizedBox(width: 5,),
                              const Padding(
                                padding: EdgeInsets.all(5),
                                child: VerticalDivider(
                                  thickness: 1,
                                  width: 5,
                                  color: Color(0xFF707070),
                                ),
                              ),
                              const SizedBox(width: 5,),
                              Expanded(
                                child: TextFormField(
                                  controller: addAmountController,
                                  keyboardType: TextInputType.number,
                                  onChanged: (value) {
                                    setState(() {
                                      addAmountStatus = false;
                                    });
                                  },
                                  decoration: const InputDecoration(
                                      border: InputBorder.none,
                                      hintText: "Add Amount",
                                      counterText: "",
                                      contentPadding: EdgeInsets.only(bottom: 8,top: 3,left: 5)
                                  ),
                                ),
                              ),

                            ],
                          ),
                        ),
                      ),
                      addAmountStatus
                          ? Container(
                        alignment: Alignment.topLeft,
                        height: 30,
                        child: Text(
                          status,
                          style: const TextStyle(
                              fontFamily: 'spartan',
                              fontSize: 12,
                              color: Colors.red),
                        ),
                      )
                          : Container(
                        height: 20,
                      ),

                      Align(
                        alignment: Alignment.bottomCenter,
                        child: TextButton(
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all(const Color(0xFF116D6E)),
                              padding: MaterialStateProperty.all(const EdgeInsets.symmetric(horizontal: 30,vertical: 12)),
                              shape: MaterialStateProperty.all(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                              ),
                            ),
                            onPressed: () {
                              setState(() {
                                if (addAmountController.text.isEmpty) {
                                  addAmountStatus = true;
                                  status = "Please Enter Amount";
                                }
                                else{
                                  getSentProposal(quoteId);
                                }
                              });

                              // Navigator.push(context, MaterialPageRoute(builder: (context) => AddServicesScreen(),));
                            },
                            child: Text("Sent",style: GoogleFonts.lato(fontSize: 14,fontWeight: FontWeight.w600,color: Colors.white,))),
                      ),
                    ],
                  );
                },

              ),
            )
        );
      },
    );
  }

  getFeeds({bool showLoading = true}) async {
    if(showLoading) {
      setState(() {

        quoteList.clear();
        isLoading = true;
      });
    }
    String typeSelected = isFeedColor ? 'invited' :  "empty";
    var body = {
      "type": typeSelected,
    };

    Response response = await feedsData.getFeed(body: body);

    if(response.statusCode == 200) {
      getfeed = GetfeedsModel.fromJson(jsonDecode(response.body));

      quoteList.addAll(getfeed!.data!.quotesdata?? []);

    }
    setState(() {
    isLoading = false;
    });
  }



  getSentProposal(String quoteId) async {
    Utils.showLoadingDialog(context);

    var body = {
      "quoteId":quoteId,
      "amount": addAmountController.text,
    };
    Response response = await sentProposal.sentProposal(body: body);
    Navigator.pop(context);
    if(response.statusCode == 200) {
       addAmountController.text="";
      Navigator.pop(context);
      Utils.showSuccessToast(jsonDecode(response.body)['message']);

    } else {
      Utils.showErrorToast(jsonDecode(response.body)['message']);
    }

  }


}
