// ignore_for_file: use_build_context_synchronously

import 'dart:convert';
import 'dart:developer';

import 'package:dentalapp/clinic_screen/setup_screen/profilesetup_2.dart';
import 'package:dentalapp/models/addClinicDetails.dart';
import 'package:dentalapp/screen/manage_profile_2.dart';
import 'package:dentalapp/utils/api_services.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;

import '../../utils/api_helper.dart';

class profileSetup1 extends StatefulWidget {
  const profileSetup1({Key? key}) : super(key: key);

  @override
  State<profileSetup1> createState() => _profileSetup1State();
}

class _profileSetup1State extends State<profileSetup1> {
  final formKey = GlobalKey<FormState>();
  var autoValidate = AutovalidateMode.disabled;
  AddClinicDetailsModel? addClinicdetailsmodel;
  bool isLoading =  false;
  bool isPasswordVisible = true;
  TextEditingController dateInputController = TextEditingController();
  TextEditingController labNameController = TextEditingController();
  TextEditingController labMobileController = TextEditingController();
  TextEditingController landLineNumberController = TextEditingController();

  TextEditingController countryController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController poBoxController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Form(
      key: formKey,
      autovalidateMode: autoValidate,
      child: SafeArea(
          child:Scaffold(
            resizeToAvoidBottomInset: true,
            body: !isLoading ?SizedBox(
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
                              Image(image: AssetImage("assets/image/left.png"),fit: BoxFit.fill),
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
                          SizedBox(height: 10,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text("1/",style: GoogleFonts.lato(fontSize: 17,fontWeight: FontWeight.w600),),
                              Text("3",style: GoogleFonts.lato(fontSize: 17,fontWeight: FontWeight.w600,color: Color(0xFFA0A0A0)),),
                            ],
                          ),
                          SizedBox(height: 20,),
                          Text("Clinic Details",style: GoogleFonts.lato(fontSize: 19,fontWeight: FontWeight.w600),),
                          SizedBox(height: 20,),
                          TextFormField(
                            textInputAction: TextInputAction.next,
                            controller: labNameController,
                            keyboardType: TextInputType.name,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12),
                                  borderSide: BorderSide(color: Color(0xFF707070))
                              ),
                              labelText: 'Clinic Name',
                              hintText: 'Clinic Name',
                              hintStyle: TextStyle(fontSize: 15,fontWeight: FontWeight.w500,color: Color(0xFF707070)),
                              contentPadding: EdgeInsets.only(left: 18,top: 16,bottom: 16),
                            ),
                              validator: (value) {
                                if(value == null || value.isEmpty){
                                  return 'Please enter Clinic Name';
                                }
                                return null;
                              },
                          ),
                          SizedBox(height: 20,),
                          TextFormField(
                            controller: labMobileController,
                            textInputAction: TextInputAction.next,
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12),
                                  borderSide: BorderSide(color: Color(0xFF707070))
                              ),
                              labelText: 'Mobile Number',
                              hintText: '123456789',
                              counterText: "",
                              hintStyle: TextStyle(fontSize: 15,fontWeight: FontWeight.w500,color: Color(0xFF707070)),
                              contentPadding: EdgeInsets.only(left: 18,top: 16,bottom: 16),
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter Mobile Number';
                              } else if(!RegExp(r'(^(?:[+0]9)?[0-9]{10,12}$)').hasMatch(value!)){
                                return "Enter valid Mobile Number";
                              }
                              return null;
                            },
                          ),
                          SizedBox(height: 20,),
                          TextFormField(
                            textInputAction: TextInputAction.next,
                            controller: landLineNumberController,
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12),
                                  borderSide: BorderSide(color: Color(0xFF707070))
                              ),
                              labelText: 'Land Line Number',
                              hintText: '123456789',
                              counterText: "",
                              hintStyle: TextStyle(fontSize: 15,fontWeight: FontWeight.w500,color: Color(0xFF707070)),
                              contentPadding: EdgeInsets.only(left: 18,top: 16,bottom: 16),
                            ),
                            validator: (value) {
                              if(value == null || value.isEmpty){
                                return 'Please enter Land Line Number';
                              }
                              return null;
                            },
                          ),



                          SizedBox(height: 30,),
                          Divider(
                            color: Color(0xFFE7E7E7),
                            thickness: 1,
                          ),
                          SizedBox(height: 30,),
                          Text("Clinic Location ",style: GoogleFonts.lato(fontSize: 19,fontWeight: FontWeight.w600),),
                          SizedBox(height: 20,),
                          TextFormField(
                            controller: countryController,
                            keyboardType: TextInputType.name,
                            textInputAction: TextInputAction.next,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12),
                                  borderSide: BorderSide(color: Color(0xFF707070))
                              ),
                              labelText: 'Country',
                              hintText: 'Country',
                              counterText: "",
                              hintStyle: TextStyle(fontSize: 15,fontWeight: FontWeight.w500,color: Color(0xFF707070)),
                              contentPadding: EdgeInsets.only(left: 18,top: 16,bottom: 16),
                            ),
                            validator: (value) {
                              if(value == null || value.isEmpty){
                                return 'Please enter Country';
                              }
                              return null;
                            },
                          ),
                          SizedBox(height: 20,),
                          TextFormField(
                            controller: cityController,
                            keyboardType: TextInputType.name,
                            textInputAction: TextInputAction.next,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12),
                                  borderSide: BorderSide(color: Color(0xFF707070))
                              ),
                              labelText: 'City',
                              hintText: 'City',
                              counterText: "",
                              hintStyle: TextStyle(fontSize: 15,fontWeight: FontWeight.w500,color: Color(0xFF707070)),
                              contentPadding: EdgeInsets.only(left: 18,top: 16,bottom: 16),
                            ),
                            validator: (value) {
                              if(value == null || value.isEmpty){
                                return 'Please enter City';
                              }
                              return null;
                            },
                          ),
                          SizedBox(height: 20,),
                          TextFormField(
                            keyboardType: TextInputType.streetAddress,
                            controller: addressController,
                            textInputAction: TextInputAction.next,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12),
                                  borderSide: BorderSide(color: Color(0xFF707070))
                              ),
                              labelText: 'Address',
                              hintText: 'Address',
                              counterText: "",
                              hintStyle: TextStyle(fontSize: 15,fontWeight: FontWeight.w500,color: Color(0xFF707070)),
                              contentPadding: EdgeInsets.only(left: 18,top: 16,bottom: 16),
                            ),
                            validator: (value) {
                              if(value == null || value.isEmpty){
                                return 'Please enter Address';
                              }
                              return null;
                            },
                          ),
                          SizedBox(height: 20,),
                          TextFormField(
                            keyboardType: TextInputType.name,
                            controller: poBoxController,
                            textInputAction: TextInputAction.next,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12),
                                  borderSide: BorderSide(color: Color(0xFF707070))
                              ),
                              labelText: 'P.O.Box',
                              hintText: 'P.O.Box',
                              counterText: "",
                              hintStyle: TextStyle(fontSize: 15,fontWeight: FontWeight.w500,color: Color(0xFF707070)),
                              contentPadding: EdgeInsets.only(left: 18,top: 16,bottom: 16),
                            ),
                            validator: (value) {
                              if(value == null || value.isEmpty){
                                return 'Please enter P.O.Box';
                              }
                              return null;
                            },
                          ),
                          SizedBox(height: 20,),
                          TextFormField(
                            textInputAction: TextInputAction.next,
                            controller:dateInputController,
                            readOnly: true,
                            decoration: InputDecoration(
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(12),
                                    borderSide: BorderSide(color: Color(0xFF707070))
                                ),
                                labelText: 'Date of establishment',
                               // hintText: '12 jan 2022',
                                counterText: "",
                                hintStyle: TextStyle(fontSize: 15,fontWeight: FontWeight.w500,color: Color(0xFF707070)),
                                contentPadding: EdgeInsets.only(left: 18,top: 16,bottom: 16),
                                suffixIcon: InkWell(
                                    onTap: () async {
                                      DateTime? pickedDate = await showDatePicker(
                                          context: context,
                                          initialDate: DateTime.now(),
                                          firstDate: DateTime(1950),
                                          lastDate: DateTime(2050));

                                      if (pickedDate != null) {
                                        dateInputController.text =
                                            DateFormat('dd MMMM yyyy').format(pickedDate);
                                      };
                                    },
                                    child: Image(image: AssetImage("assets/image/date.png")))
                            ),
                            validator: (value) {
                              if(value == null || value.isEmpty){
                                return 'Please Select Date';
                              }
                              return null;
                            },
                          ),
                          SizedBox(height: 30,),
                          Container(
                            height: 50,
                            width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                color: Color(0xFF116D6E)
                                    //:Color(0xffA0A0A0),
                            ),
                            child: TextButton(
                                onPressed: () {
                                  if (formKey.currentState!.validate()){
                                    proFileSetup1();
                                  }else{
                                    autoValidate = AutovalidateMode.always;
                                  }
                                },
                                child: Text("Continue",style: GoogleFonts.lato(fontSize: 15,fontWeight: FontWeight.w500,color: Colors.white))),
                          ),
                          SizedBox(height: 40,),
                        ],),
                    )
                  ],
                ),
              ),
            ): const Center(
              child:  CircularProgressIndicator(),
          ))),
    );
  }


  proFileSetup1()async{
    var postUri = Uri.parse(ApiServices.addClinicDetails);
    try {
      setState(() {
        isLoading = true;
      });
      var bodyData = {
        "clinicName": labNameController.text.toString(),
        "mobileNumber": labMobileController.text.toString(),
        "landLineNumber": landLineNumberController.text.toString(),
        "country": countryController.text.toString(),
        "city": cityController.text.toString(),
        "address": addressController.text.toString(),
        "poBox": poBoxController.text.toString(),
        "dateOfEstablishment": dateInputController.text.toString(),
      };
      var response = await http.post(
        postUri,
        body: bodyData,
        headers:ApiHelpers.apiHeader,
      );
      print("token==${ApiHelpers.apiHeader}");
      print("body ====> $bodyData");
      log("addPayment response.body ==> ${response.body}");
      log("addPayment status code ==> ${response.statusCode}");
      if (response.statusCode == 200) {
        Map map = jsonDecode(response.body);
        if (map["status"] == 200) {
         addClinicdetailsmodel = AddClinicDetailsModel.fromJson(jsonDecode(response.body));
          Fluttertoast.showToast(
              msg: "${addClinicdetailsmodel?.message}",
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.BOTTOM,
              timeInSecForIosWeb: 1,
              backgroundColor: Colors.black,
              textColor: Colors.white,
              fontSize: 16.0
          );
          Navigator.push(context,
            MaterialPageRoute(
              builder: (context) => const ProfileSetup2(),),
          );
        } else {
          Fluttertoast.showToast(
              msg: "${addClinicdetailsmodel?.message}",
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
}
