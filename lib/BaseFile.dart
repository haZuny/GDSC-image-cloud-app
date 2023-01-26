import 'package:flutter/cupertino.dart';

/// Color
int color_deepMint = 0xff246D7D;
int color_whiteMint = 0xffA9DBE6;
int color_mint = 0xff4DB5CB;

/// Size
// 공통
double btnHeightSize = 50;
double btnWidthSize = 200;
double btnFontSize = 15;
double btnRound = 20;
double appBarMenuPaddingSize = 15;
double appBarDropDownWidth = 150;
double appBarDropDownIconSize = 30;
// MainPage
int listBoxSizePercent = 70;
double titleImgSize = 60;
double titleImgRound = 20;
double mainListTitleFontSize = 20;
double mainListPaddingSize = 20;
double mainImgTitleThinSize = 30;


/// 화면 크기 반환
double getFulLSizePercent(BuildContext context, int percent, bool isWidth){
  if(isWidth)
    return (MediaQuery.of(context).size.width * percent / 100);
  else
    return (MediaQuery.of(context).size.height * percent / 100);
}