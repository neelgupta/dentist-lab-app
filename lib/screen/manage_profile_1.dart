import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:dentalapp/screen/manage_profile_2.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

import '../models/manage_prifile_1_model.dart';
import '../services/helper_fun.dart';
import '../utils/api_services.dart';

class ManageProfile1 extends StatefulWidget {
  const ManageProfile1({Key? key}) : super(key: key);

  @override
  State<ManageProfile1> createState() => _ManageProfile1State();
}

class _ManageProfile1State extends State<ManageProfile1> {

  bool isPasswordVisible = true;
  TextEditingController dateInputController = TextEditingController();
  TextEditingController labNameController = TextEditingController();
  TextEditingController labMobileController = TextEditingController();
  TextEditingController landLineNumberController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController countryController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController poBoxController = TextEditingController();

  bool isLoading =  false;
  ManageProfile1Model? manageProfile1Model;
  final formKey = GlobalKey<FormState>();
  var autoValidate = AutovalidateMode.disabled;

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
                            Text("6",style: GoogleFonts.lato(fontSize: 17,fontWeight: FontWeight.w600,color: Color(0xFFA0A0A0)),),
                          ],
                        ),
                        SizedBox(height: 20,),
                        Text("Lab Details",style: GoogleFonts.lato(fontSize: 19,fontWeight: FontWeight.w600),),
                        SizedBox(height: 20,),
                        TextFormField(
                          textInputAction: TextInputAction.next,
                          controller: labNameController,
                          keyboardType: TextInputType.name,
                          validator: (value) {
                            if(value == null || value.isEmpty){
                              return 'Please Enter Lab Name';
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                                borderSide: BorderSide(color: Color(0xFF707070))
                            ),
                            labelText: 'Lab Name',
                            hintText: 'Lab Name',
                            hintStyle: TextStyle(fontSize: 15,fontWeight: FontWeight.w500,color: Color(0xFF707070)),
                            contentPadding: EdgeInsets.only(left: 18,top: 16,bottom: 16),
                          ),
                        ),
                        SizedBox(height: 20,),
                        TextFormField(
                          controller: labMobileController,
                          textInputAction: TextInputAction.next,
                          keyboardType: TextInputType.number,
                          validator: (value) {
                            if(value == null || value.isEmpty){
                              return 'Please Enter Lab Number';
                            }
                            return null;
                          },
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
                        ),
                        SizedBox(height: 20,),
                        TextFormField(
                          textInputAction: TextInputAction.next,
                          controller: landLineNumberController,
                          keyboardType: TextInputType.number,
                          validator: (value) {
                            if(value == null || value.isEmpty){
                              return 'Please Enter Land-Line Number';
                            }
                            return null;
                          },
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
                        ),
                        SizedBox(height: 20,),
                        TextFormField(
                          controller: emailController,
                          keyboardType: TextInputType.emailAddress,
                          textInputAction: TextInputAction.next,
                          validator: (value) {
                            if(value == null || value.isEmpty){
                              return 'Please Enter Email';
                            }
                            return null;
                          },
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
                          obscureText: isPasswordVisible,
                          controller: passwordController,
                          keyboardType: TextInputType.emailAddress,
                          textInputAction: TextInputAction.next,
                          validator: (value) {
                            if(value == null || value.isEmpty){
                              return 'Please Enter Password';
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12),
                                  borderSide: BorderSide(color: Color(0xFF707070))
                              ),
                              labelText: 'Password',
                              hintText: 'Password',
                              hintStyle: TextStyle(fontSize: 15,fontWeight: FontWeight.w500,color: Color(0xFF707070)),
                              contentPadding: EdgeInsets.only(left: 18,top: 16,bottom: 16),
                              suffixIcon: InkWell(
                                  onTap: () {
                                    setState(() {
                                      isPasswordVisible = !isPasswordVisible;
                                    });
                                  },
                                  child: !isPasswordVisible ? Image(image: AssetImage("assets/image/Vector.png"))
                                  : Image(image: AssetImage("assets/image/Vector12.png")))
                          ),
                        ),
                        SizedBox(height: 30,),
                        Divider(
                          color: Color(0xFFE7E7E7),
                          thickness: 1,
                        ),
                        SizedBox(height: 30,),
                        Text("Lab Location ",style: GoogleFonts.lato(fontSize: 19,fontWeight: FontWeight.w600),),
                        SizedBox(height: 20,),
                        TextFormField(
                          controller: countryController,
                          keyboardType: TextInputType.name,
                          textInputAction: TextInputAction.next,
                          validator: (value) {
                            if(value == null || value.isEmpty){
                              return 'Please Enter Country';
                            }
                            return null;
                          },
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
                        ),
                        SizedBox(height: 20,),
                        TextFormField(
                          maxLength: 10,
                          controller: cityController,
                          keyboardType: TextInputType.name,
                          textInputAction: TextInputAction.next,
                          validator: (value) {
                            if(value == null || value.isEmpty){
                              return 'Please Enter City Name';
                            }
                            return null;
                          },
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
                        ),
                        SizedBox(height: 20,),
                          TextFormField(
                            controller: addressController,
                            keyboardType: TextInputType.name,
                            textInputAction: TextInputAction.next,
                            validator: (value) {
                              if(value == null || value.isEmpty){
                                return 'Please Enter Address';
                              }
                              return null;
                            },
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
                          ),
                          SizedBox(height: 20,),
                          TextFormField(
                            keyboardType: TextInputType.name,
                          controller: poBoxController,
                          maxLength: 18,
                          textInputAction: TextInputAction.next,
                            validator: (value) {
                              if(value == null || value.isEmpty){
                                return 'Please Enter P.O Box Number';
                              }
                              return null;
                            },
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
                        ),
                          SizedBox(height: 20,),
                          TextFormField(
                          maxLength: 10,
                          textInputAction: TextInputAction.next,
                          controller:dateInputController,
                          readOnly: true,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                                borderSide: BorderSide(color: Color(0xFF707070))
                            ),
                            labelText: 'Date of establishment',
                            hintText: '10 jun 2023',
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
                                  }
                                },
                                child: Image(image: AssetImage("assets/image/date.png")))
                          ),
                        ),
                          SizedBox(height: 30,),
                          Container(
                            height: 50,
                            width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                color: Color(0xFF166D6E)
                            ),
                            child: TextButton(
                                onPressed: () {
                                  if (formKey.currentState!.validate()){
                                    manageProfile1();
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
            ) : const Center(
              child: CircularProgressIndicator(),
            )
          )),
    );
  }
  manageProfile1()async{
    var postUri = Uri.parse(ApiServices.manageProfile1Api);
    try {
      setState(() {
        isLoading = true;
      });
      var bodyData = {
        "labName":labNameController.text.toString(),
        "mobileNumber":labMobileController.text.toString(),
        "landLineNumber":landLineNumberController.text.toString(),
        "country":countryController.text.toString(),
        "city":cityController.text.toString(),
        "address":addressController.text.toString(),
        "poBox":poBoxController.text.toString(),
        "dateOfEstablishment":dateInputController.text.toString()
      };
      var headers = {"Authorization": "Bearer ${ApiHelper.getToken()}"};
      var response = await http.post(
        postUri,
        body: bodyData,
        headers: headers,
      );
      print("body ====> $bodyData");
      print("body ====> ${response.statusCode}");
      print("body ====> ${response.body}");
      print("header ====> ${headers}");
      if (response.statusCode == 200) {
        Map map = jsonDecode(response.body);
        if (map["status"] == 200) {
          manageProfile1Model = ManageProfile1Model.fromJson(jsonDecode(response.body));
          Navigator.push(context, MaterialPageRoute(builder: (context) => ManageProfile2(),));
          Fluttertoast.showToast(
              msg: "${manageProfile1Model?.message}",
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.BOTTOM,
              timeInSecForIosWeb: 1,
              backgroundColor: Colors.black,
              textColor: Colors.white,
              fontSize: 16.0
          );
        } else {
          Fluttertoast.showToast(
              msg: "${manageProfile1Model?.message}",
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
