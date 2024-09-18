import 'dart:convert';

import 'package:flutter/foundation.dart';

import '/flutter_flow/flutter_flow_util.dart';
import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

/// Start SUPAFLOW Group Code

class SupaflowGroup {
  static String getBaseUrl({
    String? anonKey =
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InJ6bGpncWNybHpuYmFucW1idnZkIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MTcxOTE3MjQsImV4cCI6MjAzMjc2NzcyNH0.u_iCGJr7vnzdg1T7OYxQqr5LskR965ZmR6oVelBIkzg',
  }) =>
      'https://rzljgqcrlznbanqmbvvd.supabase.co/';
  static Map<String, String> headers = {
    'Content-Type': 'application/json',
  };
  static SelectIsOpenCall selectIsOpenCall = SelectIsOpenCall();
  static ResetPasswordCall resetPasswordCall = ResetPasswordCall();
  static UpdateUserCall updateUserCall = UpdateUserCall();
}

class SelectIsOpenCall {
  Future<ApiCallResponse> call({
    int? qrCode,
    String? anonKey =
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InJ6bGpncWNybHpuYmFucW1idnZkIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MTcxOTE3MjQsImV4cCI6MjAzMjc2NzcyNH0.u_iCGJr7vnzdg1T7OYxQqr5LskR965ZmR6oVelBIkzg',
  }) async {
    final baseUrl = SupaflowGroup.getBaseUrl(
      anonKey: anonKey,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'SelectIsOpen',
      apiUrl: '$baseUrl/rest/v1/empresas?select=*',
      callType: ApiCallType.GET,
      headers: {
        'Content-Type': 'application/json',
        'apikey':
            'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InJ6bGpncWNybHpuYmFucW1idnZkIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MTcxOTE3MjQsImV4cCI6MjAzMjc2NzcyNH0.u_iCGJr7vnzdg1T7OYxQqr5LskR965ZmR6oVelBIkzg',
        'Authorization':
            'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InJ6bGpncWNybHpuYmFucW1idnZkIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MTcxOTE3MjQsImV4cCI6MjAzMjc2NzcyNH0.u_iCGJr7vnzdg1T7OYxQqr5LskR965ZmR6oVelBIkzg',
      },
      params: {
        'qr_code': qrCode,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  bool? path(dynamic response) => castToType<bool>(getJsonField(
        response,
        r'''$[0].is_open''',
      ));
}

class ResetPasswordCall {
  Future<ApiCallResponse> call({
    String? email = '',
    String? anonKey =
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InJ6bGpncWNybHpuYmFucW1idnZkIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MTcxOTE3MjQsImV4cCI6MjAzMjc2NzcyNH0.u_iCGJr7vnzdg1T7OYxQqr5LskR965ZmR6oVelBIkzg',
  }) async {
    final baseUrl = SupaflowGroup.getBaseUrl(
      anonKey: anonKey,
    );

    final ffApiRequestBody = '''
{
  "email": "$email"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Reset Password',
      apiUrl: '${baseUrl}auth/v1/recover',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json',
        'apikey':
            'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InJ6bGpncWNybHpuYmFucW1idnZkIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MTcxOTE3MjQsImV4cCI6MjAzMjc2NzcyNH0.u_iCGJr7vnzdg1T7OYxQqr5LskR965ZmR6oVelBIkzg',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class UpdateUserCall {
  Future<ApiCallResponse> call({
    String? email = '',
    String? jwtToken = '',
    String? newPassword = '',
    String? anonKey =
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InJ6bGpncWNybHpuYmFucW1idnZkIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MTcxOTE3MjQsImV4cCI6MjAzMjc2NzcyNH0.u_iCGJr7vnzdg1T7OYxQqr5LskR965ZmR6oVelBIkzg',
  }) async {
    final baseUrl = SupaflowGroup.getBaseUrl(
      anonKey: anonKey,
    );

    final ffApiRequestBody = '''
{
  "email": "$email",
  "password": "$newPassword"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Update User',
      apiUrl: '${baseUrl}auth/v1/user',
      callType: ApiCallType.PUT,
      headers: {
        'Content-Type': 'application/json',
        'apikey':
            'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InJ6bGpncWNybHpuYmFucW1idnZkIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MTcxOTE3MjQsImV4cCI6MjAzMjc2NzcyNH0.u_iCGJr7vnzdg1T7OYxQqr5LskR965ZmR6oVelBIkzg',
        'Authorization': 'Bearer',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

/// End SUPAFLOW Group Code

class GenerateAvatarCall {
  static Future<ApiCallResponse> call({
    String? name = 'John Doe',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'Generate Avatar',
      apiUrl:
          'www.ui-avatars.com/api/?name=$name&background=7541EE&color=fff',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class UpdateUSerCall {
  static Future<ApiCallResponse> call({
    String? email = '',
    String? newPassword = '',
    String? userToken = '',
  }) async {
    final ffApiRequestBody = '''
{
  "email": "$email",
  "password": "$newPassword"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Update USer',
      apiUrl: 'https://rzljgqcrlznbanqmbvvd.supabase.co/auth/v1/user',
      callType: ApiCallType.PUT,
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $userToken',
        'apikey':
            'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InJ6bGpncWNybHpuYmFucW1idnZkIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MTcxOTE3MjQsImV4cCI6MjAzMjc2NzcyNH0.u_iCGJr7vnzdg1T7OYxQqr5LskR965ZmR6oVelBIkzg',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
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

String _toEncodable(dynamic item) {
  if (item is DocumentReference) {
    return item.path;
  }
  return item;
}

String _serializeList(List? list) {
  list ??= <String>[];
  try {
    return json.encode(list, toEncodable: _toEncodable);
  } catch (_) {
    if (kDebugMode) {
      print("List serialization failed. Returning empty list.");
    }
    return '[]';
  }
}

String _serializeJson(dynamic jsonVar, [bool isList = false]) {
  jsonVar ??= (isList ? [] : {});
  try {
    return json.encode(jsonVar, toEncodable: _toEncodable);
  } catch (_) {
    if (kDebugMode) {
      print("Json serialization failed. Returning empty json.");
    }
    return isList ? '[]' : '{}';
  }
}
