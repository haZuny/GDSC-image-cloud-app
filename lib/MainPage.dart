import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:toy_project/AppBar.dart';

import 'BaseFile.dart';

class MainPage extends StatefulWidget {
  @override
  State<MainPage> createState() => _MainPage();
}

class _MainPage extends State<MainPage> {
  List<MainCategory> categoryList = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    categoryList.add(MainCategory('타이틀', 0));
    categoryList.add(MainCategory('타이틀', 1));
    categoryList.add(MainCategory('타이틀', 2));
    categoryList.add(MainCategory('타이틀', 3));
    categoryList.add(MainCategory('타이틀', 4));
  }

  @override
  Widget build(context) => Scaffold(
        appBar: MyAppBar(),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Center(
              /// 각 카테고리 리스트
              child: SizedBox(
                height: getFulLSizePercent(context, listBoxSizePercent, false),
                child: ListView.builder(
                    itemCount: categoryList.length,
                    itemBuilder: (context, idx) => Column(
                          children: [
                            Padding(
                              padding: EdgeInsets.all(mainListPaddingSize),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
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
                                          color: Color(color_whiteMint)),
                                      child:
                                          // 사진 없음
                                          categoryList[idx].imgNum == 0
                                              ? Container()
                                              // 사진 하나
                                              : categoryList[idx].imgNum == 1
                                                  ? Container(
                                                      decoration: BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius.circular(
                                                                  titleImgRound)),
                                                      width: titleImgSize / 2,
                                                      height: titleImgSize / 2,
                                                      child: ClipRRect(
                                                          borderRadius:
                                                              BorderRadius.circular(
                                                                  titleImgRound),
                                                          child:
                                                              categoryList[idx]
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
                                                          width:
                                                              titleImgSize / 2,
                                                          height:
                                                              titleImgSize / 2,
                                                          child: Column(
                                                            children: [
                                                              Row(
                                                                children: [
                                                                  listTitleImg(
                                                                      1,
                                                                      img: categoryList[
                                                                              idx]
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
                                                                      img: categoryList[
                                                                              idx]
                                                                          .imgList[1]),
                                                                ],
                                                              ),
                                                            ],
                                                          ))
                                                      // 이미지 3개
                                                      : categoryList[idx].imgNum ==
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
                                                                          img: categoryList[idx]
                                                                              .imgList[0]),
                                                                      listTitleImg(
                                                                          2,
                                                                          img: categoryList[idx]
                                                                              .imgList[1]),
                                                                    ],
                                                                  ),
                                                                  Row(
                                                                    children: [
                                                                      listTitleImg(
                                                                          3,
                                                                          img: categoryList[idx]
                                                                              .imgList[2]),
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
                                                                  BoxDecoration(borderRadius: BorderRadius.circular(titleImgRound)),
                                                              width: titleImgSize / 2,
                                                              height: titleImgSize / 2,
                                                              child: Column(
                                                                children: [
                                                                  Row(
                                                                    children: [
                                                                      listTitleImg(
                                                                          1,
                                                                          img: categoryList[idx]
                                                                              .imgList[0]),
                                                                      listTitleImg(
                                                                          2,
                                                                          img: categoryList[idx]
                                                                              .imgList[1]),
                                                                    ],
                                                                  ),
                                                                  Row(
                                                                    children: [
                                                                      listTitleImg(
                                                                          3,
                                                                          img: categoryList[idx]
                                                                              .imgList[2]),
                                                                      listTitleImg(
                                                                          4,
                                                                          img: categoryList[idx]
                                                                              .imgList[3]),
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
              onPressed: () {},
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

/// 카테고리
class MainCategory {
  int imgNum = 0;
  String title = "";
  List imgList = [];

  MainCategory(String title, int imgNum) {
    this.title = title;
    this.imgNum = imgNum;
    imgList.add(Image.asset('assets/img/test1.jpg', fit: BoxFit.fill));
    imgList.add(Image.asset('assets/img/test2.jpg', fit: BoxFit.fill));
    imgList.add(Image.asset('assets/img/test3.jpg', fit: BoxFit.fill));
    imgList.add(Image.asset('assets/img/test4.jpg', fit: BoxFit.fill));
  }
}
