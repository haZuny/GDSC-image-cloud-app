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
  /// 화면 상태
  bool showOnlyImg = false;
  late ImageDetailObj img;

  /// 카테고리
  String categoryVal = '';

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    img = ImageDetailObj(
        1, Image.asset('assets/img/test3.jpg'), DateTime.now(), 'animal');
    categoryVal = img.category;
  }

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
                      builder: (context) =>
                          StatefulBuilder(
                            builder: (context, setState2) {
                              return AlertDialog(
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
                                  child: SingleChildScrollView(
                                    child: Column(
                                      mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                      crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          height: 48,
                                          alignment: Alignment.centerLeft,
                                          child: Text(
                                            '파일이름',
                                            style: TextStyle(
                                              color: Color(color_deepMint),
                                              fontSize:
                                              imgDetailDialogContentFontSize,
                                            ),
                                          ),
                                        ),
                                        Container(
                                          height: 48,
                                          alignment: Alignment.centerLeft,
                                          child: Text(
                                            '${img.uploadedAt.year}년 ${img.uploadedAt
                                                .month}월 ${img.uploadedAt.day}일 업로드',
                                            style: TextStyle(
                                              color: Color(color_deepMint),
                                              fontSize:
                                              imgDetailDialogContentFontSize,
                                            ),
                                          ),
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              '분류: ',
                                              style: TextStyle(
                                                color: Color(color_deepMint),
                                                fontSize:
                                                imgDetailDialogContentFontSize,
                                              ),
                                            ),
                                            Expanded(
                                              child: Container(
                                                alignment: Alignment.center,
                                                child: DropdownButton(
                                                  items: [
                                                    DropdownMenuItem(
                                                      child: Text('동물'),
                                                      value: 'animal',
                                                    ),
                                                    DropdownMenuItem(
                                                      child: Text('음식'),
                                                      value: 'food',
                                                    ),
                                                    DropdownMenuItem(
                                                      child: Text('실내'),
                                                      value: 'indoor',
                                                    ),
                                                    DropdownMenuItem(
                                                      child: Text('자동차'),
                                                      value: 'mobility',
                                                    ),
                                                    DropdownMenuItem(
                                                      child: Text('풍경'),
                                                      value: 'outdoor',
                                                    ),
                                                    DropdownMenuItem(
                                                      child: Text('인물'),
                                                      value: 'person',
                                                    ),
                                                    DropdownMenuItem(
                                                      child: Text('그 외'),
                                                      value: 'other',
                                                    ),
                                                  ],
                                                  // 변경 메소드
                                                  onChanged: (val) {
                                                      setState2((){
                                                        categoryVal = val.toString();
                                                      });
                                                  },
                                                  value: categoryVal,
                                                  style: TextStyle(
                                                    color: Color(color_deepMint),
                                                    fontSize:
                                                    imgDetailDialogContentFontSize,
                                                    fontWeight: FontWeight.bold
                                                  ),
                                                  alignment: Alignment.center,
                                                  underline: Container(),
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                actions: [
                                  /// 닫기 버튼
                                  TextButton(
                                    onPressed: () {
                                      Get.back();
                                    },
                                    child: Text(
                                      '닫기',
                                      style: TextStyle(
                                        color: Color(color_deepMint),
                                        fontSize:
                                        imgDetailDialogContentFontSize,
                                      ),
                                    ),
                                  )
                                ],
                                actionsAlignment: MainAxisAlignment.center,
                                shape: OutlineInputBorder(borderRadius: BorderRadius.circular(imgDetailDialogRound)),
                              );
                            }
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
