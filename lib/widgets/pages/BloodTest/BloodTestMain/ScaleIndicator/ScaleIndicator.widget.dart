import 'package:flutter/material.dart';

class ScaleIndicator extends StatelessWidget {
  final double numericValue;
  final bool isVisible;

  const ScaleIndicator(
      {required this.numericValue, required this.isVisible, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          isVisible
              ? Container(
                  width: 0,
                  height: 15,
                  decoration: const BoxDecoration(
                    border: Border(
                      left: BorderSide(width: 1.50, color: Color(0xFF4B4B4B)),
                    ),
                  ),
                )
              : const SizedBox(height: 15),
          const SizedBox(height: 1),
          SizedBox(
            height: 30,
            child: SizedBox(
              width: 42,
              child: Opacity(
                opacity: isVisible ? 1 : 0,
                child: Text(
                  numericValue.toStringAsFixed(1),
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: Color(0xFF818181),
                    fontSize: 11,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w400,
                    height: 0,
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