import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Constants{
  Constants._();

  static const String title = 'Pokedex';
  static TextStyle getTitleTextStyle(){
    return TextStyle(
      color: Colors.white,
      fontWeight: FontWeight.bold,
      fontSize: _caculateFontSize(48),
    );
  }

  static TextStyle getPokemonNameTextStyle(){
    return TextStyle(
      color: Colors.white,
      fontWeight: FontWeight.bold,
      fontSize: _caculateFontSize(20),
    );
  }

  static TextStyle getPokemonTypeTextStyle(){
    return TextStyle(
      color: Colors.white,
      fontSize: _caculateFontSize(15),
    );
  }

  static _caculateFontSize(int size){
    if(ScreenUtil().orientation == Orientation.portrait){
      return size.sp;
    }else{
      return (size * 1.05).sp;
    }
  }


}