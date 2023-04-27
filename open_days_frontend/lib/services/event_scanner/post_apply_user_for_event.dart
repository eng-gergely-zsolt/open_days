import 'package:http/http.dart' as http;

import '../../shared/secure_storage.dart';
import '../../models/responses/base_response.dart';

Future<BaseResponse> participateInEventSvc(String? uri) async {
  final response = BaseResponse();
  final userPublicId = await SecureStorage.getUserId() ?? '';
  final authorizationToken = await SecureStorage.getAuthorizationToken();

  if (uri == null) {
    return response;
  }

  uri = uri + '/' + userPublicId;

  Map<String, String> headers = {
    "Content-Type": "application/json",
    "Authorization": authorizationToken ?? '',
  };

  final rawResponse = await http
      .post(
        Uri.parse(uri),
        headers: headers,
      )
      .timeout(const Duration(seconds: 10));

  if (rawResponse.statusCode == 200) {
    response.isOperationSuccessful = true;
  }

  return response;
}
