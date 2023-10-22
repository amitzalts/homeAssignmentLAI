import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_ha_longevityai/widgets/pages/BloodTest/BloodTestMain/BloodTestMain.data.dart';

import '../BloodTestMain/Interentions/Interventions.widget.dart';

class LineChartMonthlyXAxis extends StatefulWidget {
  const LineChartMonthlyXAxis({
    Key? key,
    required this.lineColor,
    required this.title,
    required this.indicatorStrokeColor,
    required this.indicatorPaddingStrokeColor,
    required this.gridLineColor,
    required this.xAxisValues,
    required this.firstValueOnYAxis,
    required this.incrementOfYAxis,
    required this.indicatorSpotIndex,
    required this.allSpots,
    required this.numberOfDigitsAfterDecimalPoint,
    required this.withInterventionSpots,
    required this.topInterventions,
    required this.handleSelectedIndexOfIntervention,
    required this.selectedIndexOfIntervention,
  }) : super(key: key);

  final String title;
  final Color lineColor;
  final Color indicatorStrokeColor;
  final int indicatorSpotIndex;
  final Color indicatorPaddingStrokeColor;
  final Color gridLineColor;
  final List<String> xAxisValues;
  final double firstValueOnYAxis;
  final double incrementOfYAxis;
  final List<FlSpot> allSpots;
  final List<FlSpot> withInterventionSpots;
  final int numberOfDigitsAfterDecimalPoint;
  final List<Intervention> topInterventions;
  final Function(int) handleSelectedIndexOfIntervention;
  final int selectedIndexOfIntervention;

  @override
  State<LineChartMonthlyXAxis> createState() => _LineChartMonthlyXAxis();
}

class _LineChartMonthlyXAxis extends State<LineChartMonthlyXAxis> {
  late List<int> showingTooltipOnSpots;
  late List<FlSpot> allSpots;

  @override
  void initState() {
    super.initState();

    showingTooltipOnSpots = [widget.indicatorSpotIndex];
    allSpots = widget.allSpots;
  }

  Widget bottomTitleWidgets(double value, TitleMeta meta, double chartWidth) {
    const style = TextStyle(
      color: Color(0xFF818181),
            fontSize: 12,
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w400,
            height: 0,
    );

    if (value < 0 || value >= widget.xAxisValues.length) {
      return Container();
    }

    String text = widget.xAxisValues[value.toInt()];

    return SideTitleWidget(
      fitInside: const SideTitleFitInsideData(
          enabled: true,
          distanceFromEdge: 0,
          parentAxisSize: 1,
          axisPosition: 0),
      space: 20,
      axisSide: meta.axisSide,
      child: Text(text, style: style),
    );
  }

  Widget leftTitleWidgets(double value, TitleMeta meta, double chartWidth) {
    const style = TextStyle(
      color: Color(0xFFB3B3B3),
            fontSize: 12,
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w400,
            height: 0,
    );

    return SideTitleWidget(
      axisSide: meta.axisSide,
      child: Text(value.toStringAsFixed(widget.numberOfDigitsAfterDecimalPoint),
          style: style),
    );
  }

  Widget chartHeader(BuildContext context) {
    return Container(
      width: 1007.6,
      height: 43,
      padding: const EdgeInsets.only(
        top: 12,
        left: 12,
        right: 12,
        bottom: 10,
      ),
      decoration: const BoxDecoration(
        border: Border(
          left: BorderSide.none,
          top: BorderSide.none,
          right: BorderSide.none,
          bottom: BorderSide(width: 1, color: Color(0xFFE3E3E3)),
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            widget.title,
            style: const TextStyle(
              color: Color(0xFF4B4B4B),
              fontSize: 14,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final List<FlSpot> firstSegmentSpots =
        widget.allSpots.sublist(0, widget.indicatorSpotIndex + 1);
    final List<FlSpot> noInterventionSpots =
        widget.allSpots.sublist(widget.indicatorSpotIndex);

    final List<FlSpot> withInterventionSpots = widget.withInterventionSpots;

    final lineBarsData = [
      LineChartBarData(
        showingIndicators: showingTooltipOnSpots,
        spots: firstSegmentSpots,
        isCurved: true,
        barWidth: 3,
        dotData: const FlDotData(show: false),
        color: widget.lineColor,
      ),
      LineChartBarData(
        spots: noInterventionSpots,
        isCurved: true,
        barWidth: 3,
        dotData: const FlDotData(show: false),
        color: const Color.fromARGB(255, 209, 204, 204),
        dashArray: [8, 8],
      ),
      LineChartBarData(
        spots: withInterventionSpots,
        isCurved: true,
        barWidth: 3,
        dotData: const FlDotData(show: false),
        color: widget.lineColor,
        dashArray: [8, 8],
      ),
    ];

    final tooltipsOnBar = lineBarsData[0];

    return AspectRatio(
      aspectRatio: 1,
      child: LayoutBuilder(builder: (context, constraints) {
        return Container(
          decoration: ShapeDecoration(
            color: Colors.white,
            shape: RoundedRectangleBorder(
              side: const BorderSide(
                  width: 2, color: Color.fromARGB(255, 227, 227, 227)),
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          child: Column(
            children: [
              chartHeader(context),
              Padding(
                padding: const EdgeInsets.fromLTRB(12, 0, 0, 0),
                child: SizedBox(
                  width: 1007.6,
                  height: 313.5,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Column(
                        children: [
                          const SizedBox(
                            height: 22,
                          ),
                          SizedBox(
                            width: 808,
                            height: 291,
                            child: LineChart(
                              LineChartData(
                                showingTooltipIndicators:
                                    showingTooltipOnSpots.map((index) {
                                  return ShowingTooltipIndicators([
                                    LineBarSpot(
                                      tooltipsOnBar,
                                      lineBarsData.indexOf(tooltipsOnBar),
                                      tooltipsOnBar.spots[index],
                                    ),
                                  ]);
                                }).toList(),
                                lineTouchData: LineTouchData(
                                  enabled: false,
                                  handleBuiltInTouches: false,
                                  getTouchedSpotIndicator:
                                      (LineChartBarData barData,
                                          List<int> spotIndexes) {
                                    return spotIndexes.map((index) {
                                      return TouchedSpotIndicatorData(
                                        const FlLine(
                                          color: Colors.transparent,
                                        ),
                                        FlDotData(
                                          show: true,
                                          getDotPainter:
                                              (spot, percent, barData, index) =>
                                                  FlDotCirclePainter(
                                            radius: 4,
                                            color: widget.indicatorStrokeColor,
                                            strokeWidth: 2,
                                            strokeColor: widget
                                                .indicatorPaddingStrokeColor,
                                          ),
                                        ),
                                      );
                                    }).toList();
                                  },
                                  touchTooltipData: LineTouchTooltipData(
                                    tooltipBgColor: Colors.transparent,
                                    getTooltipItems:
                                        (List<LineBarSpot> lineBarsSpot) {
                                      return lineBarsSpot.map((lineBarSpot) {
                                        return LineTooltipItem(
                                          lineBarSpot.y.toString(),
                                          const TextStyle(
                                            color: Colors.transparent,
                                          ),
                                        );
                                      }).toList();
                                    },
                                  ),
                                ),
                                lineBarsData: lineBarsData,
                                maxX: widget.xAxisValues.length.toDouble(),
                                minY: widget.firstValueOnYAxis,
                                maxY: 60,
                                baselineY: 0,
                                titlesData: FlTitlesData(
                                  leftTitles: AxisTitles(
                                    sideTitles: SideTitles(
                                      showTitles: true,
                                      interval: widget.incrementOfYAxis,
                                      getTitlesWidget:
                                          (currentValueofYAxis, meta) {
                                        return leftTitleWidgets(
                                          currentValueofYAxis,
                                          meta,
                                          constraints.maxWidth,
                                        );
                                      },
                                      reservedSize: 25,
                                    ),
                                  ),
                                  bottomTitles: AxisTitles(
                                    sideTitles: SideTitles(
                                      showTitles: true,
                                      interval: 1,
                                      getTitlesWidget:
                                          (currentValueofXAxis, meta) {
                                        return bottomTitleWidgets(
                                          currentValueofXAxis,
                                          meta,
                                          constraints.maxWidth,
                                        );
                                      },
                                      reservedSize: 40,
                                    ),
                                  ),
                                  rightTitles: const AxisTitles(
                                    sideTitles: SideTitles(
                                      showTitles: false,
                                    ),
                                  ),
                                  topTitles: const AxisTitles(
                                    sideTitles: SideTitles(
                                      showTitles: false,
                                    ),
                                  ),
                                ),
                                gridData: FlGridData(
                                  show: true,
                                  drawVerticalLine: false,
                                  drawHorizontalLine: true,
                                  horizontalInterval: widget.incrementOfYAxis,
                                  getDrawingHorizontalLine:
                                      (currentValueofYAxis) {
                                    return FlLine(
                                      color: widget.gridLineColor,
                                      strokeWidth: 1.0,
                                    );
                                  },
                                ),
                                borderData: FlBorderData(
                                  show: true,
                                  border: Border(
                                    top: BorderSide(
                                        width: 0.9, color: widget.gridLineColor),
                                    bottom: BorderSide(
                                        width: 0.9, color: widget.gridLineColor),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Container(
                        width: 12,
                        decoration: const BoxDecoration(
                          border: Border(
                            left: BorderSide(
                              color: Color.fromARGB(255, 187, 190, 192),
                              width: 1.0,
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          width: 151,
                          height: 315,
                          padding: const EdgeInsets.only(top: 12),
                          child: Interventions(
                              topInterventions: widget.topInterventions,
                              selectedIndexOfIntervention:
                                  widget.selectedIndexOfIntervention,
                              handleSelectedIndexOfIntervention:
                                  widget.handleSelectedIndexOfIntervention),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      }),
    );
  }
}
