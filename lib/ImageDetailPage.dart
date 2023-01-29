import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'BaseFile.dart';
import 'GetControllers.dart';

import 'AppBar_Drawer.dart';

class ImageDetailPage extends StatefulWidget {
  @override
  State<ImageDetailPage> createState() => _ImageDetailPage();
}

class _ImageDetailPage extends State<ImageDetailPage> {
  bool showOnlyImg = false;
  ImageDetailObj img = ImageDetailObj(
      1, Image.asset('assets/img/test3.jpg'), DateTime.now(), '카테고리');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: showOnlyImg ? Colors.black : Colors.white,
        appBar: showOnlyImg ? null : MyAppBar(true),
        extendBodyBehindAppBar: true,
        // 앱바 겹치게
        /// 하단 버튼
        floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
        floatingActionButton: Container(
          margin: EdgeInsets.only(
              bottom: getFulLSizePercent(
                  context, imgDetailPageBottomBtnMarginPercent, false)),
          child: showOnlyImg
              ? null
              : Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    /// 정보 버튼
                    ElevatedButton(
                      onPressed: () {
                        showDialog(
                            context: context,

                            /// 상세 정보 다이얼로그
                            builder: (context) => AlertDialog(
                                  title: Text(
                                    '상세 정보',
                                    textAlign: TextAlign.center,
                                  ),
                                  titleTextStyle: TextStyle(
                                      color: Color(color_deepMint),
                                      fontSize: imgDetailDialogTitleFontSize),
                                  content: Padding(
                                    padding: EdgeInsets.all(
                                        imgDetailDialogContentPadding),
                                    child: Container(
                                      height: getFulLSizePercent(context, 15, false),
                                      child: SingleChildScrollView(
                                        child: Column(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              '파일이름',
                                              style: TextStyle(
                                                color: Color(color_deepMint),
                                                fontSize:
                                                    imgDetailDialogContentFontSize,
                                              ),
                                            ),
                                            Text(
                                              '${img.uploadedAt.year}년 ${img.uploadedAt.year}월 ${img.uploadedAt.year}일 업로드됨',
                                              style: TextStyle(
                                                color: Color(color_deepMint),
                                                fontSize:
                                                    imgDetailDialogContentFontSize,
                                              ),
                                            ),
                                            Row(
                                              children: [
                                                Text(
                                                  '분류: ',
                                                  style: TextStyle(
                                                    color: Color(color_deepMint),
                                                    fontSize:
                                                        imgDetailDialogContentFontSize,
                                                  ),
                                                ),Text(
                                                  '\t\t' + img.category + '\t\t',
                                                  style: TextStyle(
                                                    color: Color(color_deepMint),
                                                    fontSize:
                                                        imgDetailDialogContentFontSize,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),actions: [TextButton(onPressed: (){}, child: Text('a'))],
                                ));
                      },
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(100)),
                        backgroundColor: Color(color_whiteMint),
                        minimumSize: Size(
                            getFulLSizePercent(
                                context, btnDoubleWidthPercent, true),
                            btnHeight),
                      ),
                      child: Text(
                        '정보',
                        style: TextStyle(
                            color: Color(color_deepMint),
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    Container(
                      width: getFulLSizePercent(
                          context, btnDoubleGabPercent, true),
                    ),

                    /// 삭제 버튼
                    ElevatedButton(
                      onPressed: () {
                        Get.back();
                      },
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(100)),
                        backgroundColor: Color(color_whiteMint),
                        minimumSize: Size(
                            getFulLSizePercent(
                                context, btnDoubleWidthPercent, true),
                            btnHeight),
                      ),
                      child: Text(
                        '삭제',
                        style: TextStyle(
                            color: Color(color_deepMint),
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                    )
                  ],
                ),
        ),

        /// 이미지
        body: GestureDetector(
          onTap: () {
            setState(() {
              showOnlyImg = !showOnlyImg;
            });
          },
          child: Container(
              height: double.infinity,
              color: Colors.transparent,
              alignment: Alignment.center,
              child: img.img),
        ));
  }
}

/// 이미지 객체
class ImageDetailObj {
  final int id;
  final Image img;
  final DateTime uploadedAt;
  final String category;

  // 생성자
  ImageDetailObj(int id, Image img, DateTime uploadedAt, String category)
      : this.id = id,
        this.img = img,
        this.uploadedAt = uploadedAt,
        this.category = category;
}
