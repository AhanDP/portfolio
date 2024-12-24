// import 'package:animated_text_kit/animated_text_kit.dart';
// import 'package:portfolio/screen/login/login_controller.dart';
// import 'package:portfolio/values/app_colors.dart';
// import 'package:portfolio/values/route_path.dart';
// import 'package:portfolio/widget/textfield_widget.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:go_router/go_router.dart';
// import 'package:provider/provider.dart';
// import 'package:responsive_framework/responsive_framework.dart';
//
// class LoginScreen extends StatefulWidget {
//   const LoginScreen({super.key});
//
//   @override
//   State<LoginScreen> createState() => _LoginScreenState();
// }
//
// class _LoginScreenState extends State<LoginScreen> {
//   TextEditingController username = TextEditingController();
//   TextEditingController password = TextEditingController();
//   final _formKey = GlobalKey<FormState>();
//   @override
//   Widget build(BuildContext context) {
//     return ChangeNotifierProvider(
//       create: (context) => LoginController(context),
//       child: Consumer<LoginController>(builder: (context, model, child) {
//         return Scaffold(
//           backgroundColor: AppColors.backgroundColor,
//           body: Stack(
//             children: [
//               Container(
//                 height: double.maxFinite,
//                 width: double.maxFinite,
//                 decoration: BoxDecoration(
//                   image: const DecorationImage(
//                       image: AssetImage("assets/images/login_background.jpeg"),
//                       opacity: 0.1,
//                       fit: BoxFit.cover),
//                   color: AppColors.secondaryColor.withOpacity(0.8),
//                   borderRadius: BorderRadius.circular(4),
//                   // border: Border.all(color: AppColors.border)
//                 ),
//               ),
//               ResponsiveRowColumn(
//                 layout: ResponsiveBreakpoints.of(context).smallerThan(DESKTOP)
//                     ? ResponsiveRowColumnType.COLUMN
//                     : ResponsiveRowColumnType.ROW,
//                 rowCrossAxisAlignment: CrossAxisAlignment.center,
//                 rowMainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   ResponsiveRowColumnItem(
//                       child: Flexible(
//                     flex: 3,
//                     child: SizedBox(
//                       height: double.maxFinite,
//                       width: MediaQuery.of(context).size.width,
//                       child: Padding(
//                         padding: EdgeInsets.only(
//                             left: MediaQuery.of(context).size.width * 0.02,
//                             right: MediaQuery.of(context).size.width * 0.02,
//                             top: MediaQuery.of(context).size.width * 0.02),
//                         child: Column(
//                           mainAxisAlignment: MainAxisAlignment.start,
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             Container(
//                               alignment:
//                                   ResponsiveBreakpoints.of(context).isDesktop
//                                       ? Alignment.bottomLeft
//                                       : Alignment.center,
//                               height: ResponsiveBreakpoints.of(context)
//                                       .isDesktop
//                                   ? MediaQuery.of(context).size.height / 2
//                                   : MediaQuery.of(context).size.height * 0.35,
//                               child: Image.asset(
//                                   "assets/images/canfin_logo.png"),
//                             ),
//                             SizedBox(
//                               height:
//                                   ResponsiveBreakpoints.of(context).isDesktop
//                                       ? MediaQuery.of(context).size.height * 0.1
//                                       : MediaQuery.of(context).size.height * 0,
//                             ),
//                             Padding(
//                               padding: EdgeInsets.only(
//                                   left: ResponsiveBreakpoints.of(context)
//                                       .isDesktop
//                                       ?30.0:10,
//                                   right: ResponsiveBreakpoints.of(context)
//                                           .isDesktop
//                                       ? 100
//                                       : 10),
//                               child: SizedBox(
//                                 height: ResponsiveBreakpoints.of(context)
//                                         .isDesktop
//                                     ? MediaQuery.of(context).size.height * 0.17
//                                     : MediaQuery.of(context).size.height * 0.1,
//                                 child: DefaultTextStyle(
//                                   style: TextStyle(
//                                       fontWeight:
//                                           ResponsiveBreakpoints.of(context)
//                                                   .isDesktop
//                                               ? FontWeight.w600
//                                               : FontWeight.w700,
//                                       fontSize:
//                                           ResponsiveBreakpoints.of(context)
//                                                   .isDesktop
//                                               ? 40.0
//                                               : 20,
//                                       fontFamily: 'PlusJakartaSans',
//                                       color: Colors.white),
//                                   child: AnimatedTextKit(
//                                     animatedTexts: [
//                                       TyperAnimatedText(
//                                           'Applying for Home loan and tracking its status is now on your fingertips'),
//                                       TyperAnimatedText(
//                                           'Sign in to Unlock the door to your dream home.'),
//                                     ],
//                                     isRepeatingAnimation: false,
//                                   ),
//                                 ),
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                     ),
//                   ),),
//                   ResponsiveRowColumnItem(
//                       child: Flexible(
//                     flex: ResponsiveBreakpoints.of(context).isDesktop ? 2 : 3,
//                     child: Padding(
//                       padding: EdgeInsets.only(
//                           right: ResponsiveBreakpoints.of(context).smallerThan(DESKTOP)
//                               ? MediaQuery.of(context).size.width * 0.03
//                               : MediaQuery.of(context).size.height * 0.08,
//                           left: ResponsiveBreakpoints.of(context).smallerThan(DESKTOP)
//                               ? MediaQuery.of(context).size.width * 0.03
//                               : MediaQuery.of(context).size.height * 0.03,
//                           bottom: ResponsiveBreakpoints.of(context).isDesktop
//                               ? 0
//                               : MediaQuery.of(context).size.height * 0.02),
//                       child: Container(
//                         padding: EdgeInsets.all(
//                             ResponsiveBreakpoints.of(context).smallerThan(DESKTOP)
//                                 ? 20
//                                 : 70),
//                         alignment: Alignment.center,
//                         decoration: BoxDecoration(
//                             borderRadius: BorderRadius.circular(20),
//                             color: Colors.white),
//                         height: MediaQuery.of(context).size.height * 0.7,
//                         width: MediaQuery.of(context).size.width,
//                         child: Padding(
//                           padding: EdgeInsets.only(
//                               top: ResponsiveBreakpoints.of(context).smallerThan(DESKTOP)
//                                   ? 10
//                                   : 0,
//                           bottom: ResponsiveBreakpoints.of(context).smallerThan(DESKTOP)?10:0),
//                           child: Form(
//                             key: _formKey,
//                             child: Column(
//                               mainAxisAlignment: MainAxisAlignment.start,
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: [
//                                 Padding(
//                                   padding: EdgeInsets.only(
//                                       top: ResponsiveBreakpoints.of(context)
//                                               .isDesktop
//                                           ? MediaQuery.of(context).size.height * 0.03
//                                           : 0),
//                                   child: Text(
//                                     "Sign in",
//                                     style: TextStyle(
//                                         color: AppColors.primaryColor,
//                                         fontWeight: FontWeight.w600,
//                                         fontSize:
//                                         ResponsiveBreakpoints.of(context)
//                                             .isDesktop?ScreenUtil().setSp(7):ScreenUtil().setSp(20)),
//                                   ),
//                                 ),
//                                 Padding(
//                                   padding: const EdgeInsets.only(top: 10.0),
//                                   child: Row(
//                                     children: [
//                                       Text("New here? ",
//                                           style: TextStyle(
//                                               fontSize: ResponsiveBreakpoints.of(context)
//                                                   .isDesktop?ScreenUtil().setSp(5):ScreenUtil().setSp(15))),
//                                       InkWell(
//                                           onTap: () => context.go(RoutePath.register.toPath),
//                                           child: Text(
//                                             "Register",
//                                             style: TextStyle(
//                                                 color: Colors.blue,
//                                                 fontSize: ResponsiveBreakpoints.of(context)
//                                                     .isDesktop?ScreenUtil().setSp(5):ScreenUtil().setSp(15)),
//                                           ))
//                                     ],
//                                   ),
//                                 ),
//                                 Padding(
//                                   padding: EdgeInsets.only(
//                                       top: ResponsiveBreakpoints.of(context)
//                                               .smallerThan(DESKTOP)
//                                           ? 25
//                                           : 50),
//                                   child: const Text("Mobile Number"),
//                                 ),
//                                 TextFieldWidget(hint: "Mobile Number", controller: username),
//                                 const Text("Password"),
//                                 TextFieldWidget(hint: 'Password', controller: password,),
//                                 Padding(
//                                   padding: const EdgeInsets.only(top: 8.0),
//                                   child: InkWell(
//                                     onTap: () {
//                                       if (_formKey.currentState!.validate()) {
//                                         _formKey.currentState?.save();
//                                         model.login(username.text, password.text);
//                                        context.go(RoutePath.home.toPath);
//                                       }
//                                     },
//                                     child: Container(
//                                       height: ResponsiveBreakpoints.of(context).smallerThan(DESKTOP)
//                                           ? MediaQuery.of(context).size.height * 0.055
//                                           : MediaQuery.of(context).size.height * 0.055,
//                                       width: ResponsiveBreakpoints.of(context)
//                                           .smallerThan(DESKTOP)
//                                           ? MediaQuery.of(context).size.width * 0.8
//                                           : MediaQuery.of(context).size.width * 0.4,
//                                       alignment: Alignment.center,
//                                       decoration: BoxDecoration(
//                                           color: AppColors.secondaryColor,
//                                           borderRadius:
//                                               BorderRadius.circular(20)),
//                                       child: const Text(
//                                         "Sign in",
//                                         style: TextStyle(
//                                             color: Colors.white, fontSize: 17),
//                                       ),
//                                     ),
//                                   ),
//                                 )
//                               ],
//                             ),
//                           ),
//                         ),
//                       ),
//                     ),
//                   ))
//                 ],
//               )
//             ],
//           ),
//         );
//       }),
//     );
//   }
// }
