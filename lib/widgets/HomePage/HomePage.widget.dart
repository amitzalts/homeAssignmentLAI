import 'package:flutter/material.dart';
import 'package:flutter_application_ha_longevityai/widgets/MainTopBar/MainTopBar.widget.dart';
import 'package:flutter_application_ha_longevityai/widgets/ToggleButtonLeftMenu/ToggleButtonLeftMenu.widget.dart';
import 'package:flutter_application_ha_longevityai/widgets/pages/BloodTest/BloodTestMain/BloodTestMain.data.dart';
import '../LeftMenu/LeftMenu.widget.dart';
import '../pages/BloodTest/BloodTestMain/BloodTestMain.widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  User activeUser = users.firstWhere((user) => user.isLoggedIn == true);
  bool isMainMenuOpen = true;

  // Navigate to different pages based on the selected tab
  void navigateToPage(String tab) {
    // Replace this with your actual navigation logic
    switch (tab) {
      case 'Overview':
        // Navigate to the overview page
        break;
      case 'About':
        // Navigate to the about page
        break;
      case 'BloodTest':
        // Navigate to the BloodTest page
        break;
      case 'Risks':
        // Navigate to the risks page
        break;
      case 'Interventions':
        // Navigate to the interventions page
        break;
      case 'Home':
        // Navigate to the home page
        break;
      case 'Search':
        // Navigate to the search page
        break;
      case 'Chat':
        // Navigate to the chat page
        break;
    }
  }

  void toggleMainMenu() {
    setState(() {
      isMainMenuOpen = !isMainMenuOpen;
    });
  }

  @override
  Widget build(BuildContext context) {
    final double leftMenuWidth = isMainMenuOpen ? 281 : 100;
    final double toggleMainMenuLeftPosition = isMainMenuOpen ? 265 : 84;
    

    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: SizedBox(
        height: 1080,
        child: Stack(children: <Widget>[
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    width: 1,
                    color: Color.fromARGB(255, 190, 231, 194),
                  ),
                ),
                width: leftMenuWidth,
                child: LeftMenu(isMainMenuOpen:isMainMenuOpen),
              ),
              Expanded(
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        MainTopBar(),
                      ],
                    ),
                    Expanded(
                      child: BloodTestMain(
                        activeUser: activeUser,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Positioned(
              top: 118,
              left: toggleMainMenuLeftPosition,
              child: ToggleButtonLeftMenu(
                  isMainMenuOpen: isMainMenuOpen, toggleMainMenu: toggleMainMenu))
        ]),
      ),
    );
  }
}
