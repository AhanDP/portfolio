class RegisterResponse {
  bool? status;
  String? error;
  String? message;

  RegisterResponse.fromMap(Map<String, dynamic> data) {
    status = true;
    if (data['message'] != null) {
      message = data['message'];
    }
  }
  RegisterResponse.withError(this.status, this.error);
}
