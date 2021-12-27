import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:test_project_hr/constants/api_route.dart' as api_url;
import 'package:test_project_hr/models/attendance.dart';
import 'package:test_project_hr/providers/authentication_provider.dart';

Future<AttCheckInRequest?> checkIn(AttCheckInRequest data) async {
  try {
    final uri = Uri.parse(api_url.attCheckIn);
    final payload = jsonEncode(data);
    final response = await http.post(uri,
        headers: {
          HttpHeaders.contentTypeHeader: 'application/json',
          HttpHeaders.authorizationHeader: AuthenticationProvider.accessToken
        },
        body: payload);
    if (response.statusCode == 200) {
      final responseJson = jsonDecode(response.body);
      var attendanceStatus = AttCheckInRequest.fromJson(responseJson);
      return attendanceStatus;
    }
    return null;
  } catch (e) {
    return null;
  }
}
