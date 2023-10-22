import 'package:flutter/material.dart';

class ToggleButtonLeftMenu extends StatefulWidget {
  final bool isMainMenuOpen;
  final VoidCallback toggleMainMenu;

  ToggleButtonLeftMenu({
    required this.isMainMenuOpen,
    required this.toggleMainMenu,
  });

  @override
  _ToggleButtonLeftMenuState createState() => _ToggleButtonLeftMenuState();
}

class _ToggleButtonLeftMenuState extends State<ToggleButtonLeftMenu> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 32,
      height: 32,
      decoration: BoxDecoration(
        border: Border.all(
          color: const Color(0xFFBEE7E7),
          width: 1.0,
        ),
        borderRadius: BorderRadius.circular(50.0),
        color: Colors.white,
      ),
      child: Center(
        child: IconButton(
          padding: EdgeInsets.zero,
          iconSize: 24.0,
          icon: Icon(
            widget.isMainMenuOpen
                ? Icons.keyboard_arrow_left_sharp
                : Icons.keyboard_arrow_right_sharp,
            color: const Color(0xFF145A5A),
          ),
          onPressed: widget.toggleMainMenu,
        ),
      ),
    );
  }
}
