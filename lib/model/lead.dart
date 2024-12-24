class Lead {
  String? name;
  late String applicationId;
  String? mobile;
  int? amount;
  String? loanType;
  String? stage;
  String? buttonText;
  int? askCount;
  int? b2bUserId;
  String? createdAt;
  String? employmentType;
  String? stepsCompleted;
  String? url;

  Lead(
      this.name,
      this.applicationId,
      this.mobile,
      this.amount,
      this.loanType,
      this.stage,
      this.buttonText,
      this.askCount,
      this.b2bUserId,
      this.createdAt,
      this.employmentType,
      this.stepsCompleted,
      this.url,
      );

  Lead.fromMap(Map<String, dynamic> data) {
    name = data['username'];
    applicationId = data['applicant_id'];
    mobile = data['mobile_no'];
    amount = data['loan_amount'];
    loanType = data['loan_type'];
    stage = data['stage'];
    buttonText = data['button_text'];
    askCount = data['ask_count'];
    b2bUserId = data['b2b_user_id'];
    createdAt = data['created_at'];
    employmentType = data['employment_type'];
    stepsCompleted = data['steps_completed'];
    url = data['url'];
  }
}
