// lib/views/windows_ui.dart
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../values/route_path.dart';

class WindowsUI extends StatefulWidget {
  const WindowsUI({super.key});

  @override
  State<WindowsUI> createState() => _WindowsUIState();
}

class _WindowsUIState extends State<WindowsUI> {
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
                  _buildTaskbarIcons("apple.png", "Start", () => context.go(RoutePath.mac.toPath)),
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
                  _buildTaskbarIcons("windows_store.png", "Apps", () {}),
                  _buildTaskbarIcons("linkedin.png", "Linkedin", () => launchUrl(Uri.parse("https://www.linkedin.com/in/ahan-dp-ba19a8240"))),
                  _buildTaskbarIcons("profile.png", "About Me", () {}),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTaskbarIcons(String icon, String tooltip, void Function() onTap) {
    ValueNotifier<bool> isHovered = ValueNotifier(false);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Tooltip(
        message: tooltip,
        child: Semantics(
          label: tooltip,
          child: MouseRegion(
            onEnter: (_) => isHovered.value = true,
            onExit: (_) => isHovered.value = false,
            child: ValueListenableBuilder<bool>(
              valueListenable: isHovered,
              builder: (context, hovered, child) {
                return AnimatedContainer(
                  duration: const Duration(milliseconds: 50),
                  curve: Curves.easeOut,
                  transform: Matrix4.identity()
                    ..scale(hovered ? 1.2 : 1.0)
                    ..translate(hovered ? -5.0 : 0.0, hovered ? -10.0 : 0.0),
                  child: InkWell(
                    onTap: onTap,
                    child: Container(
                      height: 35,
                      width: 35,
                      decoration:
                      BoxDecoration(
                        color: Colors.transparent,
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: hovered
                            ? [BoxShadow(color: Colors.blueAccent.withOpacity(0.3), blurRadius: 10)]
                            : [],
                      ),
                      child: Image.asset(
                        "assets/icons/$icon",
                        height: 32,
                        width: 32
                      )
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
