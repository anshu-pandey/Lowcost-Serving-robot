import 'dart:convert' as convert;
import 'package:http/http.dart' as http;
import 'package:flutter_application_2/Database/Details.dart';

/// FormController is a class which does work of saving FeedbackForm in Google Sheets using
/// HTTP GET request on Google App Script Web URL and parses response and sends result callback.
class FormController {
  var URL =
      "https://script.google.com/macros/s/AKfycbxpt8aVCYU_1jnXpG0dZ3HQ/exec";
  Uri url = Uri.parse(
      "https://script.google.com/macT5JwcI2cG2XTeNUuFhndYU_1jnXpG0dZ3HQ/exec");

  // Success Status Message
  static const STATUS_SUCCESS = "SUCCESS";

  /// Async function which saves feedback, parses [feedbackForm] parameters
  /// and sends HTTP GET request on [URL]. On successful response, [callback] is called.
  void submitForm(Details feedbackForm, void Function(String) callback) async {
    /*try {
       await http.post(url, body: feedbackForm.toJson()).then((response) async {
        if (response.statusCode == 302) {
          url = response.headers['location'] as Uri;
      await http.get(url).then((response) {
        callback(convert.jsonDecode(response.body)['status']);
      });
    }
      } else {
          callback(convert.jsonDecode(response.body)['status']);
        }
      });
    }
    catch (e) {
      print(e);
    }
    */
    Uri demo_url = Uri.parse(URL + feedbackForm.toParams());
    try {
      await http.get(demo_url).then((response) {
        callback(convert.jsonDecode(response.body)['status']);
      });
    } catch (e) {
      print(e);
    }
  }
}
