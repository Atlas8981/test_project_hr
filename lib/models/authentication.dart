import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:test_project_hr/constants/api_route.dart' as api_url;

class Authentication {
  String? token;
  final String username;
  final String password;
  String? deviceIdentifier;

  Authentication({
    required this.username,
    required this.password,
    this.deviceIdentifier,
  });

  Future<bool> login() async {
    try {
      var uri = Uri.parse(api_url.authLogin);
      var payload = jsonEncode(toJson());
      var response = await http.post(uri,
          headers: {HttpHeaders.contentTypeHeader: 'application/json'},
          body: payload);
      if (response.statusCode == 200) {
        final responseJson = jsonDecode(response.body);
        token = responseJson['_token'];
        return true;
      }
      return false;
    } catch (e) {
      return false;
    }
  }

  Map<String, String> toJson() => {
        "username": username,
        "password": password,
      };

  Map<String, dynamic> parseJwt(String token) {
    final parts = token.split('.');
    if (parts.length != 3) {
      throw Exception('invalid token');
    }

    final payload = _decodeBase64(parts[1]);
    final payloadMap = json.decode(payload);
    if (payloadMap is! Map<String, dynamic>) {
      throw Exception('invalid payload');
    }

    return payloadMap;
  }

  String _decodeBase64(String str) {
    String output = str.replaceAll('-', '+').replaceAll('_', '/');

    switch (output.length % 4) {
      case 0:
        break;
      case 2:
        output += '==';
        break;
      case 3:
        output += '=';
        break;
      default:
        throw Exception('Illegal base64url string!"');
    }

    return utf8.decode(base64Url.decode(output));
  }
}
