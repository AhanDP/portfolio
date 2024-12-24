import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';
import '../model/add_lead.dart';
import '../values/app_colors.dart';

class LoanCard extends StatelessWidget {
  final Loan loan;

  const LoanCard({super.key, required this.loan});

  @override
  Widget build(BuildContext context) {
    double cardSize = MediaQuery.of(context).size.height * 0.20;
    return Container(
      decoration: BoxDecoration(
        color: AppColors.backgroundColor,
        borderRadius: BorderRadius.circular(20),
      ),
      height: cardSize, width: cardSize,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            /*CachedNetworkImage(
              imageUrl: "${loan.logoUrl}",
              placeholder: (context, url) => const CircularProgressIndicator(),
              errorWidget: (context, url, error) => const Icon(Icons.error),
            ),*/
            Text(
              '${loan.loanTypeName}',
              style: TextStyle(
                fontSize: ResponsiveBreakpoints.of(context).smallerThan(DESKTOP)
                    ? 14
                    : 22,
                fontWeight: FontWeight.w500,
                color: AppColors.primaryColor,
              ),
            )
          ],
        ),
      ),
    );
  }
}
