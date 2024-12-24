// import 'package:portfolio/controller/connectivity_controller.dart';
// import 'package:portfolio/values/route_path.dart';
// import 'package:flutter/material.dart';
// import 'package:go_router/go_router.dart';
// import '../../model/user.dart';
// import '../../response_handler/login_response.dart';
//
// class LoginController extends ConnectivityController{
//   BuildContext? context;
//   bool obscureText = true;
//   User? user;
//
//   LoginController(super.buildContext);
//
//   User? getUser() => user;
//
//   Future setUser({User? user_}) async {
//     user = user_ ?? await User.get();
//     notifyListeners();
//   }
//
//   void changeObscure() {
//     obscureText = !obscureText;
//     notifyListeners();
//   }
//
//   Future<void> login(String username, String password) async {
//     Map<String, dynamic> request = {
//       'username': username,
//       'password': password,
//     };
//     notifyListeners();
//
//     LoginResponse response = await apiProvider.login(request);
//     if (response.status == true) {
//         await response.user?.save().then((value) async {
//           await setUser(user_: response.user).then((value) => context?.go(RoutePath.home.toPath));
//         });
//     } else {
//       notifyListeners();
//       LoginResponse response =
//       await apiProvider.login(request);
//       ScaffoldMessenger.of(context!).showSnackBar(
//         SnackBar(
//           content: Text("${response.message}"),
//           backgroundColor: Colors.red,
//         ),
//       );
//     }
//   }
// }