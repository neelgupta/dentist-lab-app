// ignore_for_file: use_build_context_synchronously

import 'dart:convert';
import 'package:dentalapp/screen/add_services_screen.dart';
import 'package:dentalapp/screen/lab_home.dart';
import 'package:dentalapp/screen/service_detail_screen.dart';
import 'package:dentalapp/util/utils.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart';
import '../models/all_added_service_model.dart';
import '../services/lab_services/add_services_api.dart';

class ServicesScreen extends StatefulWidget {
  const ServicesScreen({Key? key}) : super(key: key);

  @override
  State<ServicesScreen> createState() => _ServicesScreenState();
}

class _ServicesScreenState extends State<ServicesScreen> {
  List<AllAddedServicesModel> getServicesList = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    getServiceList();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return WillPopScope(
      onWillPop: goBack,
      child: SafeArea(
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          body: SizedBox(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: isLoading
                ? Center(child: loader())
                : SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                            height: height * 0.24,
                            decoration: const BoxDecoration(
                                color: Color(0xFF116D6E),
                                image: DecorationImage(
                                    image: AssetImage(
                                        "assets/image/Group 12305.png"),
                                    fit: BoxFit.fitWidth,
                                    alignment: Alignment.bottomCenter,
                                    opacity: 0.3)),
                            child: Align(
                                alignment: Alignment.center,
                                child: Column(
                                  children: [
                                    Container(
                                      padding: EdgeInsets.only(
                                          left: width * 0.06,
                                          top: height * 0.03),
                                      alignment: Alignment.centerLeft,
                                      child: InkWell(
                                          onTap: () {
                                            goBack();
                                          },
                                          child: const Icon(
                                            Icons.keyboard_backspace,
                                            color: Colors.white,
                                          )),
                                    ),
                                    SizedBox(
                                      height: height * 0.04,
                                    ),
                                    Text(
                                      "Services",
                                      style: GoogleFonts.lato(
                                        fontSize: 32,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ],
                                ))),
                        getServicesList.isNotEmpty
                            ? Padding(
                                padding: EdgeInsets.all(width * 0.05),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      height: height * 0.010,
                                    ),
                                    Text(
                                      "Services",
                                      style: GoogleFonts.lato(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    SizedBox(
                                      height: height * 0.025,
                                    ),
                                    SizedBox(
                                      height: height * 0.65,
                                      child: ListView.separated(
                                        scrollDirection: Axis.vertical,
                                        itemBuilder: (context, index) {
                                          return InkWell(
                                            onTap: () {
                                              Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                    builder: (context) =>
                                                        ServiceDetailsScreen(
                                                      id: getServicesList[index]
                                                          .id,
                                                    ),
                                                  ));
                                            },
                                            child: Column(
                                              children: [
                                                Row(
                                                  children: [
                                                    InkWell(
                                                        onTap: () {
                                                          deleteService(index);
                                                        },
                                                        child: const Image(
                                                            height: 20,
                                                            image: AssetImage(
                                                                "assets/image/Delete.png"))),
                                                    SizedBox(
                                                        width: width * 0.05),
                                                    Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Text(
                                                          getServicesList[index]
                                                              .title,
                                                          style:
                                                              GoogleFonts.lato(
                                                            fontSize: 18,
                                                            fontWeight:
                                                                FontWeight.w500,
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          height:
                                                              height * 0.005,
                                                        ),
                                                        Text(
                                                          "AED ${getServicesList[index].price}",
                                                          style: GoogleFonts.lato(
                                                              fontSize: 14,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w400,
                                                              color: const Color(
                                                                  0xFFA0A0A0)),
                                                        )
                                                      ],
                                                    ),
                                                    const Spacer(),
                                                    const Icon(
                                                      Icons.navigate_next,
                                                      color: Color(0XFF707070),
                                                    )
                                                  ],
                                                ),
                                                SizedBox(
                                                  height: height * 0.010,
                                                ),
                                                const Divider(
                                                  color: Color(0xFFE7E7E7),
                                                  thickness: 1,
                                                ),
                                              ],
                                            ),
                                          );
                                        },
                                        separatorBuilder: (context, index) {
                                          return SizedBox(
                                            height: height * 0.020,
                                          );
                                        },
                                        itemCount: getServicesList.length,
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            : Container(
                                height: height * 0.5,
                                alignment: Alignment.center,
                                child: const Text("No Service Found !!!"),
                              ),
                      ],
                    ),
                  ),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(
                builder: (context) {
                  return const AddServicesScreen();
                },
              )).then((value) => getServiceList());
            },
            backgroundColor: const Color(0xFF116D6E),
            child: const Icon(Icons.add),
          ),
        ),
      ),
    );
  }

  getServiceList() async {
    setState(() {
      isLoading = true;
    });
    Response response = await LabServices.getAllService();

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      List services = data["serviceData"] ?? [];
      if (services.isNotEmpty) {
        getServicesList.clear();
        for (var e in services) {
          getServicesList.add(AllAddedServicesModel.fromJson(e));
        }
      }
    } else if (response.statusCode == 401) {
      Utils.logout(context);
    } else {
      getServicesList = [];
    }
    isLoading = false;
    setState(() {});
  }

  deleteService(index) async {
    Utils.showLoadingDialog(context);
    Response response =
        await LabServices.deleteService(getServicesList[index].id);
    Navigator.pop(context);
    if (response.statusCode == 200) {
      getServicesList.removeAt(index);
      Utils.showSuccessToast(jsonDecode(response.body)['message']);
    } else if (response.statusCode == 401) {
      Utils.logout(context);
    } else {
      Utils.showErrorToast(jsonDecode(response.body)['message']);
    }
    isLoading = false;
    setState(() {});
  }

  Future<bool> goBack() async {
    Navigator.pushAndRemoveUntil(context, MaterialPageRoute(
      builder: (context) {
        return const LabHome(index: 0);
      },
    ), (route) => false);
    return true;
  }
}
