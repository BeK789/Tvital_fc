import 'package:flutter/material.dart';
import '../components/ecgchart.dart';
import '../components/etco2chart.dart';
import '../components/spo2chart.dart';
import '../widgets/appBar.dart';

class ChartPage extends StatelessWidget {
  const ChartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // extendBodyBehindAppBar: true,
      appBar: CustomAppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Center(
            child: Column(
              children: [
                SizedBox(
                  height: 20,
                ),
                Container(
                  alignment: Alignment.center,
                  height: 310,
                  width: 350,
                  decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(15),
                      boxShadow: [
                        BoxShadow(
                          color: Color.fromARGB(179, 194, 186, 186)
                              .withOpacity(0.5),
                          spreadRadius: 3,
                          blurRadius: 10,
                          offset: Offset(0, 3),
                        )
                      ]),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 10, right: 10, top: 5),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'ECG Waveform',
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.w100),
                              ),
                              Icon(Icons.health_and_safety_sharp)
                            ],
                          ),
                        ),
                        Container(child: ECGChart()),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 10, right: 10, bottom: 2),
                          child: Row(
                            children: [
                              Text(
                                'Heart Rate',
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.w100),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 2),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'bpm',
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w100,
                                    color: Colors.green[600]),
                              ),
                              Text(
                                '108',
                                style: TextStyle(
                                    fontSize: 25,
                                    fontWeight: FontWeight.w100,
                                    color: Colors.green[600]),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 40,
                ),
                Container(
                  alignment: Alignment.center,
                  height: 310,
                  width: 350,
                  decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(15),
                      boxShadow: [
                        BoxShadow(
                          color: Color.fromARGB(179, 194, 186, 186)
                              .withOpacity(0.5),
                          spreadRadius: 3,
                          blurRadius: 10,
                          offset: Offset(0, 3),
                        )
                      ]),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 10, right: 10, top: 5),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Pulse Oximeter',
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.w100),
                              ),
                              Text(
                                'O2',
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.w100),
                              )
                            ],
                          ),
                        ),
                        Container(child: SpO2Chart()),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 10, right: 10, bottom: 2),
                          child: Row(
                            children: [
                              Text(
                                'SpO2',
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.w100),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 2),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                '%',
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w100,
                                    color: Colors.yellow[400]),
                              ),
                              Text(
                                '108',
                                style: TextStyle(
                                    fontSize: 25,
                                    fontWeight: FontWeight.w100,
                                    color: Colors.yellow[400]),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 40,
                ),
                Container(
                  alignment: Alignment.center,
                  height: 310,
                  width: 350,
                  decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(15),
                      boxShadow: [
                        BoxShadow(
                          color: Color.fromARGB(179, 194, 186, 186)
                              .withOpacity(0.5),
                          spreadRadius: 3,
                          blurRadius: 10,
                          offset: Offset(0, 3),
                        )
                      ]),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 10, right: 10, top: 5),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'End-Tidal-CO2',
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.w100),
                              ),
                              Text(
                                'CO2',
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.w100),
                              )
                            ],
                          ),
                        ),
                        Container(child: EtCO2Chart()),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 10, right: 10, bottom: 2),
                          child: Row(
                            children: [
                              Text(
                                'lmCO2',
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.w100),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 2),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                '%',
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w100,
                                    color: Colors.white70),
                              ),
                              Text(
                                '38',
                                style: TextStyle(
                                    fontSize: 25,
                                    fontWeight: FontWeight.w100,
                                    color: Colors.white70),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
