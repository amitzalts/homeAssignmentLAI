import 'package:flutter/material.dart';

// ignore: must_be_immutable
class HeaderItem extends StatefulWidget {
  final String text;
  final IconData? icon;
  bool isCollapsed;
  final VoidCallback onTap;

  HeaderItem({
    super.key,
    required this.text,
    this.icon,
    required this.isCollapsed,
    required this.onTap,
  });

  @override
  _HeaderItemState createState() => _HeaderItemState();
}

class _HeaderItemState extends State<HeaderItem> {
  @override
  Widget build(BuildContext context) {
    Color fontColor = const Color(0xFF145A5A);
    return Container(
      width: 200,
      child: ListTile(
        contentPadding: EdgeInsets.zero,
        onTap: widget.onTap,
        title: Text(
          widget.text,
          overflow: TextOverflow.ellipsis,
          maxLines: 1,
          style: TextStyle(
            color: fontColor,
            fontSize: 16,
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w300,
            height: 0,
          ),
        ),
        trailing: Icon(
          widget.isCollapsed
              ? Icons.keyboard_arrow_up_sharp
              : Icons.keyboard_arrow_down_sharp,
          color: fontColor,
        ),
      ),
    );
  }
}
