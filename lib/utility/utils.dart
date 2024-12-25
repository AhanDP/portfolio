import 'dart:core';
import 'dart:developer';
import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:path_provider/path_provider.dart';

class Utils {
  static double getAspectRatio(BuildContext context, {double? matchValue}) {
    if (matchValue != null) {
      return MediaQuery.of(context).size.width /
          (MediaQuery.of(context).size.height -
              (MediaQuery.of(context).padding.top + matchValue));
    } else {
      return MediaQuery.of(context).size.width /
          (MediaQuery.of(context).size.height -
              (MediaQuery.of(context).padding.top));
    }
  }

  static void logError(String code, String message) =>
      log('Error: $code\nError Message: $message');

  static String timestamp() => DateTime.now().millisecondsSinceEpoch.toString();

  static bool excludePath(String path) {
    // ApiEndpoint apiEndpoint = ApiEndpoint();
    List<String?> pathList = [];

    return !pathList.contains(path);
  }

  static List<String> splitMethod(String uri) {
    List<String> idPwd = [];
    var parts = uri.split("/");
    for (int i = 0; i < parts.length; i++) {
      if (parts[i].contains("?")) {
        var newParts = parts[i].split("?");
        var meetingId = newParts[0];
        var pwd = newParts[1].replaceAll("pwd=", "");
        idPwd.add(meetingId);
        idPwd.add(pwd);
      }
    }
    return idPwd;
  }

  static Future<void> deleteCacheDir() async {
    Directory tempDir = await getTemporaryDirectory();
    if (tempDir.existsSync()) {
      tempDir.deleteSync(recursive: true);
    }
  }

  static Future<void> deleteAppDir() async {
    Directory appDocDir = await getApplicationDocumentsDirectory();
    if (appDocDir.existsSync()) {
      appDocDir.deleteSync(recursive: true);
    }
  }

  static String convertToAgo(DateTime input) {
    Duration diff = DateTime.now().difference(input);

    if (diff.inDays >= 1) {
      return '${diff.inDays}d';
    } else if (diff.inHours >= 1) {
      return '${diff.inHours}h';
    } else if (diff.inMinutes >= 1) {
      return '${diff.inMinutes}m';
    } else if (diff.inSeconds >= 1) {
      return '${diff.inSeconds}s';
    } else {
      return 'Just now';
    }
  }

  static Future<File> writeToFile(Uint8List list, String fileName) async {
    final tempDir = await getTemporaryDirectory();
    final file = await File('${tempDir.path}/$fileName').create();
    file.writeAsBytesSync(list);
    return file;
  }


  final indianRupeesFormat = NumberFormat.currency(
    name: "INR",
    locale: 'en_IN',
    decimalDigits: 0, // change it to get decimal places
    symbol: '₹ ',
  );
}
