import 'package:flutter/material.dart';
import 'LeftMenuHeader/LeftMenuHeader.widget.dart';
import 'LeftMenuBody/LeftMenuBody.widget.dart';

class LeftMenu extends StatelessWidget {
  const LeftMenu({super.key, required this.isMainMenuOpen});

  final bool isMainMenuOpen;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFFE0F6F6),
      child: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.only(top: 35, left: 25, right: 25),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const LeftMenuHeader(),
                    const SizedBox(height: 25),
                    LeftMenuBody(isMainMenuOpen: isMainMenuOpen),
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
