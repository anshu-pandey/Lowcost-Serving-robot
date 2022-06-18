import 'package:gsheets/gsheets.dart';

class userdataSheetsApi {
  static const _crediential = r''' 
 { "type": "service_account",
  "project_id": "",
  "private_key_id": "",
  "private_key": "----",
  "client_email": "m",
  "client_id": "17",
  "auth_uri": "",
  "token_uri": "",
  "auth_provider_x509_cert_url": "",
  "client_x509_cert_url": "''';

  static final _spreadsheetid = "1exPlU";
  static final _gsheet = GSheets(_crediential);
  static Worksheet? _userSheet;
  static Future init() async {
    final spreadsheet = await _gsheet.spreadsheet(_spreadsheetid);
    _userSheet = spreadsheet.worksheetByTitle('order');
    // create worksheet if it does not exist yet
    _userSheet ??= await spreadsheet.addWorksheet('order');
  }

  static Future insert(List<Map<String, dynamic>> rowlist) async {
    if (_userSheet == null) return;
    _userSheet!.values.map.appendRows(rowlist);
  }
}
