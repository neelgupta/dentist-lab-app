import 'package:dentalapp/util/api_services.dart';
import 'package:dentalapp/util/utils.dart';
import 'package:http/http.dart' as http;

class LabService {
  getLabPaymentHistory() async {
    var postUri = Uri.parse(ApiServices.labPaymentHistory);
    var response = await http.get(
      postUri,
      headers: Utils.apiHeader,
    );

    Utils.logAPIResponse(function: "getLabPaymentHistory",apiName: ApiServices.labPaymentHistory,response: response);

    return response;
  }

  getLabNotification() async {
    var postUri = Uri.parse(ApiServices.labNotification);
    var response = await http.get(
      postUri,
      headers: Utils.apiHeader,
    );

    Utils.logAPIResponse(function: "getLabNotification",apiName: ApiServices.labNotification,response: response);

    return response;
  }
}