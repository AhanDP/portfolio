import 'package:flutter/material.dart';

class IosUi extends StatefulWidget {
  const IosUi({super.key});

  @override
  State<IosUi> createState() => _IosUiState();
}

class _IosUiState extends State<IosUi> {
  @override
  Widget build(BuildContext context) {
    return const Center(child: Text("IOS"));
  }
}
