import 'package:flutter/material.dart';
import '../MenuTab/MenuTab.widget.dart';

// ignore: must_be_immutable
class MenuTabList extends StatefulWidget {
  List<dynamic> menuTabs;

  MenuTabList({Key? key, required this.menuTabs}) : super(key: key);

  @override
  State<MenuTabList> createState() => _MenuTabListState();
}

class _MenuTabListState extends State<MenuTabList> {
  int selectedIndex = -1;
  void handleSelectedTab(int index) {
    setState(() =>
        selectedIndex != index ? selectedIndex = index : selectedIndex = -1);
  }


  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: widget.menuTabs.length,
      itemBuilder: (BuildContext context, int index) {
        final tab = widget.menuTabs[index];

        return MenuTab(
          text: tab.text,
          iconLocation: tab.iconLocation,
          tabName: tab.tabName,
          tabSubCategories: tab.tabSubCategories,
          selectedIndex: selectedIndex,
          index: index,
          onTap: () {
            handleSelectedTab(index);
          },
        );
      },
    );
  }
}
