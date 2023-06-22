// ignore_for_file: use_build_context_synchronously

import 'dart:convert';
import 'dart:io';
import 'package:dentalapp/clinic_screen/create_quote.dart';
import 'package:dentalapp/models/single_service_model.dart';
import 'package:dentalapp/util/api_services.dart';
import 'package:dentalapp/util/utils.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;

class AddServicesScreen extends StatefulWidget {
  final SingleServiceModel? userService;
  const AddServicesScreen({Key? key, this.userService}) : super(key: key);

  @override
  State<AddServicesScreen> createState() => _AddServicesScreenState();
}

class _AddServicesScreenState extends State<AddServicesScreen> {
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController servicePriceController = TextEditingController();

  final formKey = GlobalKey<FormState>();
  var autoValidate = AutovalidateMode.disabled;

  List<ImageData> selectedServicesImage = [];
  List oldImages = [];
  bool isImageSelected = false;

  @override
  void initState() {
    super.initState();
    if (widget.userService != null) {
      titleController.text = widget.userService!.title ?? "";
      descriptionController.text = widget.userService!.description ?? "";
      servicePriceController.text = widget.userService!.price ?? "";
      for (var item in widget.userService!.serviceImags ?? []) {
        selectedServicesImage.add(ImageData("1", item, "network"));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Form(
      key: formKey,
      autovalidateMode: autoValidate,
      child: SafeArea(
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
                      height: height * 0.24,
                      decoration: const BoxDecoration(
                          color: Color(0xFF116D6E),
                          image: DecorationImage(
                              image: AssetImage("assets/image/Group 12305.png"),
                              fit: BoxFit.fitWidth,
                              alignment: Alignment.bottomCenter,
                              opacity: 0.3)),
                      child: Align(
                          alignment: Alignment.center,
                          child: Column(
                            children: [
                              Container(
                                padding: EdgeInsets.only(
                                    left: 15, top: height * 0.040),
                                alignment: Alignment.centerLeft,
                                child: InkWell(
                                    onTap: () {
                                      Navigator.pop(context);
                                    },
                                    child: const Icon(
                                      Icons.keyboard_backspace,
                                      color: Colors.white,
                                    )),
                              ),
                              SizedBox(
                                height: height * 0.05,
                              ),
                              Text(
                                widget.userService != null
                                    ? "Edit Service"
                                    : "Add Service",
                                style: GoogleFonts.lato(
                                  fontSize: 32,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ))),
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: width * 0.035, vertical: height * 0.027),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: height * 0.020,
                        ),
                        Text(
                          "Services",
                          style: GoogleFonts.lato(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        SizedBox(
                          height: height * 0.020,
                        ),
                        TextFormField(
                          textInputAction: TextInputAction.next,
                          keyboardType: TextInputType.name,
                          controller: titleController,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please Enter Title';
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                                borderSide:
                                    const BorderSide(color: Color(0xFF707070))),
                            labelText: 'Title',
                            hintText: 'Title',
                            hintStyle: const TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w500,
                                color: Color(0xFF707070)),
                            contentPadding: const EdgeInsets.only(
                                left: 18, top: 16, bottom: 16),
                          ),
                        ),
                        SizedBox(
                          height: height * 0.020,
                        ),
                        TextFormField(
                          textAlign: TextAlign.start,
                          controller: descriptionController,
                          keyboardType: TextInputType.multiline,
                          minLines: 2,
                          //Normal textInputField will be displayed
                          maxLines: 6,
                          textAlignVertical: TextAlignVertical.top,
                          textInputAction: TextInputAction.next,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please Enter Description';
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                            alignLabelWithHint: true,
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                                borderSide:
                                    const BorderSide(color: Color(0xFF707070))),
                            labelText: 'Description',
                            labelStyle: const TextStyle(
                              fontSize: 14,
                            ),
                            hintText: 'Description',
                            hintStyle: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: Color(0xFF707070),
                            ),
                            contentPadding: const EdgeInsets.only(
                                left: 18, top: 16, bottom: 16, right: 5),
                          ),
                        ),
                        SizedBox(
                          height: height * 0.020,
                        ),
                        TextFormField(
                          controller: servicePriceController,
                          keyboardType: TextInputType.number,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please Enter Service Price';
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                              labelText: "Service Price",
                              hintText: "Service Price",
                              counterText: "",
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12),
                                  borderSide: const BorderSide(
                                      color: Color(0xFF707070))),
                              prefixIcon: Container(
                                width: width * 0.15,
                                margin: EdgeInsets.symmetric(
                                    horizontal: width * 0.02, vertical: 5),
                                decoration: const BoxDecoration(
                                    border: Border(
                                        right: BorderSide(
                                            color: Color(0xFF707070)))),
                                alignment: Alignment.center,
                                child: const Text(
                                  "AED",
                                  style: TextStyle(color: Color(0xFF707070)),
                                ),
                              )),
                        ),
                        SizedBox(
                          height: height * 0.020,
                        ),
                        const Divider(
                          height: 5,
                          thickness: 1,
                          color: Color(0xFFE7E7E7),
                        ),
                        SizedBox(
                          height: height * 0.020,
                        ),
                        Text(
                          "Services Images",
                          style: GoogleFonts.lato(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        SizedBox(
                          height: height * 0.020,
                        ),
                        DottedBorder(
                          borderType: BorderType.RRect,
                          dashPattern: const [3, 3, 3],
                          radius: const Radius.circular(12),
                          color: const Color(0xFF116D6E),
                          padding: EdgeInsets.zero,
                          child: selectedServicesImage.isNotEmpty
                              ? GridView.builder(
                                  shrinkWrap: true,
                                  physics: const NeverScrollableScrollPhysics(),
                                  padding: EdgeInsets.symmetric(
                                      vertical: 5, horizontal: width * 0.02),
                                  itemCount: selectedServicesImage.length + 1,
                                  gridDelegate:
                                      const SliverGridDelegateWithFixedCrossAxisCount(
                                          crossAxisCount: 3),
                                  itemBuilder: (context, index) {
                                    return index == selectedServicesImage.length
                                        ? InkWell(
                                            onTap: () {
                                              setState(() {
                                                pickImages1();
                                              });
                                            },
                                            child: Container(
                                              margin:
                                                  EdgeInsets.all(width * 0.01),
                                              decoration: BoxDecoration(
                                                  border: Border.all(
                                                      color: const Color(
                                                          0xFF116D6E)),
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                  color: Colors.white,
                                                  image: const DecorationImage(
                                                      image: AssetImage(
                                                          "assets/image/camera.png"),
                                                      fit: BoxFit.none)),
                                            ),
                                          )
                                        : Stack(
                                            alignment: Alignment.topRight,
                                            children: [
                                              Container(
                                                margin: EdgeInsets.all(
                                                    width * 0.01),
                                                decoration: selectedServicesImage[index].type ==
                                                        "file"
                                                    ? BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius.circular(
                                                                10),
                                                        image: DecorationImage(
                                                            image: FileImage(File(
                                                                selectedServicesImage[index]
                                                                    .path)),
                                                            fit: BoxFit.fill))
                                                    : BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius.circular(
                                                                10),
                                                        image: DecorationImage(
                                                            image: NetworkImage(
                                                                selectedServicesImage[index].path),
                                                            fit: BoxFit.fill)),
                                              ),
                                              InkWell(
                                                onTap: () {
                                                  if (selectedServicesImage[
                                                              index]
                                                          .type ==
                                                      'network') {
                                                    oldImages.add(
                                                        selectedServicesImage[
                                                                index]
                                                            .path);
                                                  }
                                                  selectedServicesImage
                                                      .removeAt(index);
                                                  setState(() {});
                                                },
                                                child: Container(
                                                  padding: EdgeInsets.all(
                                                      width * 0.005),
                                                  decoration: BoxDecoration(
                                                      shape: BoxShape.circle,
                                                      color: Colors.white,
                                                      border: Border.all(
                                                          color: Colors.red)),
                                                  child: const Icon(
                                                    Icons.delete_outline,
                                                    size: 15,
                                                    color: Colors.red,
                                                  ),
                                                ),
                                              )
                                            ],
                                          );
                                  },
                                )
                              : ClipRRect(
                                  borderRadius: BorderRadius.circular(12),
                                  child: Container(
                                    height: height * 0.13,
                                    width: width,
                                    alignment: Alignment.center,
                                    color: const Color(0xFFF5F7F7),
                                    child: InkWell(
                                      onTap: () {
                                        setState(() {
                                          pickImages1();
                                        });
                                      },
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
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
                                                  color:
                                                      const Color(0xFF707070)))
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                        ),
                        if (isImageSelected && selectedServicesImage.isEmpty)
                          Utils.showCustomError(
                              message: "Please Select Service Image")
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: width * 0.057, vertical: height * 0.020),
                    child: Container(
                      height: height * 0.064,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: Color(titleController.text.isNotEmpty &&
                                  descriptionController.text.isNotEmpty &&
                                  servicePriceController.text.isNotEmpty &&
                                  selectedServicesImage.isNotEmpty
                              ? 0xFF116D6E
                              : 0xFFA0A0A0)),
                      child: TextButton(
                          onPressed: () {
                            if (selectedServicesImage.isEmpty) {
                              isImageSelected = true;
                              setState(() {});
                            }
                            if (formKey.currentState!.validate()) {
                              if (selectedServicesImage.isEmpty) {
                                isImageSelected = true;
                                Utils.showErrorToast(
                                    "Please Upload Service Images");
                              } else {
                                isImageSelected = false;
                                widget.userService != null
                                    ? updateService()
                                    : getAddService();
                              }
                            } else {
                              autoValidate = AutovalidateMode.always;
                            }
                          },
                          child: Text("Save",
                              style: GoogleFonts.lato(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white))),
                    ),
                  ),
                  SizedBox(
                    height: height * 0.025,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<void> pickImages1() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
        allowMultiple: true,
        allowedExtensions: ['jpg', 'png', 'jpeg'],
        type: FileType.custom);

    if (result != null) {
      for (var item in result.files) {
        selectedServicesImage.add(ImageData("1", item.path!, "file"));
      }
      setState(() {});
    } else {
      // User canceled the picker
    }
  }

  getAddService() async {
    Utils.showLoadingDialog(context);
    var bodyData = {
      "title": titleController.text.toString(),
      "description": descriptionController.text.toString(),
      "price": servicePriceController.text.toString(),
    };
    var postUri = Uri.parse(ApiServices.addLabServices);
    var request = http.MultipartRequest("POST", postUri);

    request.headers.addAll(Utils.apiHeader);
    request.fields.addAll(bodyData);

    for (var image in selectedServicesImage) {
      http.MultipartFile multipartFile =
          await http.MultipartFile.fromPath("serviceImags", image.path);
      request.files.add(multipartFile);
    }

    http.StreamedResponse response = await request.send();

    final res = await http.Response.fromStream(response);

    Utils.logAPIResponse(
        response: res,
        apiName: ApiServices.addLabServices,
        function: "getAddService",
        body: request.fields);
    Navigator.pop(context);

    if (response.statusCode == 200) {
      Navigator.pop(context);
      Utils.showSuccessToast(jsonDecode(res.body)['message']);
    } else if (response.statusCode == 401) {
      Utils.logout(context);
    } else {
      Utils.showErrorToast(jsonDecode(res.body)['message']);
    }
  }

  updateService() async {
    Utils.showLoadingDialog(context);
    var bodyData = {
      "serviceId": widget.userService!.id ?? "",
      "title": titleController.text.toString(),
      "description": descriptionController.text.toString(),
      "price": servicePriceController.text.toString(),
    };
    var postUri = Uri.parse(ApiServices.editLabServices);
    var request = http.MultipartRequest("PUT", postUri);

    request.headers.addAll(Utils.apiHeader);
    request.fields.addAll(bodyData);

    if (oldImages.isNotEmpty) {
      for (var i = 0; i < oldImages.length; i++) {
        Map<String, String> oldServiceImage = {
          'removeImages[$i]': oldImages[i],
        };
        request.fields.addAll(oldServiceImage);
      }
    }
    int index = 0;
    for (var image in selectedServicesImage) {
      if (image.type == "file") {
        http.MultipartFile multipartFile = await http.MultipartFile.fromPath(
            "serviceImags[$index]", image.path);
        request.files.add(multipartFile);
        index++;
      }
    }

    http.StreamedResponse response = await request.send();

    final res = await http.Response.fromStream(response);

    Utils.logAPIResponse(
        response: res,
        apiName: ApiServices.editLabServices,
        function: "updateService",
        body: request.fields);
    Navigator.pop(context);

    if (response.statusCode == 200) {
      Navigator.pop(context);
      Utils.showSuccessToast(jsonDecode(res.body)['message']);
    } else if (response.statusCode == 401) {
      Utils.logout(context);
    } else {
      Utils.showErrorToast(jsonDecode(res.body)['message']);
    }
  }
}
