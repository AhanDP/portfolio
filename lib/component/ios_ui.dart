import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
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
