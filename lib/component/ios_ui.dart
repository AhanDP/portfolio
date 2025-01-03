import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';
import '../values/constant.dart';
import '../values/route_path.dart';
import '../widget/mobile_taskbar.dart';

class IosUi extends StatefulWidget {
  const IosUi({super.key});

  @override
  State<IosUi> createState() => _IosUiState();
}

class _IosUiState extends State<IosUi> {
  @override
  Widget build(BuildContext context) {
    String formattedTime = DateFormat.jm().format(DateTime.now());
    String timePart = formattedTime.substring(0, formattedTime.length - 2);
    String periodPart = formattedTime.substring(formattedTime.length - 2);
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/mac_wallpaper.png"),
                fit: BoxFit.cover,
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.only(left: 20, right: 20, top: 50),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 25),
                        decoration: BoxDecoration(
                            color: Colors.black.withOpacity(0.7),
                            borderRadius: BorderRadius.circular(20)
                        ),
                        child: Column(
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
                        )
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
                        decoration: BoxDecoration(
                            color: Colors.blue.withOpacity(0.5),
                            borderRadius: BorderRadius.circular(20)
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text("91\u00B0", style: TextStyle(color: Colors.white, fontSize: 28, fontWeight: FontWeight.w500)),
                            const SizedBox(height: 20),
                            Image.asset('assets/icons/android_weather.png', height: 20, width: 20),
                            const SizedBox(height: 5),
                            const Text("Partly Cloudy", style: TextStyle(color: Colors.white, fontSize: 12, fontWeight: FontWeight.w500)),
                          ],
                        )
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 20,
            left: 0,
            right: 0,
            child: Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Container(
                  height: 80,
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.5),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      MobileTaskbar(icon: 'ios_dialer.png', onTap: () => launchUrl(Uri(scheme: 'tel', path: constant.mobileNumber))),
                      MobileTaskbar(icon: 'ios_message.png', onTap: () => launchUrl(Uri(scheme: "sms", path: constant.mobileNumber))),
                      MobileTaskbar(icon: 'android.png', onTap: () => context.go(RoutePath.android.toPath)),
                      MobileTaskbar(icon: 'linkedin.png', onTap: () => launchUrl(Uri.parse(constant.linkedinUrl))),
                      MobileTaskbar(icon: 'profile.png', onTap: () => launchUrl(Uri.parse(constant.resumeUrl))),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
