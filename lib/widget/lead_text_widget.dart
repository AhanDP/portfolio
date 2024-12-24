import 'package:flutter/material.dart';

import '../values/app_colors.dart';

class LeadTextWidget extends StatelessWidget {
  final String title;
  final String description;
  final String? secondDescription;
  final EdgeInsetsGeometry padding;
  final Color? descriptionColor;

  const LeadTextWidget(
      {Key? key,
        required this.title,
        required this.description,
        this.secondDescription,
        required this.padding,
        this.descriptionColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: AppColors.primaryColor.withOpacity(0.4)),
          ),
          const SizedBox(height: 5),
          Text(
            description,
            style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w700,
                color: descriptionColor ?? AppColors.primaryColor),
          ),
          secondDescription != null
              ? Padding(
            padding: const EdgeInsets.only(top: 5),
            child: Text(
              '$secondDescription',
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  color: descriptionColor ??
                      AppColors.primaryColor.withOpacity(0.5)),
            ),
          )
              : const SizedBox.shrink()
        ],
      ),
    );
  }
}