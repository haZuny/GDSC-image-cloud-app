import 'package:flutter/cupertino.dart';

/// API
String hostURL = 'http://52.78.194.113:8080/';
String uid = '';
String token = '';
String refToken = '';

/// Category Label
Map categoryLabel = {
  'ANIMAL': '동물',
  'FOOD': '음식',
  'INDOOR': '실내',
  'MOBILITY': '자동차',
  'OUTDOOR': '풍경',
  'PERSON': '인물',
  'OTHER': '그 외'
};

/// 이미지 객체
class ImageObj {
  final int phothID;
  final Image photo;
  final DateTime uploadAt;
  final String category;
  final String filePath;

  // 생성자
  const ImageObj(
      int id, Image img, String category, DateTime date, String filePath)
      : phothID = id,
        photo = img,
        this.category = category,
        uploadAt = date,
        this.filePath = filePath;
}

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
int listBoxSizePercent = 70; // height
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
double imgDetailDialogTitleFontSize = 20;
double imgDetailDialogContentFontSize = 17;
double imgDetailDialogContentPadding = 10;
double imgDetailDialogRound = 20;
// UploadImgPage
double uploadImgPagePadding = 15;
int uploadImgPageCategoryGabPercent = 10;
int uploadImgPageContentsGabPercent = 5;

/// 화면 크기 반환
double getFulLSizePercent(BuildContext context, int percent, bool isWidth) {
  if (isWidth)
    return (MediaQuery.of(context).size.width * percent / 100);
  else
    return (MediaQuery.of(context).size.height * percent / 100);
}
