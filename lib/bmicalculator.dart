import 'package:flutter/material.dart';

class BmiCalculator extends StatefulWidget {
  const BmiCalculator({Key? key}) : super(key: key);

  @override
  _BmiCalculatorState createState() => _BmiCalculatorState();
}

Color backcolor = Colors.blue.shade900;
Color backcolorcon = Colors.blue.shade800;
Color coloricon = Colors.white;
double _currentSliderValue = 20;
Color fontcolor = Colors.white;

class _BmiCalculatorState extends State<BmiCalculator> {
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
                  "166 Cm",
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
                Containerhalf1(heading1: "Weight"),
                Containerhalf1(heading1: "Age"),
              ],
            ),
          ),
          Expanded(
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                width: MediaQuery.of(context).size.width * 1,
                color: Colors.blue,
                child: ElevatedButton(
                  child: Text("Calculate Your BMI"),
                  onPressed: () {},
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
  const Containerhalf1({Key? key, required this.heading1}) : super(key: key);
  final String heading1;
  @override
  _Containerhalf1State createState() => _Containerhalf1State();
}

// var heading1 = "Weight";

class _Containerhalf1State extends State<Containerhalf1> {
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
            "64",
            style: TextStyle(
                fontSize: MediaQuery.of(context).size.width * 0.12,
                color: fontcolor),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.remove_circle,
                color: fontcolor,
                size: MediaQuery.of(context).size.width * 0.09,
              ),
              Icon(
                Icons.add_circle,
                color: fontcolor,
                size: MediaQuery.of(context).size.width * 0.09,
              ),
            ],
          )
        ],
      ),
    );
  }
}
