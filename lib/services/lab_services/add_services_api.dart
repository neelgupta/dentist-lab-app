import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../util/api_services.dart';
import '../../util/utils.dart';

class LabServices {

  static addServices({required body}) async {
    var postUri = Uri.parse(ApiServices.addLabServices);
    var response = await http.post(
      postUri,
      body: jsonEncode(body),
      headers: Utils.apiHeader,
    );

    Utils.logAPIResponse(apiName: ApiServices.addLabServices,
        function: "addServices",
        body: body,
        response: response);

    return response;
  }

  static getAllService() async {
    final response = await http.get(Uri.parse(ApiServices.getAllServices),
      headers: Utils.apiHeader,
    );

    Utils.logAPIResponse(function: "getAllService",apiName: ApiServices.getAllServices,response: response);

    return response;
  }

 static getSingleService(String id) async {
    var postUri = Uri.parse("${ApiServices.singleLabService}/$id");
    var response = await http.get(
      postUri,
      headers: Utils.apiHeader,
    );

    Utils.logAPIResponse(function: "getSingleService", apiName: "${ApiServices.singleLabService}/$id", response: response);

    return response;
  }

  static deleteService(String id) async {
    var postUri = Uri.parse("${ApiServices.deleteService}/$id");
    var response = await http.delete(
      postUri,
      headers: Utils.apiHeader,
    );

    Utils.logAPIResponse(function: "deleteService", apiName: "${ApiServices.deleteService}/$id", response: response);

    return response;
  }
}