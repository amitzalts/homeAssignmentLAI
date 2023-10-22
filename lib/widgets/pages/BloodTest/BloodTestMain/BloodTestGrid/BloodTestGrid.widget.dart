import 'package:flutter/material.dart';
import 'package:flutter_application_ha_longevityai/widgets/pages/BloodTest/BloodResults/BloodResults.data.dart';
import 'package:flutter_application_ha_longevityai/widgets/pages/BloodTest/BloodTestMain/BloodTestMain.data.dart';
import '../../../../BiomarkerResult/BiomarkerResult.widget.dart';
import '../../LineChartMonthlyXAxis/LineChartMonthlyXAxis.widget.dart';
import '../../LineChartNumericXAxis/LineChartNumericXAxis.widget.dart';
import '../BloodResultsHeader/BloodResultsHeader.widget.dart';

class BloodTestGrid extends StatefulWidget {
  final User activeUser;

  const BloodTestGrid({super.key, required this.activeUser});

  @override
  State<BloodTestGrid> createState() => _BloodTestGridState();
}

class _BloodTestGridState extends State<BloodTestGrid> {
  int selectedIndexOfIntervention = 0;
  void handleSelectedIndexOfIntervention(int index) {
    setState(() {
      selectedIndexOfIntervention = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    BloodResults bloodResults = widget.activeUser.bloodResults;
    BloodResults previousBloodResults = widget.activeUser.previousBloodResults;
    List<Intervention> interventions = widget.activeUser.topInterventions;

    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 30, 0, 0),
      child: Row(
        children: [
          Column(
            children: [
              Container(
                width: 480,
                height: 766,
                clipBehavior: Clip.antiAlias,
                decoration: ShapeDecoration(
                  shape: RoundedRectangleBorder(
                    side:
                        const BorderSide(width: 1, color: Color(0xFFE3E3E3)),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        BloodResultsHeader(),
                        SingleChildScrollView(
                          scrollDirection: Axis.vertical,
                          child: SizedBox(
                            height: 650,
                            width: 480,
                            child: ListView.builder(
                              itemCount: BiomarkersEnum.values.length,
                              itemBuilder: (context, index) {
                                String name =
                                    BiomarkersEnum.values[index].name;
                                double numericValue = 0;
                                bool isNumericValueIncreased = false;
                                switch (name) {
                                  case "Alanine Aminotransferase (ALT)":
                                    numericValue = bloodResults.ALT;
                                    isNumericValueIncreased =
                                        bloodResults.ALT >
                                                previousBloodResults.ALT
                                            ? true
                                            : false;
                                    break;
                                  case "Alkaline Phosphatase":
                                    numericValue =
                                        bloodResults.AlkalinePhosphatase;
                                    isNumericValueIncreased =
                                        bloodResults.AlkalinePhosphatase >
                                                previousBloodResults
                                                    .AlkalinePhosphatase
                                            ? true
                                            : false;
                                    break;
                                  case "Aspartate Aminotransferase (AST)":
                                    numericValue = bloodResults.AST;
                                    isNumericValueIncreased =
                                        bloodResults.AST >
                                                previousBloodResults.AST
                                            ? true
                                            : false;
                                    break;
                                  case "Glucose":
                                    numericValue = bloodResults.Glucose;
                                    isNumericValueIncreased =
                                        bloodResults.Glucose >
                                                previousBloodResults.Glucose
                                            ? true
                                            : false;
                                    break;
                                  case "Hemoglobin A1c (HbA1c)":
                                    numericValue = bloodResults.HbA1c;
                                    isNumericValueIncreased =
                                        bloodResults.HbA1c >
                                                previousBloodResults.HbA1c
                                            ? true
                                            : false;
                                    break;
                                  case "High Sensitivity C-Reactive Protein":
                                    numericValue = bloodResults
                                        .HighSensitivityCReactiveProtein;
                                    isNumericValueIncreased = bloodResults
                                                .HighSensitivityCReactiveProtein >
                                            previousBloodResults
                                                .HighSensitivityCReactiveProtein
                                        ? true
                                        : false;
                                    break;
                                  case "High-density Lipoprotein (HDL)":
                                    numericValue = bloodResults.HDL;
                                    isNumericValueIncreased =
                                        bloodResults.HDL >
                                                previousBloodResults.HDL
                                            ? true
                                            : false;
                                    break;
                                  default:
                                    numericValue = 0.0;
                                    isNumericValueIncreased = false;
                                }
                                return BiomarkerResult(
                                  name: name,
                                  numericValue: numericValue,
                                  isNumericValueIncreased:
                                      isNumericValueIncreased,
                                  unitOfMeasurement: BiomarkersEnum
                                      .values[index].unitOfMeasurement,
                                  mainIndicator: BiomarkersEnum
                                      .values[index].mainIndicator,
                                  secondaryIndicator: BiomarkersEnum
                                      .values[index].secondaryIndicator,
                                  hasSecondaryIndicator: BiomarkersEnum
                                      .values[index].hasSecondaryIndicator,
                                  fixedPoint:
                                      BiomarkersEnum.values[index].fixedPoint,
                                );
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(width: 50.0),
          Expanded(
            flex: 2,
            child: Column(
              children: [
                Expanded(
                  flex: 1,
                  child: Row(
                    children: [
                      Expanded(
                        child: LineChartNumericXAxis(
                          title: 'ALT Age',
                          lineColor: const Color(0xFF8BE2A8),
                          indicatorStrokeColor: Colors.grey,
                          indicatorPaddingStrokeColor: Colors.white,
                          gridLineColor:
                              const Color.fromARGB(255, 227, 223, 223),
                          firstValueOnXAxis: 20,
                          incrementOfXAxis: 10,
                          maxValueOnXAxis: 95,
                          firstValueOnYAxis: 18,
                          incrementOfYAxis: 2,
                          xAxisPosition: -1,
                          indicatorSpotIndex: 5,
                          allSpots: widget.activeUser.AltAgeGraphSpots,
                          fixedPoint: 0,
                          widthOfLeftScaleMarks: 20,
                        ),
                      ),
                      const SizedBox(width: 50.0),
                      Expanded(
                        child: LineChartNumericXAxis(
                          title: 'ALT of Similar People',
                          lineColor: const Color(0xFF8BE2A8),
                          indicatorStrokeColor: Colors.grey,
                          indicatorPaddingStrokeColor: Colors.white,
                          gridLineColor:
                              const Color.fromARGB(255, 227, 223, 223),
                          firstValueOnXAxis: 0,
                          incrementOfXAxis: 25,
                          maxValueOnXAxis: 150,
                          firstValueOnYAxis: 0.000,
                          incrementOfYAxis: 0.005,
                          xAxisPosition: 15,
                          indicatorSpotIndex: 1,
                          allSpots:
                              widget.activeUser.AltOfSimilarPeopleGraphSpots,
                          fixedPoint: 3,
                          widthOfLeftScaleMarks: 38,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 50.0),
                Expanded(
                  flex: 1,
                  child: SizedBox(
                    width: 1007.66,
                    height: 358,
                    child: LineChartMonthlyXAxis(
                      title: "ALT Trend",
                      lineColor: const Color(0xFF8BE2A8),
                      indicatorStrokeColor: Colors.grey,
                      indicatorPaddingStrokeColor: Colors.white,
                      gridLineColor: const Color.fromARGB(255, 227, 223, 223),
                      xAxisValues: const [
                        "Oct 21",
                        "Apr 22",
                        "Oct 22",
                        "Apr 23",
                        "Oct 23",
                        "Future"
                      ],
                      firstValueOnYAxis: 0,
                      incrementOfYAxis: 10,
                      indicatorSpotIndex: 8,
                      allSpots: widget.activeUser.AltTrendGraphSpots,
                      numberOfDigitsAfterDecimalPoint: 0,
                      topInterventions: widget.activeUser.topInterventions,
                      withInterventionSpots:
                          interventions[selectedIndexOfIntervention]
                              .withInterventionAltTrendGraphSpots,
                      handleSelectedIndexOfIntervention:
                          handleSelectedIndexOfIntervention,
                      selectedIndexOfIntervention: selectedIndexOfIntervention,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
