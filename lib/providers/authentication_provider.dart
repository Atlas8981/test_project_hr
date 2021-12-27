import 'package:flutter/foundation.dart';
import 'package:test_project_hr/models/users.dart';

class AuthenticationProvider extends ChangeNotifier {
  String? _token;
  final String _tokenType = 'Bearer';
  late UserProfile userProfile;
  static String accessToken = '';

  String? get getToken => _token;
  String get getAccessToken => '$_tokenType $_token';

  void updateToken(String token) async {
    _token = token;
    AuthenticationProvider.accessToken = getAccessToken;
    notifyListeners();
  }

  void clearToken() async {
    _token = null;
    AuthenticationProvider.accessToken = '';
    notifyListeners();
  }

  void updateUserProfile(UserProfile profile) {
    userProfile = profile;
    notifyListeners();
  }
}
