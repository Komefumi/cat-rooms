import 'package:alfred/alfred.dart';

class Http {
  static handleResponse(HttpResponse res, bool success,
      Map<String, dynamic>? data, String? message) {
    final payload = {'success': success, 'data': data};
    if (message != null) {
      payload['message'] = message;
    }
    res.json(payload);
  }

  static handleSuccess(
      HttpResponse res, Map<String, dynamic>? data, String? message) {
    return Http.handleResponse(res, true, data, message);
  }

  static handleFailure(
      HttpResponse res, Map<String, dynamic>? data, String? message) {
    return Http.handleResponse(res, false, data, message);
  }
}
