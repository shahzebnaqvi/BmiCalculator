import 'dart:ffi';

import 'package:bmicalculator/calculate.dart';
import 'package:flutter/material.dart';

class BmiCalculator extends StatefulWidget {
  const BmiCalculator({Key? key}) : super(key: key);

  @override
  _BmiCalculatorState createState() => _BmiCalculatorState();
}

int counter1 = 0;
int counter2 = 0;
double heightcm1 = 0;
String heightcm = "";
Color backcolor = Colors.blue.shade900;
Color backcolorcon = Colors.blue.shade800;

Color backbut = Colors.pink.shade900;
Color backbut21 = Colors.pink.shade50;

Color coloricon = Colors.white;
Color fontcolor = Colors.white;
double _currentSliderValue = 20;

class _BmiCalculatorState extends State<BmiCalculator> {
  height() {
    setState(() {
      heightcm1 = _currentSliderValue;
      heightcm = num.parse(heightcm1.toString()).toStringAsFixed(1);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backcolor,
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.04),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                containerhalf(context, Icons.male_rounded, "Male"),
                containerhalf(context, Icons.female_rounded, "Female"),
              ],
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width * 0.9,
            color: backcolorcon,
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.02,
                    bottom: MediaQuery.of(context).size.height * 0.01,
                  ),
                  child: Text(
                    "Height",
                    style: TextStyle(color: fontcolor),
                  ),
                ),
                Text(
                  "$heightcm",
                  style: TextStyle(fontSize: 40, color: fontcolor),
                ),
                Slider(
                  value: _currentSliderValue,
                  min: 10,
                  max: 1000,
                  activeColor: Colors.white,
                  thumbColor: Colors.red,
                  divisions: 1000,
                  label: _currentSliderValue.round().toString(),
                  onChanged: (double value) {
                    setState(() {
                      _currentSliderValue = value;
                      height();
                    });
                  },
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.04),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Containerhalf1(
                    heading1: "Weight", counter: counter1, indexnum: "1"),
                Containerhalf1(
                    heading1: "Age", counter: counter2, indexnum: "2"),
              ],
            ),
          ),
          Expanded(
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                margin:
                    EdgeInsets.all(MediaQuery.of(context).size.width * 0.02),
                width: MediaQuery.of(context).size.width * 0.95,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(primary: Colors.red),
                  child: Text("Calculate Your BMI"),
                  onPressed: () {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Calculate(
                              weightcounter: counter1,
                              agecounter: counter1,
                              height: "$heightcm",
                              gender: "male"),
                        ));
                  },
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

Widget containerhalf(context, iconcont, name) {
  return Container(
    padding: EdgeInsets.all(
      MediaQuery.of(context).size.width * 0.04,
    ),
    width: MediaQuery.of(context).size.width * 0.45,
    color: backcolorcon,
    child: Column(
      children: [
        Icon(iconcont,
            color: coloricon, size: MediaQuery.of(context).size.width * 0.3),
        Text(
          name,
          style: TextStyle(
              fontSize: MediaQuery.of(context).size.width * 0.06,
              color: fontcolor),
        )
      ],
    ),
  );
}

class Containerhalf1 extends StatefulWidget {
  const Containerhalf1(
      {Key? key,
      required this.heading1,
      required this.counter,
      required this.indexnum})
      : super(key: key);
  final String heading1;
  final int counter;
  final String indexnum;

  @override
  _Containerhalf1State createState() => _Containerhalf1State();
}

int counteraa = 0;
// var heading1 = "Weight";

class _Containerhalf1State extends State<Containerhalf1> {
  void _incrementCounter() {
    setState(() {
      if (widget.indexnum == "1") {
        counter1++;
      } else if (widget.indexnum == "2") {
        counter2++;
      }
      print(counter1);
      print(counter2);
    });
  }

  void _decrementCounter() {
    setState(() {
      // counteraa--;
      // print(counteraa);
      // print(counteraa);
      if (widget.indexnum == "1") {
        counter1--;
      } else if (widget.indexnum == "2") {
        counter2--;
      }
      print(counter1);
      print(counter2);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(
        MediaQuery.of(context).size.width * 0.04,
      ),
      width: MediaQuery.of(context).size.width * 0.45,
      color: backcolorcon,
      child: Column(
        children: [
          Text(
            "${widget.heading1}",
            style: TextStyle(
                fontSize: MediaQuery.of(context).size.width * 0.05,
                color: fontcolor),
          ),
          Text(
            "${widget.counter}",
            style: TextStyle(
                fontSize: MediaQuery.of(context).size.width * 0.12,
                color: fontcolor),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InkWell(
                onTap: () {
                  _decrementCounter();
                },
                child: Icon(
                  Icons.remove_circle,
                  color: fontcolor,
                  size: MediaQuery.of(context).size.width * 0.09,
                ),
              ),
              InkWell(
                onTap: () {
                  _incrementCounter();
                },
                child: Icon(
                  Icons.add_circle,
                  color: fontcolor,
                  size: MediaQuery.of(context).size.width * 0.09,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
