import 'package:flutter/material.dart';
import 'package:tvital/screens/login_screen.dart';
import 'package:tvital/widgets/dialog_box.dart';
import 'package:tvital/widgets/dialog_box2.dart';

import '../widgets/myButton.dart';

class SmartConfig extends StatefulWidget {
  const SmartConfig({Key? key}) : super(key: key);

  @override
  _SmartConfigState createState() => _SmartConfigState();
}

class _SmartConfigState extends State<SmartConfig> {
  String groupValue = "Broadcast";
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Stack(
          children: [
            Column(
              children: [
                Row(
                  children: [
                    Container(
                      margin: EdgeInsets.only(left: 35, right: 35, top: 20),
                      child: CircleAvatar(
                        radius: 20,
                        backgroundColor: Color.fromARGB(255, 62, 63, 67),
                        child: IconButton(
                            color: Colors.white,
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Login()),
                              );
                            },
                            icon: Icon(
                              Icons.arrow_back,
                            )),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Center(
                  child: Text(
                    'Tvital',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 33,
                        fontWeight: FontWeight.w500),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Row(
                  children: [
                    Container(
                      margin: EdgeInsets.only(left: 35, right: 35, top: 25),
                      child: Text(
                        'EspTouch: SmartConfig',
                        style: TextStyle(color: Colors.white, fontSize: 25),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 30,
                ),
                Row(
                  children: [
                    Container(
                      margin: EdgeInsets.only(left: 35, right: 35),
                      child: Text(
                        'SSID: TechTOnions\nBSSID: 02:00:00:00:00',
                        style: TextStyle(
                            color: Color.fromARGB(255, 170, 159, 159),
                            fontSize: 17),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.5),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsets.only(left: 35, right: 35),
                      child: Column(
                        children: [
                          Container(
                            child: Text(
                              'Password:',
                              style: TextStyle(
                                  color: Color.fromARGB(255, 216, 209, 209),
                                  fontSize: 19),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          TextField(
                            style: TextStyle(color: Colors.black),
                            decoration: InputDecoration(
                                fillColor: Colors.grey.shade100,
                                filled: true,
                                hintText: "Type Your Password",
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                )),
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          Column(
                            children: [
                              Text(
                                'Type of Cast',
                                style: TextStyle(
                                    color: Color.fromARGB(255, 216, 209, 209),
                                    fontSize: 19),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    padding: EdgeInsets.symmetric(
                                        vertical: 5, horizontal: 20),
                                    margin:
                                        EdgeInsets.symmetric(horizontal: 22),
                                    decoration: BoxDecoration(
                                        color: Color.fromARGB(255, 88, 89, 90),
                                        borderRadius:
                                            BorderRadius.circular(30)),
                                    child: Row(
                                      children: [
                                        Text(
                                          "Broadcast",
                                          style: TextStyle(
                                              fontSize: 17,
                                              color: Colors.white,
                                              fontWeight: FontWeight.w100),
                                        ),
                                        Radio(
                                          value: "Broadcast",
                                          groupValue: groupValue,
                                          onChanged: (value) {
                                            setState(() {
                                              groupValue = value!;
                                            });
                                          },
                                        ),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    padding: EdgeInsets.symmetric(
                                        vertical: 5, horizontal: 20),
                                    margin:
                                        EdgeInsets.symmetric(horizontal: 22),
                                    decoration: BoxDecoration(
                                        color: Color.fromARGB(255, 88, 89, 90),
                                        borderRadius:
                                            BorderRadius.circular(30)),
                                    child: Row(
                                      children: [
                                        Text(
                                          "Multicast",
                                          style: TextStyle(
                                              fontSize: 17,
                                              color: Colors.white,
                                              fontWeight: FontWeight.w100),
                                        ),
                                        Radio(
                                          value: "Multicast",
                                          groupValue: groupValue,
                                          onChanged: (value) {
                                            setState(() {
                                              groupValue = value!;
                                            });
                                          },
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          MyButton(
                            onTap: () {
                              showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return Success();
                                    Future.delayed(Duration(seconds: 2), () {
                                      Navigator.of(context).pop();
                                      Success();
                                    });
                                    // context = context;
                                    // return Loading();
                                  });
                            },
                            text: 'Confirm',
                          ),
                          SizedBox(
                            height: 20,
                          ),
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
    );
  }
}
