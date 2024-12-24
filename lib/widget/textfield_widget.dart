import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';
import '../values/app_colors.dart';

class TextFieldWidget extends StatelessWidget {
  final String? hint;
  final TextEditingController controller;

  const TextFieldWidget({super.key, required this.hint, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10.0),
      child: SizedBox(
        height:
        MediaQuery.of(context).size.height * 0.09,
        width: ResponsiveBreakpoints.of(context)
            .isDesktop
            ? MediaQuery.of(context).size.width * 0.40
            : MediaQuery.of(context).size.width * 0.8,
        child: TextFormField(
          controller: controller,
          keyboardType: TextInputType.number,
          decoration: InputDecoration(
            contentPadding:
            const EdgeInsets.only(left: 20),
            hintText: hint,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: const BorderSide(
                  color: AppColors.primaryColor),
            ),
          ),
          cursorColor: AppColors.primaryColor,
        ),
      ),
    );
  }
}
