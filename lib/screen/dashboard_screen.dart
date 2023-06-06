import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:dentalapp/screen/manage_profile_1.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {

  int selectedIndex = 0;

  Color selected = Colors.white;
  Color unselected = Color(0xFFEBEFEE);
  bool isColor = true;

  void changeColors() {
    setState(() {
      if (isColor) {
        selected = Colors.white;
        unselected = Color(0xFFEBEFEE);
      } else {
        selected = Color(0xFFEBEFEE);
        unselected = Colors.white;
      }

      isColor = !isColor;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    SchedulerBinding.instance?.addPostFrameCallback((_) {
      showMyDialog(context);
      // your dialong goes here
    }
    );
    // showMyDialog(context);
  }
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
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
                            decoration: BoxDecoration(
                                color: Color(0xFF116D6E),
                                image: DecorationImage(image: AssetImage("assets/image/Group 12305.png"),
                                    fit: BoxFit.fitWidth,alignment: Alignment.bottomCenter,opacity: 0.3)
                            ),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(vertical: 20,horizontal: 18),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Row(
                                    children: [
                                      Image(image: AssetImage("assets/image/Menu.png")),
                                      Spacer(),
                                      Image(image: AssetImage("assets/image/Notification 3.png"))
                                    ],
                                  ),
                                  SizedBox(height: 16,),
                                  Container(
                                    alignment: Alignment.center,
                                    height: 80,
                                    width: 80,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(50),
                                      color: const Color(0xFF116D6E).withOpacity(0.5),
                                      border: Border.all(color: Color(0xFFFFFFFF))
                                    ),
                                    child: Text("N",style: GoogleFonts.lato(color: Colors.white,fontSize: 24,fontWeight: FontWeight.w600)),
                                  ),
                                  SizedBox(height: 15,),
                                  Text("User name",style: GoogleFonts.lato(fontSize: 24,fontWeight: FontWeight.w700,color: Colors.white,)),
                                  SizedBox(height: 10,),
                                  Text("Since 1992",style: GoogleFonts.lato(fontSize: 14,fontWeight: FontWeight.w400,color: Colors.white,)),
                                ],
                              ),
                            )
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 30,horizontal: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            height: 50,
                            width: 388,
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
                                          color: selected,
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
                                          color:unselected,
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
                          SizedBox(height: 23,),
                          Text("Quote",style: GoogleFonts.lato(fontSize: 16,fontWeight: FontWeight.w600,)),
                          SizedBox(height: 20,),
                          Row(
                            children: [
                              Text("Surname Name",style: GoogleFonts.lato(fontSize: 16,fontWeight: FontWeight.w600,)),
                              Spacer(),
                              Text("18 Jun 2022",style: GoogleFonts.lato(fontSize: 14,fontWeight: FontWeight.w400,color: Color(0xFFA0A0A0),)),
                            ],
                          ),
                          SizedBox(height: 20,),
                          Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit."
                              " Pellentesque tristique elit in nibh ultricies rhoncus.",
                              style: GoogleFonts.lato(fontSize: 14,fontWeight: FontWeight.w400,color: Color(0xFF707070)),
                          maxLines: 3,overflow: TextOverflow.ellipsis),
                          SizedBox(height: 15,),
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
                              child: Text("View",style: GoogleFonts.lato(fontSize: 14,fontWeight: FontWeight.w600,color: Colors.white,))),
                          SizedBox(height: 20,),
                          Divider(thickness: 1,color: Color(0xFFE7E7E7),),
                          SizedBox(height: 20,),
                          Row(
                            children: [
                              Text("Surname Name",style: GoogleFonts.lato(fontSize: 16,fontWeight: FontWeight.w600,)),
                              Spacer(),
                              Text("18 Jun 2022",style: GoogleFonts.lato(fontSize: 14,fontWeight: FontWeight.w400,color: Color(0xFFA0A0A0),)),
                            ],
                          ),
                          SizedBox(height: 20,),
                          Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit."
                              " Pellentesque tristique elit in nibh ultricies rhoncus.",
                              style: GoogleFonts.lato(fontSize: 14,fontWeight: FontWeight.w400,color: Color(0xFF707070)),
                              maxLines: 3,overflow: TextOverflow.ellipsis),
                          SizedBox(height: 15,),
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
                              },
                              child: Text("View",style: GoogleFonts.lato(fontSize: 14,fontWeight: FontWeight.w600,color: Colors.white,))),

                        ],
                      ),
                    )
                  ],
                ),
                Positioned(
                  top: 70,
                    left: 225,
                    child: Text("Verified",style: GoogleFonts.lato(fontSize: 15,fontWeight: FontWeight.w600,color: Colors.yellow,))),
              ],
            ),
          ),
        ),
        bottomNavigationBar: Stack(
          children: [
            Container(
              height: 80,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: Color(0xFF116D6E)
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Spacer(),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image(image: AssetImage("assets/image/Profile 1.png")),
                      SizedBox(height: 5,),
                      Text("Profile",style: GoogleFonts.lato(fontSize: 13,fontWeight: FontWeight.w500,color: Colors.white,))
                    ],
                  ),
                  Spacer(),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image(image: AssetImage("assets/image/Setting.png")),
                      SizedBox(height: 5,),
                      Text("Setting",style: GoogleFonts.lato(fontSize: 13,fontWeight: FontWeight.w500,color: Colors.white,))
                    ],
                  ),
                  Spacer(),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image(image: AssetImage("assets/image/category.png")),
                      SizedBox(height: 5,),
                      Text("Quote",style: GoogleFonts.lato(fontSize: 13,fontWeight: FontWeight.w500,color: Colors.white,))
                    ],
                  ),
                  Spacer(),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image(image: AssetImage("assets/image/chart.png"),color: Colors.white),
                      SizedBox(height: 5,),
                      Text("Dashboard",style: GoogleFonts.lato(fontSize: 13,fontWeight: FontWeight.w500,color: Colors.white,))
                    ],
                  ),
                  Spacer(),
                ],
              ),
            ),
            Positioned(
              left: 280,
              child: Container(
                height: 65,
                width: 77,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(bottomLeft: Radius.circular(10),bottomRight: Radius.circular(10))
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image(image: AssetImage("assets/image/chart.png")),
                    SizedBox(height: 5,),
                    Text("Dashboard",style: GoogleFonts.lato(fontSize: 13,fontWeight: FontWeight.w500,color: Color(0xFF116D6E),))
                  ],
                ),
              ),
            )
          ],
        )
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
              borderRadius: BorderRadius.circular(12),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text("Set up your profile with in 6 steps",style: GoogleFonts.lato(fontSize: 18,fontWeight: FontWeight.w600,),textAlign: TextAlign.center),
                  SizedBox(height: 20,),
                  Text("Lorem ipsum dolor sit, consecteturamet adipiscing."
                      " Pellentesque tristique elit in nibh ultricies rhoncus.",
                      style: GoogleFonts.lato(fontSize: 14,fontWeight: FontWeight.w400,color: Color(0xFF707070),),
                  maxLines: 3,overflow: TextOverflow.ellipsis,textAlign: TextAlign.center),
                  SizedBox(height: 30,),
                  TextButton(
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
                        Navigator.push(context, MaterialPageRoute(builder: (context) => ManageProfile1(),));
                      },
                      child: Text("Start Setup",style: GoogleFonts.lato(fontSize: 14,fontWeight: FontWeight.w600,color: Colors.white,))),
                ],
              ),
            ),
          )
      );
    },
  );
}
}
