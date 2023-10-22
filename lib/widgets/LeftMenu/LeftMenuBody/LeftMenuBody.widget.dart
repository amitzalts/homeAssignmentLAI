import 'package:flutter/material.dart';
import '../../HeaderItem/HeaderItem.data.dart';
import '../../HeaderItem/HeaderItem.widget.dart';
import '../../MenuTab/MenuTab.data.dart';
import '../../MenuTabList/MenuTabList.widget.dart';

class LeftMenuBody extends StatefulWidget {
  const LeftMenuBody({required this.isMainMenuOpen, Key? key}) : super(key: key);

  final bool isMainMenuOpen;

  @override
  _LeftMenuBodyState createState() => _LeftMenuBodyState();
}

class _LeftMenuBodyState extends State<LeftMenuBody> {
  bool isPatientCollapsibleOpen = false;
  bool isMenuCollapsibleOpen = false;

  void togglePatientCollapsible() {
    setState(() {
      isPatientCollapsibleOpen = !isPatientCollapsibleOpen;
    });
  }

  void toggleMenuCollapsible() {
    setState(() {
      isMenuCollapsibleOpen = !isMenuCollapsibleOpen;
    });
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> columnChildren = [];

    columnChildren.add(const Divider());

    columnChildren.add(
      HeaderItem(
        text: HeadersEnum.patient.text,
        isCollapsed: isPatientCollapsibleOpen,
        onTap: () {
          togglePatientCollapsible();
        },
      ),
    );

    if (isPatientCollapsibleOpen) {
      columnChildren.add(
        MenuTabList(menuTabs: PatientTabsEnum.values),
      );
    }

    columnChildren.add(const Divider());

    columnChildren.add(
      HeaderItem(
        text: HeadersEnum.menu.text,
        isCollapsed: isMenuCollapsibleOpen,
        onTap: () {
          toggleMenuCollapsible();
        },
      ),
    );

    if (isMenuCollapsibleOpen) {
      columnChildren.add(
        MenuTabList(menuTabs: MenuTabsEnum.values),
      );
    }

    return Column(
      children: [
        widget.isMainMenuOpen ? Column(children: columnChildren) : const SizedBox(),
      ],
    );
  }
}
