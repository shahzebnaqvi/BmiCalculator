import 'package:bmicalculator/bmicalculator.dart';
import 'package:flutter/material.dart';

Color backcolor = Colors.blue.shade900;
Color backcolorcon = Colors.blue.shade800;

Color backbut = Colors.pink.shade900;
Color backbut21 = Colors.pink.shade50;

Color coloricon = Colors.white;
Color fontcolor = Colors.white;

class Calculate extends StatefulWidget {
  const Calculate(
      {Key? key,
      required this.weightcounter,
      required this.agecounter,
      required this.height,
      required this.gender})
      : super(key: key);
  final weightcounter;
  final agecounter;
  final height;
  final gender;

  @override
  State<Calculate> createState() => _CalculateState();
}

class _CalculateState extends State<Calculate> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backcolor,
      body: Column(
        children: [
          Text("${widget.height}"),
          Center(
              child: containerhalf(
                  context, Icons.male_rounded, "Male", "${widget.agecounter}")),
          Expanded(
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                margin:
                    EdgeInsets.all(MediaQuery.of(context).size.width * 0.02),
                width: MediaQuery.of(context).size.width * 0.95,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(primary: backbut),
                  child: Text("Recalculate Your BMI"),
                  onPressed: () {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => BmiCalculator(),
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

Widget containerhalf(context, iconcont, name, age) {
  return Container(
    padding: EdgeInsets.all(
      MediaQuery.of(context).size.height * 0.05,
    ),
    width: MediaQuery.of(context).size.width * 0.95,
    color: backcolorcon,
    child: Column(
      children: [
        Text(
          "Mild Thickness",
          style: TextStyle(
            color: backbut21,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 10),
          child: Text(
            "18.0",
            style: TextStyle(
                fontSize: MediaQuery.of(context).size.width * 0.12,
                color: fontcolor),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 10),
          child: Text(
            "Normal BMI Range",
            style: TextStyle(
              color: fontcolor,
            ),
          ),
        ),
        Text(
          "18.5 - 25 kg/m2",
          style: TextStyle(
            color: fontcolor,
            fontSize: MediaQuery.of(context).size.width * 0.04,
            fontWeight: FontWeight.bold,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 10),
          child: Text(
            "Your Age",
            style: TextStyle(
              color: backbut,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Text(
          "$age",
          style: TextStyle(
            color: fontcolor,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 10),
          child: Text(
            "underweight",
            style: TextStyle(
              color: fontcolor,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    ),
  );
}
