import 'dart:convert';

import 'package:dentalapp/util/api_services.dart';
import 'package:dentalapp/util/utils.dart';
import 'package:http/http.dart' as http;

class LabDashBoard{


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

  sentProposal({required body}) async {
    var postUri = Uri.parse(ApiServices.postSentProposal);
    var response = await http.post(
      postUri,
      body: jsonEncode(body),
      headers: Utils.apiHeader,
    );
    Utils.logAPIResponse(function: "getProposal",apiName: ApiServices.postSentProposal,response: response, body: body);

    return response;
  }

}