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

  bool  isFeedColor = true;
  Color feedSelected = Colors.white;
  Color feedUnselected = const Color(0xFFEBEFEE);

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

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    SchedulerBinding.instance.addPostFrameCallback((_) {
      showMyDialog(context);
      // your dialong goes here
    }
    );
    // showMyDialog(context);
  }
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
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
                                  const Row(
                                    children:   [
                                      Image(image: AssetImage("assets/image/Menu.png")),
                                      Spacer(),
                                      Image(image: AssetImage("assets/image/Notification 3.png"))
                                    ],
                                  ),
                                  const SizedBox(height: 16,),
                                  Container(
                                    alignment: Alignment.center,
                                    height: height*0.090,
                                    width: width*0.20,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(50),
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
                      padding: const EdgeInsets.symmetric(vertical: 30,horizontal: 20),
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
                          const SizedBox(height: 23,),
                          Text("Quote",style: GoogleFonts.lato(fontSize: 16,fontWeight: FontWeight.w600,)),
                          const SizedBox(height: 20,),
                          Row(
                            children: [
                              Text("Surname Name",style: GoogleFonts.lato(fontSize: 16,fontWeight: FontWeight.w600,)),
                              const Spacer(),
                              Text("18 Jun 2022",style: GoogleFonts.lato(fontSize: 14,fontWeight: FontWeight.w400,color: const Color(0xFFA0A0A0),)),
                            ],
                          ),
                          const SizedBox(height: 20,),
                          Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit."
                              " Pellentesque tristique elit in nibh ultricies rhoncus.",
                              style: GoogleFonts.lato(fontSize: 14,fontWeight: FontWeight.w400,color: const Color(0xFF707070)),
                          maxLines: 3,overflow: TextOverflow.ellipsis),
                          const SizedBox(height: 15,),
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
                              showMyDialog(context);
                              },
                              child: Text("View",style: GoogleFonts.lato(fontSize: 14,fontWeight: FontWeight.w600,color: Colors.white,))),
                          const SizedBox(height: 20,),
                          const Divider(thickness: 1,color: Color(0xFFE7E7E7),),
                          const SizedBox(height: 20,),
                          Row(
                            children: [
                              Text("Surname Name",style: GoogleFonts.lato(fontSize: 16,fontWeight: FontWeight.w600,)),
                              const Spacer(),
                              Text("18 Jun 2022",style: GoogleFonts.lato(fontSize: 14,fontWeight: FontWeight.w400,color: const Color(0xFFA0A0A0),)),
                            ],
                          ),
                          const SizedBox(height: 20,),
                          Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit."
                              " Pellentesque tristique elit in nibh ultricies rhoncus.",
                              style: GoogleFonts.lato(fontSize: 14,fontWeight: FontWeight.w400,color: const Color(0xFF707070)),
                              maxLines: 3,overflow: TextOverflow.ellipsis),
                          const SizedBox(height: 15,),
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
              height: height*0.095,
              width: MediaQuery.of(context).size.width,
              decoration: const BoxDecoration(
                color: Color(0xFF116D6E)
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Spacer(),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Image(image: AssetImage("assets/image/Profile 1.png")),
                      const SizedBox(height: 5,),
                      Text("Profile",style: GoogleFonts.lato(fontSize: 13,fontWeight: FontWeight.w500,color: Colors.white,))
                    ],
                  ),
                  const Spacer(),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Image(image: AssetImage("assets/image/Setting.png"),width: 25),
                      const SizedBox(height: 5,),
                      Text("Setting",style: GoogleFonts.lato(fontSize: 13,fontWeight: FontWeight.w500,color: Colors.white,))
                    ],
                  ),
                  const Spacer(),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Image(image: AssetImage("assets/image/category.png")),
                      const SizedBox(height: 5,),
                      Text("Quote",style: GoogleFonts.lato(fontSize: 13,fontWeight: FontWeight.w500,color: Colors.white,))
                    ],
                  ),
                  const Spacer(),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Image(image: AssetImage("assets/image/chart.png"),color: Colors.white),
                      const SizedBox(height: 5,),
                      Text("Dashboard",style: GoogleFonts.lato(fontSize: 13,fontWeight: FontWeight.w500,color: Colors.white,))
                    ],
                  ),
                  const Spacer(),
                ],
              ),
            ),
            Positioned(
              left: width*0.7,
              child: Container(
                height: height*0.081,
                width: width*0.22,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(bottomLeft: Radius.circular(10),bottomRight: Radius.circular(10))
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Image(image: AssetImage("assets/image/chart.png")),
                    const SizedBox(height: 5,),
                    Text("Dashboard",style: GoogleFonts.lato(fontSize: 13,fontWeight: FontWeight.w500,color: const Color(0xFF116D6E),))
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
                  const SizedBox(height: 20,),
                  Text("Lorem ipsum dolor sit, consecteturamet adipiscing."
                      " Pellentesque tristique elit in nibh ultricies rhoncus.",
                      style: GoogleFonts.lato(fontSize: 14,fontWeight: FontWeight.w400,color: const Color(0xFF707070),),
                  maxLines: 3,overflow: TextOverflow.ellipsis,textAlign: TextAlign.center),
                  const SizedBox(height: 30,),
                  TextButton(
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
                        Navigator.push(context, MaterialPageRoute(builder: (context) => const ManageProfile1(),));
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
