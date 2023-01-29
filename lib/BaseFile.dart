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
double floatingBtnMargin = 10;
int btnSingleWidthPercent = 50;
int btnDoubleWidthPercent = 30;
int btnDoubleGabPercent = 5;
double btnHeight = 50;
// SignInUpPage
double signInPageTFRound = 10;
double signInPageTFBorderWidth = 2;
double signInPageTFLabelFontSize = 20;
int signInPageTFWidthPercent = 90;
double signInPagePerTFGab = 30;
double signInPagePerBtnGab = 20;
double signInPageTF_BTNGab = 70;
// MainPage
int listBoxSizePercent = 70;  // height
double titleImgSize = 60;
double titleImgRound = 20;
double mainListTitleFontSize = 20;
double mainListPaddingSize = 20;
double mainImgTitleThinSize = 30;
// AddImgDialog
double bgOpacity = 0.8;
int bgPageBtnSizePercent = 35;
double bgPageBtnFontSize = 18;
double bgPageGabPerBtn = 20;
double bgPageIconSize = 50;
// ImageListPage
double imgListPageDateFontSize = 18;
double imgListPageDateFontPadding = 10;
double imgListPageDatePadding = 10;
double imgListPageGabPerImg = 5;
// ImageDetailPage
int imgDetailPageBottomBtnMarginPercent = 5;
double imgDetailDialogTitleFontSize = 23;
double imgDetailDialogContentFontSize = 20;
double imgDetailDialogContentPadding = 10;

/// 화면 크기 반환
double getFulLSizePercent(BuildContext context, int percent, bool isWidth){
  if(isWidth)
    return (MediaQuery.of(context).size.width * percent / 100);
  else
    return (MediaQuery.of(context).size.height * percent / 100);
}