import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'BaseFile.dart';
import 'package:toast/toast.dart';

import 'AppBar_Drawer.dart';

class ImageDetailPage extends StatefulWidget {
  @override
  State<ImageDetailPage> createState() => _ImageDetailPage();
}

class _ImageDetailPage extends State<ImageDetailPage> {
  /// 화면 상태
  bool showOnlyImg = false;

  /// 이미지 객체
  ImageObj img = Get.arguments['img'];

  /// 카테고리
  String categoryVal = '';

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    categoryVal = img.category;
  }

  @override
  Widget build(BuildContext context) {
    ToastContext().init(context);
    return Scaffold(
        backgroundColor: showOnlyImg ? Colors.black : Colors.white,
        appBar: showOnlyImg ? null : MyAppBar(true, categoryLabel[img.category]),
        extendBodyBehindAppBar: true,
        // 앱바 겹치게
        /// 하단 버튼
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
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
                                            '${img.uploadAt.year}년 ${img.uploadAt
                                                .month}월 ${img.uploadAt.day}일 업로드',
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
                                                      value: 'ANIMAL',
                                                    ),
                                                    DropdownMenuItem(
                                                      child: Text('음식'),
                                                      value: 'FOOD',
                                                    ),
                                                    DropdownMenuItem(
                                                      child: Text('실내'),
                                                      value: 'INDOOR',
                                                    ),
                                                    DropdownMenuItem(
                                                      child: Text('자동차'),
                                                      value: 'MOBILITY',
                                                    ),
                                                    DropdownMenuItem(
                                                      child: Text('풍경'),
                                                      value: 'OUTDOOR',
                                                    ),
                                                    DropdownMenuItem(
                                                      child: Text('인물'),
                                                      value: 'PERSON',
                                                    ),
                                                    DropdownMenuItem(
                                                      child: Text('그 외'),
                                                      value: 'OTHER',
                                                    ),
                                                  ],
                                                  // 변경 메소드
                                                  onChanged: (val) async {
                                                    if(await apiPatchImaget(img.phothID, val as String)==0){
                                                      setState2((){
                                                        categoryVal = val.toString();
                                                      });
                                                    }
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
                onPressed: () async {
                  if(await apiDeleteImaget(img.phothID, img.filePath) == 0){
                    Get.back();
                  }
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
              child: img.photo),
        ));
  }

  /// API
  // 이미지 삭제
  Future<int> apiDeleteImaget(int photoId, String filePath) async {
    String uri = hostURL + 's3/file';
    Map body = {"photoId": photoId, 'filePath': filePath};
    Dio dio = Dio();
    dio.options.headers = {
      'Authorization': "bearer " + token,
    };
    try {
      var res = await dio.delete(uri, data: body);
      print('==========\n사진 삭제 성공\n==========');
      Toast.show("성공적으로 삭제했습니다.");
      return 0;
    } catch (e) {
      print('==========\n사진 삭제 실패\n==========');
      Toast.show("사진 삭제 실패");
      return -1;
    }
  }
  // 카테고리 변경
  Future<int> apiPatchImaget(int photoId, String category) async {
    String uri = hostURL + 's3/file';
    Map body = {"photoId": photoId, 'category': category};
    Dio dio = Dio();
    dio.options.headers = {
      'Authorization': "bearer " + token,
    };
    try {
      var res = await dio.patch(uri, data: body);
      print('==========\n사진 카테고리 변경 성공\n==========');
      return 0;
    } catch (e) {
      print('==========\n사진 카테고리 변경 실패\n==========');
      return -1;
    }
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
