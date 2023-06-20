import 'dart:convert';
import 'package:dentalapp/screen/add_services_screen.dart';
import 'package:dentalapp/services/lab_services/add_services_api.dart';
import 'package:dentalapp/util/utils.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart';
import '../models/single_service_model.dart';


class ServiceDetailsScreen extends StatefulWidget {
  final String id;
  const ServiceDetailsScreen({Key? key,required this.id}) : super(key: key);

  @override
  State<ServiceDetailsScreen> createState() => _ServiceDetailsScreenState();
}

class _ServiceDetailsScreenState extends State<ServiceDetailsScreen> {

  bool isGalleryVisible= false;
  SingleServiceModel? userService;
  bool isLoading = true;
  Service? service;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getServiceData();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width  = MediaQuery.of(context).size.width;
    return SafeArea(
        child: Scaffold(
          body: isLoading?Center(child: loader()):SizedBox(
              height:MediaQuery.of(context).size.height,
              width:MediaQuery.of(context).size.width,
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                children: [
                  Container(
                      height: height*0.33,
                      decoration: const BoxDecoration(
                          image: DecorationImage(image: AssetImage("assets/image/StartPage.png"),
                              fit: BoxFit.fitWidth,alignment: Alignment.bottomCenter)
                      ),
                      child: Align(
                          alignment: Alignment.center,
                          child: Column(
                            children: [
                              Container(
                                padding: const EdgeInsets.only(left: 15,top: 40),
                                alignment: Alignment.centerLeft,
                                child: InkWell(
                                    onTap: () {
                                      Navigator.pop(context);
                                    },
                                    child: const Icon(Icons.keyboard_backspace,color: Colors.white,)),
                              ),
                            ],
                          ))
                  ),
                  userService==null?const Center(child: Text("No Data Found !!! \n\n Please Try Again.")):Container(
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(topLeft: Radius.circular(15),topRight: Radius.circular(15))
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("${userService!.title}",style: GoogleFonts.lato(fontSize: 19,fontWeight: FontWeight.w700,),),
                          const SizedBox(height: 5,),
                          Text("AED ${userService!.price}",style: GoogleFonts.lato(fontSize: 14,fontWeight: FontWeight.w400,color: const Color(0xFFA0A0A0)),),
                          SizedBox(height: height*0.020,),
                          const Divider(thickness: 1,color: Color(0xFFE7E7E7),),
                          SizedBox(height: height*0.020,),
                          Text("Description",style: GoogleFonts.lato(fontSize: 17,fontWeight: FontWeight.w600,),),
                          SizedBox(height: height*0.020,),
                          Text("${userService!.description}",
                              style: GoogleFonts.lato(fontSize: 14,fontWeight: FontWeight.w400,color: const Color(0xFF707070)),maxLines: isGalleryVisible?null:4,overflow: TextOverflow.ellipsis,),
                          SizedBox(height: height*0.020,),
                          if(isGalleryVisible && userService!.serviceImags.isNotEmpty)
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Divider(thickness: 1,color: Color(0xFFE7E7E7),),
                                SizedBox(height: height*0.015,),
                                Text("Gallery",style: GoogleFonts.lato(fontSize: 17,fontWeight: FontWeight.w600,),),
                                SizedBox(height: height*0.020,),
                                SizedBox(
                                  height: width*0.35,
                                  child: ListView.builder(
                                    scrollDirection: Axis.horizontal,
                                      itemBuilder: (context, index) {
                                        return Container(
                                          height: width*0.35,
                                          width: width*0.35,
                                          margin: EdgeInsets.symmetric(horizontal: width*0.01),
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(10),
                                              image: DecorationImage(
                                                  image:  NetworkImage(userService!.serviceImags[index]),
                                                  fit: BoxFit.fill
                                              )
                                          ),
                                        );
                                      },
                                      itemCount: userService!.serviceImags.length),
                                ),
                                SizedBox(height: height*0.02),
                              ],
                            ),
                          InkWell(
                            onTap: () {
                              setState(() {
                                isGalleryVisible = !isGalleryVisible;
                              });
                            },
                            child: isGalleryVisible ? Container(
                              decoration:BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                border: Border.all(color: const Color(0xFF116D6E))
                              ),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(vertical: 14),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text("View Less",style: GoogleFonts.lato(fontSize: 15,fontWeight: FontWeight.w700,color: const Color(0xFF116D6E)),),
                                    const SizedBox(width: 15,),
                                    const Icon(Icons.expand_less_rounded,color: Color(0xFF116D6E),)
                                  ],
                                ),
                              ),
                            )
                                : Container(
                              decoration:BoxDecoration(
                                  borderRadius: BorderRadius.circular(12),
                                  border: Border.all(color: const Color(0xFF116D6E))
                              ),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(vertical: 14),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text("View More Desription",style: GoogleFonts.lato(fontSize: 15,fontWeight: FontWeight.w700,color: const Color(0xFF116D6E)),),
                                    const SizedBox(width: 15,),
                                    const Icon(Icons.expand_more_rounded,color: Color(0xFF116D6E),)
                                  ],
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: height*0.02),
                          const Divider(thickness: 1,color: Color(0xFFE7E7E7),),
                          SizedBox(height: height*0.02,),
                          // Text("You May Like",style: GoogleFonts.lato(fontSize: 17,fontWeight: FontWeight.w600,),),
                          // SizedBox(height: height*0.02),
                          // SizedBox(
                          //   height: height*0.25,
                          //   child: ListView.separated(
                          //     scrollDirection: Axis.horizontal,
                          //       itemBuilder: (context, index) {
                          //         return Column(
                          //           children: [
                          //             Container(
                          //               height: 85,
                          //               width: 85,
                          //               decoration: BoxDecoration(
                          //                   borderRadius: BorderRadius.circular(8),
                          //                   image: const DecorationImage(image: AssetImage("assets/image/gallery3.png"),fit: BoxFit.cover)
                          //               ),
                          //             ),
                          //             const SizedBox(height: 10,),
                          //             Text("Orthodontic\nAppliances",style: GoogleFonts.lato(fontSize: 13,fontWeight: FontWeight.w600,),textAlign: TextAlign.center,),
                          //           ],
                          //         );
                          //       },
                          //       separatorBuilder: (context, index) {
                          //         return SizedBox(width: width*0.030,);
                          //       },
                          //       itemCount: 5),
                          // ),
                          Container(
                            width: width,
                            decoration: BoxDecoration(
                              color: const Color(0xFF116D6E),
                              borderRadius: BorderRadius.circular(12),
                              border: Border.all(color: const Color(0xFF116D6E)),
                            ),
                            child: TextButton(
                                onPressed: () {
                                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                                    return AddServicesScreen(userService: userService,);
                                  },)).then((value) => getServiceData());
                                },
                                child: Text("Edit",style: GoogleFonts.lato(fontSize: 13,fontWeight: FontWeight.w600,color: Colors.white),textAlign: TextAlign.center,)),
                          ),
                          SizedBox(height: height*0.030,),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }

  getServiceData() async{
    Response response = await LabServices.getSingleService(widget.id);
    if(response.statusCode == 200) {
      service = Service.fromJson(jsonDecode(response.body));
      userService = service!.serviceData!.first;
    } else if (response.statusCode == 401) {
      Utils.logout(context);
    }
    isLoading = false;
    setState(() {});
  }
}
