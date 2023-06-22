// ignore_for_file: use_build_context_synchronously

import 'dart:convert';
import 'package:country_code_picker/country_code_picker.dart';
import 'package:dentalapp/models/lab_profile.dart';
import 'package:dentalapp/util/utils.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import '../util/api_services.dart';

class EditLabDetail extends StatefulWidget {
  final LabDatum labData;
  const EditLabDetail({super.key, required this.labData});

  @override
  State<EditLabDetail> createState() => _EditLabDetailState();
}

class _EditLabDetailState extends State<EditLabDetail> {
  TextEditingController dateInputController = TextEditingController();
  TextEditingController labNameController = TextEditingController();
  TextEditingController labMobileController = TextEditingController();
  TextEditingController landLineNumberController = TextEditingController();
  TextEditingController countryController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController poBoxController = TextEditingController();
  String countryCode = "+971";

  bool isLoading = false;
  final formKey = GlobalKey<FormState>();
  var autoValidate = AutovalidateMode.disabled;

  @override
  void initState() {
    super.initState();
    labNameController.text = widget.labData.labName ?? "";
    labMobileController.text = widget.labData.mobileNumber ?? "";
    landLineNumberController.text = widget.labData.landLineNumber ?? "";
    countryController.text = widget.labData.country ?? "";
    cityController.text = widget.labData.city ?? "";
    addressController.text = widget.labData.address ?? "";
    poBoxController.text = widget.labData.poBox ?? "";
    countryCode = widget.labData.countryCode ?? "";
    dateInputController.text = DateFormat('yyyy-MM-dd').format(DateTime.parse(
        widget.labData.dateOfEstablishment ?? DateTime.now().toString()));
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
              resizeToAvoidBottomInset: true,
              body: SizedBox(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Column(
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
                                        left: width * 0.05, top: height * 0.04),
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
                                    height: height * 0.04,
                                  ),
                                  Text(
                                    "Edit Profile",
                                    style: GoogleFonts.lato(
                                      fontSize: 30,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              ))),
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: width * 0.057,
                            vertical: height * 0.027),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(
                              height: 20,
                            ),
                            Text(
                              "Lab Details",
                              style: GoogleFonts.lato(
                                  fontSize: 19, fontWeight: FontWeight.w600),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            TextFormField(
                              textInputAction: TextInputAction.next,
                              controller: labNameController,
                              keyboardType: TextInputType.name,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please Enter Lab Name';
                                }
                                return null;
                              },
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(12),
                                    borderSide: const BorderSide(
                                        color: Color(0xFF707070))),
                                labelText: 'Lab Name',
                                hintText: 'Lab Name',
                                hintStyle: const TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w500,
                                    color: Color(0xFF707070)),
                                contentPadding: const EdgeInsets.only(
                                    left: 18, top: 16, bottom: 16),
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Row(
                              children: [
                                Container(
                                  height: 50,
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                        color: const Color(0xFF707070)),
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  child: CountryCodePicker(
                                    onChanged: (value) {
                                      countryCode = value.dialCode!;
                                      setState(() {});
                                    },
                                    padding: EdgeInsets.zero,
                                    showFlag: false,
                                    initialSelection: countryCode,
                                    showDropDownButton: false,
                                    favorite: const ['+971'],
                                    showCountryOnly: false,
                                    showOnlyCountryWhenClosed: false,
                                    alignLeft: false,
                                  ),
                                ),
                                SizedBox(width: width * 0.02),
                                Expanded(
                                  child: TextFormField(
                                    controller: labMobileController,
                                    keyboardType: TextInputType.number,
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return 'Please Enter Lab Mobile Number';
                                      }
                                      return null;
                                    },
                                    decoration: InputDecoration(
                                        labelText: "Mobile Number",
                                        hintText: "Mobile Number",
                                        counterText: "",
                                        border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(12),
                                            borderSide: const BorderSide(
                                                color: Color(0xFF707070))),
                                        contentPadding: const EdgeInsets.only(
                                            left: 18, top: 16, bottom: 16)),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            TextFormField(
                              textInputAction: TextInputAction.next,
                              controller: landLineNumberController,
                              keyboardType: TextInputType.number,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please Enter Land Line Number';
                                }
                                return null;
                              },
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(12),
                                    borderSide: const BorderSide(
                                        color: Color(0xFF707070))),
                                labelText: 'Land Line Number',
                                hintText: 'Land Line Number',
                                counterText: "",
                                hintStyle: const TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w500,
                                    color: Color(0xFF707070)),
                                contentPadding: const EdgeInsets.only(
                                    left: 18, top: 16, bottom: 16),
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            const Divider(
                              color: Color(0xFFE7E7E7),
                              thickness: 1,
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(
                              "Lab Location ",
                              style: GoogleFonts.lato(
                                  fontSize: 19, fontWeight: FontWeight.w600),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            TextFormField(
                              controller: countryController,
                              keyboardType: TextInputType.name,
                              textInputAction: TextInputAction.next,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please Enter Country';
                                }
                                return null;
                              },
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(12),
                                    borderSide: const BorderSide(
                                        color: Color(0xFF707070))),
                                labelText: 'Country',
                                hintText: 'Country',
                                counterText: "",
                                hintStyle: const TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w500,
                                    color: Color(0xFF707070)),
                                contentPadding: const EdgeInsets.only(
                                    left: 18, top: 16, bottom: 16),
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            TextFormField(
                              controller: cityController,
                              keyboardType: TextInputType.name,
                              textInputAction: TextInputAction.next,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please Enter City';
                                }
                                return null;
                              },
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(12),
                                    borderSide: const BorderSide(
                                        color: Color(0xFF707070))),
                                labelText: 'City',
                                hintText: 'City',
                                counterText: "",
                                hintStyle: const TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w500,
                                    color: Color(0xFF707070)),
                                contentPadding: const EdgeInsets.only(
                                    left: 18, top: 16, bottom: 16),
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            TextFormField(
                              controller: addressController,
                              keyboardType: TextInputType.name,
                              textInputAction: TextInputAction.next,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please Enter Address';
                                }
                                return null;
                              },
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(12),
                                    borderSide: const BorderSide(
                                        color: Color(0xFF707070))),
                                labelText: 'Address',
                                hintText: 'Address',
                                counterText: "",
                                hintStyle: const TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w500,
                                    color: Color(0xFF707070)),
                                contentPadding: const EdgeInsets.only(
                                    left: 18, top: 16, bottom: 16),
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            TextFormField(
                              keyboardType: TextInputType.name,
                              controller: poBoxController,
                              textInputAction: TextInputAction.next,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please Enter P.O. Box Number';
                                }
                                return null;
                              },
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(12),
                                    borderSide: const BorderSide(
                                        color: Color(0xFF707070))),
                                labelText: 'P.O.Box',
                                hintText: 'P.O.Box',
                                counterText: "",
                                hintStyle: const TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w500,
                                    color: Color(0xFF707070)),
                                contentPadding: const EdgeInsets.only(
                                    left: 18, top: 16, bottom: 16),
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            TextFormField(
                              onTap: () async {
                                DateTime? pickedDate = await showDatePicker(
                                    context: context,
                                    initialDate: DateTime.now()
                                        .subtract(const Duration(days: 1)),
                                    firstDate: DateTime(1950),
                                    lastDate: DateTime.now()
                                        .subtract(const Duration(days: 1)));

                                if (pickedDate != null) {
                                  setState(() {
                                    dateInputController.text =
                                        DateFormat('yyyy-MM-dd')
                                            .format(pickedDate);
                                  });
                                }
                              },
                              textInputAction: TextInputAction.next,
                              controller: dateInputController,
                              readOnly: true,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please Select Establish Date';
                                }
                                return null;
                              },
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(12),
                                      borderSide: const BorderSide(
                                          color: Color(0xFF707070))),
                                  focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(12),
                                      borderSide: const BorderSide(
                                          color: Color(0xFF707070))),
                                  labelStyle: const TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w500,
                                      color: Color(0xFF707070)),
                                  labelText: 'Date of establishment',
                                  hintText: 'Date of establishment',
                                  counterText: "",
                                  hintStyle: const TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w500,
                                      color: Color(0xFF707070)),
                                  contentPadding: const EdgeInsets.only(
                                      left: 18, top: 16, bottom: 16),
                                  suffixIcon: const Image(
                                      image:
                                          AssetImage("assets/image/date.png"))),
                            ),
                            const SizedBox(
                              height: 30,
                            ),
                            Container(
                              height: 50,
                              width: MediaQuery.of(context).size.width,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12),
                                  color: Color((labNameController
                                              .text.isNotEmpty &&
                                          labMobileController.text.isNotEmpty &&
                                          landLineNumberController
                                              .text.isNotEmpty &&
                                          countryController.text.isNotEmpty &&
                                          cityController.text.isNotEmpty &&
                                          addressController.text.isNotEmpty &&
                                          poBoxController.text.isNotEmpty &&
                                          dateInputController.text.isNotEmpty)
                                      ? 0xFF166D6E
                                      : 0xFFA0A0A0)),
                              child: TextButton(
                                  onPressed: () {
                                    if (formKey.currentState!.validate()) {
                                      if (dateInputController.text.isEmpty) {
                                        Utils.showErrorToast(
                                            "Please Select Establish Date");
                                      } else {
                                        updateProfile();
                                      }
                                    } else {
                                      autoValidate = AutovalidateMode.always;
                                    }
                                  },
                                  child: Text("Continue",
                                      style: GoogleFonts.lato(
                                          fontSize: 15,
                                          fontWeight: FontWeight.w500,
                                          color: Colors.white))),
                            ),
                            const SizedBox(
                              height: 40,
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ))),
    );
  }

  updateProfile() async {
    Utils.showLoadingDialog(context);
    var postUri = Uri.parse(ApiServices.editLabDetails);
    var bodyData = {
      "labName": labNameController.text.toString(),
      "mobileNumber": labMobileController.text.toString(),
      "countryCode": countryCode,
      "landLineNumber": landLineNumberController.text.toString(),
      "country": countryController.text.toString(),
      "city": cityController.text.toString(),
      "address": addressController.text.toString(),
      "poBox": poBoxController.text.toString(),
      "dateOfEstablishment": dateInputController.text.toString()
    };
    var response = await http.put(
      postUri,
      body: jsonEncode(bodyData),
      headers: Utils.apiHeader,
    );
    Utils.logAPIResponse(
        body: bodyData,
        response: response,
        apiName: ApiServices.editLabDetails,
        function: "updateProfile");
    Navigator.pop(context);
    if (response.statusCode == 200) {
      Map map = jsonDecode(response.body);
      Navigator.pop(context);
      Utils.showSuccessToast(map['message']);
    } else if (response.statusCode == 401) {
      Utils.logout(context);
    } else {
      Utils.showErrorToast(jsonDecode(response.body)['message']);
    }
  }
}
