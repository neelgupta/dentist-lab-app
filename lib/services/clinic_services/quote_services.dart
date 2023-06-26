import 'dart:convert';
import 'dart:developer';
import 'package:dentalapp/clinic_screen/create_quote.dart';
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

    Utils.logAPIResponse(
        function: "getQuotes",
        apiName: ApiServices.getQuote,
        response: response,
        body: body);

    return response;
  }

  getPendingQuoteDetail({required body}) async {
    var postUri = Uri.parse(ApiServices.getPendingQuote);
    var response = await http.post(
      postUri,
      body: jsonEncode(body),
      headers: Utils.apiHeader,
    );

    Utils.logAPIResponse(
        function: "getPendingQuoteDetail",
        apiName: ApiServices.getPendingQuote,
        response: response,
        body: body);

    return response;
  }

  acceptProposal({required body}) async {
    var postUri = Uri.parse(ApiServices.acceptProposals);
    var response = await http.post(
      postUri,
      body: jsonEncode(body),
      headers: Utils.apiHeader,
    );

    Utils.logAPIResponse(
        function: "acceptProposal",
        apiName: ApiServices.acceptProposals,
        response: response,
        body: body);

    return response;
  }

  getAcceptedQuoteDetail({required body}) async {
    var postUri = Uri.parse(ApiServices.getAcceptedQuote);
    var response = await http.post(
      postUri,
      body: jsonEncode(body),
      headers: Utils.apiHeader,
    );

    Utils.logAPIResponse(
        function: "getAcceptedQuoteDetail",
        apiName: ApiServices.getAcceptedQuote,
        response: response,
        body: body);

    return response;
  }

  makePayment({required body, required isAdvance}) async {
    var postUri = isAdvance
        ? Uri.parse(ApiServices.makeAdvancePayment)
        : Uri.parse(ApiServices.makeRemainingPayment);
    var response = await http.post(
      postUri,
      body: jsonEncode(body),
      headers: Utils.apiHeader,
    );

    Utils.logAPIResponse(
        function: "makeAdvancePayment",
        apiName: isAdvance
            ? ApiServices.makeAdvancePayment
            : ApiServices.makeRemainingPayment,
        response: response,
        body: body);

    return response;
  }

  acceptRejectDelivery({required body, required isAccept}) async {
    var postUri = isAccept
        ? Uri.parse(ApiServices.deliveryAccepted)
        : Uri.parse(ApiServices.deliveryRejected);
    var response = await http.post(
      postUri,
      body: jsonEncode(body),
      headers: Utils.apiHeader,
    );

    Utils.logAPIResponse(
        function: "acceptDelivery",
        apiName: isAccept
            ? ApiServices.deliveryAccepted
            : ApiServices.deliveryRejected,
        response: response,
        body: body);

    return response;
  }

  addComments({required body}) async {
    var postUri = Uri.parse(ApiServices.addComment);
    var response = await http.post(
      postUri,
      body: jsonEncode(body),
      headers: Utils.apiHeader,
    );

    Utils.logAPIResponse(
        function: "addComments",
        apiName: ApiServices.addComment,
        response: response,
        body: body);

    return response;
  }

  getComments({required body}) async {
    var postUri = Uri.parse(ApiServices.getComment);
    var response = await http.post(
      postUri,
      body: jsonEncode(body),
      headers: Utils.apiHeader,
    );

    Utils.logAPIResponse(
        function: "getComments",
        apiName: ApiServices.getComment,
        response: response,
        body: body);

    return response;
  }

  getLabProfile({required body}) async {
    var postUri = Uri.parse(ApiServices.getLabProfile);
    var response = await http.post(
      postUri,
      body: jsonEncode(body),
      headers: Utils.apiHeader,
    );

    Utils.logAPIResponse(
        function: "getLabProfile",
        apiName: ApiServices.getLabProfile,
        response: response,
        body: body);

    return response;
  }

  createQuote(
      {required body,
      required List<ImageData> images,
      required List serviceId,
      required List labId}) async {
    var postUri = Uri.parse(ApiServices.createQuote);
    var request = http.MultipartRequest("POST", postUri);
    request.fields.addAll(body);
    for (var i = 0; i < serviceId.length; i++) {
      Map<String, String> service = {
        'serviceIds[$i]': serviceId[i],
      };
      request.fields.addAll(service);
    }
    if (labId.isNotEmpty) {
      for (var i = 0; i < labId.length; i++) {
        Map<String, String> lab = {
          'labs[$i]': labId[i],
        };
        request.fields.addAll(lab);
      }
    }
    request.headers.addAll(Utils.apiHeader);
    for (var i = 0; i < images.length; i++) {
      http.MultipartFile multipartFile =
          await http.MultipartFile.fromPath('quoteImages', images[i].path);
      request.files.add(multipartFile);
    }
    http.StreamedResponse response = await request.send();

    final res = await http.Response.fromStream(response);

    Utils.logAPIResponse(
        function: "createQuote",
        apiName: ApiServices.createQuote,
        response: res,
        body: body);

    return res;
  }

  updateQuote(
      {required body,
      required List<ImageData> images,
      required List serviceId,
      required List labId,
      required List removedImages}) async {
    var postUri = Uri.parse(ApiServices.updateQuote);
    var request = http.MultipartRequest("PUT", postUri);
    request.fields.addAll(body);
    for (var i = 0; i < serviceId.length; i++) {
      Map<String, String> service = {
        'serviceIds[$i]': serviceId[i],
      };
      request.fields.addAll(service);
    }
    if (labId.isNotEmpty) {
      for (var i = 0; i < labId.length; i++) {
        Map<String, String> lab = {
          'labs[$i]': labId[i],
        };
        request.fields.addAll(lab);
      }
    }

    if (removedImages.isNotEmpty) {
      for (var i = 0; i < removedImages.length; i++) {
        Map<String, String> removedImage = {
          'oldQuoteImages[$i]': removedImages[i],
        };
        request.fields.addAll(removedImage);
      }
    }
    if (images.isNotEmpty) {
      for (var i = 0; i < images.length; i++) {
        http.MultipartFile multipartFile =
            await http.MultipartFile.fromPath('quoteImages', images[i].path);
        request.files.add(multipartFile);
      }
    }
    request.headers.addAll(Utils.apiHeader);
    http.StreamedResponse response = await request.send();

    final res = await http.Response.fromStream(response);
    log("${request.fields}");
    log("${request.files}");

    Utils.logAPIResponse(
        function: "updateQuote",
        apiName: ApiServices.updateQuote,
        response: res,
        body: body);

    return res;
  }

  completeWork({required body}) async {
    var postUri = Uri.parse(ApiServices.completeWork);
    var response = await http.post(
      postUri,
      body: jsonEncode(body),
      headers: Utils.apiHeader,
    );

    Utils.logAPIResponse(
        function: "completeWork",
        apiName: ApiServices.completeWork,
        response: response,
        body: body);

    return response;
  }

  getPaymentUrl({required body}) async {
    var postUri = Uri.parse("https://www.payd.ae/pg/public/api/generateTransactionId");
    var headers = {
      'Accept': 'application/json',
    'secretkey': "\$2y\$10\$.gDNy24kZIDtS5/paN9q.eB/YM7u6PY0yJ6Lvd2NINbFtUQouk6OO"
    };
    var response = await http.post(
      postUri,
      body: body,
      headers: headers,
    );

    Utils.logAPIResponse(
        function: "getPaymentUrl",
        apiName: "https://www.payd.ae/pg/public/api/generateTransactionId",
        response: response,
        body: body);

    return response;
  }

  getSingleQuoteDetail({required String quotId}) async {
    var postUri = Uri.parse("${ApiServices.getSingleQuote}/$quotId");
    var response = await http.get(
      postUri,
      headers: Utils.apiHeader,
    );

    Utils.logAPIResponse(
        function: "getSingleQuoteDetail",
        apiName: "${ApiServices.getSingleQuote}/$quotId",
        response: response,);

    return response;
  }
}
