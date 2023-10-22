import 'package:fl_chart/fl_chart.dart';

class User {
  const User({
    required this.userId,
    required this.isLoggedIn,
    required this.firstName,
    required this.lastName,
    required this.age,
    required this.bloodResults,
    required this.previousBloodResults,
    required this.AltAgeGraphSpots,
    required this.AltOfSimilarPeopleGraphSpots,
    required this.AltTrendGraphSpots,
    required this.topInterventions,
  });

  final String userId;
  final bool isLoggedIn;
  final String firstName;
  final String lastName;
  final int age;
  final BloodResults bloodResults;
  final BloodResults previousBloodResults;
  final List<FlSpot> AltAgeGraphSpots;
  final List<FlSpot> AltOfSimilarPeopleGraphSpots;
  final List<FlSpot> AltTrendGraphSpots;
  final List<Intervention> topInterventions;
}

class BloodResults {
  const BloodResults({
    // ignore: non_constant_identifier_names
    required this.ALT,
    required this.AlkalinePhosphatase,
    required this.AST,
    required this.Glucose,
    required this.HbA1c,
    required this.HighSensitivityCReactiveProtein,
    required this.HDL,
  });

  final double ALT;
  final double AlkalinePhosphatase;
  final double AST;
  final double Glucose;
  final double HbA1c;
  final double HighSensitivityCReactiveProtein;
  final double HDL;
}

class Intervention {
  const Intervention({
    required this.title,
    required this.withInterventionAltTrendGraphSpots,
  });

  final String title;
  final List<FlSpot> withInterventionAltTrendGraphSpots;
}

List<User> users = [
  const User(
    userId: "124",
    isLoggedIn: true,
    firstName: "John",
    lastName: "Smith",
    age: 45,
    bloodResults: BloodResults(
      ALT: 17.9,
      AlkalinePhosphatase: 90.0,
      AST: 19.0,
      Glucose: 110.0,
      HbA1c: 17.0,
      HighSensitivityCReactiveProtein: 0.02,
      HDL: 73.9,
    ),
    previousBloodResults: BloodResults(
      ALT: 16.9,
      AlkalinePhosphatase: 91.0,
      AST: 18.0,
      Glucose: 109.0,
      HbA1c: 18.0,
      HighSensitivityCReactiveProtein: 0.03,
      HDL: 71.9,
    ),
    AltAgeGraphSpots: [
      FlSpot(20, 27),
      FlSpot(30, 32),
      FlSpot(40, 31),
      FlSpot(50, 31),
      FlSpot(60, 29),
      FlSpot(70, 24),
      FlSpot(80, 20),
      FlSpot(90, 17.5),
      FlSpot(95, 18)
    ],
    AltOfSimilarPeopleGraphSpots: [
      FlSpot(0, 0.000),
      FlSpot(25, 0.020),
      FlSpot(50, 0.035),
      FlSpot(75, 0.002),
      FlSpot(100, 0.001),
      FlSpot(125, 0.002),
      FlSpot(150, 0.001)
    ],
    AltTrendGraphSpots: [
      FlSpot(0, 15),
      FlSpot(0.5, 16),
      FlSpot(1, 16),
      FlSpot(1.5, 15),
      FlSpot(2, 14),
      FlSpot(2.5, 14),
      FlSpot(3, 14),
      FlSpot(3.5, 15),
      FlSpot(4, 18),
      FlSpot(4.5, 18),
      FlSpot(5, 19),
      FlSpot(5.5, 21),
      FlSpot(6, 22),
    ],
    topInterventions: [
      Intervention(
        title: "Swimming",
        withInterventionAltTrendGraphSpots: [
          FlSpot(4, 17),
          FlSpot(4.5, 16),
          FlSpot(5, 14),
          FlSpot(5.5, 14),
          FlSpot(6, 14)
        ],
      ),
      Intervention(
        title: "Moderate carbs",
        withInterventionAltTrendGraphSpots: [
          FlSpot(4, 17),
          FlSpot(4.5, 17),
          FlSpot(5, 15),
          FlSpot(5.5, 15),
          FlSpot(6, 15)
        ],
      ),
      Intervention(
        title: "Fish x2 a week",
        withInterventionAltTrendGraphSpots: [
          FlSpot(4, 17),
          FlSpot(4.5, 15),
          FlSpot(5, 15),
          FlSpot(5.5, 16),
          FlSpot(6, 16)
        ],
      ),
    ],
  ),
  const User(
    userId: "125",
    isLoggedIn: true,
    firstName: "Carol",
    lastName: "Davis",
    age: 40,
    bloodResults: BloodResults(
      ALT: 20.9,
      AlkalinePhosphatase: 95.0,
      AST: 21.5,
      Glucose: 115.0,
      HbA1c: 19.0,
      HighSensitivityCReactiveProtein: 0.05,
      HDL: 71.9,
    ),
    previousBloodResults: BloodResults(
      ALT: 15.9,
      AlkalinePhosphatase: 93.0,
      AST: 15.0,
      Glucose: 107.0,
      HbA1c: 16.0,
      HighSensitivityCReactiveProtein: 0.07,
      HDL: 69.9,
    ),
    AltAgeGraphSpots: [
      FlSpot(20, 30),
      FlSpot(30, 32),
      FlSpot(40, 32),
      FlSpot(50, 29),
      FlSpot(60, 27),
      FlSpot(70, 26),
      FlSpot(80, 20),
      FlSpot(90, 18),
      FlSpot(95, 18.5)
    ],
    AltOfSimilarPeopleGraphSpots: [
      FlSpot(0, 0.000),
      FlSpot(25, 0.035),
      FlSpot(50, 0.020),
      FlSpot(75, 0.002),
      FlSpot(100, 0.001),
      FlSpot(125, 0.002),
      FlSpot(150, 0.001)
    ],
    AltTrendGraphSpots: [
      FlSpot(0, 20),
      FlSpot(0.5, 21),
      FlSpot(1, 21),
      FlSpot(1.5, 23),
      FlSpot(2, 22),
      FlSpot(2.5, 21),
      FlSpot(3, 22),
      FlSpot(3.5, 24),
      FlSpot(4, 24),
      FlSpot(4.5, 25),
      FlSpot(5, 26),
      FlSpot(5.5, 26),
      FlSpot(6, 26),
    ],
    topInterventions: [
      Intervention(
        title: "running",
        withInterventionAltTrendGraphSpots: [
          FlSpot(4, 24),
          FlSpot(4.5, 16),
          FlSpot(5, 14),
          FlSpot(5.5, 14),
          FlSpot(6, 14)
        ],
      ),
      Intervention(
        title: "Moderate fruits",
        withInterventionAltTrendGraphSpots: [
          FlSpot(4, 24),
          FlSpot(4.5, 17),
          FlSpot(5, 15),
          FlSpot(5.5, 15),
          FlSpot(6, 15)
        ],
      ),
      Intervention(
        title: "Fish x2 a week",
        withInterventionAltTrendGraphSpots: [
          FlSpot(4, 24),
          FlSpot(4.5, 15),
          FlSpot(5, 15),
          FlSpot(5.5, 16),
          FlSpot(6, 16)
        ],
      ),
    ],
  ),
];

