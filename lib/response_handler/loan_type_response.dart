import '../model/add_lead.dart';

class LoanTypeResponse {
  bool? status;
  List<Loan>? loans;
  String? error;
  String? message;

  LoanTypeResponse.fromMap(Map<String, dynamic> data) {
    status = true;
    if (data['message'] != null) {
      message = data['message'];
    }
    if (data['data']['loan_list'] != null) {
      loans = (data['data']['loan_list'] as List).map((e) => Loan.fromMap(e)).toList();
    }
  }

  LoanTypeResponse.withError(this.status, this.error);
}
