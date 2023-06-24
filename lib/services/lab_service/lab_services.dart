import 'package:dentalapp/util/api_services.dart';
import 'package:dentalapp/util/utils.dart';
import 'package:http/http.dart' as http;

class LabService {
  getLabPaymentHistory({required int offset}) async {
    var postUri = Uri.parse("${ApiServices.labPaymentHistory}?limit=10&offset=$offset");
    var response = await http.get(
      postUri,
      headers: Utils.apiHeader,
    );

    Utils.logAPIResponse(function: "getLabPaymentHistory",apiName: "${ApiServices.labPaymentHistory}?limit=10&offset=$offset",response: response);

    return response;
  }

  getLabNotification({required int offset}) async {
    var postUri = Uri.parse("${ApiServices.labNotification}?limit=10&offset=$offset");
    var response = await http.get(
      postUri,
      headers: Utils.apiHeader,
    );

    Utils.logAPIResponse(function: "getLabNotification",apiName: "${ApiServices.labNotification}?limit=10&offset=$offset",response: response);

    return response;
  }
}