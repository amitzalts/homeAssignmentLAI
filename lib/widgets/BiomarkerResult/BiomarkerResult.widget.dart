import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../pages/BloodTest/BloodTestMain/DGraph/DGraph.widget.dart';

class BiomarkerResult extends StatelessWidget {
  BiomarkerResult({
    required this.name,
    required this.numericValue,
    required this.unitOfMeasurement,
    required this.mainIndicator,
    required this.secondaryIndicator,
    required this.hasSecondaryIndicator,
    required this.isNumericValueIncreased,
    required this.fixedPoint,
  });

  final String name;
  final double numericValue;
  final String unitOfMeasurement;
  final double mainIndicator;
  final double secondaryIndicator;
  final bool hasSecondaryIndicator;
  final bool isNumericValueIncreased;
  final int fixedPoint;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 480,
      height: 109,
      padding: const EdgeInsets.fromLTRB(25, 24, 25, 16),
      decoration: const BoxDecoration(
        color: Color(0xFFF6FFFF),
        border: Border(
          left: BorderSide(color: Color(0xFFE3E3E3)),
          top: BorderSide(color: Color(0xFFE3E3E3)),
          right: BorderSide(color: Color(0xFFE3E3E3)),
          bottom: BorderSide(width: 1, color: Color(0xFFE3E3E3)),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 430,
            height: 21,
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    name,
                    style: const TextStyle(
                      color: Color(0xFF4B4B4B),
                      fontSize: 14,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w500,
                      height: 0,
                    ),
                  ),
                ),
                Row(
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: [
                        Text(
                          numericValue.toStringAsFixed(fixedPoint),
                          style: const TextStyle(
                            color: Color(0xFF818181),
                            fontSize: 14,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        const SizedBox(width: 2),
                        Text(
                          unitOfMeasurement,
                          style: const TextStyle(
                            color: Color(0xFF818181),
                            fontSize: 12,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        const SizedBox(width: 8),
                        SizedBox(
                          width: 18,
                          height: 18,
                          child: isNumericValueIncreased
                              ? SvgPicture.asset(
                                  "lib/assets/icons/increased.svg")
                              : SvgPicture.asset(
                                  "lib/assets/icons/decreased.svg"),
                        ),
                      ],
                    ),
                    const SizedBox(width: 8),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: 12),
          DGraph(
            mainIndicator: mainIndicator,
            secondaryIndicator: secondaryIndicator,
            hasSecondaryIndicator: hasSecondaryIndicator,
            bloodValue: numericValue,
          ),
        ],
      ),
    );
  }
}