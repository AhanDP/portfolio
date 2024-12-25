import 'package:flutter/material.dart';

class AndroidUi extends StatefulWidget {
  const AndroidUi({super.key});

  @override
  State<AndroidUi> createState() => _AndroidUiState();
}

class _AndroidUiState extends State<AndroidUi> {
  @override
  Widget build(BuildContext context) {
    return const Center(child: Text("Android"),);
  }
}
