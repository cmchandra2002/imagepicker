import 'dart:convert';
import 'dart:typed_data';

import '../../flutter_flow/flutter_flow_util.dart';

import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

class UploadImageCall {
  static Future<ApiCallResponse> call({
    String? accessToken = '',
  }) {
    final body = '''
{
  "schedule_visit_id": "624dc9111a6bda002dd6a73e",
  "user_id": "62041819c0dfd334d0f46548",
  "location": {
    "type": "Point",
    "coordinates": [
      37.4219983,
      -122.084
    ]
  },
  "image_uploaded": false,
  "image": {
    "file_name": "New_Document",
    "file_type": "jpeg",
    "file_size": "100kb"
  }
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'UploadImage',
      apiUrl: 'https://api-sales-dev.yodadiagnostics.com/v1.0/visit-proof',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': '${accessToken}',
      },
      params: {},
      body: body,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class ApiPagingParams {
  int nextPageNumber = 0;
  int numItems = 0;
  dynamic lastResponse;

  ApiPagingParams({
    required this.nextPageNumber,
    required this.numItems,
    required this.lastResponse,
  });

  @override
  String toString() =>
      'PagingParams(nextPageNumber: $nextPageNumber, numItems: $numItems, lastResponse: $lastResponse,)';
}

String _serializeList(List? list) {
  list ??= <String>[];
  try {
    return json.encode(list);
  } catch (_) {
    return '[]';
  }
}

String _serializeJson(dynamic jsonVar) {
  jsonVar ??= {};
  try {
    return json.encode(jsonVar);
  } catch (_) {
    return '{}';
  }
}
