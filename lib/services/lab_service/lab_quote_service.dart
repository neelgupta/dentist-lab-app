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
}