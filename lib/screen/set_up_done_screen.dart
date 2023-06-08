import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SetUpDoneScreen extends StatefulWidget {
  const SetUpDoneScreen({Key? key}) : super(key: key);

  @override
  State<SetUpDoneScreen> createState() => _SetUpDoneScreenState();
}

class _SetUpDoneScreenState extends State<SetUpDoneScreen> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width  = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: SizedBox(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                  height: height*0.24,
                  decoration: const BoxDecoration(
                      color: Color(0xFF116D6E),
                      image: DecorationImage(image: AssetImage("assets/image/Group 12305.png"),
                          fit: BoxFit.fitWidth,alignment: Alignment.bottomCenter,opacity: 0.3)
                  ),
                  child: Align(
                      alignment: Alignment.center,
                      child: Column(
                        children: [
                          Container(
                            padding: EdgeInsets.only(left: 15,top: 40),
                            alignment: Alignment.centerLeft,
                            child: InkWell(
                                onTap: () {
                                  Navigator.pop(context);
                                },
                                child: Icon(Icons.keyboard_backspace,color: Colors.white,)),
                          ),
                          SizedBox(height: height*0.05,),
                          Text("Set Up Profile",style: GoogleFonts.lato(fontSize: 32,fontWeight: FontWeight.w600,color: Colors.white,),),
                        ],
                      ))
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: width*0.035,vertical: height*0.027),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children:  [
                    SizedBox(height: height*0.11,),
                    Image(image: AssetImage("assets/image/Group 12680.png")),
                    SizedBox(height: height*0.030,),
                    Text("Congratulations on a successful\nprofile set up",style: GoogleFonts.lato(fontSize: 18,fontWeight: FontWeight.w600 ),textAlign: TextAlign.center),
                    SizedBox(height: height*0.012,),
                    Text("Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
                        style: GoogleFonts.lato(fontSize: 15,fontWeight: FontWeight.w500,
                            color: Color(0xFF707070) ),maxLines: 2,textAlign: TextAlign.center),
                  ],
                ),
              ),
              Spacer(),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: width*0.057,vertical: height*0.020),
                child: Container(
                  height: height*0.064,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: Color(0xFF116D6E)
                  ),
                  child: TextButton(
                      onPressed: () {
                        // Navigator.push(context, MaterialPageRoute(builder: (context) => DashboardScreen(),));
                      },
                      child: Text("Continue",style: GoogleFonts.lato(fontSize: 15,fontWeight: FontWeight.w500,color: Colors.white))),
                ),
              ),
              SizedBox(height: height*0.025,),
            ],
          ),
        ),
      ),
    );
  }
}
