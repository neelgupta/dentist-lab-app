// ignore_for_file: use_build_context_synchronously

import 'dart:convert';

import 'package:country_code_picker/country_code_picker.dart';
import 'package:csc_picker/csc_picker.dart';
import 'package:dentalapp/models/clinic_profile.dart';
import 'package:dentalapp/services/clinic_services/clinic_services.dart';
import 'package:dentalapp/util/utils.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart';
import 'package:intl/intl.dart';

class EditClinicDetails extends StatefulWidget {
  final Data clinicData;
  const EditClinicDetails({super.key, required this.clinicData});

  @override
  State<EditClinicDetails> createState() => _EditClinicDetailsState();
}

class _EditClinicDetailsState extends State<EditClinicDetails> {
  final formKey = GlobalKey<FormState>();
  var autoValidate = AutovalidateMode.disabled;
  bool isLoading = false;
  bool isPasswordVisible = true;
  TextEditingController dateInputController = TextEditingController();
  TextEditingController labNameController = TextEditingController();
  TextEditingController labMobileController = TextEditingController();
  TextEditingController landLineNumberController = TextEditingController();

  TextEditingController countryController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController poBoxController = TextEditingController();
  ClinicService clinicService = ClinicService();
  String countryCode = "+971";
  String? country;
  String? city;
  String? state;

  @override
  void initState() {
    super.initState();
    labNameController.text = widget.clinicData.clinicName ?? "";
    labMobileController.text = widget.clinicData.mobileNumber ?? "";
    countryCode = widget.clinicData.countryCode ?? "+971";
    landLineNumberController.text = widget.clinicData.landLineNumber ?? "";
    country = widget.clinicData.country;
    state = widget.clinicData.state;
    city = widget.clinicData.city;
    addressController.text = widget.clinicData.address ?? "";
    poBoxController.text = widget.clinicData.poBox ?? "";
    dateInputController.text = DateFormat('yyyy-MM-dd').format(DateTime.parse(
        widget.clinicData.dateOfEstablishment ?? DateTime.now().toString()));
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
              body: !isLoading
                  ? SizedBox(
                      height: MediaQuery.of(context).size.height,
                      width: MediaQuery.of(context).size.width,
                      child: SingleChildScrollView(
                        scrollDirection: Axis.vertical,
                        child: Column(
                          children: [
                            Container(
                                height: height * 0.2,
                                width: MediaQuery.of(context).size.width,
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
                                        SizedBox(height: height * 0.05),
                                        Container(
                                          padding: EdgeInsets.only(
                                              left: width * 0.05),
                                          alignment: Alignment.topLeft,
                                          child: InkWell(
                                              onTap: () {
                                                Navigator.pop(context);
                                              },
                                              child: const Image(
                                                  image: AssetImage(
                                                      "assets/image/left.png"),
                                                  fit: BoxFit.fill)),
                                        ),
                                        SizedBox(height: height * 0.03),
                                        Text(
                                          "Edit Clinic Details",
                                          style: GoogleFonts.lato(
                                            fontSize: 28,
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
                                    height: 10,
                                  ),
                                  Text(
                                    "Clinic Details",
                                    style: GoogleFonts.lato(
                                        fontSize: 19,
                                        fontWeight: FontWeight.w600),
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  TextFormField(
                                    textInputAction: TextInputAction.next,
                                    controller: labNameController,
                                    keyboardType: TextInputType.name,
                                    decoration: InputDecoration(
                                      border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(12),
                                          borderSide: const BorderSide(
                                              color: Color(0xFF707070))),
                                      labelText: 'Clinic Name',
                                      hintText: 'Clinic Name',
                                      hintStyle: const TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.w500,
                                          color: Color(0xFF707070)),
                                      contentPadding: const EdgeInsets.only(
                                          left: 18, top: 16, bottom: 16),
                                    ),
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return 'Please Enter Clinic Name';
                                      }
                                      return null;
                                    },
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
                                          borderRadius:
                                              BorderRadius.circular(12),
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
                                          maxLength: 12,
                                          controller: labMobileController,
                                          keyboardType: TextInputType.number,
                                          validator: (value) {
                                            if (value == null ||
                                                value.isEmpty) {
                                              return 'Please Enter Mobile Number';
                                            } else if(!RegExp(r'(^(?:[+0]9)?[0-9]{8,12}$)').hasMatch(value)) {
                                              return 'Please Enter Valid Mobile Number';
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
                                            contentPadding:
                                                const EdgeInsets.only(
                                                    left: 18,
                                                    top: 16,
                                                    bottom: 16),
                                          ),
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
                                    decoration: InputDecoration(
                                      border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(12),
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
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return 'Please Enter Land Line Number';
                                      }
                                      return null;
                                    },
                                  ),
                                  const SizedBox(
                                    height: 30,
                                  ),
                                  const Divider(
                                    color: Color(0xFFE7E7E7),
                                    thickness: 1,
                                  ),
                                  const SizedBox(
                                    height: 30,
                                  ),
                                  Text(
                                    "Clinic Location ",
                                    style: GoogleFonts.lato(
                                        fontSize: 19,
                                        fontWeight: FontWeight.w600),
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  CSCPicker(
                                    cityDropdownLabel: "City",
                                    countryDropdownLabel: "country",
                                    stateDropdownLabel: "State",
                                    currentCountry: country,
                                    currentState: state,
                                    currentCity: city,
                                    disabledDropdownDecoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        border: Border.all(color: Color(0xFF707070))),
                                    onCountryChanged: (value) {
                                      country = value;
                                      setState(() {});
                                    },
                                    onStateChanged: (value) {
                                      state = value;
                                      setState(() {});
                                    },
                                    onCityChanged: (value) {
                                      city = value;
                                      setState(() {});
                                    },
                                    flagState: CountryFlag.DISABLE,

                                    dropdownDialogRadius: 8,
                                    dropdownDecoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        border: Border.all(color: Color(0xFF707070))),
                                  ),
                                  // TextFormField(
                                  //   controller: countryController,
                                  //   keyboardType: TextInputType.name,
                                  //   textInputAction: TextInputAction.next,
                                  //   decoration: InputDecoration(
                                  //     border: OutlineInputBorder(
                                  //         borderRadius:
                                  //             BorderRadius.circular(12),
                                  //         borderSide: const BorderSide(
                                  //             color: Color(0xFF707070))),
                                  //     labelText: 'Country',
                                  //     hintText: 'Country',
                                  //     counterText: "",
                                  //     hintStyle: const TextStyle(
                                  //         fontSize: 15,
                                  //         fontWeight: FontWeight.w500,
                                  //         color: Color(0xFF707070)),
                                  //     contentPadding: const EdgeInsets.only(
                                  //         left: 18, top: 16, bottom: 16),
                                  //   ),
                                  //   validator: (value) {
                                  //     if (value == null || value.isEmpty) {
                                  //       return 'Please Enter Country';
                                  //     }
                                  //     return null;
                                  //   },
                                  // ),
                                  // const SizedBox(
                                  //   height: 20,
                                  // ),
                                  // TextFormField(
                                  //   controller: cityController,
                                  //   keyboardType: TextInputType.name,
                                  //   textInputAction: TextInputAction.next,
                                  //   decoration: InputDecoration(
                                  //     border: OutlineInputBorder(
                                  //         borderRadius:
                                  //             BorderRadius.circular(12),
                                  //         borderSide: const BorderSide(
                                  //             color: Color(0xFF707070))),
                                  //     labelText: 'City',
                                  //     hintText: 'City',
                                  //     counterText: "",
                                  //     hintStyle: const TextStyle(
                                  //         fontSize: 15,
                                  //         fontWeight: FontWeight.w500,
                                  //         color: Color(0xFF707070)),
                                  //     contentPadding: const EdgeInsets.only(
                                  //         left: 18, top: 16, bottom: 16),
                                  //   ),
                                  //   validator: (value) {
                                  //     if (value == null || value.isEmpty) {
                                  //       return 'Please Enter City';
                                  //     }
                                  //     return null;
                                  //   },
                                  // ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  TextFormField(
                                    keyboardType: TextInputType.streetAddress,
                                    controller: addressController,
                                    textInputAction: TextInputAction.next,
                                    decoration: InputDecoration(
                                      border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(12),
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
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return 'Please Enter Address';
                                      }
                                      return null;
                                    },
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  TextFormField(
                                    keyboardType: TextInputType.name,
                                    controller: poBoxController,
                                    textInputAction: TextInputAction.done,
                                    decoration: InputDecoration(
                                      border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(12),
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
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return 'Please Enter P.O. Box';
                                      }
                                      return null;
                                    },
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  TextFormField(
                                    onTap: () async {
                                      DateTime? pickedDate =
                                          await showDatePicker(
                                              context: context,
                                              initialDate: DateTime.now()
                                                  .subtract(
                                                      const Duration(days: 1)),
                                              firstDate: DateTime(1950),
                                              lastDate: DateTime.now().subtract(
                                                  const Duration(days: 1)));

                                      if (pickedDate != null) {
                                        dateInputController.text =
                                            DateFormat('yyyy-MM-dd')
                                                .format(pickedDate);
                                      }
                                    },
                                    textInputAction: TextInputAction.next,
                                    controller: dateInputController,
                                    readOnly: true,
                                    decoration: InputDecoration(
                                        border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(12),
                                            borderSide: const BorderSide(
                                                color: Color(0xFF707070))),
                                        focusedBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(12),
                                            borderSide: const BorderSide(
                                                color: Color(0xFF707070))),
                                        labelText: 'Date of establishment',
                                        labelStyle: const TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.w500,
                                            color: Color(0xFF707070)),
                                        // hintText: '12 jan 2022',
                                        counterText: "",
                                        hintStyle: const TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.w500,
                                            color: Color(0xFF707070)),
                                        contentPadding: const EdgeInsets.only(
                                            left: 18, top: 16, bottom: 16),
                                        suffixIcon: const Image(
                                            image: AssetImage(
                                                "assets/image/date.png"))),
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return 'Please Select Establishment Date';
                                      }
                                      return null;
                                    },
                                  ),
                                  const SizedBox(
                                    height: 30,
                                  ),
                                  Container(
                                    height: 50,
                                    width: MediaQuery.of(context).size.width,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(12),
                                        color: const Color(0xFF116D6E)
                                        //:Color(0xffA0A0A0),
                                        ),
                                    child: TextButton(
                                        onPressed: () {
                                          if (formKey.currentState!
                                              .validate()) {
                                            if(country == null) {
                                              Utils.showErrorToast("Please Select Country");
                                            } else if(state == null) {
                                              Utils.showErrorToast("Please Select State");
                                            } else if(city == null) {
                                              Utils.showErrorToast("Please Select City");
                                            } else {
                                              updateClinicDetails();
                                            }
                                          } else {
                                            autoValidate =
                                                AutovalidateMode.always;
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
                    )
                  : const Center(
                      child: CircularProgressIndicator(),
                    ))),
    );
  }

  updateClinicDetails() async {
    Utils.showLoadingDialog(context);
    var body = {
      "clinicName": labNameController.text,
      "dateOfEstablishment": dateInputController.text, // yyyy-mm-dd
      "landLineNumber": landLineNumberController.text,
      "countryCode": countryCode,
      "mobileNumber": labMobileController.text,
      "country": country,
      "state": state,
      "city": city,
      "address": addressController.text,
      "poBox": poBoxController.text
    };
    Response response = await clinicService.updateClinicDetail(body: body);
    Navigator.pop(context);
    if (response.statusCode == 200) {
      Navigator.pop(context);
      Utils.showSuccessToast(jsonDecode(response.body)['message']);
    } else if (response.statusCode == 401) {
      Utils.logout(context);
    } else {
      Utils.showErrorToast(jsonDecode(response.body)['message']);
    }
  }
}
