import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class LineChartNumericXAxis extends StatefulWidget {
  const LineChartNumericXAxis({
    Key? key,
    required this.title,
    required this.lineColor,
    required this.indicatorStrokeColor,
    required this.indicatorPaddingStrokeColor,
    required this.gridLineColor,
    required this.firstValueOnXAxis,
    required this.incrementOfXAxis,
    required this.maxValueOnXAxis,
    required this.firstValueOnYAxis,
    required this.incrementOfYAxis,
    required this.xAxisPosition,
    required this.indicatorSpotIndex,
    required this.allSpots,
    required this.fixedPoint,
    required this.widthOfLeftScaleMarks,
  }) : super(key: key);

  final String title;
  final Color lineColor;
  final Color indicatorStrokeColor;
  final int indicatorSpotIndex;
  final Color indicatorPaddingStrokeColor;
  final Color gridLineColor;
  final double firstValueOnXAxis;
  final double incrementOfXAxis;
  final double maxValueOnXAxis;
  final double firstValueOnYAxis;
  final double incrementOfYAxis;
  final double xAxisPosition;
  final List<FlSpot> allSpots;
  final int fixedPoint;
  final double widthOfLeftScaleMarks;

  @override
  State<LineChartNumericXAxis> createState() => _LineChartNumericXAxis();
}

class _LineChartNumericXAxis extends State<LineChartNumericXAxis> {
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
      fontFamily: 'poppins',
      fontSize: 12,
      fontWeight: FontWeight.w400,
      height: 0,
    );

    return SideTitleWidget(
      fitInside: SideTitleFitInsideData(
          enabled: true,
          distanceFromEdge: 0,
          parentAxisSize: 0,
          axisPosition: widget.xAxisPosition),
      space: 22,
      axisSide: meta.axisSide,
      child: Text(value.toString(), style: style),
    );
  }

  Widget leftTitleWidgets(double value, double chartWidth) {
    const style = TextStyle(
      color: Color(0xFFB3B3B3),
      fontFamily: 'poppins',
      fontSize: 12,
      fontWeight: FontWeight.w400,
      height: 0,
    );

    return SideTitleWidget(
      space: 5,
      axisSide: AxisSide.left,
      child: Text(
        value.toStringAsFixed(widget.fixedPoint),
        style: style,
        maxLines: 1,
      ),
    );
  }

  Widget chartHeader(BuildContext context) {
    return Container(
      width: 478.83,
      height: 43,
      padding: const EdgeInsets.only(
        top: 12,
        left: 12,
        right: 12,
        bottom: 10,
      ),
      decoration: const BoxDecoration(
        border: Border(
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
    final lineBarsData = [
      LineChartBarData(
        showingIndicators: showingTooltipOnSpots,
        spots: allSpots,
        isCurved: true,
        barWidth: 3,
        dotData: const FlDotData(show: false),
        color: widget.lineColor,
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
              SizedBox(
                width: 478.83,
                height: 313,
                child: ClipRect(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(12, 12, 0, 12),
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
                          getTouchedSpotIndicator: (LineChartBarData barData,
                              List<int> spotIndexes) {
                            return spotIndexes.map((index) {
                              return TouchedSpotIndicatorData(
                                const FlLine(
                                  color: Color.fromARGB(0, 240, 7, 7),
                                ),
                                FlDotData(
                                  show: true,
                                  getDotPainter:
                                      (spot, percent, barData, index) =>
                                          FlDotCirclePainter(
                                    radius: 4,
                                    color: widget.indicatorStrokeColor,
                                    strokeWidth: 2,
                                    strokeColor:
                                        widget.indicatorPaddingStrokeColor,
                                  ),
                                ),
                              );
                            }).toList();
                          },
                          touchTooltipData: LineTouchTooltipData(
                            tooltipBgColor: Colors.transparent,
                            getTooltipItems: (List<LineBarSpot> lineBarsSpot) {
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
                        maxX: widget.maxValueOnXAxis,
                        minX: widget.firstValueOnXAxis,
                        minY: widget.firstValueOnYAxis,
                        titlesData: FlTitlesData(
                          leftTitles: AxisTitles(
                            sideTitles: SideTitles(
                              showTitles: true,
                              interval: widget.incrementOfYAxis,
                              getTitlesWidget: (currentValueofYAxis, meta) {
                                return leftTitleWidgets(
                                  currentValueofYAxis,
                                  constraints.maxWidth,
                                );
                              },
                              reservedSize: widget.widthOfLeftScaleMarks,
                            ),
                          ),
                          bottomTitles: AxisTitles(
                            sideTitles: SideTitles(
                              showTitles: true,
                              interval: widget.incrementOfXAxis,
                              getTitlesWidget: (currentValueofXAxis, meta) {
                                return bottomTitleWidgets(
                                  currentValueofXAxis,
                                  meta,
                                  constraints.maxWidth,
                                );
                              },
                              reservedSize: 35,
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
                          getDrawingHorizontalLine: (currentValueofYAxis) {
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
                ),
              ),
            ],
          ),
        );
      }),
    );
  }
}
