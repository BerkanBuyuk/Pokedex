import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class UIHelper{
  UIHelper._();

  static double getAppTitleWidgetHeight(){
    return ScreenUtil().orientation == Orientation.portrait ? 0.15.sh : 0.15.sw;
  }

  static EdgeInsets getDefaultPadding(){
    if(ScreenUtil().orientation == Orientation.portrait){
      return EdgeInsets.all(12.h);
    }else {
      return EdgeInsets.all(8.w);
    }
  }

  static double getAppImageWidgetWidth(){
    return ScreenUtil().orientation == Orientation.portrait ? 0.2.sh : 0.2.sw;
  }
}