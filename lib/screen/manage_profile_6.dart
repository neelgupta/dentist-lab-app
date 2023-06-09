import 'package:dentalapp/screen/email_verified_done_screen.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:dentalapp/screen/set_up_done_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../models/manage_profile_6_model.dart';
import '../utils/api_services.dart';

enum PaymentMethod { first, second, third, none }
enum DeliveryMethods {cod , pd, none}

class ManageProfile6 extends StatefulWidget {
  const ManageProfile6({Key? key}) : super(key: key);

  @override
  State<ManageProfile6> createState() => _ManageProfile6State();
}

class _ManageProfile6State extends State<ManageProfile6> {

  PaymentMethod selectedPaymentOption = PaymentMethod.none;
  DeliveryMethods selectedDeliveryOption = DeliveryMethods.none;

  bool isLoading =  false;
  ManageProfile6Model? manageProfile6Model;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width  = MediaQuery.of(context).size.width;
    return SafeArea(
        child:Scaffold(
          resizeToAvoidBottomInset: false,
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
                        SizedBox(height: 10,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("6/",style: GoogleFonts.lato(fontSize: 17,fontWeight: FontWeight.w600),),
                            Text("6",style: GoogleFonts.lato(fontSize: 17,fontWeight: FontWeight.w600,color: Color(0xFFA0A0A0)),),
                          ],
                        ),
                        SizedBox(height: 10,),
                        Text("Delivery Methods",style: GoogleFonts.lato(fontSize: 18,fontWeight: FontWeight.w600),),
                        SizedBox(height: 10,),
                        Text("Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
                          style: GoogleFonts.lato(fontSize: 14,fontWeight: FontWeight.w500,color: Color(0xFF707070)),),
                        SizedBox(height: 20,),
                        selectedDeliveryOption == DeliveryMethods.cod ? Container(
                          height: height*0.065,
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                              border: Border.all(color: Color(0xFF116D6E) ),
                              borderRadius:BorderRadius.circular(12)
                          ),
                          child: Row(
                            children: [
                              SizedBox(width: 18,),
                              Image(image: AssetImage("assets/image/cod.png"),color: Color(0xFF116D6E),),
                              SizedBox(width: 12,),
                              Text("COD",style: GoogleFonts.lato(fontSize: 17,fontWeight: FontWeight.w400,color: Color(0xFF116D6E))),
                              Spacer(),
                              Radio(
                                value: DeliveryMethods.cod,
                                activeColor: Color(0xFF116D6E),
                                groupValue: selectedDeliveryOption,
                                onChanged: (value) {
                                  setState(() {
                                    selectedDeliveryOption = value!;
                                  });
                                },
                              ),
                            ],
                          ),
                        ) :
                        Container(
                          height: height*0.065,
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                              border: Border.all(color: Color(0xFF707070) ),
                              borderRadius:BorderRadius.circular(12)
                          ),
                          child: Row(
                            children: [
                              SizedBox(width: 18,),
                              Image(image: AssetImage("assets/image/cod.png")),
                              SizedBox(width: 12,),
                              Text("COD",style: GoogleFonts.lato(fontSize: 17,fontWeight: FontWeight.w400,color: Color(0xFF707070))),
                              Spacer(),
                              Radio(
                                value: DeliveryMethods.cod,
                                activeColor: Color(0xFF116D6E),
                                groupValue: selectedDeliveryOption,
                                onChanged: (value) {
                                  setState(() {
                                    selectedDeliveryOption = value!;
                                  });
                                },
                              ),
                            ],
                          ),
                        ),

                        SizedBox(height: 20,),
                         selectedDeliveryOption == DeliveryMethods.pd ? Container(
                           height: height*0.065,
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                              border: Border.all(color: Color(0xFF116D6E)),
                              borderRadius:BorderRadius.circular(12)
                          ),
                          child: Row(
                            children: [
                              SizedBox(width: 18,),
                              Image(image: AssetImage("assets/image/Dollar Square.png"),color: Color(0xFF116D6E)),
                              SizedBox(width: 12,),
                              Text("Paid Delivery",style: GoogleFonts.lato(fontSize: 17,fontWeight: FontWeight.w400,color: Color(0xFF116D6E))),
                              Spacer(),
                              Radio(
                                value: DeliveryMethods.pd,
                                activeColor: Color(0xFF116D6E),
                                groupValue: selectedDeliveryOption,
                                onChanged: (value) {
                                  setState(() {
                                    selectedDeliveryOption = value!;
                                  });
                                },
                              ),
                            ],
                          ),
                        ) :
                         Container(
                           height: height*0.065,
                           width: MediaQuery.of(context).size.width,
                           decoration: BoxDecoration(
                               border: Border.all(color:Color(0xFF707070)),
                               borderRadius:BorderRadius.circular(12)
                           ),
                           child: Row(
                             children: [
                               SizedBox(width: 18,),
                               Image(image: AssetImage("assets/image/Dollar Square.png")),
                               SizedBox(width: 12,),
                               Text("Paid Delivery",style: GoogleFonts.lato(fontSize: 17,fontWeight: FontWeight.w400,color: Color(0xFF707070))),
                               Spacer(),
                               Radio(
                                 value: DeliveryMethods.pd,
                                 activeColor: Color(0xFF116D6E),
                                 groupValue: selectedDeliveryOption,
                                 onChanged: (value) {
                                   setState(() {
                                     selectedDeliveryOption = value!;
                                   });
                                 },
                               ),
                             ],
                           ),
                         ),

                        SizedBox(height: 20,),
                        Divider(color: Color(0xFFE7E7E7),thickness: 2),
                        SizedBox(height: 25,),
                        Text("Payment Methods",style: GoogleFonts.lato(fontSize: 18,fontWeight: FontWeight.w600),),
                        SizedBox(height: 10,),
                        Text("Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
                          style: GoogleFonts.lato(fontSize: 14,fontWeight: FontWeight.w500,color: Color(0xFF707070)),),
                        SizedBox(height: 20,),


                        selectedPaymentOption == PaymentMethod.first  ? Container(
                          height: height*0.065,
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                              border: Border.all(color: Color(0xFF116D6E)),
                              borderRadius:BorderRadius.circular(12)
                          ),
                          child: Row(
                            children: [
                              SizedBox(width: 18,),
                              Image(image: AssetImage("assets/image/cod.png"),color: Color(0xFF116D6E)),
                              SizedBox(width: 12,),
                              Text("Online Payment",style: GoogleFonts.lato(fontSize: 17,fontWeight: FontWeight.w400,color: Color(0xFF116D6E))),
                              Spacer(),
                              Radio(
                                value: PaymentMethod.first,
                                activeColor: Color(0xFF116D6E),
                                groupValue: selectedPaymentOption,
                                onChanged: (value) {
                                  setState(() {
                                    selectedPaymentOption = value!;
                                  });
                                },
                              ),
                            ],
                          ),
                        ) :
                        Container(
                          height: height*0.065,
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                              border: Border.all(color: Color(0xFF707070)),
                              borderRadius:BorderRadius.circular(12)
                          ),
                          child: Row(
                            children: [
                              SizedBox(width: 18,),
                              Image(image: AssetImage("assets/image/cod.png")),
                              SizedBox(width: 12,),
                              Text("Online Payment",style: GoogleFonts.lato(fontSize: 17,fontWeight: FontWeight.w400,color: Color(0xFF707070))),
                              Spacer(),
                              Radio(
                                value: PaymentMethod.first,
                                activeColor: Color(0xFF116D6E),
                                groupValue: selectedPaymentOption,
                                onChanged: (value) {
                                  setState(() {
                                    selectedPaymentOption = value!;
                                  });
                                },
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 20,),


                        selectedPaymentOption == PaymentMethod.second ?
                        Container(
                          height: height*0.065,
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                              border: Border.all(color: Color(0xFF116D6E)),
                              borderRadius:BorderRadius.circular(12)
                          ),
                          child: Row(
                            children: [
                              SizedBox(width: 18,),
                              const Image(image: AssetImage("assets/image/Dollar Square.png"),color: Color(0xFF116D6E)),
                              SizedBox(width: 12,),
                              Text("Cash",style: GoogleFonts.lato(fontSize: 17,fontWeight: FontWeight.w400,color: Color(0xFF116D6E))),
                              Spacer(),
                              Radio(
                                value: PaymentMethod.second,
                                activeColor: Color(0xFF116D6E),
                                groupValue: selectedPaymentOption,
                                onChanged: (value) {
                                  setState(() {
                                    selectedPaymentOption = value!;
                                  });
                                },
                              ),
                            ],
                          ),
                        ) :
                        Container(
                          height: height*0.065,
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                              border: Border.all(color: Color(0xFF707070)),
                              borderRadius:BorderRadius.circular(12)
                          ),
                          child: Row(
                            children: [
                              SizedBox(width: 18,),
                              const Image(image: AssetImage("assets/image/Dollar Square.png")),
                              SizedBox(width: 12,),
                              Text("Cash",style: GoogleFonts.lato(fontSize: 17,fontWeight: FontWeight.w400,color: Color(0xFF707070))),
                              Spacer(),
                              Radio(
                                value: PaymentMethod.second,
                                activeColor: Color(0xFF116D6E),
                                groupValue: selectedPaymentOption,
                                onChanged: (value) {
                                  setState(() {
                                    selectedPaymentOption = value!;
                                  });
                                },
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 20,),

                        selectedPaymentOption == PaymentMethod.third ?
                        Container(
                          height: height*0.065,
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                              border: Border.all(color: Color(0xFF116D6E)),
                              borderRadius:BorderRadius.circular(12)
                          ),
                          child: Row(
                            children: [
                              SizedBox(width: 18,),
                              const Image(image: AssetImage("assets/image/Ticket 2.png"),color: Color(0xFF116D6E)),
                              SizedBox(width: 12,),
                              Text("Cheque",style: GoogleFonts.lato(fontSize: 17,fontWeight: FontWeight.w400,color: Color(0xFF116D6E))),
                              Spacer(),
                              Radio(
                                value: PaymentMethod.third,
                                activeColor: Color(0xFF116D6E),
                                groupValue: selectedPaymentOption,
                                onChanged: (value) {
                                  setState(() {
                                    selectedPaymentOption = value!;
                                  });
                                },
                              ),
                            ],
                          ),
                        ) :
                        Container(
                          height: height*0.065,
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                              border: Border.all(color: Color(0xFF707070)),
                              borderRadius:BorderRadius.circular(12)
                          ),
                          child: Row(
                            children: [
                              SizedBox(width: 18,),
                              const Image(image: AssetImage("assets/image/Ticket 2.png")),
                              SizedBox(width: 12,),
                              Text("Cheque",style: GoogleFonts.lato(fontSize: 17,fontWeight: FontWeight.w400,color: Color(0xFF707070))),
                              Spacer(),
                              Radio(
                                value: PaymentMethod.third,
                                activeColor: Color(0xFF116D6E),
                                groupValue: selectedPaymentOption,
                                onChanged: (value) {
                                  setState(() {
                                    selectedPaymentOption = value!;
                                  });
                                },
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: height*0.035,),
                        Container(
                          height: height*0.066,
                          width: MediaQuery.of(context).size.width,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              primary: selectedPaymentOption != PaymentMethod.none ? Color(0xFF116D6E)  : Color(0xFFA0A0A0)
                            ),
                              onPressed: () {
                                 manageProfile6();
                              },
                              child: Text("Continue",style: GoogleFonts.lato(fontSize: 15,fontWeight: FontWeight.w500,color: Colors.white))),
                        ),
                        SizedBox(height: height*0.025,),
                      ],),
                  ),
                ],
              ),
            ),
          ) : const Center(
            child: CircularProgressIndicator(),
          )
        ));
  }
  manageProfile6()async{
    var postUri = Uri.parse(ApiServices.manageProfile6Api);
    try {
      setState(() {
        isLoading = true;
      });
      var bodyData = {
        "deliveryMethod": selectedDeliveryOption.index.toString(),
        "paymentMethod": selectedPaymentOption.index.toString()
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
          manageProfile6Model = ManageProfile6Model.fromJson(jsonDecode(response.body));
          Navigator.push(context, MaterialPageRoute(builder: (context) => SetUpDoneScreen(),));
          Fluttertoast.showToast(
              msg: "${manageProfile6Model?.message}",
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.BOTTOM,
              timeInSecForIosWeb: 1,
              backgroundColor: Colors.black,
              textColor: Colors.white,
              fontSize: 16.0
          );
        } else {
          Fluttertoast.showToast(
              msg: "${manageProfile6Model?.message}",
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
