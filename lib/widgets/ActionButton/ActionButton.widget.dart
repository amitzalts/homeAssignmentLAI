import 'package:flutter/material.dart';


class ActionButton extends StatelessWidget {
  final String text;
  final Widget icon;
  final bool isIconOnRightEnd;

  const ActionButton(
      {super.key,
      required this.text,
      required this.icon,
      required this.isIconOnRightEnd});

  List<Widget> rowChildren() {
    return <Widget>[
      Text(
        text,
        style: const TextStyle(
          color: Color(0xFF818181),
          fontSize: 18,
          fontFamily: 'Poppins',
          fontWeight: FontWeight.w400,
        ),
      ),
      const SizedBox(width: 9),
      Container(
        width: 32,
        height: 32,
        padding: const EdgeInsets.all(2),
        child: icon,
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 154,
      height: 52,
      decoration: const ShapeDecoration(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(12),
            topRight: Radius.circular(12),
          ),
        ),
      ),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(
          vertical: 10,
          horizontal: 14,
        ),
        decoration: ShapeDecoration(
          color: Colors.white,
          shape: RoundedRectangleBorder(
            side: const BorderSide(width: 1, color: Color(0xFFE3E3E3)),
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: isIconOnRightEnd
              ? rowChildren().reversed.toList()
              : rowChildren(),
        ),
      ),
    );
  }
}
