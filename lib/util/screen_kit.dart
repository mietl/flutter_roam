import 'package:flutter/material.dart';


class ScreenKit{
  static late   double screenWidth;
  static late  double screenHeight;
  static late  double devicePixelRatio;

  static late  double physicalWidth;
  static late  double  physicalHeight;

  static late  double statusHeight;

  static late  double rpx;
  static late  double px;

  static init(BuildContext context,{ double referSize=750 }){
    // 获取逻辑分辨率
    screenWidth = MediaQuery.of(context).size.width;
    screenHeight =  MediaQuery.of(context).size.height;

    devicePixelRatio = MediaQuery.of(context).devicePixelRatio;

    // 获取物理分辨率
    physicalWidth = screenWidth * devicePixelRatio;
    physicalHeight = screenHeight * devicePixelRatio;


    statusHeight = MediaQuery.of(context).padding.top;

    // 一份占多少
    //  计算 rpx 的大小
    rpx = screenWidth / referSize;
    px =  screenWidth / referSize * 2;
  }

  static double setRpx(double size){
    return size * rpx;
  }

  // 如果设计稿是 px，自动算 rpx;
  static double setPx(double size){
    return size * px;
  }
}