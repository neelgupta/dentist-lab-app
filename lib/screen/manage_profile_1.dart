import 'dart:convert';
import 'package:dentalapp/util/utils.dart';
import 'package:http/http.dart' as http;
import 'package:dentalapp/screen/manage_profile_2.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import '../util/api_services.dart';
import '../widget/mobile_code_widget.dart';

class ManageProfile1 extends StatefulWidget {
  const ManageProfile1({Key? key}) : super(key: key);

  @override
  State<ManageProfile1> createState() => _ManageProfile1State();
}

class _ManageProfile1State extends State<ManageProfile1> {

  bool isPasswordVisible = true;
  // CountryController countryController = CountryController();
  TextEditingController dateInputController = TextEditingController();
  TextEditingController labNameController = TextEditingController();
  TextEditingController labMobileController = TextEditingController();
  TextEditingController landLineNumberController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController countryNameController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController poBoxController = TextEditingController();

  bool isLoading =  false;
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
                      decoration: const BoxDecoration(
                          image: DecorationImage(image: AssetImage("assets/image/01.png"),fit: BoxFit.fill)
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(
                            children: const [
                              SizedBox(width: 20,),
                              Image(image: AssetImage("assets/image/left.png"),fit: BoxFit.fill),
                            ],
                          ),
                          const SizedBox(height: 20,),
                          Align(
                            alignment: Alignment.center,
                            child: Container(
                              alignment: Alignment.center,
                              height: 70,
                              width: 70,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
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
                      padding: EdgeInsets.symmetric(horizontal: width*0.057,vertical: height*0.027),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                        const SizedBox(height: 10,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("1/",style: GoogleFonts.lato(fontSize: 17,fontWeight: FontWeight.w600),),
                            Text("6",style: GoogleFonts.lato(fontSize: 17,fontWeight: FontWeight.w600,color: const Color(0xFFA0A0A0)),),
                          ],
                        ),
                        const SizedBox(height: 20,),
                        Text("Lab Details",style: GoogleFonts.lato(fontSize: 19,fontWeight: FontWeight.w600),),
                        const SizedBox(height: 20,),
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
                                borderSide: const BorderSide(color: Color(0xFF707070))
                            ),
                            labelText: 'Lab Name',
                            hintText: 'Lab Name',
                            hintStyle: const TextStyle(fontSize: 15,fontWeight: FontWeight.w500,color: Color(0xFF707070)),
                            contentPadding: const EdgeInsets.only(left: 18,top: 16,bottom: 16),
                          ),
                        ),
                        const SizedBox(height: 20,),
                        MobileCodeWidget(
                          controller: labMobileController,
                        ),
                        const SizedBox(height: 20,),
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
                                borderSide: const BorderSide(color: Color(0xFF707070))
                            ),
                            labelText: 'Land Line Number',
                            hintText: '123456789',
                            counterText: "",
                            hintStyle: const TextStyle(fontSize: 15,fontWeight: FontWeight.w500,color: Color(0xFF707070)),
                            contentPadding: const EdgeInsets.only(left: 18,top: 16,bottom: 16),
                          ),
                        ),
                        const SizedBox(height: 30,),
                        const Divider(
                          color: Color(0xFFE7E7E7),
                          thickness: 1,
                        ),
                        const SizedBox(height: 30,),
                        Text("Lab Location ",style: GoogleFonts.lato(fontSize: 19,fontWeight: FontWeight.w600),),
                        const SizedBox(height: 20,),
                        TextFormField(
                          controller: countryNameController,
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
                                borderSide: const BorderSide(color: Color(0xFF707070))
                            ),
                            labelText: 'Country',
                            hintText: 'Country',
                            counterText: "",
                            hintStyle: const TextStyle(fontSize: 15,fontWeight: FontWeight.w500,color: Color(0xFF707070)),
                            contentPadding: const EdgeInsets.only(left: 18,top: 16,bottom: 16),
                          ),
                        ),
                        const SizedBox(height: 20,),
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
                                borderSide: const BorderSide(color: Color(0xFF707070))
                            ),
                            labelText: 'City',
                            hintText: 'City',
                            counterText: "",
                            hintStyle: const TextStyle(fontSize: 15,fontWeight: FontWeight.w500,color: Color(0xFF707070)),
                            contentPadding: const EdgeInsets.only(left: 18,top: 16,bottom: 16),
                          ),
                        ),
                        const SizedBox(height: 20,),
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
                                  borderSide: const BorderSide(color: Color(0xFF707070))
                              ),
                              labelText: 'Address',
                              hintText: 'Address',
                              counterText: "",
                              hintStyle: const TextStyle(fontSize: 15,fontWeight: FontWeight.w500,color: Color(0xFF707070)),
                              contentPadding: const EdgeInsets.only(left: 18,top: 16,bottom: 16),
                            ),
                          ),
                          const SizedBox(height: 20,),
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
                                borderSide: const BorderSide(color: Color(0xFF707070))
                            ),
                            labelText: 'P.O.Box',
                            hintText: 'P.O.Box',
                            counterText: "",
                            hintStyle: const TextStyle(fontSize: 15,fontWeight: FontWeight.w500,color: Color(0xFF707070)),
                            contentPadding: const EdgeInsets.only(left: 18,top: 16,bottom: 16),
                          ),
                        ),
                          const SizedBox(height: 20,),
                          TextFormField(
                          onTap: () async {
                            DateTime? pickedDate = await showDatePicker(
                                context: context,
                                initialDate: DateTime.now().subtract(const Duration(days: 1)),
                                firstDate: DateTime(1950),
                                lastDate: DateTime.now().subtract(const Duration(days: 1)));

                            if (pickedDate != null) {
                              setState(() {
                                dateInputController.text =
                                    DateFormat('dd MMMM yyyy').format(pickedDate);
                              });
                            }
                          },
                          textInputAction: TextInputAction.next,
                          controller:dateInputController,
                          readOnly: true,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                                borderSide: const BorderSide(color: Color(0xFF707070))
                            ),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                                borderSide: const BorderSide(color: Color(0xFF707070))
                            ),
                            labelStyle: const TextStyle(fontSize: 15,fontWeight: FontWeight.w500,color: Color(0xFF707070)),
                            labelText: 'Date of establishment',
                            hintText: 'Date of establishment',
                            counterText: "",
                            hintStyle: const TextStyle(fontSize: 15,fontWeight: FontWeight.w500,color: Color(0xFF707070)),
                            contentPadding: const EdgeInsets.only(left: 18,top: 16,bottom: 16),
                            suffixIcon: const Image(image: AssetImage("assets/image/date.png"))
                          ),
                        ),
                          const SizedBox(height: 30,),
                          Container(
                            height: 50,
                            width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                color: Color(
                                    (labNameController.text.isNotEmpty && labMobileController.text.isNotEmpty && landLineNumberController.text.isNotEmpty
                                        && countryNameController.text.isNotEmpty && cityController.text.isNotEmpty && addressController.text.isNotEmpty
                                        && poBoxController.text.isNotEmpty && dateInputController.text.isNotEmpty)
                                        ? 0xFF166D6E : 0xFFA0A0A0)
                            ),
                            child: TextButton(
                                onPressed: () {
                                  if (formKey.currentState!.validate()){
                                    if(dateInputController.text.isEmpty) {
                                      Utils.showErrorToast("Please Select Establish Date");
                                    } else {
                                      manageProfile1();
                                    }
                                  }else{
                                    autoValidate = AutovalidateMode.always;
                                  }
                                },
                                child: Text("Continue",style: GoogleFonts.lato(fontSize: 15,fontWeight: FontWeight.w500,color: Colors.white))),
                          ),
                          const SizedBox(height: 40,),
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
    Utils.showLoadingDialog(context);
    var postUri = Uri.parse(ApiServices.manageProfile1Api);
      var bodyData = {
        "labName":labNameController.text.toString(),
        "mobileNumber":labMobileController.text.toString(),
        "landLineNumber":landLineNumberController.text.toString(),
        "country":countryNameController.text.toString(),
        "city":cityController.text.toString(),
        "address":addressController.text.toString(),
        "poBox":poBoxController.text.toString(),
        "dateOfEstablishment":dateInputController.text.toString()
      };
      var response = await http.post(
        postUri,
        body: jsonEncode(bodyData),
        headers: Utils.apiHeader,
      );
      Utils.logAPIResponse(body: bodyData, response: response,apiName: ApiServices.manageProfile1Api,function: "manageProfile1");
      Navigator.pop(context);
      if (response.statusCode == 200) {
        Map map = jsonDecode(response.body);
        if (map["status"] == 200) {
          Utils.setScreenStatus("2");
          Navigator.push(context, MaterialPageRoute(builder: (context) => const ManageProfile2(),));
          Utils.showSuccessToast(map['message']);
        } else {
          Utils.showErrorToast(map['message']);
        }
      }else{
        Utils.showErrorToast(jsonDecode(response.body)['message']);
      }
  }
}
