class Filter{
  List<String> status = [];

  Filter(this.status);

  Filter.fromMap(Map<String, dynamic> data) {
    status = (data['status'] as List).map((e) => e.toString()).toList();
  }
}