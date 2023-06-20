import 'dart:convert';
import 'dart:io';
import 'package:dentalapp/screen/services_%20screen.dart';
import 'package:dentalapp/services/lab_services/add_services_api.dart';
import 'package:dentalapp/util/api_services.dart';
import 'package:dentalapp/util/utils.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import '../util/api_services.dart';
import '../util/utils.dart';
import 'package:image_picker/image_picker.dart';

class AddServicesScreen extends StatefulWidget {
  const AddServicesScreen({Key? key}) : super(key: key);

  @override
  State<AddServicesScreen> createState() => _AddServicesScreenState();
}

class _AddServicesScreenState extends State<AddServicesScreen> {
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController servicePriceController = TextEditingController();

  final formKey = GlobalKey<FormState>();
  var autoValidate = AutovalidateMode.disabled;

  List<File> selectedServicesImage = [];
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
                                "Add Services",
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
                              return 'Please Enter Service Title';
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                                borderSide:
                                const BorderSide(color: Color(0xFF707070))),
                            labelText: 'Title',
                            hintText: 'Enter Title',
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
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                                borderSide:
                                const BorderSide(color: Color(0xFF707070))),
                            labelText: 'Description',
                            labelStyle: const TextStyle(
                              fontSize: 14,
                            ),
                            hintText:
                            'Lorem Ipsum is simply dummy text of the printing and typesetting industry. '
                                'when an unknown printer took a galley of type and scrambled it to make a type specimen book.',
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
                        Container(
                          height: 50,
                          width: MediaQuery
                              .of(context)
                              .size
                              .width,
                          decoration: BoxDecoration(
                            border: Border.all(color: const Color(0xFF707070)),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 5),
                            child: Row(
                              children: [
                                Text(
                                  "AED",
                                  style: GoogleFonts.lato(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w500,
                                    color: const Color(0xFF707070),
                                  ),
                                ),
                                const SizedBox(
                                  width: 5,
                                ),
                                const Padding(
                                  padding: EdgeInsets.all(5),
                                  child: VerticalDivider(
                                    thickness: 1,
                                    width: 5,
                                    color: Color(0xFF707070),
                                  ),
                                ),
                                const SizedBox(
                                  width: 5,
                                ),
                                Expanded(
                                  child: TextFormField(
                                    maxLength: 10,
                                    controller: servicePriceController,
                                    keyboardType: TextInputType.number,
                                    // validator: (value) {
                                    //   if(value == null || value.isEmpty){
                                    //     return 'Please Enter Service Price';
                                    //   }
                                    //   return null;
                                    // },
                                    decoration: const InputDecoration(
                                        border: InputBorder.none,
                                        hintText: "Service Price",
                                        counterText: "",
                                        contentPadding: EdgeInsets.only(
                                            bottom: 13, top: 5, left: 5)),
                                  ),
                                ),
                              ],
                            ),
                          ),
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
                                    decoration: BoxDecoration(
                                        borderRadius:
                                        BorderRadius.circular(
                                            10),
                                        image: DecorationImage(
                                            image: FileImage(File(
                                                selectedServicesImage[
                                                index]
                                                    .path)),
                                            fit: BoxFit.fill)),
                                  ),
                                  InkWell(
                                    onTap: () {
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
                                              image: AssetImage("assets/image/camera.png"),
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
                          color: const Color(0xFF116D6E)),
                      child: TextButton(
                          onPressed: () {
                            if (formKey.currentState!.validate()) {
                              if (servicePriceController.text.isEmpty) {
                                Utils.showErrorToast(
                                    "Please Enter Service Price");
                              } else if (selectedServicesImage.isEmpty &&
                                  selectedServicesImage == null) {
                                Utils.showErrorToast(
                                    "Please Upload Service Images");
                              } else {
                                getAddService(selectedServicesImage);
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
        allowedExtensions: ['jpg', 'pdf', 'jpeg'],
        type: FileType.custom);

    if (result != null) {
      selectedServicesImage.addAll(result.paths.map((path) => File(path!)));
      setState(() {});
    } else {
      // User canceled the picker
    }
  }

  getAddService(selectedServicesImages) async {
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
        http.MultipartFile multipartFile = await http.MultipartFile.fromPath("serviceImags", image.path);
        request.files.add(multipartFile);
      }

      http.StreamedResponse response = await request.send();

      // print("body ====> $bodyData");
      // print("body ====> ${response.statusCode}");

      final res = await http.Response.fromStream(response);
      Navigator.pop(context);

      // print('body: ${res.body}');

      if (response.statusCode == 200) {
        Map map = jsonDecode(res.body);
        if (map["status"] == 200) {
          Navigator.push(context, MaterialPageRoute(builder: (context) => ServicesScreen(
            description: descriptionController.text,
          ),));
          Utils.showSuccessToast(map['message']);
        } else {
          Utils.showErrorToast(map['message']);
        }
      } else {
        Utils.showErrorToast(jsonDecode(res.body)['message']);
      }
    }
  }
