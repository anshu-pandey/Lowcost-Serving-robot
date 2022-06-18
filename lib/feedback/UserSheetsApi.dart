import 'package:gsheets/gsheets.dart';

class UserSheetsApi {
  static const _crediential = r''' 
 { "type": "",
  "client_email":,
  "client_id":,
  "auth_uri": ,
  "token_uri": 
  "auth_provider_x509_cert_url":,
  "client_x509_cert_url": }''';

  static final _spreadsheetid = "1l4gAM9-DoMb2AfqDCBSr5N_-FFJ71xPlU";
  static final _gsheet = GSheets(_crediential);
  static Worksheet? _userSheet;
  static Future init() async {
    final spreadsheet = await _gsheet.spreadsheet(_spreadsheetid);
    _userSheet = spreadsheet.worksheetByTitle('feedback');
    // create worksheet if it does not exist yet
    _userSheet ??= await spreadsheet.addWorksheet('feedback');
  }

  static Future insert(List<Map<String, dynamic>> rowlist) async {
    if (_userSheet == null) return;
    _userSheet!.values.map.appendRows(rowlist);
  }
}
