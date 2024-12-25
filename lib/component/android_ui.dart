import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:portfolio/widget/mobile_taskbar.dart';
import 'package:url_launcher/url_launcher.dart';
import '../values/constant.dart';
import '../values/route_path.dart';

class AndroidUi extends StatefulWidget {
  const AndroidUi({super.key});

  @override
  State<AndroidUi> createState() => _AndroidUiState();
}

class _AndroidUiState extends State<AndroidUi> {
  @override
  Widget build(BuildContext context) {
    String formattedTime = DateFormat.jm().format(DateTime.now());
    String timePart = formattedTime.substring(0, formattedTime.length - 2);
    String periodPart = formattedTime.substring(formattedTime.length - 2);
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: double.infinity,
            width: double.infinity,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/android_wallpaper.jpg"),
                fit: BoxFit.cover,
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.only(left: 20, right: 20, top: 50),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(20)
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(timePart, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w600, fontSize: 32)),
                                Text(periodPart.toLowerCase(), style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w300, fontSize: 14)),
                              ],
                            ),
                            const SizedBox(height: 10),
                            Text(DateFormat('EEE, MMM d').format(DateTime.now()), style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w300, fontSize: 18)),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Image.asset('assets/icons/android_weather.png', height: 50, width: 50),
                            const SizedBox(width: 10),
                            const Text("91\u00B0", style: TextStyle(color: Colors.white, fontSize: 28, fontWeight: FontWeight.w500))
                          ],
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 20,
            left: 0,
            right: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                MobileTaskbar(icon: 'android_dialer.webp', onTap: () => launchUrl(Uri(scheme: 'tel', path: constant.mobileNumber))),
                MobileTaskbar(icon: 'ios_message.png', onTap: () => launchUrl(Uri(scheme: "sms", path: constant.mobileNumber))),
                MobileTaskbar(icon: 'apple.png', onTap: () => context.go(RoutePath.ios.toPath)),
                MobileTaskbar(icon: 'linkedin.png', onTap: () => launchUrl(Uri.parse(constant.linkedinUrl))),
                MobileTaskbar(icon: 'profile.png', onTap: () => launchUrl(Uri.parse(constant.resumeUrl))),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
