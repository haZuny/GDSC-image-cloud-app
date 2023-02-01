import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import 'AppBar_Drawer.dart';
import 'BaseFile.dart';

class UploadImgPage extends StatefulWidget {
  @override
  State<UploadImgPage> createState() => _UploadImgPage();
}

class _UploadImgPage extends State<UploadImgPage> {
  XFile img = Get.arguments['image'];
  String category = Get.arguments['category'];

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: MyAppBar(true),
        body: Padding(
          padding: EdgeInsets.only(top: uploadImgPagePadding, left: uploadImgPagePadding, right: uploadImgPagePadding),
          child: Container(
            alignment: Alignment.center,
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  // Image.file(File(img.path)),
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
                      Container(width: getFulLSizePercent(context, uploadImgPageCategoryGabPercent, true),),
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
                  Container(height: getFulLSizePercent(context, uploadImgPageContentsGabPercent, false),),
                  /// 저장 버튼
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(btnRound)),
                        minimumSize: Size(btnWidthSize, btnHeightSize),
                        backgroundColor: Color(color_whiteMint)),
                    onPressed: () {},
                    child: Text(
                    "사진 저장",
                    style: TextStyle(
                        color: Color(color_deepMint),
                        fontSize: btnFontSize,
                        fontWeight: FontWeight.bold),
                  ),
                  ),
                  Container(height: getFulLSizePercent(context, uploadImgPageContentsGabPercent, false),)
                ],
              ),
            ),
          ),
        ),
      );
}
