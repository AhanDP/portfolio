class FcmResponse{
  bool? status;
  String? error;
  String? message;

  FcmResponse.fromMap(Map<String, dynamic> data) {
    status = true;
    if (data['message'] != null) {
      message = data['message'];
    }
  }

  FcmResponse.withError(this.status, this.error);
}