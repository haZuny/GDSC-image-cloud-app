import 'package:flutter/material.dart';

import 'package:intl/intl.dart';
import 'package:get/get.dart';
import 'GetControllers.dart';

import 'BaseFile.dart';
import 'AppBar_Drawer.dart';

class ImageListPage extends StatefulWidget {
  @override
  State<ImageListPage> createState() => _ImageListPage();
}

class _ImageListPage extends State<ImageListPage> {
  // GetX Controller
  final controller = Get.put(ImageListController());

  /// 오늘 날짜
  DateTime now = DateTime.now();
  String formatDateNow = DateFormat('yyyy-MM-dd').format(DateTime.now());
  String formatDateYesterDay = DateFormat('yyyy-MM-dd')
      .format(DateTime.now().subtract(Duration(days: 1)));

  /// 초기 동작
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    // 임시로 이미지 삽입
    for (int i = 0; i < 100; i++) {
      DateTime date = DateTime.now().subtract(Duration(days: i));
      controller.addImgObj(ImageObj(
          i, Image.asset('assets/img/test1.jpg', fit: BoxFit.fill), date));
      controller.addImgObj(ImageObj(
          i, Image.asset('assets/img/test2.jpg', fit: BoxFit.fill), date));
      controller.addImgObj(ImageObj(
          i, Image.asset('assets/img/test3.jpg', fit: BoxFit.fill), date));
      controller.addImgObj(ImageObj(
          i, Image.asset('assets/img/test4.jpg', fit: BoxFit.fill), date));
      controller.addImgObj(ImageObj(
          i, Image.asset('assets/img/test4.jpg', fit: BoxFit.fill), date));
      controller.addImgObj(ImageObj(
          i, Image.asset('assets/img/test3.jpg', fit: BoxFit.fill), date));
      controller.addImgObj(ImageObj(
          i, Image.asset('assets/img/test2.jpg', fit: BoxFit.fill), date));
    }
  }

  @override
  Widget build(BuildContext context) => Scaffold(
      appBar: MyAppBar(true), 
      floatingActionButton: Container(
        margin: EdgeInsets.all(floatingBtnMargin),
        child: FloatingActionButton.small(
          onPressed: () {
            Get.back();
          },
          child: Icon(Icons.arrow_back),
          backgroundColor: Color(color_mint),
        ),
      ),

      /// 날짜 리스트
      body: ListView.builder(
          itemCount: controller.dateKeyList.length,
          itemBuilder: (context, idx) => Padding(
                padding: EdgeInsets.all(imgListPageDatePadding),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // 오늘
                    controller.dateKeyList[idx].toString().substring(0, 10) ==
                            formatDateNow
                        ? Padding(
                            padding: EdgeInsets.all(imgListPageDateFontPadding),
                            child: Text(
                              "오늘",
                              style: TextStyle(
                                  fontSize: imgListPageDateFontSize,
                                  color: Color(color_deepMint)),
                            ),
                          )
                        :
                        // 어제
                        controller.dateKeyList[idx]
                                    .toString()
                                    .substring(0, 10) ==
                                formatDateYesterDay
                            ? Padding(
                                padding:
                                    EdgeInsets.all(imgListPageDateFontPadding),
                                child: Text(
                                  "어제",
                                  style: TextStyle(
                                      fontSize: imgListPageDateFontSize,
                                      color: Color(color_deepMint)),
                                ),
                              )
                            : controller.dateKeyList[idx].year == now.year
                                // 올해
                                ? Padding(
                                    padding: EdgeInsets.all(
                                        imgListPageDateFontPadding),
                                    child: Text(
                                      controller.dateKeyList[idx].month
                                              .toString() +
                                          '월 ' +
                                          controller.dateKeyList[idx].day
                                              .toString() +
                                          '일',
                                      style: TextStyle(
                                          fontSize: imgListPageDateFontSize,
                                          color: Color(color_deepMint)),
                                    ),
                                  )
                                // 아주 먼 옛날
                                : Padding(
                                    padding: EdgeInsets.all(
                                        imgListPageDateFontPadding),
                                    child: Text(
                                      controller.dateKeyList[idx].year
                                              .toString() +
                                          '년 ' +
                                          controller.dateKeyList[idx].month
                                              .toString() +
                                          "월 " +
                                          controller.dateKeyList[idx].day
                                              .toString() +
                                          '일',
                                      style: TextStyle(
                                          fontSize: imgListPageDateFontSize,
                                          color: Color(color_deepMint)),
                                    ),
                                  ),

                    /// 사진 그리드
                    GridView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: controller
                          .dateImgObjMap[controller.dateKeyList[idx]]!.length,
                      itemBuilder: (context, idx2) {
                        return Padding(
                            padding: EdgeInsets.all(imgListPageGabPerImg),
                            child: controller
                                .dateImgObjMap[controller.dateKeyList[idx]]![
                                    idx2]
                                .photo);
                      },
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 4),
                    ),
                  ],
                ),
              )));
}
