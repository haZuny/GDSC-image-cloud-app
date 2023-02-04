import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import 'package:intl/intl.dart';
import 'package:get/get.dart';

import 'BaseFile.dart';
import 'AppBar_Drawer.dart';
import 'ImageDetailPage.dart';

class ImageListPage extends StatefulWidget {
  @override
  State<ImageListPage> createState() => _ImageListPage();
}

class _ImageListPage extends State<ImageListPage> {
  /// 갱신 상태
  int page = 0;
  bool pageLast = false;

  /// 카테고리
  String category = Get.arguments['category'];

  /// 오늘 날짜
  DateTime now = DateTime.now();
  String formatDateNow = DateFormat('yyyy-MM-dd').format(DateTime.now());
  String formatDateYesterDay = DateFormat('yyyy-MM-dd')
      .format(DateTime.now().subtract(Duration(days: 1)));

  /// 날짜 객체
  List dateKeyList = [];
  Map dateImageObjListMap = {};

  /// 스크롤 컨트롤러
  ScrollController scrollController = ScrollController();

  /// 초기 동작
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    apiGetImageList(uid, category, page);
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
      appBar: MyAppBar(true, categoryLabel[category]),

      /// 뒤로가기 버튼
      floatingActionButton: Container(
        margin: EdgeInsets.all(floatingBtnMargin),
        child: FloatingActionButton.small(
          onPressed: () {
            // Get.back();
            print(scrollController.offset);
          },
          child: Icon(Icons.arrow_back),
          backgroundColor: Color(color_mint),
        ),
      ),

      /// 날짜 리스트
      body: NotificationListener(
        child: ListView.builder(
          controller: scrollController,
          physics: AlwaysScrollableScrollPhysics(),
          scrollDirection: Axis.vertical,
          itemCount: dateKeyList.length,
          itemBuilder: (context, idx) => Padding(
            padding: EdgeInsets.all(imgListPageDatePadding),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // 오늘
                dateKeyList[idx].toString().substring(0, 10) == formatDateNow
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
                    dateKeyList[idx].toString().substring(0, 10) ==
                            formatDateYesterDay
                        ? Padding(
                            padding: EdgeInsets.all(imgListPageDateFontPadding),
                            child: Text(
                              "어제",
                              style: TextStyle(
                                  fontSize: imgListPageDateFontSize,
                                  color: Color(color_deepMint)),
                            ),
                          )
                        : dateKeyList[idx].year == now.year
                            // 올해
                            ? Padding(
                                padding:
                                    EdgeInsets.all(imgListPageDateFontPadding),
                                child: Text(
                                  dateKeyList[idx].month.toString() +
                                      '월 ' +
                                      dateKeyList[idx].day.toString() +
                                      '일',
                                  style: TextStyle(
                                      fontSize: imgListPageDateFontSize,
                                      color: Color(color_deepMint)),
                                ),
                              )
                            // 아주 먼 옛날
                            : Padding(
                                padding:
                                    EdgeInsets.all(imgListPageDateFontPadding),
                                child: Text(
                                  dateKeyList[idx].year.toString() +
                                      '년 ' +
                                      dateKeyList[idx].month.toString() +
                                      "월 " +
                                      dateKeyList[idx].day.toString() +
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
                  itemCount: dateImageObjListMap[dateKeyList[idx]]!.length,
                  itemBuilder: (context, idx2) {
                    return GestureDetector(
                      child: Padding(
                          padding: EdgeInsets.all(imgListPageGabPerImg),
                          child: dateImageObjListMap[dateKeyList[idx]]![idx2]
                              .photo),
                      onTap: () => Get.to(ImageDetailPage(), arguments: {
                        'img': dateImageObjListMap[dateKeyList[idx]]![idx2]
                      })?.then((value) {
                        // 리스트 초기화
                        setState(() {
                          dateKeyList = [];
                          dateImageObjListMap = {};
                          page = 0;
                        });
                        apiGetImageList(uid, category, page);
                      }),
                    );
                  },
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 4),
                ),
              ],
            ),
          ),
        ),

        /// 슬라이드 액션
        onNotification: (notification) {
          if (scrollController.offset ==
              scrollController.position.maxScrollExtent) {
            if (pageLast == false) {
              page++;
              apiGetImageList(uid, category, page);
            }
          }
          return false;
        },
      ));

  /// API
  // 카테고리 리스트 조회
  Future<int> apiGetImageList(String id, String category, int page) async {
    String uri = hostURL + 's3/file/list?page=$page';
    Map body = {"uid": id, 'category': category.toUpperCase()};
    Dio dio = Dio();
    dio.options.headers = {
      'Authorization': "bearer " + token,
    };
    try {
      // get
      var res = await dio.request(uri,
          data: body,
          options: Options(method: "GET", contentType: "application/json"));
      // 마지막 페이지 여부 체크
      pageLast = await res.data['data']['last'];
      // 사진 객체 추가
      for (Map imgObj in res.data['data']['content']) {
        // 날짜 문자열 추출
        String imgUploadedStr = imgObj['uploadAt'];
        String imgUploaded = imgUploadedStr.substring(0, 10);
        setState(() {
          // 해당 날짜 이미 존재하는 경우
          if (dateKeyList.contains(imgUploaded)) {
            dateImageObjListMap[imgUploaded].add(ImageObj(
                imgObj['photoId'],
                Image.network(
                  imgObj['photoPath'],
                  fit: BoxFit.fill,
                ),
                category,
                DateTime(
                    int.parse(imgUploaded.substring(0, 4)),
                    int.parse(imgUploaded.substring(5, 7)),
                    int.parse(imgUploaded.substring(8, 10))),
                imgObj['photoPath']));
          }
          // 해당 날짜 존재하지 않는 경우
          else {
            dateKeyList.add(imgUploaded);
            dateImageObjListMap[imgUploaded] = [
              ImageObj(
                  imgObj['photoId'],
                  Image.network(
                    imgObj['photoPath'],
                    fit: BoxFit.fill,
                  ),
                  category,
                  DateTime(
                      int.parse(imgUploaded.substring(0, 4)),
                      int.parse(imgUploaded.substring(5, 7)),
                      int.parse(imgUploaded.substring(8, 10))),
                  imgObj['photoPath'])
            ];
          }
        });
      }
      print('==========\n이미지 리스트 page$page 조회 성공\n==========');
      return 0;
    } catch (e) {
      print('==========\n이미지 리스트 page$page 조회 실패\n==========');
      return -1;
    }
  }
}
