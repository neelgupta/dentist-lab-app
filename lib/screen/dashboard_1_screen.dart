import 'package:dentalapp/screen/add_services_screen.dart';
import 'package:dentalapp/screen/notification_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import '../widget/side_navigation_bar_widget.dart';

class DashBoard1Screen extends StatefulWidget {
  const DashBoard1Screen({Key? key}) : super(key: key);

  @override
  State<DashBoard1Screen> createState() => _DashBoard1ScreenState();
}

class _DashBoard1ScreenState extends State<DashBoard1Screen> {

  bool  isFeedColor = true;
  Color feedSelected = Colors.white;
  Color feedUnselected = Color(0xFFEBEFEE);

  void changeColors() {
    setState(() {
      if (isFeedColor) {
        feedSelected = Colors.white;
        feedUnselected = Color(0xFFEBEFEE);
      } else {
        feedSelected = Color(0xFFEBEFEE);
        feedUnselected = Colors.white;
      }
      isFeedColor = !isFeedColor;
    });
  }

  final GlobalKey<ScaffoldState> _key = GlobalKey();
  void initState() {
    // TODO: implement initState
    super.initState();
    SchedulerBinding.instance.addPostFrameCallback((_) {
    }
    );
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
                                            child: Image(image: AssetImage("assets/image/Menu.png"))),
                                        Spacer(),
                                        InkWell(
                                          onTap: () {
                                            const NotificationScreen();
                                          },
                                            child: Image(image: AssetImage("assets/image/Notification 3.png")))
                                      ],
                                    ),
                                    SizedBox(height: height*0.016,),
                                    Container(
                                      alignment: Alignment.center,
                                      height: height*0.090,
                                      width: width*0.20,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                          color: Color(0xFF116D6E).withOpacity(0.5),
                                          border: Border.all(color: Color(0xFFFFFFFF))
                                      ),
                                      child: Text("N",style: GoogleFonts.lato(color: Colors.white,fontSize: 24,fontWeight: FontWeight.w600)),
                                    ),
                                    SizedBox(height: 15,),
                                    Text("User name",style: GoogleFonts.lato(fontSize: 24,fontWeight: FontWeight.w700,color: Colors.white,)),
                                    SizedBox(height: 8,),
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
                                  color: Color(0xFFEBEFEE),
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
                                        },
                                        child: Container(
                                          alignment: Alignment.center,
                                          decoration: BoxDecoration(
                                            color: feedSelected,
                                            borderRadius: BorderRadius.circular(30),
                                          ),
                                          child: Text("Feeds",style: GoogleFonts.lato(fontSize: 15,fontWeight: FontWeight.w700,color: Color(0xFF116D6E),)),
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: InkWell(
                                        onTap: () {
                                          changeColors();
                                        },
                                        child: Container(
                                          decoration: BoxDecoration(
                                            color:feedUnselected,
                                            borderRadius: BorderRadius.circular(30),
                                          ),
                                          alignment: Alignment.center,
                                          child: Text("Invite",style: GoogleFonts.lato(fontSize: 15,fontWeight: FontWeight.w700,color: Color(0xFF116D6E),)),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(height: height*0.023,),
                            Text("Quote",style: GoogleFonts.lato(fontSize: 16,fontWeight: FontWeight.w600,)),
                            SizedBox(height: height*0.020,),
                            Container(
                              height: height*0.45,
                              width: width,
                              child: ListView.separated(
                                  scrollDirection: Axis.vertical,
                                  itemBuilder: (context, index) {
                                    return Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          children: [
                                            Text("Dr. Emily Williams",style: GoogleFonts.lato(fontSize: 16,fontWeight: FontWeight.w600,)),
                                            Spacer(),
                                            Text("18 Jun 2020",style: GoogleFonts.lato(fontSize: 14,fontWeight: FontWeight.w400,color: Color(0xFFA0A0A0),)),
                                          ],
                                        ),
                                        SizedBox(height: height*0.020,),
                                        Text("Dr. Emily Williams is a highly accomplished and "
                                            "driven senior research scientist at Nexus Research Institute",
                                            style: GoogleFonts.lato(fontSize: 14,fontWeight: FontWeight.w400,color: Color(0xFF707070)),
                                            maxLines: 3,overflow: TextOverflow.ellipsis),
                                        SizedBox(height: height*0.015,),
                                        TextButton(
                                            style: ButtonStyle(
                                              backgroundColor: MaterialStateProperty.all(Color(0xFF116D6E)),
                                              padding: MaterialStateProperty.all(EdgeInsets.symmetric(horizontal: 25,vertical: 12)),
                                              shape: MaterialStateProperty.all(
                                                RoundedRectangleBorder(
                                                  borderRadius: BorderRadius.circular(12),
                                                ),
                                              ),
                                            ),
                                            onPressed: () {
                                              showMyDialog(context);
                                            },
                                            child: Text("Sent Proposal",style: GoogleFonts.lato(fontSize: 14,fontWeight: FontWeight.w600,color: Colors.white,))),
                                        SizedBox(height: height*0.010,),
                                        Divider(thickness: 1,color: Color(0xFFE7E7E7),),
                                      ],
                                    );
                                  },
                                  separatorBuilder: (context, index) {
                                    return SizedBox(height: height*0.010,);
                                  },
                                  itemCount: 4),
                            ),
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
  void showMyDialog(BuildContext context){
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
            title: Container(
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Name",style: GoogleFonts.lato(fontSize: 16,fontWeight: FontWeight.w600,),textAlign: TextAlign.start),
                  SizedBox(height: 10,),
                  Text("Lorem ipsum dolor sit, consecteturamet adipiscing."
                      " Pellentesque tristique elit in nibh ultricies rhoncus.",
                      style: GoogleFonts.lato(fontSize: 14,fontWeight: FontWeight.w400,color: Color(0xFF707070),),
                      maxLines: 3,overflow: TextOverflow.ellipsis,textAlign: TextAlign.start),
                  SizedBox(height: 20,),
                  Container(
                    height: 55,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      border: Border.all(color: Color(0xFF707070)),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 5),
                      child: Row(
                        children: [
                          Text("AED",style: GoogleFonts.lato(fontSize: 15,fontWeight: FontWeight.w500,color: Color(0xFF707070),),),
                          SizedBox(width: 5,),
                          Padding(
                            padding: const EdgeInsets.all(5),
                            child: VerticalDivider(
                              thickness: 1,
                              width: 5,
                              color: Color(0xFF707070),
                            ),
                          ),
                          SizedBox(width: 5,),
                          Expanded(
                            child: Container(
                              child: TextFormField(
                                maxLength: 10,
                                keyboardType: TextInputType.number,
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: "Add Amount",
                                  counterText: "",
                                  contentPadding: EdgeInsets.only(bottom: 8,top: 3,left: 5)
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 20,),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: TextButton(
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(Color(0xFF116D6E)),
                          padding: MaterialStateProperty.all(EdgeInsets.symmetric(horizontal: 30,vertical: 12)),
                          shape: MaterialStateProperty.all(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                        ),
                        onPressed: () {
                           Navigator.push(context, MaterialPageRoute(builder: (context) => AddServicesScreen(),));
                        },
                        child: Text("Sent",style: GoogleFonts.lato(fontSize: 14,fontWeight: FontWeight.w600,color: Colors.white,))),
                  ),
                ],
              ),
            )
        );
      },
    );
  }
}
