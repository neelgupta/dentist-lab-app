import 'package:dentalapp/clinic_screen/setup_screen/sucessfulsetup_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfileSetUpSecondScreen extends StatefulWidget {
  const ProfileSetUpSecondScreen({Key? key}) : super(key: key);

  @override
  State<ProfileSetUpSecondScreen> createState() => _ProfileSetUpSecondScreenState();
}

class _ProfileSetUpSecondScreenState extends State<ProfileSetUpSecondScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child:Scaffold(
          resizeToAvoidBottomInset: true,
          body: SizedBox(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                children: [
                  Container(
                    height: 250,
                    width: MediaQuery.of(context).size.width,
                    decoration: const BoxDecoration(
                        image: DecorationImage(image: AssetImage("assets/image/01.png"),fit: BoxFit.fill)
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          children: [
                            const SizedBox(width: 20,),
                             GestureDetector(onTap: (){
                               setState(() {
                                 Navigator.pop(context);
                               });
                               },
                                 child: Image(image: AssetImage("assets/image/left.png"),fit: BoxFit.fill)),
                          ],
                        ),
                        const SizedBox(height: 20,),
                        Align(
                          alignment: Alignment.center,
                          child: Container(
                            alignment: Alignment.center,
                            height: 80,
                            width: 80,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50),
                                border: Border.all(color: Colors.white,width: 1),
                                image: const DecorationImage(image: AssetImage("assets/image/Ellipse 108.png"),fit: BoxFit.fill)
                            ),
                            child: Text("N",style: GoogleFonts.lato(fontSize: 24,fontWeight: FontWeight.w600,color: Colors.white),),
                          ),
                        ),

                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 10,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("2/",style: GoogleFonts.lato(fontSize: 17,fontWeight: FontWeight.w600),),
                            Text("6",style: GoogleFonts.lato(fontSize: 17,fontWeight: FontWeight.w600,color: const Color(0xFFA0A0A0)),),
                          ],
                        ),
                        const SizedBox(height: 20,),
                        Text("Additional",style: GoogleFonts.lato(fontSize: 19,fontWeight: FontWeight.w600),),
                        const SizedBox(height: 20,),
                        TextFormField(
                          maxLength: 10,
                          textInputAction: TextInputAction.next,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                                borderSide: const BorderSide(color: Color(0xFF707070))
                            ),
                            labelText: 'Medical License Number',
                            hintText: '123456789',
                            counterText: "",
                            hintStyle: const TextStyle(fontSize: 15,fontWeight: FontWeight.w500,color: Color(0xFF707070)),
                            contentPadding: const EdgeInsets.only(left: 18,top: 16,bottom: 16),
                          ),
                        ),
                        const SizedBox(height: 20,),
                        Container(
                          height: 108,
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),

                          ),
                        ),
                        const SizedBox(height: 30,),
                        Container(
                          height: 50,
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              color: const Color(0xFFA0A0A0)
                          ),
                          child: TextButton(
                              onPressed: () {
                                Navigator.push(context, MaterialPageRoute(builder: (context) {
                                  return SuccessfulProfileSetUp();
                                },));
                              },
                              child: Text("Continue",style: GoogleFonts.lato(fontSize: 15,fontWeight: FontWeight.w500,color: Colors.white))),
                        ),
                        const SizedBox(height: 40,),
                      ],),
                  )
                ],
              ),
            ),
          ),
        ));
  }
}
