import 'package:flutter/cupertino.dart';

class StageModel {
  int? title;
  List<Widget> child;

  StageModel(this.title, this.child);

  Map<String, dynamic> toJson() => {'title': title, 'child': child};
}
