

import 'dart:convert';

import 'package:dentalapp/util/api_services.dart';
import 'package:dentalapp/util/utils.dart';
import 'package:http/http.dart' as http;

class LabProfile{

   getLabProfile() async {

     var postUri = Uri.parse(ApiServices.getLabProfileApi);
     var responce=await http.get(
       postUri,
       headers: Utils.apiHeader,
     );
     print("token==${Utils.apiHeader}");

     Utils.logAPIResponse(function: "getlabProfile",apiName: ApiServices.getClinicProfileAPI, response: responce);

     return responce;
   }

   editProfile(body) async {
     var putUri = Uri.parse(ApiServices.putEditProfileApi);
     var response = await http.put(
       putUri,
       body: jsonEncode(body),
       headers: Utils.apiHeader,
     );

     Utils.logAPIResponse(function: "putEditProfile",apiName: ApiServices.getLabs,response: response, body: body);

     return response;
   }
}