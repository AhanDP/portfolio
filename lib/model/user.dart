import 'dart:convert';
import 'dart:developer';

import 'package:shared_preferences/shared_preferences.dart';

import '../values/constant.dart';

class User {
  static const typeGuest = 'guest';
  static const typeUser = 'user';

  int? id;
  String? email;
  String? name;
  int? b2bUserId;
  String? accessToken;
  String? refreshToken;
  String? mobile;
  String? type;

  User({
    this.id,
    this.email,
    this.name,
    this.b2bUserId,
    this.accessToken,
    this.refreshToken,
    this.type,
  });

  User.fromMap(Map<String, dynamic> data) {
    id = data['id'];
    email = data['email'];
    name = data['name'];
    b2bUserId = data['b2b_user_id'];
    accessToken = data['access_token'];
    refreshToken = data['refresh_token'];
    type = data['user_type'];
    mobile = data['mobile_no'];
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'email': email,
        'name': name,
        'b2b_user_id': b2bUserId,
        'access_token': accessToken,
        'refresh_token': refreshToken,
        'user_type': type,
        'mobile_no': mobile,
      };

  Future<bool> save() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    try {
      return await prefs.setString(constant.prefsUser, json.encode(this));
    } catch (e) {
      log(e.toString(), name: 'Error saving user to shared preferences');
    }

    return false;
  }

  static Future<User?> get() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? userJson = prefs.getString(constant.prefsUser);

    if (userJson != null) {
      try {
        User user = User.fromMap(json.decode(userJson));
        return user;
      } catch (e) {
        log(e.toString(), name: 'Error getting user from shared preferences');
      }
    }

    return null;
  }

  Future<bool> delete() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return await preferences.remove(constant.prefsUser);
  }
}
