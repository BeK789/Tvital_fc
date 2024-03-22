import 'dart:async';
import 'dart:math' as math;
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class SpO2Chart extends StatefulWidget {
  const SpO2Chart({Key? key}) : super(key: key);

  @override
  State<SpO2Chart> createState() => _SpO2ChartState();
}

class _SpO2ChartState extends State<SpO2Chart> {
  final List<FlSpot> spo2Data = [];
  double x = 0.0;
  int maxDataPoints = 50; // Maximum number of data points to display
  double step = 0.1; // Step size for x-axis

  late Timer timer;

  @override
  void initState() {
    super.initState();
    timer = Timer.periodic(const Duration(milliseconds: 1000), (timer) {
      setState(() {
        spo2Data.add(FlSpot(x, _generateSpo2Data()));
        x += step;

        // Remove old data points if the number exceeds maxDataPoints
        if (spo2Data.length > maxDataPoints) {
          spo2Data.removeAt(0);
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return spo2Data.isNotEmpty
        ? AspectRatio(
            aspectRatio: 1.5,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: LineChart(
                LineChartData(
                  lineBarsData: [
                    LineChartBarData(
                      spots: spo2Data,
                      isCurved: false,
                      color: Colors.yellow[400],
                      dotData: FlDotData(show: false),
                      belowBarData: BarAreaData(show: false),
                    ),
                  ],
                  minY: 0, // Minimum Y value
                  maxY: 100, // Maximum Y value (assuming percentage for SpO2)
                  titlesData: FlTitlesData(show: false),
                  gridData: FlGridData(show: false),
                  borderData: FlBorderData(show: false),
                ),
              ),
            ),
          )
        : Container();
  }

  double _generateSpo2Data() {
    // Simulate SpO2 data (can be replaced with real data)
    final double spo2 = (90 + math.Random().nextInt(11)) as double;
    return spo2; // Random value between 90 and 100
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }
}
