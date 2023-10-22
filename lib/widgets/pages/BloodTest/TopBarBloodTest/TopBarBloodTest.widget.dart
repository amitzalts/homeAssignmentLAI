import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../ActionButton/ActionButton.widget.dart';


class TopBarBloodTest extends StatelessWidget {

  final String firstName;
  final String lastName;
  final int age;

  const TopBarBloodTest({super.key, required this.firstName, required this.lastName, required this.age});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    width: double.infinity,
                    child: Text(
                      'Blood Test',
                      style: TextStyle(
                        color: Color(0xFF4B4B4B),
                        fontSize: 32,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  const SizedBox(height: 8),
                  SizedBox(
                    width: double.infinity,
                    child: Text(
                      '$firstName $lastName - age : $age',
                      style: const TextStyle(
                        color: Color(0xFF4B4B4B),
                        fontSize: 20,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ActionButton(text: "Recent", icon: SvgPicture.asset('lib/assets/icons/sortList.svg'), isIconOnRightEnd: false),
                  SizedBox(width: 18),
                  ActionButton(text: "Export", icon: SvgPicture.asset('lib/assets/icons/export.svg'), isIconOnRightEnd: true),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}

