import 'dart:convert';
import 'package:dentalapp/util/api_services.dart';
import 'package:dentalapp/util/utils.dart';
import 'package:http/http.dart' as http;

class QuoteService {

  getQuotes({required body}) async {
    var postUri = Uri.parse(ApiServices.getQuote);
    var response = await http.post(
      postUri,
      body: jsonEncode(body),
      headers: Utils.apiHeader,
    );

    Utils.logAPIResponse(function: "getQuotes",apiName: ApiServices.getQuote,response: response, body: body);

    return response;
  }

  getPendingQuoteDetail({required body}) async {
    var postUri = Uri.parse(ApiServices.getPendingQuote);
    var response = await http.post(
      postUri,
      body: jsonEncode(body),
      headers: Utils.apiHeader,
    );

    Utils.logAPIResponse(function: "getPendingQuoteDetail",apiName: ApiServices.getPendingQuote,response: response, body: body);

    return response;
  }

  acceptProposal({required body}) async {
    var postUri = Uri.parse(ApiServices.acceptProposals);
    var response = await http.post(
      postUri,
      body: jsonEncode(body),
      headers: Utils.apiHeader,
    );

    Utils.logAPIResponse(function: "acceptProposal",apiName: ApiServices.acceptProposals,response: response, body: body);

    return response;
  }

  getAcceptedQuoteDetail({required body}) async {
    var postUri = Uri.parse(ApiServices.getAcceptedQuote);
    var response = await http.post(
      postUri,
      body: jsonEncode(body),
      headers: Utils.apiHeader,
    );

    Utils.logAPIResponse(function: "getAcceptedQuoteDetail",apiName: ApiServices.getAcceptedQuote,response: response, body: body);

    return response;
  }

  makePayment({required body, required isAdvance}) async {
    var postUri = isAdvance?Uri.parse(ApiServices.makeAdvancePayment):Uri.parse(ApiServices.makeRemainingPayment);
    var response = await http.post(
      postUri,
      body: jsonEncode(body),
      headers: Utils.apiHeader,
    );

    Utils.logAPIResponse(function: "makeAdvancePayment",apiName: isAdvance?ApiServices.makeAdvancePayment:ApiServices.makeRemainingPayment,response: response, body: body);

    return response;
  }

  acceptRejectDelivery({required body,required isAccept}) async {
    var postUri = isAccept?Uri.parse(ApiServices.deliveryAccepted):Uri.parse(ApiServices.deliveryRejected);
    var response = await http.post(
      postUri,
      body: jsonEncode(body),
      headers: Utils.apiHeader,
    );

    Utils.logAPIResponse(function: "acceptDelivery",apiName: isAccept?ApiServices.deliveryAccepted:ApiServices.deliveryRejected,response: response, body: body);

    return response;
  }

  addComments({required body}) async {
    var postUri = Uri.parse(ApiServices.addComment);
    var response = await http.post(
      postUri,
      body: jsonEncode(body),
      headers: Utils.apiHeader,
    );

    Utils.logAPIResponse(function: "addComments",apiName: ApiServices.addComment,response: response, body: body);

    return response;
  }

  getComments({required body}) async {
    var postUri = Uri.parse(ApiServices.getComment);
    var response = await http.post(
      postUri,
      body: jsonEncode(body),
      headers: Utils.apiHeader,
    );

    Utils.logAPIResponse(function: "getComments",apiName: ApiServices.getComment,response: response, body: body);

    return response;
  }

  getLabProfile({required body}) async {
    var postUri = Uri.parse(ApiServices.getLabProfile);
    var response = await http.post(
      postUri,
      body: jsonEncode(body),
      headers: Utils.apiHeader,
    );

    Utils.logAPIResponse(function: "getLabProfile",apiName: ApiServices.getLabProfile,response: response, body: body);

    return response;
  }
}