import 'package:bm_calculator/result_page.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'reusable.dart';
import 'icon.dart';
import 'result_page.dart';
import 'brain.dart';

const activeCardColour = Color(0XFF1D1E33);
const inactiveCardColour = Color(0XFF111328);
const buttomCardColour = Color(0XFFEB1555);
const lastnumberbuyttom = TextStyle(
  fontSize: 25.0,
  fontWeight: FontWeight.bold,
);

const labeltextstyle = TextStyle(
  color: Color(0XFF8D8E98),
  fontSize: 18.0,
);

const numbertextstyle = TextStyle(
  fontSize: 50.0,
  fontWeight: FontWeight.w900,
);

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  int height = 180;
  int weight = 60;
  int age = 14;
  Color malecolor = inactiveCardColour;
  Color femalecolor = activeCardColour;
  void Updatecolor(int gender) {
    if (gender == 1) {
      if (malecolor == inactiveCardColour) {
        malecolor = activeCardColour;
      } else {
        malecolor = inactiveCardColour;
        femalecolor = activeCardColour;
      }
    }
    if (gender == 2) {
      if (femalecolor == inactiveCardColour) {
        femalecolor = activeCardColour;
      } else {
        femalecolor = inactiveCardColour;
        malecolor = activeCardColour;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('BMI Calculator'),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Expanded(
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          Updatecolor(1);
                        });
                      },
                      child: ReusableCard(
                        colour: malecolor,
                        cardchild: IconContent(
                          icon: FontAwesomeIcons.mars,
                          label: 'MALE',
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          Updatecolor(2);
                        });
                      },
                      child: ReusableCard(
                        colour: femalecolor,
                        cardchild: IconContent(
                          icon: FontAwesomeIcons.venus,
                          label: 'FEMALE',
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: ReusableCard(
                colour: activeCardColour,
                cardchild: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'HEIGHT',
                      style: labeltextstyle,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: <Widget>[
                        Text(
                          height.toString(),
                          style: numbertextstyle,
                        ),
                        Text(
                          'cm',
                          style: labeltextstyle,
                        ),
                      ],
                    ),
                    SliderTheme(
                      data: SliderTheme.of(context).copyWith(
                        inactiveTrackColor: Color(0XFF8D8E98),
                        activeTrackColor: Colors.white,
                        thumbColor: Color(0XFFEB1555),
                        overlayColor: Color(0X15EB1555),
                        thumbShape:
                            RoundSliderThumbShape(enabledThumbRadius: 15.0),
                        overlayShape:
                            RoundSliderOverlayShape(overlayRadius: 30.0),
                      ),
                      child: Slider(
                        value: height.toDouble(),
                        min: 120.0,
                        max: 220.0,
                        onChanged: (double newValue) {
                          setState(() {});
                          height = newValue.round();
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: ReusableCard(
                      colour: activeCardColour,
                      cardchild: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            'WEIGHT',
                            style: labeltextstyle,
                          ),
                          Text(
                            weight.toString(),
                            style: numbertextstyle,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              RoundIconButton(
                                  icon: FontAwesomeIcons.minus,
                                  onPressed: () {
                                    setState(() {
                                      weight--;
                                    });
                                  }),
                              SizedBox(
                                width: 10.0,
                              ),
                              RoundIconButton(
                                  icon: FontAwesomeIcons.plus,
                                  onPressed: () {
                                    setState(() {
                                      weight++;
                                    });
                                  }),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: ReusableCard(
                      colour: activeCardColour,
                      cardchild: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            'AGE',
                            style: labeltextstyle,
                          ),
                          Text(
                            age.toString(),
                            style: numbertextstyle,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              RoundIconButton(
                                  icon: FontAwesomeIcons.minus,
                                  onPressed: () {
                                    setState(() {
                                      age--;
                                    });
                                  }),
                              SizedBox(
                                width: 10.0,
                              ),
                              RoundIconButton(
                                  icon: FontAwesomeIcons.plus,
                                  onPressed: () {
                                    setState(() {
                                      age++;
                                    });
                                  })
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            GestureDetector(
              onTap: () {
                calculatorbrain calc =
                    calculatorbrain(height: height, weight: weight);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Resultpage(
                      bmiResult:calc.calculateBmi() ,
                      resultText:calc.getresult() ,
                      interpretation:calc.getInterpretation() ,
                    ),
                  ),
                );
              },
              child: Container(
                child: Center(
                  child: Text(
                    'CALCULATE',
                    style: lastnumberbuyttom,
                  ),
                ),
                color: buttomCardColour,
                margin: EdgeInsets.only(top: 10.0),
                width: double.infinity,
                height: 70.0,
              ),
            ),
          ],
        ));
  }
}

class RoundIconButton extends StatelessWidget {
  RoundIconButton({@required this.icon, @required this.onPressed});
  final IconData icon;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      child: Icon(icon),
      onPressed: onPressed,
      elevation: 0.0,
      constraints: BoxConstraints.tightFor(
        width: 30.0,
        height: 35.0,
      ),
      shape: CircleBorder(),
      fillColor: Color(0XFF4C4F5E),
    );
  }
}
