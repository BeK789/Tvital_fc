import 'package:flutter/material.dart';
import 'package:tvital/screens/chartPage.dart';
import 'package:tvital/widgets/appBar.dart';

class Rooms extends StatefulWidget {
  const Rooms({Key? key}) : super(key: key);

  @override
  State<Rooms> createState() => _RoomsState();
}

class _RoomsState extends State<Rooms> with TickerProviderStateMixin {
  List<String> room_number = ['01', '02', '03', '04'];
  List<String> status = ['Operational', 'Alert', 'Offline', 'Operational'];
  List<String> readings = ['bpm 108', 'Heart Pressure', 'No data', '120/80'];

  void addItemToList() {
    setState(() {
      // Find the next largest room number
      int largestRoomNumber = 0;
      room_number.forEach((room) {
        int? number = int.tryParse(room);
        if (number != null && number > largestRoomNumber) {
          largestRoomNumber = number;
        }
      });

      // Add the new item to the lists
      largestRoomNumber++;
      room_number.add(largestRoomNumber.toString());
      status.add('Offline');
      readings.add('No data');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: addItemToList,
        backgroundColor: Color.fromARGB(
          255,
          129,
          132,
          221,
        ),
        child: Icon(
          Icons.add,
          color: Colors.white,
          size: 35,
        ),
      ),
      appBar: CustomAppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 12),
        child: ListView.builder(
          itemCount: room_number.length,
          itemBuilder: (context, index) => Container(
            width: MediaQuery.of(context).size.width,
            padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ChartPage()),
                );
              },
              child: Container(
                decoration: BoxDecoration(
                  color: status[index] == 'Alert'
                      ? Colors.red.withOpacity(0.5)
                      : Colors.transparent,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: status[index] == 'Alert'
                          ? Colors.red.withOpacity(0.5)
                          : Colors.transparent,
                      spreadRadius: 1,
                      blurRadius: 5,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),
                child: Card(
                  elevation: 0.0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              width: 55,
                              height: 55,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(100),
                              ),
                              child: Icon(
                                status[index] == 'Alert'
                                    ? Icons.error_outlined
                                    : Icons.info,
                                size: 38.0,
                                color: status[index] == 'Alert'
                                    ? Colors.red
                                    : Colors.white,
                              ),
                            ),
                            SizedBox(width: 5),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(4.0),
                                  child: Text('Room ' + room_number[index]),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(4.0),
                                  child: Text('Data'),
                                )
                              ],
                            )
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: Text(
                                status[index],
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: Text(
                                readings[index],
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: status[index] == 'Alert'
                                      ? Colors.red
                                      : Colors.green,
                                ),
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
