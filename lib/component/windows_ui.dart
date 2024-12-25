import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:portfolio/widget/desktop_taskbar.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../values/route_path.dart';

class WindowsUi extends StatefulWidget {
  const WindowsUi({super.key});

  @override
  State<WindowsUi> createState() => _WindowsUiState();
}

class _WindowsUiState extends State<WindowsUi> {
  @override
  Widget build(BuildContext context) {
    TextEditingController searchController = TextEditingController();
    return Scaffold(
      backgroundColor: const Color(0xFFF3F3F3),
      body: Stack(
        children: [
          // Main Content
          Container(
            height: double.infinity,
            width: double.infinity,
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/images/windows_home.jpg"),
                    fit: BoxFit.fill)),
          ),
          // Taskbar
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              color: Colors.transparent.withOpacity(0.7),
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  DesktopTaskbar(icon: "apple.png", toolTip: "Change OS", onTap: () => context.go(RoutePath.mac.toPath), size: 40),
                  SizedBox(
                    width: ResponsiveBreakpoints.of(context).isDesktop
                        ? MediaQuery.of(context).size.width * 0.15
                        : MediaQuery.of(context).size.width * 0.4,
                    child: TextFormField(
                      controller: searchController,
                      onChanged: (value) async {
                        // await fetchTrips(value);
                      },
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.only(left: 20),
                        filled: true,
                        fillColor: Colors.transparent.withOpacity(0.3),
                        hintText: 'Search...',
                        hintStyle: const TextStyle(fontWeight: FontWeight.w400, color: Colors.white),
                        prefixIcon: IconButton(
                            icon: searchController.text != '' ? const Icon(Icons.close, color: Colors.white, size: 30) : const Icon(Icons.search, color: Colors.white, size: 30),
                            onPressed: () async{
                              // if(controller.searchController.text != ''){
                              //   controller.searchController.clear();
                              //   await controller.fetchTrips(null);
                              // }
                            }),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide: const BorderSide(color: Colors.transparent)
                        ),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide: const BorderSide(color: Colors.transparent)
                        ),
                      ),
                    ),
                  ),
                  DesktopTaskbar(icon: "windows_store.png", toolTip: "Apps", onTap: () {}, size: 40),
                  DesktopTaskbar(icon: "linkedin.png", toolTip: "Linkedin", onTap: () => launchUrl(Uri.parse("https://www.linkedin.com/in/ahan-dp-ba19a8240")), size: 40),
                  DesktopTaskbar(icon: "profile.png", toolTip: "About Me", onTap: () {}, size: 40),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
