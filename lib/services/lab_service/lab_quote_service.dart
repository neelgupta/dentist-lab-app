import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../util/api_services.dart';
import '../../util/utils.dart';


class GetLabQuote{

  static getQuotes({required body}) async {
    var postUri = Uri.parse(ApiServices.getLabAllQuote);
    var response = await http.post(
      postUri,
      body: jsonEncode(body),
      headers: Utils.apiHeader,
    );

    Utils.logAPIResponse(function: "getQuotes",apiName: ApiServices.getLabAllQuote,response: response, body: body);

    return response;
  }

  static addQuoteComment({required body}) async {
    var postUri = Uri.parse(ApiServices.addLabComment);
    var response = await http.post(
      postUri,
      body: jsonEncode(body),
      headers: Utils.apiHeader,
    );

    Utils.logAPIResponse(function: "addQuoteComments",apiName: ApiServices.addLabComment,response: response, body: body);

    return response;
  }

 static getQuoteComment({required body}) async {
    var postUri = Uri.parse(ApiServices.getLabComment);
    var response = await http.post(
      postUri,
      body: jsonEncode(body),
      headers: Utils.apiHeader,
    );

    Utils.logAPIResponse(function: "getQuoteComments",apiName: ApiServices.getLabComment,response: response, body: body);

    return response;
  }


 static getAcceptQuotes({required body}) async {
    var postUri = Uri.parse(ApiServices.getAcceptQuote);
    var response = await http.post(
      postUri,
      body: jsonEncode(body),
      headers: Utils.apiHeader,
    );

    Utils.logAPIResponse(function: "getAcceptQuoteDetail",apiName: ApiServices.getAcceptQuote,response: response, body: body);

    return response;
  }



}