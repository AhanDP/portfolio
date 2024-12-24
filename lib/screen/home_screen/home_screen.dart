// import 'package:portfolio/component/add_lead_dialog.dart';
// import 'package:portfolio/values/app_colors.dart';
// import 'package:portfolio/values/route_path.dart';
// import 'package:flutter/material.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// import 'package:go_router/go_router.dart';
// import 'package:provider/provider.dart';
// import 'package:responsive_framework/responsive_framework.dart';
// import 'package:url_launcher/url_launcher.dart';
// import '../../widget/lead_text_widget.dart';
// import 'home_controller.dart';
//
// class HomeScreen extends StatefulWidget {
//   const HomeScreen({super.key});
//
//   @override
//   State<HomeScreen> createState() => _HomeScreenState();
// }
//
// class _HomeScreenState extends State<HomeScreen> {
//   late double sizeHeight;
//   late double sizeWidth;
//   late double cardHeight;
//   @override
//   Widget build(BuildContext context) {
//     cardHeight = MediaQuery.of(context).size.height * 0.70;
//     sizeHeight = MediaQuery.of(context).size.height;
//     sizeWidth = MediaQuery.of(context).size.width;
//     return ChangeNotifierProvider(
//       create: (context) => HomeController(context),
//       child: Consumer<HomeController>(builder: (context, model, child) {
//         return Scaffold(
//           appBar: PreferredSize(
//             preferredSize:
//                 Size.fromHeight(MediaQuery.of(context).size.height * 0.12),
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.end,
//               children: <Widget>[
//                 Padding(
//                   padding: EdgeInsets.symmetric(
//                       horizontal:
//                           ResponsiveBreakpoints.of(context).smallerThan(DESKTOP)
//                               ? sizeHeight * 0
//                               : sizeHeight * 0.03,
//                       vertical: 10),
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: <Widget>[
//                       Image.asset("assets/images/canfin_logo.png", height: 80),
//                       Padding(
//                         padding: const EdgeInsets.symmetric(horizontal: 20),
//                         child: InkWell(
//                           onTap: () {
//                             model.user?.delete();
//                             context.go(RoutePath.login.toPath);
//                           },
//                           child: Container(
//                             alignment: Alignment.center,
//                             height: 41,
//                             width: 41,
//                             decoration: BoxDecoration(
//                                 borderRadius: BorderRadius.circular(20),
//                                 color: Colors.white),
//                             child: const Icon(
//                               Icons.logout_outlined,
//                               color: AppColors.primaryColor,
//                             ),
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//           ),
//           backgroundColor: AppColors.backgroundColor,
//           body: Padding(
//             padding: EdgeInsets.symmetric(
//                 vertical: ResponsiveBreakpoints.of(context).smallerThan(DESKTOP)
//                     ? sizeWidth * 0.05
//                     : sizeHeight * 0.05,
//                 horizontal:
//                     ResponsiveBreakpoints.of(context).smallerThan(DESKTOP)
//                         ? sizeWidth * 0.05
//                         : sizeHeight * 0.05),
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.start,
//               children: [
//                 SizedBox(
//                   height: 50,
//                   width: double.infinity,
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       Text(" Hello, ${model.user?.name}",
//                           style: TextStyle(
//                               fontWeight: FontWeight.w600,
//                               fontSize: ResponsiveBreakpoints.of(context)
//                                       .smallerThan(DESKTOP)
//                                   ? 25
//                                   : 35)),
//                       InkWell(
//                         onTap: () {
//                           showDialog(
//                               context: context,
//                               builder: (BuildContext context) {
//                                 return AddLeadDialog(model);
//                               }).then((value) {
//                             model.loadLead();
//                           });
//                         },
//                         child: Container(
//                           height: ResponsiveBreakpoints.of(context)
//                                   .smallerThan(DESKTOP)
//                               ? sizeHeight * 0.19
//                               : sizeWidth * 0.140,
//                           width: ResponsiveBreakpoints.of(context)
//                                   .smallerThan(DESKTOP)
//                               ? sizeHeight * 0.19
//                               : sizeWidth * 0.115,
//                           alignment: Alignment.center,
//                           decoration: BoxDecoration(
//                               borderRadius: BorderRadius.circular(30),
//                               color: Colors.white),
//                           child: Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                             children: [
//                               Container(
//                                   height: sizeHeight *
//                                       0.035,
//                                   width: sizeHeight *
//                                       0.035,
//                                   decoration: BoxDecoration(
//                                       color: AppColors.secondaryColor,
//                                       borderRadius: BorderRadius.circular(
//                                           MediaQuery.of(context).size.height *
//                                               0.035)),
//                                   child: const Icon(
//                                     Icons.add,
//                                     color: Colors.white,
//                                   )),
//                               Text(
//                                 "Apply for Loan",
//                                 style: TextStyle(
//                                     color: AppColors.primaryColor,
//                                     fontWeight: FontWeight.w500,
//                                     fontSize: ResponsiveBreakpoints.of(context)
//                                             .smallerThan(DESKTOP)
//                                         ? 13
//                                         : 16),
//                               ),
//                             ],
//                           ),
//                         ),
//                       )
//                     ],
//                   ),
//                 ),
//                 const SizedBox(
//                   height: 20,
//                 ),
//                 Expanded(
//                   child: ListView.separated(
//                     physics: const ScrollPhysics(),
//                     scrollDirection:
//                         ResponsiveBreakpoints.of(context).smallerThan(DESKTOP)
//                             ? Axis.vertical
//                             : Axis.horizontal,
//                     itemBuilder: (BuildContext context, int index) {
//                       return Container(
//                         height: cardHeight,
//                         width: cardHeight * 0.70,
//                         decoration: BoxDecoration(
//                             color: Colors.white,
//                             borderRadius: BorderRadius.circular(20)),
//                         padding: const EdgeInsets.all(30),
//                         child: Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                           children: [
//                             Row(
//                               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                               crossAxisAlignment: CrossAxisAlignment.center,
//                               children: [
//                                 Flexible(
//                                   flex: 3,
//                                   child: Text(
//                                     '${model.leads[index].name}',
//                                     maxLines: 2,
//                                     style: const TextStyle(
//                                         fontWeight: FontWeight.w700,
//                                         fontSize: 26,
//                                         color: AppColors.primaryColor),
//                                   ),
//                                 ),
//                                 const SizedBox(
//                                   width: 5,
//                                 ),
//                                 Flexible(
//                                   flex: 2,
//                                   child: Container(
//                                     alignment: Alignment.center,
//                                     height: 20,
//                                     width: 76,
//                                     decoration: BoxDecoration(
//                                         borderRadius:
//                                             BorderRadius.circular(30)),
//                                     child: Text(
//                                       "${model.leads[index].stage}",
//                                     ),
//                                   ),
//                                 ),
//                               ],
//                             ),
//                             Row(
//                               children: [
//                                 Text(
//                                   "${model.leads[index].mobile}",
//                                   style: const TextStyle(
//                                       fontSize: 28,
//                                       fontWeight: FontWeight.w700,
//                                       color: AppColors.primaryColor),
//                                 ),
//                                 const SizedBox(
//                                   width: 10,
//                                 ),
//                                 Container(
//                                     decoration: BoxDecoration(
//                                       color: Colors.blue.shade100,
//                                       borderRadius: BorderRadius.circular(30),
//                                     ),
//                                     height: 23,
//                                     width: 23,
//                                     alignment: Alignment.center,
//                                     child: const Icon(
//                                       FontAwesomeIcons.phone,
//                                       color: AppColors.primaryColor,
//                                       size: 10,
//                                     )),
//                               ],
//                             ),
//                             Text(
//                               '${model.leads[index].amount}',
//                               style: const TextStyle(
//                                   fontSize: 28,
//                                   fontWeight: FontWeight.w800,
//                                   color: AppColors.primaryColor),
//                             ),
//                             LeadTextWidget(
//                               title: model.leads[index].applicationId,
//                               description: '${model.leads[index].loanType}',
//                               secondDescription:
//                                   '(${model.leads[index].employmentType})',
//                               padding: EdgeInsets.zero,
//                             ),
//                             Row(
//                               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                               children: [
//                                 LeadTextWidget(
//                                     title: 'Completed Up',
//                                     description:
//                                         '${model.leads[index].stepsCompleted}',
//                                     padding: const EdgeInsets.only()),
//                                 LeadTextWidget(
//                                   title: 'Lead Created',
//                                   description:
//                                       '${model.leads[index].createdAt}',
//                                   padding: const EdgeInsets.only(),
//                                 ),
//                               ],
//                             ),
//                             LeadTextWidget(
//                               title: 'Ask Status',
//                               description:
//                                   'Pending Ask (${model.leads[index].askCount})',
//                               padding: EdgeInsets.zero,
//                               descriptionColor: const Color(0xFFFF9201),
//                             ),
//                             InkWell(
//                               onTap: () async{
//                                 Uri url = Uri.parse("${model.leads[index].url}");
//                                 await launchUrl(url);
//                               },
//                               child: Container(
//                                 decoration: BoxDecoration(
//                                     color: AppColors.secondaryColor,
//                                     borderRadius: BorderRadius.circular(50)),
//                                 height: 58,
//                                 child: Center(
//                                   child: Text(
//                                     '${model.leads[index].buttonText}',
//                                     style: const TextStyle(
//                                         fontSize: 17,
//                                         fontWeight: FontWeight.w700,
//                                         color: Colors.white),
//                                   ),
//                                 ),
//                               ),
//                             ),
//                           ],
//                         ),
//                       );
//                     },
//                     separatorBuilder: (BuildContext context, int index) {
//                       return SizedBox(
//                         height: ResponsiveBreakpoints.of(context)
//                                 .smallerThan(DESKTOP)
//                             ? 20
//                             : 0,
//                         width: ResponsiveBreakpoints.of(context)
//                                 .smallerThan(DESKTOP)
//                             ? 0
//                             : 20,
//                       );
//                     },
//                     itemCount: model.leads.length,
//                   ),
//                 )
//               ],
//             ),
//           ),
//         );
//       }),
//     );
//   }
// }
