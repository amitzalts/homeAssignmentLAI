import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MainTopBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double maxContainerWidth = 1637.66;
    double maxScreenWidth = 1920;
    double containerWidth = screenWidth < maxScreenWidth
        ? maxContainerWidth + (screenWidth - maxScreenWidth)
        : maxContainerWidth;

    return Column(
      children: [
        Container(
          width: containerWidth,
          height: 128,
          padding: EdgeInsets.fromLTRB(50, 32, 50, 32),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    clipBehavior: Clip.antiAlias,
                    decoration: const BoxDecoration(),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          padding: const EdgeInsets.all(10),
                          decoration: ShapeDecoration(
                            color: const Color(0xFFF6FFFF),
                            shape: RoundedRectangleBorder(
                              side: const BorderSide(
                                  width: 2, color: Color(0xFF2C9292)),
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SizedBox(
                                width: 32,
                                height: 32,
                                child: SvgPicture.asset(
                                    "lib/assets/icons/smallLogo.svg"),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 18),
                  Container(
                    width: 32,
                    height: 32,
                    clipBehavior: Clip.antiAlias,
                    decoration: ShapeDecoration(
                      color: Colors.white,
                      shape: RoundedRectangleBorder(
                        side: const BorderSide(
                            width: 1, color: Color(0xFFBEE7E7)),
                        borderRadius: BorderRadius.circular(32),
                      ),
                    ),
                    child: const Icon(Icons.keyboard_arrow_right_sharp,
                        color: Color(0xFF2C9292)),
                  ),
                  const SizedBox(width: 50),
                ],
              ),
              Expanded(
                child: SizedBox(
                  height: 36,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: 36,
                        height: 36,
                        child:
                            SvgPicture.asset("lib/assets/icons/searchBig.svg"),
                      ),
                      const SizedBox(width: 25),
                      const Expanded(
                        child: Padding(
                          padding: EdgeInsets.only(bottom: 12),
                          child: SizedBox(
                            height: 29,
                            child: TextField(
                              decoration: InputDecoration(
                                  hintText:
                                      'Search for blood results and related biomarkers',
                                  border: InputBorder.none,
                                  hintStyle: TextStyle(
                                    color: Color(0xFF818181),
                                    fontSize: 14,
                                    fontFamily: 'Inter',
                                    fontWeight: FontWeight.w400,
                                    height: 0,
                                  )),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      width: 64,
                      height: 64,
                      clipBehavior: Clip.antiAlias,
                      decoration: ShapeDecoration(
                        image: const DecorationImage(
                          image: AssetImage("lib/assets/images/Account.jpg"),
                          fit: BoxFit.fill,
                        ),
                        shape: RoundedRectangleBorder(
                          side: const BorderSide(
                              width: 2, color: Color(0xFFE3E3E3)),
                          borderRadius: BorderRadius.circular(69),
                        ),
                      ),
                    ),
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
