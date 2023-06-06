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
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: SizedBox(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Stack(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                      height: 190,
                      decoration: BoxDecoration(
                          color: Color(0xFF116D6E),
                          image: DecorationImage(image: AssetImage("assets/image/Group 12305.png"),
                              fit: BoxFit.fitWidth,alignment: Alignment.bottomCenter,opacity: 0.3)
                      ),
                      child: Align(
                          alignment: Alignment.center,
                          child: Column(
                            children: [
                              SizedBox(height: 100,),
                              Text("Setup Profile",style: GoogleFonts.lato(fontSize: 32,fontWeight: FontWeight.w600,color: Colors.white,),),
                            ],
                          ))
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children:  [
                        SizedBox(height: 110,),
                        Image(image: AssetImage("assets/image/Group 12680.png")),
                        SizedBox(height: 30,),
                        Text("Congratulations on a successful\nprofile set up",style: GoogleFonts.lato(fontSize: 19,fontWeight: FontWeight.w600 ),textAlign: TextAlign.center),
                        SizedBox(height: 10,),
                        Text("Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
                            style: GoogleFonts.lato(fontSize: 17,fontWeight: FontWeight.w500,
                                color: Color(0xFF707070) ),maxLines: 2,textAlign: TextAlign.center),
                      ],
                    ),
                  ),
                  Spacer(),
                  Padding(
                    padding: const EdgeInsets.only(top: 20,left: 20,right: 20),
                    child: Container(
                      height: 50,
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
                  SizedBox(height: 50,),
                ],
              ),
              Positioned(
                  top: 45,
                  left: 12,
                  child: InkWell(
                      onTap: () {
                        // Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => EmailVerificationScreen(),));
                      },
                      child: Icon(Icons.keyboard_backspace,color: Colors.white,)))
            ],
          ),
        ),
      ),
    );
  }
}
