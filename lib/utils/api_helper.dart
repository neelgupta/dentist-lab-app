import 'package:dentalapp/services/helper_fun.dart';

class ApiHelpers{

  static var apiHeader = {"Authorization" : "Bearer ${ApiHelper.getToken()}"};
}