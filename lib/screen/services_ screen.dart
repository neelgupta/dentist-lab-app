import 'dart:convert';

import 'package:dentalapp/screen/starter_page_screen.dart';
import 'package:dentalapp/util/api_services.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

import '../models/all_added_service_model.dart';
import '../models/all_added_service_model.dart';
import '../services/lab_services/add_services_api.dart';

class ServicesScreen extends StatefulWidget {
  String description;
  ServicesScreen({Key? key,this.description = "",}) : super(key: key);

  @override
  State<ServicesScreen> createState() => _ServicesScreenState();
}

class _ServicesScreenState extends State<ServicesScreen> {

  List<AllAddedServicesModel> getServicesList = [];
  AllAddedServicesModel? allAddedServicesModel;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getServiceList();
  }


  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width  = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: SizedBox(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                    height: height*0.24,
                    decoration: const BoxDecoration(
                        color: Color(0xFF116D6E),
                        image: DecorationImage(image: AssetImage("assets/image/Group 12305.png"),
                            fit: BoxFit.fitWidth,alignment: Alignment.bottomCenter,opacity: 0.3)
                    ),
                    child: Align(
                        alignment: Alignment.center,
                        child: Column(
                          children: [
                            Container(
                              padding: EdgeInsets.only(left: 15,top: 40),
                              alignment: Alignment.centerLeft,
                              child: InkWell(
                                  onTap: () {
                                    Navigator.pop(context);
                                  },
                                  child: Icon(Icons.keyboard_backspace,color: Colors.white,)),
                            ),
                            SizedBox(height: height*0.05,),
                            Text("Services",style: GoogleFonts.lato(fontSize: 32,fontWeight: FontWeight.w600,color: Colors.white,),),
                          ],
                        ))
                ),
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: height*0.010,),
                      Text("Services",style: GoogleFonts.lato(fontSize: 18,fontWeight: FontWeight.w600,),),
                      SizedBox(height: height*0.025,),
                      SizedBox(
                        height: height*0.65,
                        child: ListView.separated(
                          scrollDirection: Axis.vertical,
                          itemBuilder: (context, index) {
                            return InkWell(
                              onTap: () {
                                Navigator.push(context, MaterialPageRoute(builder: (context) => StarterPageScreen(
                                  id: getServicesList[index].id,
                                ),));
                              },
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      Image(height: 20,image: AssetImage("assets/image/Delete.png")),
                                      SizedBox(width: 20,),
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text("${getServicesList[index].title}",style: GoogleFonts.lato(fontSize: 16,fontWeight: FontWeight.w600,),),
                                          Text("${getServicesList[index].price}",style: GoogleFonts.lato(fontSize: 14,fontWeight: FontWeight.w600,color: Color(0xFFA0A0A0)),)
                                        ],
                                      ),
                                      Spacer(),
                                      Icon(Icons.navigate_next,color: Color(0XFF707070),)
                                    ],
                                  ),
                                  SizedBox(height: height*0.010,),
                                  Divider(
                                    color: Color(0xFFE7E7E7),
                                    thickness: 1,
                                  ),
                                ],
                              ),
                            );
                          },
                          separatorBuilder: (context, index) {
                            return SizedBox(height: height*0.020,);
                          },
                          itemCount: getServicesList.length,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  getServiceList()async{
    Map data = await LabServices.allAddedService();
    if(data["serviceData"] != null){
      data["serviceData"].forEach((e){
        getServicesList.add(AllAddedServicesModel.fromJson(e));
      });
    }
    setState(() {
      getServicesList;
    });
  }

}

