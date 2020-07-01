import 'package:bm_calculator/input_material.dart';
import 'package:bm_calculator/reusable.dart';
import 'package:flutter/material.dart';

const titletext = TextStyle(
  fontSize: 20.0,
  fontWeight: FontWeight.bold,
);
const bmicalcu=TextStyle(
  fontSize: 60.0,
  fontWeight: FontWeight.bold,

);
const sayan = TextStyle(
  color: Color(0XFF24D876),
  fontSize: 12.0,
  fontWeight: FontWeight.bold,
);
const bodytextstyle =TextStyle(
  fontSize: 13.0,

);

class Resultpage extends StatelessWidget {
  Resultpage({@required this.interpretation, @required this.bmiResult, @required this.resultText});

  final String bmiResult;
  final String resultText;
  final String interpretation;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('BMI CALCULATOR'),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Expanded(
              child: Container(
                padding: EdgeInsets.all(5.0),
                alignment: Alignment.bottomLeft,
                child: Text(
                  'Your Result',
                  style: titletext,
                ),
              ),
            ),
            Expanded(
              flex: 5,
              child: ReusableCard(
                colour: activeCardColour,
                cardchild: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      resultText.toUpperCase(),
                      style: sayan,
                    ),
                    Text(
                      bmiResult,
                      style: bmicalcu,
                    ),
                    Text(
                      interpretation,
                      textAlign: TextAlign.center,
                      style: bodytextstyle,

                    ),
                   

                  ],
                ),
              ),
            ),
             GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Container(
                child: Center(
                  child: Text(
                    'Re-CALCULATE',
                    style: lastnumberbuyttom,
                  ),
                ),
                color: buttomCardColour,
                margin: EdgeInsets.only(top: 5.0),
                width: double.infinity,
                height: 50.0,
              ),)
          ],
        ));
  }
}
