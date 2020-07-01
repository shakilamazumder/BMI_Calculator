import 'dart:math';

import 'package:flutter/cupertino.dart';

class calculatorbrain{
  calculatorbrain({@required this.height, @required this.weight
  });
  final int height;
  final int weight;
  double _bmi;

String calculateBmi(){
  _bmi= weight/ pow( height / 100, 2);
  return _bmi.toStringAsFixed(1);
}
String getresult(){
  if(_bmi>=25){
    return 'Overwweight';
  }
  else if(_bmi>18.5){
    return 'Normal';
  }
  else{
    return 'Underweight';
  }
}

String getInterpretation(){
  if(_bmi>=25){
    return 'You have heigher than normal body weight.Try to exercise more.';
  }
  else if(_bmi>18.5){
    return 'You have a normal body weight.Good Job!';
  }
  else{
    return 'You have lower than normal body weight.You can eat a bit more';
  }
}

}