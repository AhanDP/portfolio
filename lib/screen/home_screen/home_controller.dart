// import 'package:device_info_plus/device_info_plus.dart';
// import 'package:flutter/foundation.dart';
// import 'package:flutter/services.dart';
// import '../../controller/connectivity_controller.dart';
// import '../../model/add_lead.dart';
// import '../../model/lead.dart';
// import '../../model/user.dart';
// import '../../response_handler/lead_response.dart';
// import '../../response_handler/loan_type_response.dart';
// import 'dart:io' show Platform;
// import 'dart:io';
//
// class HomeController extends ConnectivityController {
//   User? user;
//   List<Loan>? loans;
//   List<Lead> leads = [];
//   int offset = 0;
//   int limit = 20;
//   // String platform = Platform.operatingSystem;
//
//   HomeController(super.buildContext) {
//     loadUser();
//     // getDeviceId();
//     loadLoans();
//     loadLead();
//   }
//
//   Future loadUser() async {
//     await User.get().then((value) {
//       user = value;
//       notifyListeners();
//     });
//   }
//
//   Future loadLoans() async {
//     LoanTypeResponse response = await apiProvider.loanTypeList({});
//     if (response.status == true) {
//       loans = response.loans!;
//     }
//     notifyListeners();
//   }
//
//   Future loadLead() async {
//     Map<String, dynamic> request = {'limit': limit, 'offset': offset};
//     LeadResponse response = await apiProvider.fetchLeads(request);
//
//     if (response.status == true) {
//       leads = response.leads!;
//       notifyListeners();
//     }
//   }
//
//
//   Future<String?> getDeviceId() async {
//     String? deviceId;
//     final DeviceInfoPlugin deviceInfoPlugin = DeviceInfoPlugin();
//     try {
//       if (Platform.isAndroid) {
//         final AndroidDeviceInfo androidInfo = await deviceInfoPlugin.androidInfo;
//         deviceId = androidInfo.id;
//         if (kDebugMode) {
//           print("DEVICE ID is $deviceId");
//         }
//       } else if (Platform.isIOS) {
//         final IosDeviceInfo iosInfo = await deviceInfoPlugin.iosInfo;
//         deviceId = iosInfo.identifierForVendor;
//         if (kDebugMode) {
//           print("DEVICE ID is $deviceId");
//         }
//       }
//     } on PlatformException {
//       if (kDebugMode) {
//         print('Failed to get device ID.');
//       }
//     }
//     return deviceId;
//   }
// }
