import 'package:flutter/material.dart';

class DesktopTaskbar extends StatelessWidget {
  final String icon;
  final String toolTip;
  final void Function() onTap;
  final double? size;

  const DesktopTaskbar(
      {super.key,
      required this.icon,
      required this.toolTip,
      required this.onTap, this.size});

  @override
  Widget build(BuildContext context) {
    ValueNotifier<bool> isHovered = ValueNotifier(false);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Tooltip(
        message: toolTip,
        child: Semantics(
          label: toolTip,
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
                    child: Image.asset(
                      "assets/icons/$icon",
                      height: size ?? 50,
                      width: size ?? 50,
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
