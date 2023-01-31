import 'package:flutter/material.dart';
import 'package:get/get.dart';

///MainPage
// 카테고리 객체
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

// Controller
class MainCategoryController extends GetxController {
  RxList categoryList = [].obs;

  void addCategory(MainCategory category) {
    categoryList.add(category);
  }
}

/// ImageListPage
// 이미지 객체
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

// Controller
class ImageListController extends GetxController {
  /// 날짜별로 정렬된 키
  RxMap dateImgObjMap = {}.obs;

  /// 키 리스트
  List dateKeyList = [];

  void addImgObj(ImageObj img) {
    if (dateKeyList.contains(img.uploadAt)) {
      dateImgObjMap[img.uploadAt].add(img);
    } else {
      dateImgObjMap[img.uploadAt] = [img];
      dateKeyList.add(img.uploadAt);
    }
  }
}


