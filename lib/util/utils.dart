import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Utils {
  static logAPIResponse({String? apiName, String? function, Response? response, Map? body}) {
    log("API Name : $apiName");
    if(body!=null)log("API Request : $body");
    log("API function : $function");
    log("status code : ${response!.statusCode}");
    log("status body : ${response.body}");
  }

  static SharedPreferences? prefs;

  static setToken(String token){
    prefs!.setString('token', token);
  }

  static getToken() {
    return prefs!.getString('token');
  }

  static setUserType(String type) {
    prefs!.setString('userType', type);
  }

  static getUserType() {
    return prefs!.getString('userType');
  }

  static setScreenStatus(String status) {
    prefs!.setString('screenStatus', status);
  }

  static getScreenStatus() {
    return prefs!.getString('screenStatus');
  }

  static setLoginStatus(bool value) {
    prefs!.setBool('userLogged', value);
  }

  static getLoginStatus() {
    return prefs!.getBool('userLogged');
  }

  static var apiHeader = {"Authorization" : "Bearer ${getToken()}"};

  static showToast(String message) {
    Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.black,
        textColor: Colors.white,
        fontSize: 16.0
    );
  }

  static showSuccessToast(String message) {
    Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: const Color(0xFF116D6E),
        textColor: Colors.white,
        fontSize: 16.0
    );
  }

  static showErrorToast(String message) {
    Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0
    );
  }

  static showLoadingDialog(context) {
    showDialog(context: context, builder: (context) {
      return const Center(
        child: CircularProgressIndicator(color: Color(0xFF116D6E)),
      );
    },);
  }
}