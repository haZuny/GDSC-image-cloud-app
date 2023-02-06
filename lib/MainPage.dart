import 'dart:io';

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:dio/dio.dart';
import 'package:image_picker/image_picker.dart';
import 'package:toast/toast.dart';
import 'package:toy_project/Classifier.dart';
import 'package:toy_project/UploadImgPage.dart';

import 'BaseFile.dart';
import 'ImgListPage.dart';
import 'AppBar_Drawer.dart';

class MainPage extends StatefulWidget {
  @override
  State<MainPage> createState() => _MainPage();
}

class _MainPage extends State<MainPage> {
  /// Category List
  List<MainCategory> categoryList = [];
  int categoryCount = 0;

  /// ImagePicker
  final imagePicker = ImagePicker();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    ToastContext().init(context);
    apiGetCategoryList(uid);
  }

  @override
  Widget build(context) => Scaffold(
    resizeToAvoidBottomInset : false,
        appBar: MyAppBar(true, '사진 분류 어플'),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Center(
              child: SizedBox(
                height: getFulLSizePercent(context, listBoxSizePercent, false),
                child: ListView.builder(
                    itemCount: categoryCount,
                    itemBuilder: (context, idx) => Column(
                          children: [
                            /// 각 카테고리 리스트
                            GestureDetector(
                              child: Container(
                                color: Colors.transparent, // 제스처 영역 확보
                                child: Padding(
                                  padding: EdgeInsets.all(mainListPaddingSize),
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      // 사진 박스
                                      Container(
                                          width: titleImgSize,
                                          height: titleImgSize,
                                          margin: EdgeInsets.only(
                                              right: mainImgTitleThinSize),
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                              color: Colors.black),
                                          child:
                                              // 사진 없음

                                              categoryList[idx].imgNum == 0
                                                  ? Container()
                                                  // 사진 하나
                                                  : categoryList[idx].imgNum ==
                                                          1
                                                      ? Container(
                                                          decoration: BoxDecoration(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          titleImgRound)),
                                                          width:
                                                              titleImgSize / 2,
                                                          height:
                                                              titleImgSize / 2,
                                                          child: ClipRRect(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          titleImgRound),
                                                              child: categoryList[
                                                                      idx]
                                                                  .imgList[0]),
                                                        )
                                                      // 사진 둘
                                                      : categoryList[idx].imgNum ==
                                                              2
                                                          ? Container(
                                                              decoration: BoxDecoration(
                                                                  borderRadius:
                                                                      BorderRadius.circular(
                                                                          titleImgRound)),
                                                              width: titleImgSize /
                                                                  2,
                                                              height: titleImgSize /
                                                                  2,
                                                              child: Column(
                                                                children: [
                                                                  Row(
                                                                    children: [
                                                                      listTitleImg(
                                                                          1,
                                                                          img: categoryList[idx]
                                                                              .imgList[0]),
                                                                      listTitleImg(
                                                                          0),
                                                                    ],
                                                                  ),
                                                                  Row(
                                                                    children: [
                                                                      listTitleImg(
                                                                          0),
                                                                      listTitleImg(
                                                                          4,
                                                                          img: categoryList[idx]
                                                                              .imgList[1]),
                                                                    ],
                                                                  ),
                                                                ],
                                                              ))
                                                          // 이미지 3개
                                                          : categoryList[idx]
                                                                      .imgNum ==
                                                                  3
                                                              ? Container(
                                                                  decoration: BoxDecoration(
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              titleImgRound)),
                                                                  width:
                                                                      titleImgSize /
                                                                          2,
                                                                  height:
                                                                      titleImgSize /
                                                                          2,
                                                                  child: Column(
                                                                    children: [
                                                                      Row(
                                                                        children: [
                                                                          listTitleImg(
                                                                              1,
                                                                              img: categoryList[idx].imgList[0]),
                                                                          listTitleImg(
                                                                              2,
                                                                              img: categoryList[idx].imgList[1]),
                                                                        ],
                                                                      ),
                                                                      Row(
                                                                        children: [
                                                                          listTitleImg(
                                                                              3,
                                                                              img: categoryList[idx].imgList[2]),
                                                                          listTitleImg(
                                                                              0),
                                                                        ],
                                                                      ),
                                                                    ],
                                                                  ))
                                                              :
                                                              // 이미지 4개
                                                              Container(
                                                                  decoration:
                                                                      BoxDecoration(
                                                                          borderRadius: BorderRadius.circular(titleImgRound)),
                                                                  width: titleImgSize / 2,
                                                                  height: titleImgSize / 2,
                                                                  child: Column(
                                                                    children: [
                                                                      Row(
                                                                        children: [
                                                                          listTitleImg(
                                                                              1,
                                                                              img: categoryList[idx].imgList[0]),
                                                                          listTitleImg(
                                                                              2,
                                                                              img: categoryList[idx].imgList[1]),
                                                                        ],
                                                                      ),
                                                                      Row(
                                                                        children: [
                                                                          listTitleImg(
                                                                              3,
                                                                              img: categoryList[idx].imgList[2]),
                                                                          listTitleImg(
                                                                              4,
                                                                              img: categoryList[idx].imgList[3]),
                                                                        ],
                                                                      ),
                                                                    ],
                                                                  ))),
                                      Text(
                                        categoryList[idx].title,
                                        style: TextStyle(
                                            fontSize: mainListTitleFontSize,
                                            color: Color(color_deepMint)),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              onTap: () {
                                Get.to(ImageListPage(), arguments: {
                                  'category': categoryList[idx].category
                                })?.then((value) {
                                  setState(() {
                                    categoryCount = 0;
                                    categoryList = [];
                                  apiGetCategoryList(uid);
                                  });
                                });
                              },
                            ),
                            if (idx < categoryList.length - 1) Divider()
                          ],
                        )),
              ),
            ),

            /// 사진 추가 버튼
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(btnRound)),
                  minimumSize: Size(btnWidthSize, btnHeightSize),
                  backgroundColor: Color(color_whiteMint)),
              onPressed: () {
                showDialog(
                    context: context,
                    /// 사진 추가 페이지
                    builder: (context) => GestureDetector(
                          onTap: () => Get.back(),
                          child: Container(
                            height: double.infinity,
                            color: Color.fromRGBO(0, 0, 0, bgOpacity),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                // 사진 찍기 버튼
                                ElevatedButton(
                                  onPressed: () async {
                                    // 사진 촬영
                                    XFile? img = await imagePicker.pickImage(
                                        source: ImageSource.camera);
                                    if (img != null) {
                                      Classifier c = Classifier(File(img.path));
                                      Get.off(UploadImgPage(), arguments: {
                                        "image": img,
                                        "category": await c.classify(),
                                      });
                                    }
                                  },
                                  style: ElevatedButton.styleFrom(
                                      shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(
                                              16)),
                                      backgroundColor: Color(color_whiteMint),
                                      minimumSize: Size(
                                          getFulLSizePercent(context,
                                              bgPageBtnSizePercent, true),
                                          getFulLSizePercent(context,
                                              bgPageBtnSizePercent, true)),
                                      maximumSize:
                                          Size(
                                              getFulLSizePercent(context,
                                                  bgPageBtnSizePercent, true),
                                              getFulLSizePercent(context,
                                                  bgPageBtnSizePercent, true))),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(
                                        Icons.camera_alt_outlined,
                                        color: Color(color_deepMint),
                                        size: bgPageIconSize,
                                      ),
                                      Text(
                                        '사진 찍기\n',
                                        style: TextStyle(
                                            color: Color(color_deepMint),
                                            fontSize: bgPageBtnFontSize,
                                            fontWeight: FontWeight.bold),
                                      )
                                    ],
                                  ),
                                ),
                                Container(
                                  width: bgPageGabPerBtn,
                                ),
                                // 앨범 추가 버튼
                                ElevatedButton(
                                  onPressed: () async {
                                    XFile? img = await imagePicker.pickImage(
                                        source: ImageSource.gallery);
                                    if (img != null) {
                                      Classifier c = Classifier(File(img.path));
                                      Get.off(UploadImgPage(), arguments: {
                                        "image": img,
                                        "category": await c.classify(),
                                      });
                                    }
                                  },
                                  style: ElevatedButton.styleFrom(
                                      shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(
                                              16)),
                                      backgroundColor: Color(color_whiteMint),
                                      minimumSize: Size(
                                          getFulLSizePercent(context,
                                              bgPageBtnSizePercent, true),
                                          getFulLSizePercent(context,
                                              bgPageBtnSizePercent, true)),
                                      maximumSize:
                                          Size(
                                              getFulLSizePercent(context,
                                                  bgPageBtnSizePercent, true),
                                              getFulLSizePercent(context,
                                                  bgPageBtnSizePercent, true))),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(
                                        Icons.image_outlined,
                                        color: Color(color_deepMint),
                                        size: bgPageIconSize,
                                      ),
                                      Text(
                                        '앨범에서\n가져오기',
                                        style: TextStyle(
                                            color: Color(color_deepMint),
                                            fontSize: bgPageBtnFontSize,
                                            fontWeight: FontWeight.bold),
                                      )
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        ));
              },
              child: Text(
                "사진 추가",
                style: TextStyle(
                    color: Color(color_deepMint),
                    fontSize: btnFontSize,
                    fontWeight: FontWeight.bold),
              ),
            )
          ],
        ),
      );

  /// API
  // 카테고리 리스트 조회
  Future<int> apiGetCategoryList(String id) async {
    String uri = hostURL + 's3/file/all';
    Map body = {"uid": id};
    Dio dio = Dio();
    dio.options.headers = {
      'Authorization': "bearer " + token,
    };

    try {
      // get
      var res = await dio.request(uri,
          data: body,
          options: Options(method: "GET", contentType: "application/json"));
      // 사진 파일 변환
      for (Map category in res.data['data']) {
        setState(() {
          int count = category['count'];
          if (count > 0) {
            categoryCount++;
            categoryList.add(MainCategory(category['category'],
                category['count'], category['filePathList']));
          }
        });
      }
      print('==========\n카테고리 조회 성공\n==========');
      return 0;
    } catch (e) {
      print('==========\n카테고리 조회 실패\n==========');
      Toast.show("정보를 얻는데 실패했습니다.");
      return -1;
    }
  }
}

/// 카테고리 객체
class MainCategory {
  int imgNum = 0;
  String title = "";
  String category = '';
  List imgList = [];

  MainCategory(String category, int imgNum, List imgList) {
    this.category = category;
    this.title = categoryLabel[category];
    this.imgNum = imgNum;
    if (imgList != null) {
      for (var img in imgList) {
        this.imgList.add(Image.network(
              img,
              fit: BoxFit.fill,
            ));
      }
    }
  }
}

/// 타이틀 이미지 조각
class listTitleImg extends StatelessWidget {
  int imgSeq = 0;
  Image? img;

  listTitleImg(int seq, {var img}) {
    imgSeq = seq;
    this.img = img;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: imgSeq == 0
              ? BorderRadius.circular(titleImgRound)
              : imgSeq == 1
                  ? BorderRadius.only(topLeft: Radius.circular(titleImgRound))
                  : imgSeq == 2
                      ? BorderRadius.only(
                          topRight: Radius.circular(titleImgRound))
                      : imgSeq == 3
                          ? BorderRadius.only(
                              bottomLeft: Radius.circular(titleImgRound))
                          : BorderRadius.only(
                              bottomRight: Radius.circular(titleImgRound))),
      width: titleImgSize / 2,
      height: titleImgSize / 2,
      child: ClipRRect(
          borderRadius: imgSeq == 1
              ? BorderRadius.only(topLeft: Radius.circular(titleImgRound))
              : imgSeq == 2
                  ? BorderRadius.only(topRight: Radius.circular(titleImgRound))
                  : imgSeq == 3
                      ? BorderRadius.only(
                          bottomLeft: Radius.circular(titleImgRound))
                      : BorderRadius.only(
                          bottomRight: Radius.circular(titleImgRound)),
          child: img ?? Container()),
    );
  }
}
