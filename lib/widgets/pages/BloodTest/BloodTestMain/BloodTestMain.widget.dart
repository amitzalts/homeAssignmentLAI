import 'package:flutter/material.dart';
import '../TopBarBloodTest/TopBarBloodTest.widget.dart';
import 'BloodTestGrid/BloodTestGrid.widget.dart';
import 'BloodTestMain.data.dart';

class BloodTestMain extends StatelessWidget {
  final User activeUser;

  const BloodTestMain({required this.activeUser, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(50, 0, 50, 0),
              child: SizedBox(
                width: 1537.66,
                height: 902,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Flexible(
                      flex: 1,
                      child: TopBarBloodTest(
                        firstName: activeUser.firstName,
                        lastName: activeUser.lastName,
                        age: activeUser.age,
                      ),
                    ),
                    Flexible(
                        flex: 8, child: BloodTestGrid(activeUser: activeUser)),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
