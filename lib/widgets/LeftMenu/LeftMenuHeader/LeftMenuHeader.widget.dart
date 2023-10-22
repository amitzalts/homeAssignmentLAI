import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LeftMenuHeader extends StatelessWidget {
  const LeftMenuHeader({super.key});

  @override
  Widget build(BuildContext context) {

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              SvgPicture.asset('lib/assets/images/logo.svg'),
            ],
          ),
        ],
      ),
    );
  }
}
