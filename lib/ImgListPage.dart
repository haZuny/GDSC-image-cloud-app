import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:toy_project/BaseFile.dart';

import 'AppBar_Drawer.dart';

class ImageListPage extends StatefulWidget {
  @override
  State<ImageListPage> createState() => _ImageListPage();
}

class _ImageListPage extends State<ImageListPage> {
  /// 날짜별로 정렬된 리스트
  Map dateAlignedImgObj = {};

  /// 키 리스트
  List dateKeyList = [];

  /// 오늘 날짜
  DateTime now = DateTime.now();
  String formatDateNow = DateFormat('yyyy-MM-dd').format(DateTime.now());
  String formatDateYesterDay = DateFormat('yyyy-MM-dd').format(DateTime.now().subtract(Duration(days: 1)));

  /// 초기 동작
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    // 임시로 이미지 삽입
    for (int i = 0; i < 50; i++) {
      DateTime date = DateTime(now.year, now.month, now.day)
          .subtract(Duration(days: (i / 2).toInt()));
      print(date);
      if (dateAlignedImgObj.containsKey(date)) {
        dateAlignedImgObj[date].add(ImageObj(
            i,
            i % 4 == 0
                ? Image.asset(
                    'assets/img/test1.jpg',
                    fit: BoxFit.fill,
                  )
                : i % 4 == 1
                    ? Image.asset('assets/img/test2.jpg', fit: BoxFit.fill)
                    : i % 4 == 2
                        ? Image.asset('assets/img/test3.jpg', fit: BoxFit.fill)
                        : Image.asset('assets/img/test4.jpg', fit: BoxFit.fill),
            date));
      } else {
        dateAlignedImgObj[date] = [
          ImageObj(
              i,
              i % 4 == 0
                  ? Image.asset(
                      'assets/img/test1.jpg',
                      fit: BoxFit.fill,
                    )
                  : i % 4 == 1
                      ? Image.asset('assets/img/test2.jpg', fit: BoxFit.fill)
                      : i % 4 == 2
                          ? Image.asset('assets/img/test3.jpg',
                              fit: BoxFit.fill)
                          : Image.asset('assets/img/test4.jpg',
                              fit: BoxFit.fill),
              date)
        ];
        dateKeyList.add(date);
      }
    }
  }

  @override
  Widget build(BuildContext context) => Scaffold(
      appBar: MyAppBar(true),

      /// 날짜 리스트
      body: ListView.builder(
          itemCount: dateKeyList.length,
          itemBuilder: (context, idx) => Padding(
                padding: EdgeInsets.all(30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // 오늘
                    dateKeyList[idx].toString().substring(0, 10) ==
                            formatDateNow
                        ? Text("오늘")
                        :
                        // 어제
                        dateKeyList[idx].toString().substring(0, 10) ==
                                formatDateYesterDay
                            ? Text("어제")
                            : Text(dateKeyList[idx].toString().substring(0, 4) +
                                '년 ' +
                                dateKeyList[idx].toString().substring(5, 7) +
                                "월 " +
                                dateKeyList[idx].toString().substring(8, 10) +
                                '일'),

                    // if (dateKeyList[idx].year == now.year && dateKeyList[idx].month == now.month && dateKeyList[idx].day == now.day)
                    //   Text(dateKeyList[idx].toString().substring(0,10)),
                    // else if()
                    //   Text('a'),

                    /// 사진 그리드
                    GridView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: dateAlignedImgObj[dateKeyList[idx]].length,
                      itemBuilder: (context, idx2) {
                        return Padding(
                            padding: EdgeInsets.all(5),
                            child: dateAlignedImgObj[dateKeyList[idx]][idx2]
                                .photo);
                      },
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 4),
                    ),
                  ],
                ),
              )));
}

/// 이미지 객체
class ImageObj {
  final int phothID;
  final Image photo;
  final DateTime uploadAt;

  // 생성자
  const ImageObj(int id, Image img, DateTime date)
      : phothID = id,
        photo = img,
        uploadAt = date;
}
