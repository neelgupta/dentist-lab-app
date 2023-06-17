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

  createQuote({required body, required List<ImageData> images, required List serviceId, required List labId}) async {
    var postUri = Uri.parse(ApiServices.createQuote);
    var request = http.MultipartRequest("POST", postUri);
    request.fields.addAll(body);
    for (var i = 0; i < serviceId.length; i++) {
      Map<String, String> service = {
        'serviceIds[$i]' : serviceId[i],
      };
      request.fields.addAll(service);
    }
    if (labId.isNotEmpty) {
      for (var i = 0; i < labId.length; i++) {
        Map<String, String> lab = {
          'labs[$i]' : labId[i],
        };
        request.fields.addAll(lab);
      }
    }
    request.headers.addAll(Utils.apiHeader);
    for (var i = 0; i < images.length; i++) {
      http.MultipartFile multipartFile = await http.MultipartFile.fromPath('quoteImages',images[i].path);
      request.files.add(multipartFile);
    }
    http.StreamedResponse response = await request.send();

    final res = await http.Response.fromStream(response);

    Utils.logAPIResponse(function: "createQuote",apiName: ApiServices.createQuote,response: res, body: body);
    log("$labId");
    log("$serviceId");
    log("${request.fields}");

    return res;
  }
}