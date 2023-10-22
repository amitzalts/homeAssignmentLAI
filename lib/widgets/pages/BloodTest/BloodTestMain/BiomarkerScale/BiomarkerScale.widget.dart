import 'package:flutter/material.dart';

class BiomarkerScale extends StatelessWidget {
  final double bloodValue;
  final double mainBiomarkerIndicator;

  const BiomarkerScale({
    super.key,
    required this.bloodValue,
    required this.mainBiomarkerIndicator,
  });

  @override
  Widget build(BuildContext context) {
    double oneHundredPercent = mainBiomarkerIndicator / 0.77;
    double bloodValuepPercent = bloodValue / oneHundredPercent;
    double renderedOneHundredPercent = 430;
    double renderedBloodValuepPercent = bloodValuepPercent * renderedOneHundredPercent;

    return Column(
      children: [
        Container(
          width: renderedOneHundredPercent,
          height: 6,
          decoration: ShapeDecoration(
            color: bloodValue <= mainBiomarkerIndicator
                ? const Color(0x338BE2A8)
                : const Color(0x33FFD700),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(71),
            ),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: renderedBloodValuepPercent,
                height: 6,
                decoration: ShapeDecoration(
                  color: bloodValue <= mainBiomarkerIndicator
                      ? const Color(0xFF8BE2A8)
                      : const Color(0xFFFFD600),
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10),
                      bottomLeft: Radius.circular(10),
                    ),
                  ),
                  shadows: const [
                    BoxShadow(
                      color: Color(0x0C000000),
                      blurRadius: 4,
                      offset: Offset(0, 2),
                      spreadRadius: 0,
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}