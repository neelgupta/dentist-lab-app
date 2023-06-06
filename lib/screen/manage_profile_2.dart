


import 'package:dentalapp/screen/manage_profile_3.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class ManageProfile2 extends StatefulWidget {
  const ManageProfile2({Key? key}) : super(key: key);

  @override
  State<ManageProfile2> createState() => _ManageProfile2State();
}


class _ManageProfile2State extends State<ManageProfile2> {

  // late File imgFile;
  // final imgPicker = ImagePicker();

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
                            const Image(image: AssetImage("assets/image/left.png"),fit: BoxFit.fill),
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
                        DottedBorder(
                          borderType: BorderType.RRect,
                          dashPattern: [3, 3, 3],
                          radius: Radius.circular(12),
                          color: Color(0xFF116D6E),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(12),
                            child: Container(
                              height: 108,
                              width: MediaQuery.of(context).size.width,
                              color: Color(0xFFF5F7F7),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  InkWell(
                                    onTap: (){
                                    },
                                    child: Container(
                                      height: 42,
                                      width: 42,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(50),
                                        color: Colors.white,
                                        image: DecorationImage(image: AssetImage("assets/image/camera.png"),fit: BoxFit.none)
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 16,),
                                  Text("Upload file",style: GoogleFonts.lato(fontSize: 15,fontWeight: FontWeight.w500,color: Color(0xFF707070)))
                                ],
                              ),
                            ),
                          ),
                        ),
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
                            labelText: 'Trade License Number',
                            hintText: '123456789',
                            counterText: "",
                            hintStyle: const TextStyle(fontSize: 15,fontWeight: FontWeight.w500,color: Color(0xFF707070)),
                            contentPadding: const EdgeInsets.only(left: 18,top: 16,bottom: 16),
                          ),
                        ),
                        const SizedBox(height: 20,),
                        DottedBorder(
                          borderType: BorderType.RRect,
                          dashPattern: [3, 3, 3],
                          radius: Radius.circular(12),
                          color: Color(0xFF116D6E),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(12),
                            child: Container(
                              height: 108,
                              width: MediaQuery.of(context).size.width,
                              color: Color(0xFFF5F7F7),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  InkWell(
                                    onTap: (){
                                    },
                                    child: Container(
                                      height: 42,
                                      width: 42,
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(50),
                                          color: Colors.white,
                                          image: DecorationImage(image: AssetImage("assets/image/camera.png"),fit: BoxFit.none)
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 16,),
                                  Text("Upload file",style: GoogleFonts.lato(fontSize: 15,fontWeight: FontWeight.w500,color: Color(0xFF707070)))
                                ],
                              ),
                            ),
                          ),
                        ),
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
                            labelText: 'TRN Number',
                            hintText: '123456789',
                            counterText: "",
                            hintStyle: const TextStyle(fontSize: 15,fontWeight: FontWeight.w500,color: Color(0xFF707070)),
                            contentPadding: const EdgeInsets.only(left: 18,top: 16,bottom: 16),
                          ),
                        ),
                        const SizedBox(height: 20,),
                        DottedBorder(
                          borderType: BorderType.RRect,
                          dashPattern: [3, 3, 3],
                          radius: Radius.circular(12),
                          color: Color(0xFF116D6E),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(12),
                            child: Container(
                              height: 108,
                              width: MediaQuery.of(context).size.width,
                              color: Color(0xFFF5F7F7),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  InkWell(
                                    onTap: (){
                                    },
                                    child: Container(
                                      height: 42,
                                      width: 42,
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(50),
                                          color: Colors.white,
                                          image: DecorationImage(image: AssetImage("assets/image/camera.png"),fit: BoxFit.none)
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 16,),
                                  Text("Upload file",style: GoogleFonts.lato(fontSize: 15,fontWeight: FontWeight.w500,color: Color(0xFF707070)))
                                ],
                              ),
                            ),
                          ),
                        ),
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
                            labelText: 'Total Number of devices used',
                            hintText: '123456789',
                            counterText: "",
                            hintStyle: const TextStyle(fontSize: 15,fontWeight: FontWeight.w500,color: Color(0xFF707070)),
                            contentPadding: const EdgeInsets.only(left: 18,top: 16,bottom: 16),
                          ),
                        ),
                        const SizedBox(height: 20,),
                        DottedBorder(
                          borderType: BorderType.RRect,
                          dashPattern: [3, 3, 3],
                          radius: Radius.circular(12),
                          color: Color(0xFF116D6E),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(12),
                            child: Container(
                              height: 108,
                              width: MediaQuery.of(context).size.width,
                              color: Color(0xFFF5F7F7),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  InkWell(
                                    onTap: (){
                                    },
                                    child: Container(
                                      height: 42,
                                      width: 42,
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(50),
                                          color: Colors.white,
                                          image: DecorationImage(image: AssetImage("assets/image/camera.png"),fit: BoxFit.none)
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 16,),
                                  Text("Upload List of Devices",style: GoogleFonts.lato(fontSize: 15,fontWeight: FontWeight.w500,color: Color(0xFF707070)))
                                ],
                              ),
                            ),
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
                                Navigator.push(context, MaterialPageRoute(builder: (context) => ManageProfile3(),));
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
        )
    );
  }
}
