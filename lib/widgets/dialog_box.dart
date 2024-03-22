import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import 'myButton.dart';

class Loading extends StatefulWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 800),
      curve: Curves.fastLinearToSlowEaseIn,
      child: Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        elevation: 0,
        backgroundColor: Colors.transparent,
        child: Stack(
          children: [
            Center(
              child: Container(
                  height: 200,
                  width: 350,
                  decoration: BoxDecoration(
                    color: Colors.black54,
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.black26,
                        blurRadius: 10,
                        offset: Offset(0, 10),
                      ),
                    ],
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SpinKitFadingCircle(
                        color: Colors.white30,
                        size: 30,
                      ),
                      (Text(
                        'Esptouch is configuring.\nPlease wait a moment',
                        style: TextStyle(
                            fontSize: 12, fontWeight: FontWeight.w400),
                      )),
                      // SizedBox(
                      //   height: 30,
                      // ),
                      MyButton(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        //signUpUser,
                        text: 'Cancel',
                      ),
                    ],
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
