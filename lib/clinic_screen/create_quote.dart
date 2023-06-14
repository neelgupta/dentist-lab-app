import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:dentalapp/clinic_screen/quote_successfully.dart';
import 'package:dentalapp/models/labs_model.dart';
import 'package:dentalapp/models/sevices_model.dart';
import 'package:dentalapp/services/clinic_services/client_profile_service.dart';
import 'package:dentalapp/util/utils.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart';
import 'package:intl/intl.dart';

class CreateQuote extends StatefulWidget {
  const CreateQuote({Key? key}) : super(key: key);

  @override
  State<CreateQuote> createState() => _CreateQuoteState();
}

class _CreateQuoteState extends State<CreateQuote> {

  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController dateInputController = TextEditingController();
  TextEditingController labsController = TextEditingController();
  ClientProfile clientProfile = ClientProfile();
  Service? service;
  Lab? lab;
  bool isLoading = true;
  final formKey = GlobalKey<FormState>();
  var autoValidate = AutovalidateMode.disabled;
  bool edit = false;
  bool billing = false;

  String priorityValue="normal";
  String quoteTypeValue="labList";
  bool method = false;

  List<ServiceData> services = [];
  List selectedLabs = [];
  List selectedService = [];
  List labNames = [];
  
  List<File> selectedImages = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getAllServices();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height -
        MediaQuery.of(context).padding.top -
        MediaQuery.of(context).padding.bottom;
    double width = MediaQuery.of(context).size.width -
        MediaQuery.of(context).padding.right -
        MediaQuery.of(context).padding.left;
    return  Scaffold(
      body: Form(
        key: formKey,
        autovalidateMode: autoValidate,
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: isLoading?Center(child: loader()):SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                    height: height*0.15,
                    decoration: const BoxDecoration(
                        color: Color(0xFF116D6E),
                        image: DecorationImage(image: AssetImage("assets/image/Group 12305.png"),
                            fit: BoxFit.fitWidth,alignment: Alignment.bottomCenter,opacity: 0.3)
                    ),
                    child: Column(mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(height: height*0.02,),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: width * 0.03),
                          child: Row(crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              InkWell(
                                  onTap: () {
                                    Navigator.pop(context);
                                  },
                                  child: const Icon(Icons.keyboard_backspace,color: Colors.white,)),
                              const Spacer(),
                              Center(child: Text(textAlign: TextAlign.center,"Quote",style: GoogleFonts.lato(fontSize: 28,fontWeight: FontWeight.w600,color: Colors.white,),)),
                              const Spacer(),
                              const Icon(Icons.keyboard_backspace,color: Colors.transparent,)
                            ],
                          ),
                        ),
                      ],
                    )
                ),
                SizedBox(height: height*0.03,),
                Padding(
                  padding: const EdgeInsets.only(left: 20,right: 20),
                  child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Create Quote",style: GoogleFonts.lato(fontSize: 19,fontWeight: FontWeight.w600),),
                      const Padding(
                        padding: EdgeInsets.only(top: 10),
                        child: Divider(thickness: 1,color: Color(0xffE7E7E7),),
                      ),
                      SizedBox(height: height*0.02,),
                      TextFormField(
                        textInputAction: TextInputAction.next,
                        controller: titleController,
                        keyboardType: TextInputType.name,
                        validator: (value) {
                          if(value == null || value.isEmpty){
                            return 'Please Enter Title';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: const BorderSide(color: Color(0xFF707070)),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: const BorderSide(color: Color(0xFF707070), ),
                          ),

                          labelText: 'Title',labelStyle: const TextStyle(color: Color(0xff707070)),
                          hintText: 'Title',
                          hintStyle: const TextStyle(fontSize: 15,fontWeight: FontWeight.w500,color: Color(0xFF707070)),
                          contentPadding: const EdgeInsets.only(left: 18,top: 16,bottom: 16),
                        ),
                      ),
                       SizedBox(height: height*0.02,),
                      TextFormField(maxLines: 3,
                        textInputAction: TextInputAction.next,
                        controller: descriptionController,
                        keyboardType: TextInputType.name,
                        validator: (value) {
                          if(value == null || value.isEmpty){
                            return 'Please Enter Description';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: const BorderSide(color: Color(0xFF707070)),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: const BorderSide(color: Color(0xFF707070), ),
                          ),
                          alignLabelWithHint: true,
                          labelText: 'Description',labelStyle: const TextStyle(color: Color(0xff707070)),
                          hintText: 'Description',
                          hintStyle: const TextStyle(fontSize: 15,fontWeight: FontWeight.w500,color: Color(0xFF707070)),
                          contentPadding: const EdgeInsets.only(left: 18,top: 16,bottom: 16),
                        ),
                      ),
                      SizedBox(height: height*0.02,),
                      Container(
                        height: 50,
                        width: width,
                        decoration: BoxDecoration(
                            border: Border.all(color: const Color(0xFF707070)),
                            borderRadius: BorderRadius.circular(10)
                        ),
                        child: ButtonTheme(
                          alignedDropdown: true,
                          child: DropdownButtonHideUnderline(
                            child: DropdownButton<ServiceData>(
                              menuMaxHeight: height*.4,
                              borderRadius: BorderRadius.circular(10),
                              value: null,
                              icon: const Icon(Icons.keyboard_arrow_down,color: Color(0xFF707070)),
                              hint: const Text("Services",style: TextStyle(color: Color(0xFF707070)),),
                              items: services
                                  .map<DropdownMenuItem<ServiceData>>((item) {
                                return DropdownMenuItem(
                                  value: item,
                                  child: SizedBox(width: width*0.75,child: Text(item.title ?? "")),
                                );
                              }).toList(),
                              onChanged: (value) {
                                if (!selectedService.contains(value)) {
                                  selectedService.add(value);
                                  setState(() {});
                                } else {
                                  Utils.showErrorToast("Service Already Selected...");
                                }
                              },
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: height*0.02,),
                      Wrap(
                          spacing: 10,
                          runSpacing: width*0.02,
                          children: (selectedService).map((item) {
                            return Container(
                              decoration: BoxDecoration(
                                border: Border.all(color: const Color(0xFF707070)),
                                borderRadius: BorderRadius.circular(5),
                              ),
                              padding: const EdgeInsets.symmetric(vertical: 5,horizontal: 5),
                              child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Text(item.title ?? ''),
                                    const SizedBox(width: 5,),
                                    InkWell(onTap: () {
                                      selectedService.remove(item);
                                      setState(() {});
                                    },child: const Icon(Icons.close,size: 15)),
                                  ]
                              ),
                            );
                          }).toList()
                      ),
                      SizedBox(height: height*0.01,),
                      Row(
                        children: [
                          Text(textAlign: TextAlign.center,"Priority :",style: GoogleFonts.lato(fontSize: 15,fontWeight: FontWeight.w500,color: const Color(0xff707070),),),

                          Row(
                            children: [
                              Radio(
                                value: "normal",
                                activeColor: const Color(0xFF116D6E),
                                groupValue: priorityValue,
                                onChanged: (value) {
                                  setState(() {
                                    priorityValue = value!;
                                    dateInputController.text = "";
                                  });
                                },
                              ),
                              Text("Normal",style: GoogleFonts.lato(fontSize: 15,fontWeight: FontWeight.w500,color: const Color(0xFF252525))),
                            ],
                          ),
                          Row(
                            children: [
                              Radio(
                                value: "urgent",
                                activeColor: const Color(0xFF116D6E),
                                groupValue: priorityValue,
                                onChanged: (value) {
                                  setState(() {
                                    priorityValue = value!;
                                  });
                                },
                              ),
                              Text("Urgent",style: GoogleFonts.lato(fontSize: 15,fontWeight: FontWeight.w500,color: const Color(0xFF252525))),
                            ],
                          ),
                        ],
                      ),

                      priorityValue=='urgent'?  Padding(
                        padding: const EdgeInsets.only(top: 10,bottom: 10),
                        child: TextFormField(
                          onTap: () async {
                            DateTime? pickedDate = await showDatePicker(
                                context: context,
                                initialDate: DateTime.now(),
                                firstDate: DateTime.now(),
                                lastDate: DateTime.now().add(const Duration(days: 365)));

                            if (pickedDate != null) {
                              dateInputController.text =
                                  DateFormat('dd MMMM yyyy').format(pickedDate);
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
                              labelText: 'Date till',
                              labelStyle: const TextStyle(fontSize: 15,fontWeight: FontWeight.w500,color: Color(0xFF707070)),
                              counterText: "",
                              hintStyle: const TextStyle(fontSize: 15,fontWeight: FontWeight.w500,color: Color(0xFF707070)),
                              contentPadding: const EdgeInsets.only(left: 18,top: 16,bottom: 16),
                              suffixIcon: const Image(image: AssetImage("assets/image/date.png"))
                          ),
                          validator: (value) {
                            if(priorityValue=='urgent' && value!.isEmpty){
                              return 'Please Select Date';
                            }
                            return null;
                          },
                        ),
                      ):const SizedBox(),

                      Row(
                        children: [
                          Text(textAlign: TextAlign.center,"Choose for :",style: GoogleFonts.lato(fontSize: 15,fontWeight: FontWeight.w500,color: const Color(0xff707070),),),

                          Row(
                            children: [
                              Radio(
                                value: "labList",
                                activeColor: const Color(0xFF116D6E),
                                groupValue: quoteTypeValue,
                                onChanged: (value) {
                                  setState(() {
                                    quoteTypeValue = value!;
                                  });
                                },
                              ),
                              Text("Lab List",style: GoogleFonts.lato(fontSize: 15,fontWeight: FontWeight.w500,color: const Color(0xFF252525))),
                            ],
                          ),
                          Row(
                            children: [
                              Radio(
                                value: "public",
                                activeColor: const Color(0xFF116D6E),
                                groupValue: quoteTypeValue,
                                onChanged: (value) {
                                  setState(() {
                                    quoteTypeValue = value!;
                                    selectedLabs.clear();
                                    labsController.text = "";
                                  });
                                },
                              ),
                              Text("Public",style: GoogleFonts.lato(fontSize: 15,fontWeight: FontWeight.w500,color: const Color(0xFF252525))),
                            ],
                          ),
                        ],
                      ),

                      if(quoteTypeValue=="labList")TypeAheadField(
                        textFieldConfiguration: TextFieldConfiguration(
                            controller: labsController,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                              hintText: "Search here...",
                              labelText: "Select Labs"
                            )),
                        hideSuggestionsOnKeyboardHide: false,
                        hideOnLoading: true,
                        suggestionsCallback: (suggestion) async {
                          if (labsController.text.isNotEmpty) {
                            return await getAllLabs();
                          }
                          return [];
                        },
                        loadingBuilder: (context) {
                          return const Center(child: CircularProgressIndicator());
                        },
                        itemBuilder: (context, suggestion) {
                          if (labsController.text.isNotEmpty) {
                            return ListTile(
                              title: Text(suggestion.toString()),
                            );
                          } else {
                            return Container();
                          }
                        },
                        direction: AxisDirection.up,
                        hideOnEmpty: true,
                        transitionBuilder: (context, suggestionsBox, controller) {
                          return suggestionsBox;
                        },
                        onSuggestionSelected: (suggestion) {
                          for(int i=0; i<(lab!.labData ?? []).length; i++) {
                            if(lab!.labData![i].labName==suggestion) {
                              selectedLabs.add(lab!.labData![i]);
                              break;
                            }
                          }
                          labsController.text = "";
                          setState(() {});
                        }
                      ),
                      if(quoteTypeValue=="labList")SizedBox(height: height*0.01,),
                      if(quoteTypeValue=="labList")Wrap(
                        spacing: 10,
                        runSpacing: width*0.02,
                        children: selectedLabs.map((item) {
                          return Container(
                              decoration: BoxDecoration(
                                border: Border.all(color: const Color(0xFF707070)),
                                borderRadius: BorderRadius.circular(5),
                              ),
                              padding: const EdgeInsets.symmetric(vertical: 5,horizontal: 5),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(item.labName ?? ''),
                                  const SizedBox(width: 5,),
                                  InkWell(onTap: () {
                                    selectedLabs.remove(item);
                                    setState(() {});
                                  },child: const Icon(Icons.close,size: 15)),
                                ]
                              ),
                          );
                        }).toList()
                      ),
                      SizedBox(height: height*0.01,),
                      Text(textAlign: TextAlign.center,"Upload Images",style: GoogleFonts.lato(fontSize: 15,fontWeight: FontWeight.w500,color: const Color(0xff707070))),
                      SizedBox(height: height*0.01,),
                      DottedBorder(
                        borderType: BorderType.RRect,
                        dashPattern: const [3, 3, 3],
                        radius: const Radius.circular(12),
                        color: const Color(0xFF116D6E),
                        padding: EdgeInsets.zero,
                        child: selectedImages.isNotEmpty?
                        GridView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          padding: EdgeInsets.symmetric(vertical: 5,horizontal: width*0.02),
                          itemCount: selectedImages.length + 1,
                          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
                          itemBuilder: (context, index) {
                            return index == selectedImages.length?InkWell(
                              onTap: () {
                                pickImages();
                              },
                              child: Container(
                                margin: EdgeInsets.all(width*0.01),
                                decoration: BoxDecoration(
                                    border: Border.all(color: const Color(0xFF116D6E)),
                                    borderRadius: BorderRadius.circular(10),
                                    color: Colors.white,
                                    image: const DecorationImage(
                                        image: AssetImage(
                                            "assets/image/camera.png"),
                                        fit: BoxFit.none)),
                              ),
                            ):Stack(
                              alignment: Alignment.topRight,
                              children: [
                                Container(
                                  margin: EdgeInsets.all(width*0.01),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      image: DecorationImage(image: FileImage(File(selectedImages[index].path)),fit: BoxFit.fill)
                                  ),
                                ),
                                InkWell(
                                  onTap: () {
                                    selectedImages.removeAt(index);
                                    setState(() {});
                                  },
                                  child: Container(
                                    padding: EdgeInsets.all(width*0.005),
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Colors.white,
                                      border: Border.all(color: Colors.red)
                                    ),
                                    child: const Icon(Icons.delete_outline,size: 15,color: Colors.red,),
                                  ),
                                )
                              ],
                            );
                          },) :ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          child: Container(
                            height: height * 0.13,
                            width: width,
                            alignment: Alignment.center,
                            color: const Color(0xFFF5F7F7),
                            child: InkWell(
                              onTap: () {
                                pickImages();
                              },
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                    height: 50,
                                    width: 50,
                                    decoration: BoxDecoration(
                                        borderRadius:
                                        BorderRadius.circular(50),
                                        color: Colors.white,
                                        image: const DecorationImage(
                                            image: AssetImage(
                                                "assets/image/camera.png"),
                                            fit: BoxFit.none)),
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  Text("Upload file",
                                      style: GoogleFonts.lato(
                                          fontSize: 15,
                                          fontWeight: FontWeight.w500,
                                          color: const Color(0xFF707070)))
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: height*0.005),
                      if(selectedImages.length<4)const Align(alignment: Alignment.centerLeft,child: Text("Minimum 4 Images Required*",style: TextStyle(color: Colors.red, fontSize: 12),)),
                      SizedBox(height: height*0.03,),
                      Container(
                        height: height * 0.064,
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color: const Color(0xff116D6E)),
                        child: TextButton(
                            onPressed: () {
                              if (formKey.currentState!.validate()) {
                                if(selectedService.isEmpty) {
                                  Utils.showErrorToast("Please Select Service");
                                } else if(quoteTypeValue=="labList" && selectedLabs.isEmpty) {
                                  Utils.showErrorToast("Please Select Labs");
                                } else if(selectedImages.isEmpty) {
                                  Utils.showErrorToast("Please Select Images");
                                } else if(selectedImages.length < 4) {
                                  Utils.showErrorToast("Please Select Minimum 4 Images");
                                } else {
                                  createQuote();
                                }
                              } else {
                                autoValidate = AutovalidateMode.always;
                                setState(() {});
                              }
                            },
                            child: Text("Create",
                                style: GoogleFonts.lato(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.white))),
                      ),
                      SizedBox(height: height*0.03,),
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

  Future<void> pickImages() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(allowMultiple: true,allowedExtensions: ['jpg', 'pdf', 'jpeg'],type: FileType.custom);

    if (result != null) {
      selectedImages.addAll(result.paths.map((path) => File(path!)));
      setState(() {});
    } else {
      // User canceled the picker
    }
  }

  getAllServices() async {
    Response response = await clientProfile.getServices();

    if(response.statusCode == 200) {
      service = Service.fromJson(jsonDecode(response.body));
      services.addAll(service!.serviceData ?? []);
    }

    isLoading = false;
    setState(() {});
  }

  getAllLabs() async {
    labNames.clear();
    var body = {
      "search" : labsController.text.trim()
    };
    Response response = await clientProfile.getLabNames(body);
    if(response.statusCode == 200) {
      lab = Lab.fromJson(jsonDecode(response.body));
      (lab!.labData ?? []).forEach((element) {
        if(element.labName!=null && (element.labName ?? "").isNotEmpty && !selectedLabs.contains(element)) {
          labNames.add(element.labName);
        }
      });
    }
    return labNames;
  }

  createQuote() async {
    Utils.showLoadingDialog(context);
    var serviceIds = [];
    selectedService.forEach((element) {serviceIds.add(element.id);});

    var labIds = [];
    selectedLabs.forEach((element) {labIds.add(element.id);});
    var body = {
      "title": titleController.text,
      "description": descriptionController.text,
      "serviceIds": serviceIds,
      "priority": priorityValue,
      "chooseFor": quoteTypeValue,
      if(labIds.isNotEmpty)"labs": labIds,
      if(dateInputController.text.isNotEmpty)"tillDate": dateInputController.text
    };
    Response response = await clientProfile.createQuote(body: body);
    Navigator.pop(context);
    if(response.statusCode == 201) {
      Utils.showSuccessToast(jsonDecode(response.body)['message']);
      Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) {
        return QuoteSuccessfully();
      },), (route) => false);
    } else {
      Utils.showErrorToast(jsonDecode(response.body)['message']);
    }
  }
}
