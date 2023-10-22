import 'package:flutter/material.dart';
import 'package:flutter_application_ha_longevityai/widgets/pages/BloodTest/BloodTestMain/BloodTestMain.data.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Interventions extends StatefulWidget {
  const Interventions({
    Key? key,
    required this.topInterventions,
    required this.handleSelectedIndexOfIntervention,
    required this.selectedIndexOfIntervention,
  }) : super(key: key);

  final List<Intervention> topInterventions;
  final Function(int) handleSelectedIndexOfIntervention;
  final int selectedIndexOfIntervention;

  @override
  _InterventionsState createState() => _InterventionsState();
}

class _InterventionsState extends State<Interventions> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Top Interventions',
          style: TextStyle(
            color: Color(0xFF4B4B4B),
            fontSize: 14,
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w400,
            height: 0,
          ),
        ),
        const SizedBox(height: 16),
        Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            buildInterventionRow(widget.topInterventions[0].title, 0),
            const SizedBox(height: 18),
            buildInterventionRow(widget.topInterventions[1].title, 1),
            const SizedBox(height: 18),
            buildInterventionRow(widget.topInterventions[2].title, 2),
          ],
        ),
      ],
    );
  }

  Widget buildInterventionRow(String text, int index) {
    const textStyle = TextStyle(
      color: Color(0xFF818181),
      fontSize: 13,
      fontFamily: 'Poppins',
      fontWeight: FontWeight.w400,
      height: 0,
    );

    final isTabSelected = widget.selectedIndexOfIntervention == index;

    const borderColorOfSelected = Color(0xFF8BE2A8);
    const borderColorOfUnselected = Color(0xFFE3E3E3);

    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: () {
          widget.handleSelectedIndexOfIntervention(index);
        },
        child: Container(
          width: 175,
          height: 38.98,
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          decoration: ShapeDecoration(
            color: Colors.white,
            shape: RoundedRectangleBorder(
              side: BorderSide(
                width: 1.5,
                color: isTabSelected
                    ? borderColorOfSelected
                    : borderColorOfUnselected,
              ),
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(8),
                bottomLeft: Radius.circular(8),
              ),
            ),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SvgPicture.asset("lib/assets/icons/downwardArrow.svg"),
              const SizedBox(width: 12),    
              Text(text, style: textStyle),
            ],
          ),
        ),
      ),
    );
  }
}
