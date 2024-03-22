import 'dart:async';
import 'dart:math' as math;
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class EtCO2Chart extends StatefulWidget {
  const EtCO2Chart({Key? key}) : super(key: key);

  @override
  State<EtCO2Chart> createState() => _EtCO2ChartState();
}

class _EtCO2ChartState extends State<EtCO2Chart> {
  final List<FlSpot> etco2Data = [];
  double x = 0.0;
  int maxDataPoints = 30; // Maximum number of data points to display
  double step = 0.1; // Step size for x-axis

  late Timer timer;

  @override
  void initState() {
    super.initState();
    timer = Timer.periodic(const Duration(milliseconds: 1000), (timer) {
      setState(() {
        etco2Data.add(FlSpot(x, _generateEtCO2Data()));
        x += step;

        // Remove old data points if the number exceeds maxDataPoints
        if (etco2Data.length > maxDataPoints) {
          etco2Data.removeAt(0);
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return etco2Data.isNotEmpty
        ? AspectRatio(
            aspectRatio: 1.5,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: LineChart(
                LineChartData(
                  lineBarsData: [
                    LineChartBarData(
                      spots: etco2Data,
                      isCurved: false,
                      color: Colors.white70,
                      dotData: FlDotData(show: false),
                      belowBarData: BarAreaData(show: false),
                    ),
                  ],
                  minY: 0, // Minimum Y value
                  maxY: 50, // Maximum Y value (assuming percentage for EtCO2)
                  titlesData: FlTitlesData(show: false),
                  gridData: FlGridData(show: false),
                  borderData: FlBorderData(show: false),
                ),
              ),
            ),
          )
        : Container();
  }

  double _generateEtCO2Data() {
    // Simulate EtCO2 data (can be replaced with real data)
    final double co2 = (20 + math.Random().nextInt(31)) as double;
    return co2; // Random value between 20 and 50
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }
}
