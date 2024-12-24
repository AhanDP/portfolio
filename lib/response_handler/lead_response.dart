import '../model/filter.dart';
import '../model/lead.dart';

class LeadResponse {
  bool? status;
  List<Lead>? leads;
  String? error;
  String? message;
  late Filter filter;

  LeadResponse.fromMap(Map<String, dynamic> data) {
    status = true;
    if (data['message'] != null) {
      message = data['message'];
    }
    if (data['data']['lead_list'] != null) {
      leads = (data['data']['lead_list'] as List).map((e) => Lead.fromMap(e)).toList();
    }
    if (data['data']['filter_data'] != null) {
      filter = Filter.fromMap(data['data']['filter_data']);
    }
  }

  LeadResponse.withError(this.status, this.error);
}