import 'dart:convert';
import 'package:dentalapp/util/api_services.dart';
import 'package:dentalapp/util/utils.dart';
import 'package:http/http.dart' as http;

class QuoteService {

  getQuotes({required body}) async {
    var postUri = Uri.parse(ApiServices.getQuote);
    var response = await http.post(
      postUri,
      body: jsonEncode(body),
      headers: Utils.apiHeader,
    );

    Utils.logAPIResponse(function: "getQuotes",apiName: ApiServices.getQuote,response: response, body: body);

    return response;
  }

  getPendingQuoteDetail({required body}) async {
    var postUri = Uri.parse(ApiServices.getPendingQuote);
    var response = await http.post(
      postUri,
      body: jsonEncode(body),
      headers: Utils.apiHeader,
    );

    Utils.logAPIResponse(function: "getPendingQuoteDetail",apiName: ApiServices.getPendingQuote,response: response, body: body);

    return response;
  }

  getAcceptedQuoteDetail({required body}) async {
    var postUri = Uri.parse(ApiServices.getAcceptedQuote);
    var response = await http.post(
      postUri,
      body: jsonEncode(body),
      headers: Utils.apiHeader,
    );

    Utils.logAPIResponse(function: "getAcceptedQuoteDetail",apiName: ApiServices.getAcceptedQuote,response: response, body: body);

    return response;
  }
}