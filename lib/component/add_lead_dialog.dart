// import 'package:portfolio/screen/home/home_controller.dart';
// import 'package:flutter/material.dart';
// import 'package:go_router/go_router.dart';
// import 'package:responsive_framework/responsive_framework.dart';
// import 'package:url_launcher/url_launcher.dart';
// import '../model/add_lead.dart';
// import '../values/app_colors.dart';
// import '../widget/loan_widget.dart';
//
// class AddLeadDialog extends StatelessWidget {
//   final HomeController controller;
//   const AddLeadDialog(this.controller, {super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Dialog(
//       shape: RoundedRectangleBorder(
//           borderRadius:
//           BorderRadius.circular(20.0)),
//       child: controller.loans == null
//           ? const SizedBox.shrink()
//           : SizedBox(
//         height: ResponsiveBreakpoints.of(context).smallerThan(DESKTOP)? MediaQuery.of(context)
//             .size
//             .height *
//             0.42: MediaQuery.of(context)
//             .size
//             .height *
//             0.70,
//         width: ResponsiveBreakpoints.of(context).smallerThan(DESKTOP)? MediaQuery.of(context)
//             .size
//             .width *
//             0.80: MediaQuery.of(context)
//             .size
//             .width *
//             0.60,
//         child: Column(
//           children: [
//             Padding(
//               padding: const EdgeInsets.all(20),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Text(
//                     "Apply for Loan",
//                     style: TextStyle(
//                         color: AppColors.primaryColor,
//                         fontWeight: FontWeight.w500,
//                         fontSize: ResponsiveBreakpoints.of(context)
//                             .smallerThan(DESKTOP)
//                             ? 20
//                             : 30),
//                   ),
//                   InkWell(
//                     onTap: () => context.pop(),
//                     child: Container(
//                         height: MediaQuery.of(context).size.height *
//                             0.035,
//                         width: MediaQuery.of(context).size.height *
//                             0.035,
//                         decoration: BoxDecoration(
//                             color: AppColors.secondaryColor,
//                             borderRadius: BorderRadius.circular(
//                                 MediaQuery.of(context).size.height *
//                                     0.035)),
//                         child: const Icon(
//                           Icons.close_outlined,
//                           color: Colors.white,
//                         )),
//                   ),
//                 ],
//               ),
//             ),
//             Expanded(
//               flex: 1,
//               child: Padding(
//                 padding: const EdgeInsets.only(left: 10,right: 10),
//                 child: ListView.separated(
//                   shrinkWrap: true,
//                   physics: const AlwaysScrollableScrollPhysics(),
//                   scrollDirection: Axis.vertical,
//                   itemCount:
//                   controller.loans?.length ?? 0,
//                   itemBuilder:
//                       (BuildContext context,
//                       int index) {
//                     Loan loan_ =
//                     controller.loans![index];
//                     return Padding(
//                       padding:
//                       const EdgeInsets.all(
//                           8.0),
//                       child: loan_
//                           .subLoans!.isEmpty
//                           ? InkWell(
//                           onTap: () async{
//                             Uri url = Uri.parse("${loan_.url}");
//                             await launchUrl(url);
//                           },
//                           child: LoanCard(loan: loan_))
//                           : InkWell(
//                         onTap: () {},
//                         child: LoanCard(
//                             loan: loan_),
//                       ),
//                     );
//                   }, separatorBuilder: (BuildContext context, int index) {
//                   return const SizedBox(height: 10);
//                 },
//                 ),
//               ),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }
