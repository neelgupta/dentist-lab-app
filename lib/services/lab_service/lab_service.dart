import 'package:dentalapp/util/api_services.dart';
import 'package:dentalapp/util/utils.dart';
import 'package:http/http.dart' as http;

class LabService{

  getNotification() async {
    var postUri = Uri.parse(ApiServices.getNotification);
    var response = await http.get(
      postUri,
      headers: Utils.apiHeader,
    );

    Utils.logAPIResponse(function: "getNotification",apiName: ApiServices.getNotification,response: response);

    return response;
  }


}