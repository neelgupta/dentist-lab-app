import 'dart:convert';

import 'package:dentalapp/util/api_services.dart';
import 'package:dentalapp/util/utils.dart';
import 'package:http/http.dart' as http;

class LabDashBoardServices{


  getFeed({required body}) async {
    var postUri = Uri.parse(ApiServices.getFeeds);
    var response = await http.post(
      postUri,
      body: jsonEncode(body),
      headers: Utils.apiHeader,
    );

    Utils.logAPIResponse(function: "getQuotes",apiName: ApiServices.getFeeds,response: response, body: body);

    return response;
  }

  sendProposal({required body}) async {
    var postUri = Uri.parse(ApiServices.sendProposal);
    var response = await http.post(
      postUri,
      body: jsonEncode(body),
      headers: Utils.apiHeader,
    );

    Utils.logAPIResponse(function: "sendProposal",apiName: ApiServices.sendProposal,response: response, body: body);

    return response;
  }

}