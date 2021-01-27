import 'package:flutter/material.dart';
import 'dart:math';
class Calculation  {


  Calculation({@required this.hight,@required this.weight});
  final int hight;
  final int weight;

  double _bmi;

  String calculateBmi(){

     _bmi=(weight/pow(hight/100, 2));
    return _bmi.toStringAsFixed(1);
  }

  String bmiStatus(){
     if(_bmi>=30){
       return 'Obese';
     }else if(_bmi>=25 ){
       return 'Overweight';
     }else if(_bmi>=18.5 ){
       return 'Normal ';
     }else{
       return 'Underweight ';
     }
  }

   String bmiComments(){
     if(_bmi>=30){
       return 'Cut Back on Sugars and Starches | Eat Protein , Vegetable | Do exercise ';
     }else if(_bmi>=25 ){
       return 'Cut Back on Sugars and Starches | Eat Protein , Vegetable | Do exercise';
     }else if(_bmi>=18.5 ){
       return 'Great Job | Carry On ';
     }else{
       return 'Take more Food ';
     }
  }

  
}