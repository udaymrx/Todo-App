import 'package:shared_preferences/shared_preferences.dart';

// ignore: avoid_classes_with_only_static_members
class UserPreferences {
  static late SharedPreferences _preferences;

  static const _userId = 'userId';
  static const _name = 'name';
  static const _authType = 'auth_type';
  static const _accessToken = 'access_token';
  static const _userType = 'user_type';
  static const _profilePic = 'profile_pic';
  static const _isSignedIn = 'isSignedIn';

  static Future init() async =>
      _preferences = await SharedPreferences.getInstance();

  static Future setUser({
    String? userId,
    String? accessToken,
    String? authType,
  }) async {
    await _preferences.setString(_userId, userId ?? "");
    await _preferences.setString(_accessToken, accessToken ?? "");
    await _preferences.setString(_authType, authType ?? "");
  }

  static Future setUserType(String? userType) async {
    await _preferences.setString(_userType, userType ?? "");
  }

  static Future setName(String? name) async {
    await _preferences.setString(_name, name ?? "");
  }

  static Future setProfilePic(String? profilePic) async {
    await _preferences.setString(_profilePic, profilePic ?? "");
  }

  static Future setSignedIn(bool? isSignedIn) async {
    await _preferences.setBool(_isSignedIn, isSignedIn ?? false);
  }

  static String get userId => _preferences.getString(_userId) ?? '';

  static String get name => _preferences.getString(_name) ?? "";

  static String get userType => _preferences.getString(_userType) ?? "";

  static String get authType => _preferences.getString(_authType) ?? "";

  static String get accessToken => _preferences.getString(_accessToken) ?? "";

  static String get profilePic => _preferences.getString(_profilePic) ?? "";

  static bool get isSignedIn => _preferences.getBool(_isSignedIn) ?? false;

  static Future removeUser() async {
    await _preferences.remove(_userId);
    await _preferences.remove(_name);
    await _preferences.remove(_userType);
    await _preferences.remove(_authType);
    await _preferences.remove(_accessToken);
    await _preferences.remove(_profilePic);
    await _preferences.remove(_isSignedIn);
  }
}
