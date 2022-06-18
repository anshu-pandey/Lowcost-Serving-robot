import 'dart:convert' as convert;
import 'package:flutter_application_2/feedback/form_feedback.dart';
import 'package:http/http.dart' as http;

/// FormController is a class which does work of saving FeedbackForm in Google Sheets using
/// HTTP GET request on Google App Script Web URL and parses response and sends result callback.
class FormController {
  // Google App Script Web URL.
  static const String URL = "https://script.google.com/mmjoE3_3J0GsvR8Q/exec";
  Uri url = Uri.parse(URL);
  // Success Status Message
  static const STATUS_SUCCESS = "SUCCESS";

  /// Async function which saves feedback, parses [feedbackForm] parameters
  /// and sends HTTP GET request on [URL]. On successful response, [callback] is called.
  void submitForm(
      form_feedback feedbackForm, void Function(String) callback) async {
    try {
      await http.post(url, body: feedbackForm.toJson()).then((response) async {
        if (response.statusCode == 302) {
          url = response.headers['location'] as Uri;
          await http.get(url).then((response) {
            callback(convert.jsonDecode(response.body)['status']);
          });
        } else {
          callback(convert.jsonDecode(response.body)['status']);
        }
      });
    } catch (e) {
      print(e);
    }
  }
}
