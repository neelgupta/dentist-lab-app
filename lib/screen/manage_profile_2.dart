import 'dart:io';
import 'dart:convert';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'package:dentalapp/screen/manage_profile_3.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../models/manage_profile_2_model.dart';
import '../services/helper_fun.dart';
import '../utils/api_services.dart';


class ManageProfile2 extends StatefulWidget {
  const ManageProfile2({Key? key}) : super(key: key);

  @override
  State<ManageProfile2> createState() => _ManageProfile2State();
}

class _ManageProfile2State extends State<ManageProfile2> {

  TextEditingController medicalLicenseController = TextEditingController();
  TextEditingController tradeLicenseController = TextEditingController();
  TextEditingController trnNumberController = TextEditingController();
  TextEditingController totalDeviceController = TextEditingController();

  File? _image;
  File? _image2;
  File? _image3;
  File? _image4;

  Future<void> _pickImage() async {
    final picker = ImagePicker();
    final pickedImage = await picker.getImage(source: ImageSource.gallery);
    setState(() {
      if(pickedImage != null){
        _image = File(pickedImage.path);
        showPickOption = false;
      }
      // imageFile = pickedImage;
    });
  }

  bool showPickOption = true;
  bool showPickOption2 = true;
  bool showPickOption3= true;
  bool showPickOption4 = true;
  bool isLoading =  false;
  ManageProfile2Model? manageProfile2Model;

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
                        const SizedBox(height: 7,),
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
                          maxLength: 17,
                          textInputAction: TextInputAction.next,
                          controller: medicalLicenseController,
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
                              height: height*0.13,
                              width: MediaQuery.of(context).size.width,
                              color: Color(0xFFF5F7F7),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  if (_image != null)
                                    Align(
                                      alignment: Alignment.centerLeft,
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(horizontal: 10),
                                        child: Container(
                                          width: 120,
                                          height: 80,
                                          decoration: BoxDecoration(
                                              image: DecorationImage(image: FileImage(_image!),fit: BoxFit.fill),
                                              borderRadius: BorderRadius.circular(12)
                                          ),
                                          // child: imageFile != null ? Image.file(File(imageFile!.path), fit: BoxFit.cover,) : Placeholder(),
                                        ),
                                      ),
                                    ),
                                  if (showPickOption)
                                    InkWell(
                                      onTap: () {
                                        _pickImage();
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
                        const SizedBox(height: 20,),
                        TextFormField(
                          maxLength: 17,
                          textInputAction: TextInputAction.next,
                          controller: tradeLicenseController,
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
                            ),
                          ),
                        ),
                        const SizedBox(height: 20,),
                        TextFormField(
                          maxLength: 17,
                          textInputAction: TextInputAction.next,
                          controller: trnNumberController,
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
                        const SizedBox(height: 20,),
                        TextFormField(
                          maxLength: 10,
                          textInputAction: TextInputAction.next,
                          controller: totalDeviceController,
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
                              height: height*0.13,
                              width: MediaQuery.of(context).size.width,
                              color: Color(0xFFF5F7F7),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  if (_image4 != null)
                                    Align(
                                      alignment: Alignment.centerLeft,
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(horizontal: 10),
                                        child: Container(
                                          width: 120,
                                          height: 80,
                                          decoration: BoxDecoration(
                                              image: DecorationImage(image: FileImage(_image4!),fit: BoxFit.fill),
                                              borderRadius: BorderRadius.circular(12)
                                          ),
                                        ),
                                      ),
                                    ),
                                  if (showPickOption4)
                                    InkWell(
                                      onTap: () {
                                        _pickImage4();
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
                        SizedBox(height:height*0.065,),
                        Container(
                          height: height*0.064,
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              color: const Color(0xFF116D6E)
                          ),
                          child: TextButton(
                              onPressed: () {
                                manageProfile2();
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

  manageProfile2()async{
    var postUri = Uri.parse(ApiServices.manageProfile2Api);
    try {
      setState(() {
        isLoading = true;
      });
      var bodyData = {
        "medicalLicenseNumber": medicalLicenseController.text.toString(),
        "tradeLicenceNumber": tradeLicenseController.text.toString(),
        "TRN_number": trnNumberController.text.toString(),
        "deviceUsed": totalDeviceController.text.toString(),
      };
      var headers = {"Authorization": "Bearer ${ApiHelper.getToken()}"};
      var postUri = Uri.parse(ApiServices.addaditionalClinicDetails);
      var request = http.MultipartRequest("POST", postUri);
      request.headers.addAll(headers);
      request.fields.addAll(bodyData);
      http.MultipartFile multipartFile = await http.MultipartFile.fromPath("licensFile",_image!.path);
      http.MultipartFile multipartFile1 = await http.MultipartFile.fromPath("tradeFile",_image2!.path);
      http.MultipartFile multipartFile2 = await http.MultipartFile.fromPath("TRNFile",_image3!.path);
      http.MultipartFile multipartFile3 = await http.MultipartFile.fromPath("devicesFile",_image4!.path);
      request.files.add(multipartFile,);
      request.files.add(multipartFile1,);
      request.files.add(multipartFile2);
      request.files.add(multipartFile3);
      http.StreamedResponse response = await request.send();
      // var response = await http.post(
      //   postUri,
      //   body: bodyData,
      //   headers: headers,
      // );
      print("body ====> $bodyData");
      print("body ====> ${response.statusCode}");
      final res = await http.Response.fromStream(response);
      print('body: ${res.body}');
      if (response.statusCode == 200) {
        Map map = jsonDecode(res.body);
        if (map["status"] == 200) {
          manageProfile2Model = ManageProfile2Model.fromJson(jsonDecode(res.body));
          Navigator.push(context, MaterialPageRoute(builder: (context) => ManageProfile3(),));
          Fluttertoast.showToast(
              msg: "${manageProfile2Model?.message}",
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.BOTTOM,
              timeInSecForIosWeb: 1,
              backgroundColor: Colors.black,
              textColor: Colors.white,
              fontSize: 16.0
          );
        } else {
          Fluttertoast.showToast(
              msg: "${manageProfile2Model?.message}",
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
            msg: "${jsonDecode(res.body)['message']}",
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
  Future<void> _pickImage4() async {
    final picker = ImagePicker();
    final pickedImage4 = await picker.getImage(source: ImageSource.gallery);
    setState(() {
      if(pickedImage4 != null){
        _image4 = File(pickedImage4.path);
        showPickOption4 = false;
      }
      // imageFile = pickedImage;
    });
  }
}
