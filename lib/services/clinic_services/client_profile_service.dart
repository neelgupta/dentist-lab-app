import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:dentalapp/clinic_screen/create_quote.dart';
import 'package:dentalapp/util/api_services.dart';
import 'package:dentalapp/util/utils.dart';
import 'package:http/http.dart' as http;


class ClientProfile {
  getClinicProfile() async {
    var postUri = Uri.parse(ApiServices.getClinicProfileAPI);
    var response = await http.get(
      postUri,
      headers: Utils.apiHeader,
    );

    Utils.logAPIResponse(function: "getClinicProfile",apiName: ApiServices.getClinicProfileAPI,response: response);

    return response;
  }

  getServices() async {
    var postUri = Uri.parse(ApiServices.getService);
    var response = await http.post(
      postUri,
      headers: Utils.apiHeader,
    );

    Utils.logAPIResponse(function: "getServices",apiName: ApiServices.getService,response: response);

    return response;
  }

  getLabNames(body) async {
    var postUri = Uri.parse(ApiServices.getLabs);
    var response = await http.post(
      postUri,
      body: jsonEncode(body),
      headers: Utils.apiHeader,
    );

    Utils.logAPIResponse(function: "getLabNames",apiName: ApiServices.getLabs,response: response, body: body);

    return response;
  }
}