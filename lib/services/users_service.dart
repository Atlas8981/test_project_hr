import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:test_project_hr/constants/api_route.dart' as api_url;
import 'package:test_project_hr/models/users.dart';
import 'package:test_project_hr/providers/authentication_provider.dart';

Future<UserProfile?> getUserProfile() async {
  try {
    var uri = Uri.parse(api_url.userProfile);
    var response = await http.post(uri, headers: {
      HttpHeaders.contentTypeHeader: 'application/json',
      HttpHeaders.authorizationHeader: AuthenticationProvider.accessToken
    });
    if (response.statusCode == 200) {
      final responseJson = jsonDecode(response.body);
      var userProfile = UserProfile.fromJson(responseJson);
      return userProfile;
    }
    return null;
  } catch (e) {
    return null;
  }
}
