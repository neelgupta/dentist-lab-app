import 'dart:developer';

import 'package:dentalapp/screen/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';

class Utils {
  static logAPIResponse(
      {String? apiName, String? function, Response? response, Map? body}) {
    log("API Name : $apiName");
    if (body != null) log("API Request : $body");
    log("API body : $function");
    log("API code : ${response!.statusCode}");
    log("API Response : ${response.body}");
  }

  static SharedPreferences? prefs;

  static setToken(String token) async {
    await prefs!.setString("token", token);
  }

  static getToken() {
    return prefs!.getString("token");
  }

  static setFirstName(String firstName) async {
    prefs!.setString("firstName", firstName);
  }

  static getFirstName() {
    return prefs!.getString("firstName");
  }

  static setLastName(String lastName) async {
    await prefs!.setString("lastName", lastName);
  }

  static getLastName() {
    return prefs!.getString("lastName");
  }

  static setProfileImage(String profileImage) async {
    await prefs!.setString("profileImage", profileImage);
  }

  static getProfileImage() {
    return prefs!.getString("profileImage");
  }

  static setEstablishDate(String establishDate) async {
    await prefs!.setString("establishDate", establishDate);
  }

  static getEstablishDate() {
    return prefs!.getString("establishDate");
  }

  static setUserType(String type) async {
    await prefs!.setString("userType", type);
  }

  static getUserType() {
    return prefs!.getString("userType");
  }

  static setScreenStatus(String status) async {
    await prefs!.setString("screenStatus", status);
  }

  static getScreenStatus() {
    return prefs!.getString("screenStatus");
  }

  static setLoginStatus(bool value) async {
    await prefs!.setBool("userLogged", value);
  }

  static getLoginStatus() {
    return prefs!.getBool("userLogged");
  }

  static var apiHeader = {
    "Content-Type": "application/json",
    "Authorization": "Bearer ${getToken()}"
  };

  static showToast(String message) {
    Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.black,
        textColor: Colors.white,
        fontSize: 16.0);
  }

  static showSuccessToast(String message) {
    Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: const Color(0xFF116D6E),
        textColor: Colors.white,
        fontSize: 16.0);
  }

  static showErrorToast(String message) {
    Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0);
  }

  static showLoadingDialog(context) {
    showDialog(
      context: context,
      builder: (context) {
        return const Center(
          child: CircularProgressIndicator(color: Color(0xFF116D6E)),
        );
      },
    );
  }

  static Future<void> makePhoneCall(String url) async {
    url = 'tel:$url';
    if (await canLaunchUrl(Uri.parse(url))) {
      await launchUrl(Uri.parse(url));
    } else {
      showErrorToast('Unable to make phone call');
      throw 'Could not launch $url';
    }
  }

  static void logout(context) async {
    setLoginStatus(false);
    setToken(" ");
    setUserType(" ");
    showSuccessToast("Logout Successfully");
    setScreenStatus("0");
    apiHeader = {};
    await Utils.prefs!.clear();
    Navigator.pushAndRemoveUntil(context, MaterialPageRoute(
      builder: (context) {
        return const LoginScreen();
      },
    ), (route) => false);
  }
}

Widget loader() {
  return const Center(
    child: CircularProgressIndicator(color: Color(0xFF116D6E)),
  );
}

class DayDetails {
  String day;
  String startTime;
  String endTime;
  bool isOpen;

  DayDetails(
      {required this.day,
      required this.startTime,
      required this.endTime,
      required this.isOpen});
}

class QuotesWidget {
  static Widget getQuoteStatus(width, status) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: width * 0.04, vertical: 5),
      decoration: BoxDecoration(
        color: getColorForQuoteStatus(status),
        borderRadius: BorderRadius.circular(2),
      ),
      child: Center(
        child: Text(
          getTextForQuoteStatus(status),
          style: GoogleFonts.lato(
            fontSize: 10,
            fontWeight: FontWeight.w600,
            color: getTextColorForQuoteStatus(status),
          ),
        ),
      ),
    );
  }

  static String getTextForQuoteStatus(status) {
    //"pending","advancePending","inProgress","outForDelivery","deliveryAccepted","deliveryRejected","paymentConfirmationPanding","jobSuccessfullyDone"
    if (status == "pending") {
      return "Pending";
    } else if (status == "advancePending") {
      return "Advance Pending";
    } else if (status == "inProgress") {
      return "In Progress";
    } else if (status == "outForDelivery") {
      return "Out For Delivery";
    } else if (status == "deliveryAccepted") {
      return "Delivery Accepted";
    } else if (status == "deliveryRejected") {
      return "Delivery Rejected";
    } else if (status == "paymentConfirmationPanding") {
      return "Payment Confirmation Pending";
    } else if (status == "jobSuccessfullyDone") {
      return "Job Successfully Done";
    } else if (status == "waitForPayment") {
      return "Waiting For Payment";
    } else if (status == "workStarted") {
      return "Work Started";
    } else if (status == "deliverySuccess") {
      return "Delivery Success";
    }
    return "";
  }

  static Color getColorForQuoteStatus(status) {
    //"pending","advancePending","inProgress","outForDelivery","deliveryAccepted","deliveryRejected","paymentConfirmationPanding","jobSuccessfullyDone"
    if (status == "pending") {
      return const Color(0xffFFD059);
    } else if (status == "advancePending") {
      return const Color(0xff414141);
    } else if (status == "inProgress") {
      return const Color(0xffFFD059);
    } else if (status == "outForDelivery") {
      return const Color(0xff2f80ed);
    } else if (status == "deliveryAccepted") {
      return const Color(0xff219653);
    } else if (status == "deliveryRejected") {
      return const Color(0xff414141);
    } else if (status == "paymentConfirmationPanding") {
      return const Color(0xff414141);
    } else if (status == "jobSuccessfullyDone") {
      return const Color(0xff2f80ed);
    } else if (status == "waitForPayment") {
      return const Color(0xff414141);
    } else if (status == "workStarted") {
      return const Color(0xffFFD059);
    } else if (status == "deliverySuccess") {
      return const Color(0xff219653);
    }
    return const Color(0xffFFD059);
  }

  static Color getTextColorForQuoteStatus(status) {
    //"pending","advancePending","inProgress","outForDelivery","deliveryAccepted","deliveryRejected","paymentConfirmationPanding","jobSuccessfullyDone"
    if (status == "pending") {
      return Colors.black;
    } else if (status == "advancePending") {
      return Colors.white;
    } else if (status == "inProgress") {
      return Colors.black;
    } else if (status == "outForDelivery") {
      return Colors.white;
    } else if (status == "deliveryAccepted") {
      return Colors.white;
    } else if (status == "deliveryRejected") {
      return Colors.white;
    } else if (status == "paymentConfirmationPanding") {
      return Colors.white;
    } else if (status == "jobSuccessfullyDone") {
      return Colors.white;
    } else if (status == "waitForPayment") {
      return Colors.white;
    } else if (status == "workStarted") {
      return Colors.black;
    } else if (status == "deliverySuccess") {
      return Colors.white;
    }
    return Colors.black;
  }
}
