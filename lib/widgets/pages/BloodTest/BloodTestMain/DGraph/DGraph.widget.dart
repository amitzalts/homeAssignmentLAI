import 'package:flutter/material.dart';
import '../BiomarkerScale/BiomarkerScale.widget.dart';
import '../ScaleIndicator/ScaleIndicator.widget.dart';

class DGraph extends StatelessWidget {
  final double bloodValue;
  final double mainIndicator;
  final double secondaryIndicator;
  final bool hasSecondaryIndicator;

  const DGraph(
      {super.key,
      required this.mainIndicator,
      required this.secondaryIndicator,
      required this.hasSecondaryIndicator,
      required this.bloodValue});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 430,
      height: 34,
      // padding: const EdgeInsets.only(top: 8, bottom: 20),
      child: SizedBox(
        height: 20,
        child: Stack(
          children: <Widget>[
            Positioned(
              top: 4,
              left: 0,
              child: BiomarkerScale(
                  bloodValue: bloodValue,
                  mainBiomarkerIndicator: mainIndicator),
            ),
            Positioned(
              top: 0,
              left: 90.5,
              child: SizedBox(
                width: 280,
                height: 50,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    ScaleIndicator(
                        isVisible: hasSecondaryIndicator,
                        numericValue: secondaryIndicator),
                    const SizedBox(width: 155, height: 17,),
                    ScaleIndicator(
                        isVisible: true, numericValue: mainIndicator),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}