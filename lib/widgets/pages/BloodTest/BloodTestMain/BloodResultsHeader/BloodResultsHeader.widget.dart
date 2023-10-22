import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';

// ignore: must_be_immutable
class BloodResultsHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    DateTime now = DateTime.now();
    String formattedDate = DateFormat('MMM d').format(now);

    return Container(
      width: 480,
      height: 107,
      padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 24),
      decoration: const BoxDecoration(
          color: Colors.white,
          border: Border(
            left: BorderSide(color: Color(0xFFE3E3E3)),
            top: BorderSide(color: Color(0xFFE3E3E3)),
            right: BorderSide(color: Color(0xFFE3E3E3)),
            bottom: BorderSide(width: 0.5, color: Color(0xFFE3E3E3)),
          ),
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(8), topRight: (Radius.circular(8)))),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            width: 235,
            height: 59,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: 58,
                  height: 58,
                  padding: const EdgeInsets.all(11),
                  clipBehavior: Clip.antiAlias,
                  decoration: ShapeDecoration(
                    color: const Color(0xFFF2F2F2),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(706),
                    ),
                  ),
                  child: SvgPicture.asset('lib/assets/icons/blood.svg'),
                ),
                const SizedBox(width: 18),
                SizedBox(
                  width: 159,
                  height: 59,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Blood Results',
                        style: TextStyle(
                          color: Color(0xFF4B4B4B),
                          fontSize: 20,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w600,
                          height: 0,
                        ),
                      ),
                      const SizedBox(height: 6.5),
                      Text(
                        'Logging time - $formattedDate',
                        style: const TextStyle(
                          color: Color(0xFF4B4B4B),
                          fontSize: 14,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w400,
                          height: 0,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Transform.rotate(
            angle: -90 * 3.14159265359 / 180,
            child: Container(
              width: 32,
              height: 32,
              clipBehavior: Clip.antiAlias,
              decoration: ShapeDecoration(
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(32),
                ),
              ),
              child: const Icon(
                Icons.arrow_back_ios,
                color: Color.fromARGB(255, 203, 199, 199),
                size: 12,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
