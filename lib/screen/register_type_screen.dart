import 'package:dentalapp/screen/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class RegisterTypeScreen extends StatefulWidget {
  const RegisterTypeScreen({Key? key}) : super(key: key);

  @override
  State<RegisterTypeScreen> createState() => _RegisterTypeScreenState();
}

class _RegisterTypeScreenState extends State<RegisterTypeScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  String select = "Clinic";

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        body: SizedBox(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Column(
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
                        Text("Logo",style:GoogleFonts.lato(fontSize: 45,fontWeight: FontWeight.w600,color: Colors.white)),
                      ],
                    )),
              ),
              Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: [
                    SizedBox(height: 10,),
                    Container(
                      height: 50,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                          border: Border.all(color: Color(0xFF707070)),
                          borderRadius:BorderRadius.circular(12)
                      ),
                      child: Row(
                        children: [
                          Radio(
                            value: 'Lab',
                            activeColor: Color(0xFF116D6E),
                            groupValue: select,
                            onChanged: (value) {
                              setState(() {
                                select = value!;
                              });
                            },
                          ),
                          Text("Lab",style: GoogleFonts.lato(fontSize: 15,fontWeight: FontWeight.w500,color: Color(0xFF707070))),
                        ],
                      ),
                    ),
                    SizedBox(height: 20,),
                    Container(
                      height: 50,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                          border: Border.all(color: Color(0xFF707070)),
                          borderRadius:BorderRadius.circular(12)
                      ),
                      child: Row(
                        children: [
                          Radio(
                            value: "Clinic",
                            activeColor: Color(0xFF116D6E),
                            groupValue: select,
                            onChanged: (value) {
                              setState(() {
                                select = value!;
                              });
                            },
                          ),
                          Text("Clinic",style: GoogleFonts.lato(fontSize: 15,fontWeight: FontWeight.w500,color: Color(0xFF707070))),
                        ],
                      ),
                    ),
                    SizedBox(height: 20,),
                    Container(
                      height: 50,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                          border: Border.all(color: Color(0xFF707070)),
                          borderRadius:BorderRadius.circular(12)
                      ),
                      child: Row(
                        children: [
                          Radio(
                            value: "Dentist",
                            activeColor: Color(0xFF116D6E),
                            groupValue: select,
                            onChanged: (value) {
                              setState(() {
                                select = value!;
                              });
                            },
                          ),
                          Text("Dentist",style: GoogleFonts.lato(fontSize: 15,fontWeight: FontWeight.w500,color: Color(0xFF707070))),
                        ],
                      ),
                    ),

                  ],
                ),
              ),
              Spacer(),
              Padding(
                padding: const EdgeInsets.only(bottom: 50,top: 20,left: 20,right: 20),
                child: Container(
                  height: 50,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: Color(0xFF116D6E)
                  ),
                  child: TextButton(
                      onPressed: () {
                        Navigator.push(context,
                        MaterialPageRoute(builder: (context) => LoginScreen(),));
                      },
                      child: Text("Continue",style: GoogleFonts.lato(fontSize: 15,fontWeight: FontWeight.w500,color: Colors.white))),
                ),
              )

            ],
          ),
        ),
      ),
    );
  }
}
