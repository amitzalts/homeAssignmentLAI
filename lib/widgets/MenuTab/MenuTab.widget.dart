import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

// ignore: must_be_immutable
class MenuTab extends StatefulWidget {
  final String text;
  final String? iconLocation;
  final String tabName;
  final List<String> tabSubCategories;
  final VoidCallback onTap;
  final int selectedIndex;
  final int index;

  const MenuTab({
    UniqueKey? key,
    required this.text,
    this.iconLocation,
    required this.tabName,
    required this.tabSubCategories,
    required this.onTap,
    required this.selectedIndex,
    required this.index,
  }) : super(key: key);

  @override
  _MenuTabState createState() => _MenuTabState();
}

class _MenuTabState extends State<MenuTab> {
  @override
  Widget build(BuildContext context) => buildMenuTab(
        widget.text,
        widget.iconLocation,
        widget.tabName,
        widget.onTap,
        widget.selectedIndex,
        widget.index,
      );

  Widget buildMenuTab(String text, String? iconLocation, String tabName,
      VoidCallback onTap, int selectedTab, int index) {
    bool isTabSelected = (widget.selectedIndex == widget.index) ? true : false;
    List<String> tabSubCategories = [];

    if (isTabSelected) tabSubCategories.addAll(widget.tabSubCategories);

    Color fontColor = const Color(0xFF145A5A);

    return Column(
      children: [
        Container(
          width: 231.34,
          height: isTabSelected ? 100 : 52,
          padding: const EdgeInsets.all(10),
          decoration: isTabSelected
              ? const BoxDecoration(
                  color: Color.fromARGB(255, 255, 255, 255),
                  borderRadius: BorderRadius.all(
                    Radius.circular(8.0),
                  ),
                )
              : null,
          child: ListTile(
            selected: isTabSelected,
            onTap: () => widget.onTap(),
            title: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      iconLocation != null
                          ? SvgPicture.asset(iconLocation)
                          : const SizedBox(),
                      const SizedBox(width: 9),
                      Text(
                        text,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                        style: TextStyle(
                          color: fontColor,
                          fontSize: 18,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w500,
                          height: 0,
                        ),
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ListView.separated(
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          final subcategory = tabSubCategories[index];
                          return ListTile(
                            title: Text(
                              subcategory,
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                              style: TextStyle(
                                color: fontColor,
                                fontSize: 14,
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w400,
                                height: 0,
                              ),
                            ),
                            onTap: () {},
                          );
                        },
                        separatorBuilder: (context, index) {
                          return const SizedBox(height: 0.1);
                        },
                        itemCount: tabSubCategories.length,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
        const SizedBox(height: 10)
      ],
    );
  }
}
