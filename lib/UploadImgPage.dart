import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart' as myDio;
import 'package:http_parser/http_parser.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:toy_project/MainPage.dart';

import 'AppBar_Drawer.dart';
import 'BaseFile.dart';

class UploadImgPage extends StatefulWidget {
  @override
  State<UploadImgPage> createState() => _UploadImgPage();
}

class _UploadImgPage extends State<UploadImgPage> {
  XFile img = Get.arguments['image'];
  String category = Get.arguments['category'];

  _UploadImgPage() {
    print("뭘까뭘까");
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: MyAppBar(true, '사진 분류 어플'),
        body: Padding(
          padding: EdgeInsets.only(
              top: uploadImgPagePadding,
              left: uploadImgPagePadding,
              right: uploadImgPagePadding),
          child: Container(
            alignment: Alignment.center,
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Image.file(File(img.path)),

                  /// 분류
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        '분류: ',
                        style: TextStyle(
                          color: Color(color_deepMint),
                          fontSize: imgDetailDialogContentFontSize,
                        ),
                      ),
                      Container(
                        width: getFulLSizePercent(
                            context, uploadImgPageCategoryGabPercent, true),
                      ),
                      DropdownButton(
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
                          setState(() {
                            category = val.toString();
                          });
                        },
                        value: category,
                        style: TextStyle(
                            color: Color(color_deepMint),
                            fontSize: imgDetailDialogContentFontSize,
                            fontWeight: FontWeight.bold),
                        alignment: Alignment.center,
                        underline: Container(),
                      )
                    ],
                  ),
                  Container(
                    height: getFulLSizePercent(
                        context, uploadImgPageContentsGabPercent, false),
                  ),

                  /// 저장 버튼
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(btnRound)),
                        minimumSize: Size(btnWidthSize, btnHeightSize),
                        backgroundColor: Color(color_whiteMint)),
                    onPressed: () async {
                      if (await apiPostFileUpload(
                              uid, category, File(img.path)) ==
                          0) {
                        Get.off(MainPage());
                      }
                    },
                    child: Text(
                      "사진 저장",
                      style: TextStyle(
                          color: Color(color_deepMint),
                          fontSize: btnFontSize,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Container(
                    height: getFulLSizePercent(
                        context, uploadImgPageContentsGabPercent, false),
                  )
                ],
              ),
            ),
          ),
        ),
      );

  /// API
  // 사진 업로드
  Future<int> apiPostFileUpload(String id, String category, File image) async {
    String uri = hostURL + 's3/file';
    print(id);
    myDio.FormData body = myDio.FormData.fromMap({
      "uploadPhotoResponse": myDio.MultipartFile.fromString(
        jsonEncode({"uid": id, 'category':category.toUpperCase()}),
        contentType: MediaType.parse('application/json'),),
      "multipartFile": await myDio.MultipartFile.fromFile(image.path,)
    });
    myDio.Dio dio = myDio.Dio();
    dio.options.headers = {
      'Authorization': "bearer " + token,
    };
    try {
      var res = await dio.post(uri, data: body);
      print('==========\n업로드 성공\n==========');
      return 0;
    } catch (e) {
      print('==========\n업로드 실패\n==========');
      print(e);
      return -1;
    }
  }
}
