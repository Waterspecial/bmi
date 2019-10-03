import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new HomeState();
  }
}

class HomeState extends State<Home> {
  final TextEditingController _ageController = new TextEditingController();
  final TextEditingController _heightController = new TextEditingController();
  final TextEditingController _weightController = new TextEditingController();
  double inches = 0.0;
  double result = 0.0;
  String BmIndex = "";
  String CalculatedBmi = "";

  void _calculator() {
    setState(() {
      int age = int.parse(_ageController.text);
      double height = double.parse(_heightController.text);
      inches = height * 12;
      double weight = double.parse(_weightController.text);

      if ((_ageController.text.isNotEmpty || age > 0) &&
          ((_heightController.text.isNotEmpty || inches > 0) &&
              (_weightController.text.isNotEmpty || weight > 0))) {
        result = weight / (inches * inches) * 703;

        if (double.parse(result.toStringAsFixed(1)) < 18.5) {
          BmIndex = "UnderWeight";
          print(BmIndex);
        } else if (double.parse(result.toStringAsFixed(1)) >= 18.5 &&
            result < 25) {
          BmIndex = "Normal Weight: You are in great Shape";
          print(BmIndex);
        } else if (double.parse(result.toStringAsFixed(1)) >= 25.0 &&
            result < 30) {
          BmIndex = "Overweight";
          print(BmIndex);
        } else if (double.parse(result.toStringAsFixed(1)) >= 30) {
          BmIndex = "Obese";
          print(BmIndex);
        }
      } else {
        result = 0.0;
      }
    });
    CalculatedBmi = "Your BMI: ${result.toStringAsFixed(1)}";
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("BMI"),
        centerTitle: true,
        backgroundColor: Colors.pinkAccent,
      ),
      backgroundColor: Colors.white,
      body: new Container(
        alignment: Alignment.center,
        child: new ListView(
          padding: const EdgeInsets.all(1.0),
          children: <Widget>[
            new Image.asset('images/111bmilogo.png',
                width: 80.0, height: 100.0),
            new Padding(padding: new EdgeInsets.all(4.9)),
            new Container(
              width: 290.0,
              height: 315.0,
              color: Colors.grey.shade300,
              child: new Column(
                children: <Widget>[
                  new Padding(padding: new EdgeInsets.all(5.9)),
                  new TextField(
                    controller: _ageController,
                    keyboardType: TextInputType.number,
                    decoration: new InputDecoration(
                        hintText: "e.g 34",
                        labelText: "Age",
                        icon: new Icon(Icons.person)),
                  ),
                  new Padding(padding: new EdgeInsets.all(16.9)),
                  new TextField(
                    controller: _heightController,
                    keyboardType: TextInputType.number,
                    decoration: new InputDecoration(
                        hintText: " 6.0' ",
                        labelText: "Height in feet",
                        icon: new Icon(Icons.insert_chart)),
                  ),
                  new Padding(padding: new EdgeInsets.all(16.9)),
                  new TextField(
                    controller: _weightController,
                    keyboardType: TextInputType.number,
                    decoration: new InputDecoration(
                        hintText: "150",
                        labelText: "Weight in ib",
                        icon: new Icon(Icons.line_weight)),
                  ),
                  new Padding(padding: new EdgeInsets.all(11.9)),
                  new Container(
                    alignment: Alignment.center,
                    child: new RaisedButton(
                      onPressed: _calculator,
                      color: Colors.pinkAccent,
                      child: new Text("Calculate"),
                      textColor: Colors.white,
                    ),
                  )
                ],
              ),
            ),
            new Padding(padding: new EdgeInsets.all(6.0)),
            new Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                new Text(
                  "$CalculatedBmi",
                  style: new TextStyle(
                      color: Colors.blueAccent,
                      fontSize: 28.0,
                      fontWeight: FontWeight.w500,
                      fontStyle: FontStyle.italic),
                ),
                new Text(
                  "$BmIndex",
                  style: new TextStyle(
                      color: Colors.pinkAccent,
                      fontSize: 28.0,
                      fontWeight: FontWeight.w500,
                      fontStyle: FontStyle.normal),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
