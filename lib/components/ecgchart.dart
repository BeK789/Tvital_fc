import 'dart:async';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;

class ECGChart extends StatefulWidget {
  const ECGChart({Key? key}) : super(key: key);

  @override
  State<ECGChart> createState() => _ECGChartState();
}

class _ECGChartState extends State<ECGChart> {
  final List<FlSpot> ecgData = [];
  double x = 0.0;
  int maxDataPoints = 80; // Maximum number of data points to display
  double step = 0.1; // Step size for x-axis

  late Timer timer;

  @override
  void initState() {
    super.initState();
    timer = Timer.periodic(const Duration(milliseconds: 100), (timer) {
      setState(() {
        ecgData.add(FlSpot(x, _generateECGData(x)));
        x += step;

        // Remove old data points if the number exceeds maxDataPoints
        if (ecgData.length > maxDataPoints) {
          ecgData.removeAt(0);
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return ecgData.isNotEmpty
        ? AspectRatio(
            aspectRatio: 1.5,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: LineChart(
                LineChartData(
                  lineBarsData: [
                    LineChartBarData(
                      spots: ecgData,
                      isCurved: false,
                      color: Colors.green,
                      dotData: FlDotData(show: false),
                      belowBarData: BarAreaData(show: false),
                    ),
                  ],
                  minY: -1.0, // Minimum Y value
                  maxY: 1.0, // Maximum Y value
                  titlesData: FlTitlesData(show: false),
                  gridData: FlGridData(show: false),
                  borderData: FlBorderData(show: false),
                ),
              ),
            ),
          )
        : Container();
  }

  double _generateECGData(double x) {
    // Simulate ECG data (can be replaced with real data)
    // ECG waveform is typically a combination of sinusoidal waves
    final double sin1 = 0.7 * math.sin(2 * math.pi * x);
    final double sin2 = 0.3 * math.sin(6 * math.pi * x);
    final double sin3 = 0.1 * math.sin(14 * math.pi * x);
    return sin1 + sin2 + sin3;
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }
}
