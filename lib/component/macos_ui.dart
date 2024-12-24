import 'package:flutter/material.dart';

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
          // Wallpaper
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/mac_wallpaper.png"),
                fit: BoxFit.cover,
              ),
            ),
          ),
          // Menu Bar
          /*Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: _buildMenuBar(),
          ),*/
          // Desktop Icons
          _buildDesktopIcons(),
          // Dock
          Positioned(
            bottom: 20,
            left: 0,
            right: 0,
            child: _buildDock(),
          ),
        ],
      ),
    );
  }

  // Widget _buildMenuBar() {
  //   return Container(
  //     height: 50,
  //     color: Colors.black.withOpacity(0.5),
  //     child: Row(
  //       children: [
  //         const SizedBox(width: 10),
  //         const Text(
  //           "",
  //           style: TextStyle(color: Colors.white, fontSize: 24),
  //         ),
  //         const SizedBox(width: 10),
  //         const Text(
  //           "File",
  //           style: TextStyle(color: Colors.white),
  //         ),
  //         const SizedBox(width: 10),
  //         const Text(
  //           "Edit",
  //           style: TextStyle(color: Colors.white),
  //         ),
  //         const Spacer(),
  //         const Text(
  //           "Wi-Fi",
  //           style: TextStyle(color: Colors.white),
  //         ),
  //         const SizedBox(width: 10),
  //         const Icon(Icons.battery_charging_full, color: Colors.white),
  //         const SizedBox(width: 10),
  //         Text(
  //           TimeOfDay.now().format(context),
  //           style: const TextStyle(color: Colors.white),
  //         ),
  //         const SizedBox(width: 10),
  //       ],
  //     ),
  //   );
  // }

  Widget _buildDesktopIcons() {
    return Positioned.fill(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Align(
          alignment: Alignment.topLeft,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildDesktopIcon("Finder", "assets/icons/finder.png"),
              const SizedBox(height: 10),
              _buildDesktopIcon("Trash", "assets/icons/trash.png"),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDesktopIcon(String label, String iconPath) {
    return Column(
      children: [
        Image.asset(iconPath, height: 50),
        const SizedBox(height: 5),
        Text(label, style: const TextStyle(color: Colors.white)),
      ],
    );
  }

  Widget _buildDock() {
    List<String> dockIcons = [
      "finder.png",
      "launchpad.png",
      "safari.png",
      "settings.png",
    ];

    return Center(
      child: Container(
        height: 80,
        padding: const EdgeInsets.symmetric(horizontal: 20),
        decoration: BoxDecoration(
          color: Colors.black.withOpacity(0.5),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: dockIcons.map((icon) => _buildDockIcon(icon)).toList(),
        ),
      ),
    );
  }

  Widget _buildDockIcon(String iconPath) {
    ValueNotifier<bool> isHovered = ValueNotifier(false);

    return MouseRegion(
      onEnter: (_) => isHovered.value = true,
      onExit: (_) => isHovered.value = false,
      child: ValueListenableBuilder<bool>(
        valueListenable: isHovered,
        builder: (context, hovered, child) {
          return AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            transform: Matrix4.identity()..scale(hovered ? 1.5 : 1.0),
            margin: const EdgeInsets.symmetric(horizontal: 10),
            child: Image.asset(
              "assets/icons/$iconPath",
              height: 50,
              width: 50,
            ),
          );
        },
      ),
    );
  }
}