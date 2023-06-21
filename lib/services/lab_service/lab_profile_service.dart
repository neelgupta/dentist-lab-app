

import 'dart:convert';

import 'package:dentalapp/util/api_services.dart';
import 'package:dentalapp/util/utils.dart';
import 'package:http/http.dart' as http;

class LabProfile{

   getLabProfile() async {

     var postUri = Uri.parse(ApiServices.getLabProfileApi);
     var response=await http.get(
       postUri,
       headers: Utils.apiHeader,
     );

     Utils.logAPIResponse(function: "getlabProfile",apiName: ApiServices.getLabProfileApi, response: response);

     return response;
   }

   editProfile(body) async {
     var putUri = Uri.parse(ApiServices.putEditProfileApi);
     var response = await http.put(
       putUri,
       body: jsonEncode(body),
       headers: Utils.apiHeader,
     );

     Utils.logAPIResponse(function: "editProfile",apiName: ApiServices.putEditProfileApi,response: response, body: body);

     return response;
   }

   updateImage(image) async {
     var postUri = Uri.parse(ApiServices.updateProfileImage);
     var request = http.MultipartRequest("PUT", postUri);
     request.headers.addAll(Utils.apiHeader);

     http.MultipartFile multipartFile = await http.MultipartFile.fromPath("profileImage", image);
     request.files.add(multipartFile);

     http.StreamedResponse response = await request.send();

     final res = await http.Response.fromStream(response);

     Utils.logAPIResponse(response: res,apiName: ApiServices.updateProfileImage,function: "updateLabImage", body: request.fields);

     return res;
   }
}