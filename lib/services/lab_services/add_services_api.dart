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

  static Future<Map> allAddedService() async {
    final response = await http.get(Uri.parse(ApiServices.allLabServices),
      headers: Utils.apiHeader,
    );

    if (response.statusCode == 200) {
      String data = response.body;
      Map listData = jsonDecode(data);
      return listData;
    } else {
      return {};
    }
  }

 static getSingleService(String Id) async {
    var postUri = Uri.parse("${ApiServices.singleLabService}/$Id");
    print("${ApiServices.singleLabService}$Id");
    var response = await http.get(
      postUri,
      headers: Utils.apiHeader,
    );

    Utils.logAPIResponse(function: "getSingleService",apiName: ApiServices.singleLabService,response: response);

    return response;
  }
}