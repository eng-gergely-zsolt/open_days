import 'dart:convert';
import 'package:http/http.dart' as http;

import '../../constants/constants.dart';
import '../../models/base_request_model.dart';
import '../../modules/home_base/models/get_all_event_model.dart';
import '../../modules/home_base/models/event_response_model.dart';

Future<GetAllEventModel> getAllEventSvc(
    BaseRequestModel baseRequestData) async {
  String uri = 'http://10.0.2.2:8081/open-days/event/all-event';

  Map<String, String> headers = {
    "Content-Type": "application/json",
    "Authorization": baseRequestData.authorizationToken,
  };

  final rawResponse = await http
      .get(
        Uri.parse(uri),
        headers: headers,
      )
      .timeout(const Duration(seconds: 5));

  GetAllEventModel response = GetAllEventModel();

  if (rawResponse.statusCode == 200) {
    Iterable decodedResponse = jsonDecode(rawResponse.body);

    response.operationResult = operationResultSuccess;
    response.events =
        decodedResponse.map((e) => EventResponseModel.fromJson(e)).toList();
  }

  return response;
}