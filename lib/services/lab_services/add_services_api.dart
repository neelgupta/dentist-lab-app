import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../util/api_services.dart';
import '../../util/utils.dart';

class LabServices{

 static addServices({required body})async{
    var postUri = Uri.parse(ApiServices.addLabServices);
    var response = await http.post(
      postUri,
      body: jsonEncode(body),
      headers: Utils.apiHeader,
    );

    Utils.logAPIResponse(apiName: ApiServices.addLabServices,function: "addServices",body: body,response: response);

    return response;
  }


 static allAddedService() async {
   var postUri = Uri.parse(ApiServices.allLabServices);
   var response = await http.get(
     postUri,
     headers: Utils.apiHeader,
   );

   Utils.logAPIResponse(function: "allAddedService",apiName: ApiServices.allLabServices,response: response);

   return response;
 }

}