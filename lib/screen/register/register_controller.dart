import 'package:portfolio/controller/connectivity_controller.dart';
import 'package:portfolio/response_handler/register_response.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../../values/app_colors.dart';

class RegisterController extends ConnectivityController{
  RegisterController(super.buildContext);

  Future register(String name, String mobile, String email, String password) async {
    Map<String, dynamic> request = {'username': name,'password': password,'mobile_no': mobile,'email_id': email};
    RegisterResponse response =
    await apiProvider.register(request);
    Fluttertoast.showToast(
        msg: response.status == false?"Invalid Format":"User created successfully",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: AppColors.secondaryColor,
        textColor: Colors.white,
        fontSize: 16.0);

    if (response.status == true) {
      notifyListeners();
    }
  }
}