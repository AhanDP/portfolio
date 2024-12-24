class Loan {
  int? loanType;
  int? loanCategory;
  String? categoryName;
  String? loanTypeName;
  String? logoUrl;
  String? url;
  List<Loan>? subLoans;

  Loan(this.loanType, this.loanCategory, this.categoryName, this.loanTypeName,
      this.logoUrl, this.url);

  Loan.fromMap(Map<String, dynamic> data) {
    loanType = data['loan_type'];
    loanCategory = data['loan_cat'];
    categoryName = data['category_name'];
    loanTypeName = data['loan_type_name'];
    logoUrl = data['logo_url'];
    url = data['url'];
    subLoans = ((data['sub_loan_type'] ?? []) as List).map((e) => Loan.fromMap(e)).toList();
  }
}
