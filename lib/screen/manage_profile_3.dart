import 'package:dotted_border/dotted_border.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';

import '../models/manage_profile_3_model.dart';
import '../utils/api_services.dart';
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


  File? _image2;
  File? _image3;
  bool showPickOption2 = true;
  bool showPickOption3= true;

  bool isLoading =  false;
  ManageProfile3Model? manageProfile3Model;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width  = MediaQuery.of(context).size.width;
    return SafeArea(
        child:Scaffold(
          resizeToAvoidBottomInset: true,
          body: !isLoading ? SizedBox(
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
                              height: height*0.13,
                              width: MediaQuery.of(context).size.width,
                              color: Color(0xFFF5F7F7),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  if (_image2 != null)
                                    Align(
                                      alignment: Alignment.centerLeft,
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(horizontal: 10),
                                        child: Container(
                                          width: 120,
                                          height: 80,
                                          decoration: BoxDecoration(
                                              image: DecorationImage(image: FileImage(_image2!),fit: BoxFit.fill),
                                              borderRadius: BorderRadius.circular(12)
                                          ),
                                        ),
                                      ),
                                    ),
                                  if (showPickOption2)
                                    InkWell(
                                      onTap: () {
                                        _pickImage2();
                                      },
                                      child: Container(
                                        child: Column(
                                          children: [
                                            Container(
                                              height: 50,
                                              width: 50,
                                              decoration: BoxDecoration(
                                                  borderRadius: BorderRadius.circular(50),
                                                  color: Colors.white,
                                                  image: DecorationImage(image: AssetImage("assets/image/camera.png"),fit: BoxFit.none)
                                              ),
                                            ),
                                            SizedBox(height: 5,),
                                            Text("Upload file",style: GoogleFonts.lato(fontSize: 15,fontWeight: FontWeight.w500,color: Color(0xFF707070)))
                                          ],
                                        ),
                                      ),
                                    ),
                                ],
                              ),
                              // child:Row(
                              //   mainAxisAlignment: MainAxisAlignment.center,
                              //   children: [
                              //     if (_image != null)
                              //     Align(
                              //       alignment: Alignment.centerLeft,
                              //       child: Container(
                              //         width: 120,
                              //         height: 80,
                              //         decoration: BoxDecoration(
                              //           image: DecorationImage(image: FileImage(_image!),fit: BoxFit.fill),
                              //           borderRadius: BorderRadius.circular(12)
                              //         ),
                              //         // child: imageFile != null ? Image.file(File(imageFile!.path), fit: BoxFit.cover,) : Placeholder(),
                              //       ),
                              //     ),
                              //     if (showPickOption)
                              //
                              //   ],
                              // ),
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
                              height: height*0.13,
                              width: MediaQuery.of(context).size.width,
                              color: Color(0xFFF5F7F7),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  if (_image3 != null)
                                    Align(
                                      alignment: Alignment.centerLeft,
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(horizontal: 10),
                                        child: Container(
                                          width: 120,
                                          height: 80,
                                          decoration: BoxDecoration(
                                              image: DecorationImage(image: FileImage(_image3!),fit: BoxFit.fill),
                                              borderRadius: BorderRadius.circular(12)
                                          ),
                                        ),
                                      ),
                                    ),
                                  if (showPickOption3)
                                    InkWell(
                                      onTap: () {
                                        _pickImage3();
                                      },
                                      child: Container(
                                        child: Column(
                                          children: [
                                            Container(
                                              height: 50,
                                              width: 50,
                                              decoration: BoxDecoration(
                                                  borderRadius: BorderRadius.circular(50),
                                                  color: Colors.white,
                                                  image: DecorationImage(image: AssetImage("assets/image/camera.png"),fit: BoxFit.none)
                                              ),
                                            ),
                                            SizedBox(height: 5,),
                                            Text("Upload file",style: GoogleFonts.lato(fontSize: 15,fontWeight: FontWeight.w500,color: Color(0xFF707070)))
                                          ],
                                        ),
                                      ),
                                    ),
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
                              color: Color(0xFF116D6E)
                          ),
                          child: TextButton(
                              onPressed: () {
                                manageProfile3();
                              },
                              child: Text("Continue",style: GoogleFonts.lato(fontSize: 15,fontWeight: FontWeight.w500,color: Colors.white))),
                        ),
                        SizedBox(height: height*0.025,),
                      ],),
                  )
                ],
              ),
            ),
          ) : const Center(
            child: CircularProgressIndicator(),
          )
        )
    );
  }

  manageProfile3()async{
    var postUri = Uri.parse(ApiServices.manageProfile3Api);
    try {
      setState(() {
        isLoading = true;
      });
      var bodyData = {
        "labMangerName" : labManagerNameController.text.toString(),
        "labMangerNumber" : labManagerNumberController.text.toString(),
        "labMangerEmail" : labManagerEmailController.text.toString(),
        "techMangerName" : technicalManagerNameController.text.toString(),
        "techMangerNumber" : technicalManagerNumberController.text.toString(),
        "techMangerEmail" : technicalManagerEmailController.text.toString(),
        "techMangerlicensNo" : technicalManagerLicenseController.text.toString(),
        "finacialMangerName" : financialManagerNameController.text.toString(),
        "finacialMangerNumber" : financialManagerNumberController.text.toString(),
        "finacialMangerEmail" : financialManagerEmailController.text.toString(),
        "totalLabTechinicians" : totalTechnicianController.text.toString(),
        "techlicensFile" : _image2,
        "labTechs" : _image3,
      };
      var response = await http.post(
        postUri,
        body: bodyData,
      );
      print("body ====> $bodyData");
      print("body ====> ${response.statusCode}");
      print("body ====> ${response.body}");
      if (response.statusCode == 200) {
        Map map = jsonDecode(response.body);
        if (map["status"] == 200) {
          manageProfile3Model = ManageProfile3Model.fromJson(jsonDecode(response.body));
          Navigator.push(context, MaterialPageRoute(builder: (context) => ManageProfile4(),));
          Fluttertoast.showToast(
              msg: "${manageProfile3Model?.message}",
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.BOTTOM,
              timeInSecForIosWeb: 1,
              backgroundColor: Colors.black,
              textColor: Colors.white,
              fontSize: 16.0
          );
        } else {
          Fluttertoast.showToast(
              msg: "${manageProfile3Model?.message}",
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.BOTTOM,
              timeInSecForIosWeb: 1,
              backgroundColor: Colors.black,
              textColor: Colors.white,
              fontSize: 16.0
          );
        }
      }else{
        Fluttertoast.showToast(
            msg: "${jsonDecode(response.body)['message']}",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.black,
            textColor: Colors.white,
            fontSize: 16.0
        );
      }
    }catch(e){
      rethrow;
    }finally{
      setState(() {
        isLoading = false;
      });
    }
  }

  Future<void> _pickImage2() async {
    final picker = ImagePicker();
    final pickedImage2 = await picker.getImage(source: ImageSource.gallery);
    setState(() {
      if(pickedImage2 != null){
        _image2 = File(pickedImage2.path);
        showPickOption2 = false;
      }
      // imageFile = pickedImage;
    });
  }
  Future<void> _pickImage3() async {
    final picker = ImagePicker();
    final pickedImage3 = await picker.getImage(source: ImageSource.gallery);
    setState(() {
      if(pickedImage3 != null){
        _image3 = File(pickedImage3.path);
        showPickOption3 = false;
      }
      // imageFile = pickedImage;
    });
  }
}
