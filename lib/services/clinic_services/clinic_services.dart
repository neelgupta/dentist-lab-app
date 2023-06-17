import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:dentalapp/util/api_services.dart';
import 'package:dentalapp/util/utils.dart';

class ClinicService {
  getPaymentHistory() async {
    var postUri = Uri.parse(ApiServices.paymentHistory);
    var response = await http.get(
      postUri,
      headers: Utils.apiHeader,
    );

    Utils.logAPIResponse(function: "getPaymentHistory",apiName: ApiServices.paymentHistory,response: response);

    return response;
  }


  getNotification() async {
    var postUri = Uri.parse(ApiServices.notification);
    var response = await http.get(
      postUri,
      headers: Utils.apiHeader,
    );

    Utils.logAPIResponse(function: "getNotification",apiName: ApiServices.notification,response: response);

    return response;
  }
}