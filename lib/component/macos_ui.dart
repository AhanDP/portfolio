import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:portfolio/values/constant.dart';
import 'package:portfolio/values/route_path.dart';
import 'package:portfolio/widget/desktop_taskbar.dart';
import 'package:url_launcher/url_launcher.dart';

class MacosUi extends StatefulWidget {
  const MacosUi({super.key});

  @override
  State<MacosUi> createState() => _MacosUiState();
}

class _MacosUiState extends State<MacosUi> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/ios_wallpaper.png"),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Positioned(
            bottom: 20,
            left: 0,
            right: 0,
            child: Center(
              child: Container(
                height: 80,
                padding: const EdgeInsets.symmetric(horizontal: 20),
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.5),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    DesktopTaskbar(icon: 'windows.png', toolTip: 'Change OS', onTap: () => context.go(RoutePath.windows.toPath)),
                    DesktopTaskbar(icon: 'finder.png', toolTip: 'Finder', onTap: () {}),
                    DesktopTaskbar(icon: 'app_store.png', toolTip: 'App Store', onTap: () {}),
                    DesktopTaskbar(icon: 'linkedin.png', toolTip: 'Linkedin', onTap: () => launchUrl(Uri.parse(constant.linkedinUrl))),
                    DesktopTaskbar(icon: 'profile.png', toolTip: 'About Me', onTap: () => launchUrl(Uri.parse(constant.resumeUrl))),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}