import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'manage_profile_4.dart';

class ManageProfile3 extends StatefulWidget {
  const ManageProfile3({Key? key}) : super(key: key);

  @override
  State<ManageProfile3> createState() => _ManageProfile3State();
}

class _ManageProfile3State extends State<ManageProfile3> {

  TextEditingController labManagerNameController = TextEditingController();
  TextEditingController labManagerNumberController = TextEditingController();
  TextEditingController labManagerEmailController = TextEditingController();
  TextEditingController technicalManagerNameController = TextEditingController();
  TextEditingController technicalManagerNumberController = TextEditingController();
  TextEditingController technicalManagerEmailController = TextEditingController();
  TextEditingController technicalManagerLicenseController = TextEditingController();
  TextEditingController financialManagerNameController = TextEditingController();
  TextEditingController financialManagerNumberController = TextEditingController();
  TextEditingController financialManagerEmailController = TextEditingController();
  TextEditingController totalTechnicianController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width  = MediaQuery.of(context).size.width;
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
                    height: height*0.25,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                        image: DecorationImage(image: AssetImage("assets/image/01.png"),fit: BoxFit.fill)
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          children: [
                            SizedBox(width: 20,),
                            InkWell(
                                onTap: () {
                                  Navigator.pop(context);
                                },
                                child: Image(image: AssetImage("assets/image/left.png"),fit: BoxFit.fill)),
                          ],
                        ),
                        SizedBox(height: 20,),
                        Align(
                          alignment: Alignment.center,
                          child: Container(
                            alignment: Alignment.center,
                            height: 70,
                            width: 70,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50),
                                border: Border.all(color: Colors.white,width: 1),
                                image: DecorationImage(image: AssetImage("assets/image/Ellipse 108.png"),fit: BoxFit.fill)
                            ),
                            child: Text("N",style: GoogleFonts.lato(fontSize: 24,fontWeight: FontWeight.w600,color: Colors.white),),
                          ),
                        ),

                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: width*0.057,vertical: height*0.027),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 8,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("3/",style: GoogleFonts.lato(fontSize: 17,fontWeight: FontWeight.w600),),
                            Text("6",style: GoogleFonts.lato(fontSize: 17,fontWeight: FontWeight.w600,color: Color(0xFFA0A0A0)),),
                          ],
                        ),
                        SizedBox(height: 15,),
                        Text("Lab Manager Details",style: GoogleFonts.lato(fontSize: 19,fontWeight: FontWeight.w600),),
                        SizedBox(height: 20,),
                        TextFormField(
                          textInputAction: TextInputAction.next,
                          controller: labManagerNameController,
                          keyboardType: TextInputType.name,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                                borderSide: BorderSide(color: Color(0xFF707070))
                            ),
                            labelText: 'Lab Manager Name',
                            hintText: 'Manager Name',
                            hintStyle: TextStyle(fontSize: 15,fontWeight: FontWeight.w500,color: Color(0xFF707070)),
                            contentPadding: EdgeInsets.only(left: 18,top: 16,bottom: 16),
                          ),
                        ),
                        SizedBox(height: 20,),
                        TextFormField(
                          maxLength: 10,
                          controller: labManagerNumberController,
                          textInputAction: TextInputAction.next,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                                borderSide: BorderSide(color: Color(0xFF707070))
                            ),
                            labelText: 'Contact Number',
                            hintText: '123456789',
                            counterText: "",
                            hintStyle: TextStyle(fontSize: 15,fontWeight: FontWeight.w500,color: Color(0xFF707070)),
                            contentPadding: EdgeInsets.only(left: 18,top: 16,bottom: 16),
                          ),
                        ),
                        SizedBox(height: 20,),
                        TextFormField(
                          textInputAction: TextInputAction.next,
                          controller: labManagerEmailController,
                          keyboardType: TextInputType.emailAddress,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                                borderSide: BorderSide(color: Color(0xFF707070))
                            ),
                            labelText: 'Email Address',
                            hintText: 'user@gmail.com',
                            hintStyle: TextStyle(fontSize: 15,fontWeight: FontWeight.w500,color: Color(0xFF707070)),
                            contentPadding: EdgeInsets.only(left: 18,top: 16,bottom: 16),
                          ),
                        ),
                        SizedBox(height: 20,),
                        Divider(
                          color: Color(0xFFE7E7E7),
                          thickness: 1,
                        ),
                        SizedBox(height: 20,),
                        Text("Technical Manager Details",style: GoogleFonts.lato(fontSize: 19,fontWeight: FontWeight.w600),),
                        SizedBox(height: 20,),
                        TextFormField(
                          maxLength: 10,
                          controller: technicalManagerNameController,
                          keyboardType: TextInputType.name,
                          textInputAction: TextInputAction.next,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                                borderSide: BorderSide(color: Color(0xFF707070))
                            ),
                            labelText: 'Technical Manager Name',
                            hintText: 'Manager Name',
                            counterText: "",
                            hintStyle: TextStyle(fontSize: 15,fontWeight: FontWeight.w500,color: Color(0xFF707070)),
                            contentPadding: EdgeInsets.only(left: 18,top: 16,bottom: 16),
                          ),
                        ),
                        SizedBox(height: 20,),
                        TextFormField(
                          maxLength: 10,
                          controller: technicalManagerNumberController,
                          textInputAction: TextInputAction.next,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                                borderSide: BorderSide(color: Color(0xFF707070))
                            ),
                            labelText: 'Contact Number',
                            hintText: '12345 67890',
                            counterText: "",
                            hintStyle: TextStyle(fontSize: 15,fontWeight: FontWeight.w500,color: Color(0xFF707070)),
                            contentPadding: EdgeInsets.only(left: 18,top: 16,bottom: 16),
                          ),
                        ),
                        SizedBox(height: 20,),
                        TextFormField(
                          textInputAction: TextInputAction.next,
                          controller: technicalManagerEmailController,
                          keyboardType: TextInputType.emailAddress,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                                borderSide: BorderSide(color: Color(0xFF707070))
                            ),
                            labelText: 'Email Address',
                            hintText: 'user@gmail.com',
                            hintStyle: TextStyle(fontSize: 15,fontWeight: FontWeight.w500,color: Color(0xFF707070)),
                            contentPadding: EdgeInsets.only(left: 18,top: 16,bottom: 16),
                          ),
                        ),
                        SizedBox(height: 20,),
                        TextFormField(
                          maxLength: 17,
                          controller: technicalManagerLicenseController,
                          textInputAction: TextInputAction.next,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                                borderSide: BorderSide(color: Color(0xFF707070))
                            ),
                            labelText: 'License Number',
                            hintText: '12345 67890',
                            counterText: "",
                            hintStyle: TextStyle(fontSize: 15,fontWeight: FontWeight.w500,color: Color(0xFF707070)),
                            contentPadding: EdgeInsets.only(left: 18,top: 16,bottom: 16),
                          ),
                        ),
                        SizedBox(height: 20,),
                        DottedBorder(
                          borderType: BorderType.RRect,
                          dashPattern: [3, 3, 3],
                          radius: Radius.circular(12),
                          color: Color(0xFF116D6E),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(12),
                            child: Container(
                              height: 100,
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
                                  Text("Upload File",style: GoogleFonts.lato(fontSize: 15,fontWeight: FontWeight.w500,color: Color(0xFF707070)))
                                ],
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 20,),
                        Divider(
                          color: Color(0xFFE7E7E7),
                          thickness: 1,
                        ),
                        SizedBox(height: 20,),
                        Text("Financial Manager Details",style: GoogleFonts.lato(fontSize: 19,fontWeight: FontWeight.w600),),
                        SizedBox(height: 20,),
                        TextFormField(
                          maxLength: 10,
                          controller: financialManagerNameController,
                          keyboardType: TextInputType.name,
                          textInputAction: TextInputAction.next,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                                borderSide: BorderSide(color: Color(0xFF707070))
                            ),
                            labelText: 'Financial Manager Name  ',
                            hintText: 'Manager Name',
                            counterText: "",
                            hintStyle: TextStyle(fontSize: 15,fontWeight: FontWeight.w500,color: Color(0xFF707070)),
                            contentPadding: EdgeInsets.only(left: 18,top: 16,bottom: 16),
                          ),
                        ),
                        SizedBox(height: 20,),
                        TextFormField(
                          maxLength: 10,
                          controller: financialManagerNumberController,
                          textInputAction: TextInputAction.next,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                                borderSide: BorderSide(color: Color(0xFF707070))
                            ),
                            labelText: 'Contact Number',
                            hintText: '12345 67890',
                            counterText: "",
                            hintStyle: TextStyle(fontSize: 15,fontWeight: FontWeight.w500,color: Color(0xFF707070)),
                            contentPadding: EdgeInsets.only(left: 18,top: 16,bottom: 16),
                          ),
                        ),
                        SizedBox(height: 20,),
                        TextFormField(
                          textInputAction: TextInputAction.next,
                          controller: financialManagerEmailController,
                          keyboardType: TextInputType.emailAddress,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                                borderSide: BorderSide(color: Color(0xFF707070))
                            ),
                            labelText: 'Email Address',
                            hintText: 'user@gmail.com',
                            hintStyle: TextStyle(fontSize: 15,fontWeight: FontWeight.w500,color: Color(0xFF707070)),
                            contentPadding: EdgeInsets.only(left: 18,top: 16,bottom: 16),
                          ),
                        ),
                        SizedBox(height: 20,),
                        TextFormField(
                          maxLength: 5,
                          controller: totalTechnicianController,
                          textInputAction: TextInputAction.next,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                                borderSide: BorderSide(color: Color(0xFF707070))
                            ),
                            labelText: 'Total Number of Lab Technicians',
                            hintText: '12345 67890',
                            counterText: "",
                            hintStyle: TextStyle(fontSize: 15,fontWeight: FontWeight.w500,color: Color(0xFF707070)),
                            contentPadding: EdgeInsets.only(left: 18,top: 16,bottom: 16),
                          ),
                        ),
                        SizedBox(height: 20,),
                        DottedBorder(
                          borderType: BorderType.RRect,
                          dashPattern: [3, 3, 3],
                          radius: Radius.circular(12),
                          color: Color(0xFF116D6E),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(12),
                            child: Container(
                              height: 100,
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
                                  Text("Upload List of Lab Techs",style: GoogleFonts.lato(fontSize: 15,fontWeight: FontWeight.w500,color: Color(0xFF707070)))
                                ],
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: height*0.050,),
                        Container(
                          height: height*0.064,
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              color: Color(0xFFA0A0A0)
                          ),
                          child: TextButton(
                              onPressed: () {
                                Navigator.push(context, MaterialPageRoute(builder: (context) => ManageProfile4(),));
                              },
                              child: Text("Continue",style: GoogleFonts.lato(fontSize: 15,fontWeight: FontWeight.w500,color: Colors.white))),
                        ),
                        SizedBox(height: height*0.025,),
                      ],),
                  )
                ],
              ),
            ),
          ),
        ));
  }
}
