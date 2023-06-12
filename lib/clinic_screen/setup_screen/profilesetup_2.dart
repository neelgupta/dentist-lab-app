import 'dart:convert';
import 'dart:io';
import 'package:dentalapp/clinic_screen/setup_screen/profilesetup_3.dart';
import 'package:dentalapp/utils/api_helper.dart';
import 'package:dentalapp/utils/api_services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:dentalapp/screen/manage_profile_3.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;



class ProfileSetup2 extends StatefulWidget {
  const ProfileSetup2({Key? key}) : super(key: key);

  @override
  State<ProfileSetup2> createState() => _ProfileSetup2State();
}

class _ProfileSetup2State extends State<ProfileSetup2> {
  TextEditingController licenseAuthorityController = TextEditingController();
  TextEditingController medicalLicenseController = TextEditingController();

  TextEditingController tradeLicenseController = TextEditingController();
  TextEditingController trnNumberController = TextEditingController();
  TextEditingController totalDeviceController = TextEditingController();

  File? _image;
  File? _image1;
  File? _image2;
  File? _image3;

  bool isLoading =  false;

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
  bool showPickOption1 = true;

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
                        const SizedBox(height: 7,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("2/",style: GoogleFonts.lato(fontSize: 17,fontWeight: FontWeight.w600),),
                            Text("3",style: GoogleFonts.lato(fontSize: 17,fontWeight: FontWeight.w600,color: const Color(0xFFA0A0A0)),),
                          ],
                        ),
                        const SizedBox(height: 20,),
                        Text("Additional",style: GoogleFonts.lato(fontSize: 19,fontWeight: FontWeight.w600),),
                        const SizedBox(height: 20,),
                        TextFormField(
                          maxLength: 15,
                          textInputAction: TextInputAction.next,
                          controller: licenseAuthorityController,
                          keyboardType: TextInputType.name,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                                borderSide: const BorderSide(color: Color(0xFF707070))
                            ),
                            labelText: 'Licensing Authority',
                            hintText: 'Licensing Authority',
                            counterText: "",
                            hintStyle: const TextStyle(fontSize: 15,fontWeight: FontWeight.w500,color: Color(0xFF707070)),
                            contentPadding: const EdgeInsets.only(left: 18,top: 16,bottom: 16),
                          ),
                        ),
                        const SizedBox(height: 20,),
                        TextFormField(
                          maxLength: 15,
                          textInputAction: TextInputAction.next,
                          controller: medicalLicenseController,
                          keyboardType: TextInputType.name,
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
                                  if (_image1 != null)
                                    Align(
                                      alignment: Alignment.centerLeft,
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(horizontal: 10),
                                        child: Container(
                                          width: 120,
                                          height: 80,
                                          decoration: BoxDecoration(
                                              image: DecorationImage(image: FileImage(_image1!),fit: BoxFit.fill),
                                              borderRadius: BorderRadius.circular(12)
                                          ),
                                          // child: imageFile != null ? Image.file(File(imageFile!.path), fit: BoxFit.cover,) : Placeholder(),
                                        ),
                                      ),
                                    ),
                                  if (showPickOption1)
                                    InkWell(
                                      onTap: () {
                                        _pickImage1();
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
                          controller: tradeLicenseController,
                          keyboardType: TextInputType.name,
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
                          keyboardType: TextInputType.name,
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

                        SizedBox(height:height*0.065,),
                        Container(
                          height: height*0.064,
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              color: const Color(0xFFA0A0A0)
                          ),
                          child: TextButton(
                              onPressed: () {
                                  profileSetup2();
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
        )
    );
  }
  Future<void> _pickImage1() async {
    final picker = ImagePicker();
    final pickedImage1 = await picker.getImage(source: ImageSource.gallery);
    setState(() {
      if(pickedImage1 != null){
        _image1 = File(pickedImage1.path);
        print("_image1=$_image1");
        showPickOption1 = false;
      }
      // imageFile = pickedImage;
    });
  }
  Future<void> _pickImage2() async {
    final picker = ImagePicker();
    final pickedImage2 = await picker.getImage(source: ImageSource.gallery);
    setState(() {
      if(pickedImage2 != null){
        _image2 = File(pickedImage2.path);
        print("_image2=$_image2");
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
        print("_image3=$_image3");
        showPickOption3 = false;
      }
      // imageFile = pickedImage;
    });
  }






  Future<void> profileSetup2() async {

    try{
           setState(() {
              isLoading = true;
            });
      var bodyData = {
        "licensingAuthority": licenseAuthorityController.text.toString(),
        "medicalLicenseNumber": medicalLicenseController.text.toString(),
        "tradeLicenceNumber": tradeLicenseController.text.toString(),
        "TRN_number": trnNumberController.text.toString(),

          };
      var postUri = Uri.parse(ApiServices.addaditionalClinicDetails);
      var request = http.MultipartRequest("POST", postUri);
      request.headers.addAll(ApiHelpers.apiHeader);
      request.fields.addAll(bodyData);
      // http.MultipartFile multipartFile1 = await http.MultipartFile.fromPath("licensFile",_image1!.path);
      // http.MultipartFile multipartFile2 = await http.MultipartFile.fromPath("tradeFile",_image2!.path);
      // http.MultipartFile multipartFile3 = await http.MultipartFile.fromPath("trnFile",_image3!.path);
      //  request.files.add(multipartFile1,);
      //  request.files.add(multipartFile2);
      //  request.files.add(multipartFile3);
      http.StreamedResponse response = await request.send();

      print('code: ${response.statusCode}');
      final res = await http.Response.fromStream(response);
      print('body: ${res.body}');
      Map map = jsonDecode(res.body);
      if (map['status'] == 200) {
        Fluttertoast.showToast(
            msg: '${map['message']}',
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.blue,
            textColor: Colors.white,
            fontSize: 16.0
        );
        Navigator.push(context, MaterialPageRoute(builder: (context) => ProfileSetup3(),));
      } else {
        Fluttertoast.showToast(
            msg: '${map['message']}',
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.blue,
            textColor: Colors.white,
            fontSize: 16.0
        );

      }
    }
    catch(e){
      rethrow;
    }
    finally{
      isLoading = false;
    }
  }


}
