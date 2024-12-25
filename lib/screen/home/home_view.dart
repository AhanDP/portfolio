import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'home_controller.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => HomeController(context),
      child: Consumer<HomeController>(builder: (context, model, child) {
        model.detectPlatform(context);
        return const Center(child: CircularProgressIndicator());
      }),
    );
  }
}
