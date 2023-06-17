
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl_phone_field/country_picker_dialog.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

class MobileCodeWidget extends StatelessWidget {
  TextEditingController controller;
  MobileCodeWidget({Key? key,required this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Column(
      children: [
        IntlPhoneField(
          validator: (value) {
            if (value == null) {
              return 'Please Enter Mobile Number';
            }
            return null;
          },
          showCountryFlag: false,
          flagsButtonPadding: EdgeInsets.only(left: 13,right: 5),
          initialValue: "+91",
          showDropdownIcon: false,
          controller: controller,
          style: GoogleFonts.lato(fontSize: 15,fontWeight: FontWeight.w500),
          dropdownTextStyle: GoogleFonts.lato(fontSize: 15,fontWeight: FontWeight.w500),
          keyboardType: TextInputType.number,
          invalidNumberMessage: "",
          textInputAction: TextInputAction.next,
          decoration: InputDecoration(
            labelText: 'Mobile Number',
            hintText: "12345678",
            counterText: "",
            contentPadding: EdgeInsets.only(top: 15,bottom: 7),
            border: OutlineInputBorder(
              borderSide: BorderSide(),
              borderRadius: BorderRadius.circular(12)
            ),
          ),
        )
      ],
    );
  }
}
