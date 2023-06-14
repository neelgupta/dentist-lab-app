import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';

Widget commonButton(BuildContext context,String textString,double fontSize,FontWeight fontWeight,Color colors,VoidCallback onTap){
  double height = MediaQuery.of(context).size.height - MediaQuery.of(context).padding.top - MediaQuery.of(context).padding.bottom;
  double width = MediaQuery.of(context).size.width - MediaQuery.of(context).padding.right - MediaQuery.of(context).padding.left;

  return  GestureDetector(
    onTap: onTap,
    child: Container(
      alignment: Alignment.center,
      width: width,
      height: height * 0.055,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: const Color(0xff116D6E)),
      child:  Text(
        textString,
        style: GoogleFonts.lato(
          fontSize: fontSize,
          fontWeight: fontWeight,
          color: colors,
        ),
      ),
    ),
  );
}
