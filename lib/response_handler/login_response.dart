
import '../model/user.dart';

class LoginResponse {
  bool? status;
  User? user;
  String? error;
  String? message;

  LoginResponse.fromMap(Map<String, dynamic> data) {
    status = true;
    if (data['message'] != null) {
      message = data['message'];
    }
    if (data['data']['user'] != null) {
      user = User.fromMap(data['data']['user']);
    }

  }

  LoginResponse.withError(this.status, this.error);
}
