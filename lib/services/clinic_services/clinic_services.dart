import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:dentalapp/util/api_services.dart';
import 'package:dentalapp/util/utils.dart';

class ClinicService {
  getPaymentHistory({required int offset}) async {
    var postUri = Uri.parse("${ApiServices.paymentHistory}?limit=10&offset=$offset");
    var response = await http.get(
      postUri,
      headers: Utils.apiHeader,
    );

    Utils.logAPIResponse(function: "getPaymentHistory",apiName: "${ApiServices.paymentHistory}?limit=10&offset=$offset",response: response);

    return response;
  }


  getNotification({required int offset}) async {
    var postUri = Uri.parse("${ApiServices.notification}?limit=10&offset=$offset");
    var response = await http.get(
      postUri,
      headers: Utils.apiHeader,
    );

    Utils.logAPIResponse(function: "getNotification",apiName: "${ApiServices.notification}?limit=10&offset=$offset",response: response);

    return response;
  }

  updateProfile({required body}) async {
    var putUri = Uri.parse(ApiServices.editProfile);
    var response = await http.put(
      putUri,
      body: jsonEncode(body),
      headers: Utils.apiHeader,
    );

    Utils.logAPIResponse(function: "updateProfile",apiName: ApiServices.editProfile,response: response, body: body);

    return response;
  }

  updateClinicDetail({required body}) async {
    var putUri = Uri.parse(ApiServices.editClinicInfo);
    var response = await http.put(
      putUri,
      body: jsonEncode(body),
      headers: Utils.apiHeader,
    );

    Utils.logAPIResponse(function: "updateClinicDetail",apiName: ApiServices.editClinicInfo,response: response, body: body);

    return response;
  }

  updateClinicManagerDetail({required body, required File? license}) async {
    var putUri = Uri.parse(ApiServices.editClinicManagerInfo);
    var request = http.MultipartRequest("PUT", putUri);
    request.fields.addAll(body);
    request.headers.addAll(Utils.apiHeader);
    if (license!=null) {
      http.MultipartFile multipartFile = await http.MultipartFile.fromPath('directorLicensFile',license.path);
      request.files.add(multipartFile);
    }
    http.StreamedResponse response = await request.send();

    final res = await http.Response.fromStream(response);

    Utils.logAPIResponse(function: "updateClinicManagerDetail",apiName: ApiServices.editClinicManagerInfo,response: res, body: body);

    return res;
  }

  updateClinicAdditionalDetail({required body, required File? license, required File? trade, required File? trn}) async {
    var putUri = Uri.parse(ApiServices.editClinicAdditionalInfo);
    var request = http.MultipartRequest("PUT", putUri);
    request.fields.addAll(body);
    request.headers.addAll(Utils.apiHeader);
    if (license!=null) {
      http.MultipartFile multipartFile = await http.MultipartFile.fromPath('licensFile',license.path);
      request.files.add(multipartFile);
    }
    if (trade!=null) {
      http.MultipartFile multipartFile = await http.MultipartFile.fromPath('tradeFile',trade.path);
      request.files.add(multipartFile);
    }
    if (trn!=null) {
      http.MultipartFile multipartFile = await http.MultipartFile.fromPath('trnFile',trn.path);
      request.files.add(multipartFile);
    }
    http.StreamedResponse response = await request.send();

    final res = await http.Response.fromStream(response);

    Utils.logAPIResponse(function: "updateClinicAdditionalDetail",apiName: ApiServices.editClinicAdditionalInfo,response: res, body: body);

    return res;
  }
}