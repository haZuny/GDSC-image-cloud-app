import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'BaseFile.dart';
import 'AppBar_Drawer.dart';

class SignUpPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) => GestureDetector(
    onTap: (){
      FocusScope.of(context).unfocus();
    },
    child: Scaffold(
          appBar: MyAppBar(false),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              /// ID TF
              Container(
                width: getFulLSizePercent(context, signInPageTFWidthPercent, true),
                child: TextField(
                    decoration: InputDecoration(
                  // 기본 테두리
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(signInPageTFRound),
                      borderSide: BorderSide(
                          width: signInPageTFBorderWidth,
                          color: Color(color_deepMint))),
                  // 선택 테두리
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(signInPageTFRound),
                      borderSide: BorderSide(
                          width: signInPageTFBorderWidth,
                          color: Color(color_deepMint))),
                  // 라벨
                  labelText: 'ID',
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                  labelStyle: TextStyle(
                      fontSize: signInPageTFLabelFontSize,
                      fontWeight: FontWeight.bold,
                      color: Color(color_deepMint)),
                )),
              ),
              Container(width: getFulLSizePercent(context, 100, true), height: signInPagePerTFGab,),
              /// PW TF
              Container(
                width: getFulLSizePercent(context, signInPageTFWidthPercent, true),
                child: TextField(
                    decoration: InputDecoration(
                  // 기본 테두리
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(signInPageTFRound),
                      borderSide: BorderSide(
                          width: signInPageTFBorderWidth,
                          color: Color(color_deepMint))),
                  // 선택 테두리
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(signInPageTFRound),
                      borderSide: BorderSide(
                          width: signInPageTFBorderWidth,
                          color: Color(color_deepMint))),
                  // 라벨
                  labelText: 'PW',
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                  labelStyle: TextStyle(
                      fontSize: signInPageTFLabelFontSize,
                      fontWeight: FontWeight.bold,
                      color: Color(color_deepMint)),
                )),
              ),
              Container(width: getFulLSizePercent(context, 100, true), height: signInPagePerTFGab,),
              /// PW Check TF
              Container(
                width: getFulLSizePercent(context, signInPageTFWidthPercent, true),
                child: TextField(
                    decoration: InputDecoration(
                      // 기본 테두리
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(signInPageTFRound),
                          borderSide: BorderSide(
                              width: signInPageTFBorderWidth,
                              color: Color(color_deepMint))),
                      // 선택 테두리
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(signInPageTFRound),
                          borderSide: BorderSide(
                              width: signInPageTFBorderWidth,
                              color: Color(color_deepMint))),
                      // 라벨
                      labelText: 'PW Check',
                      floatingLabelBehavior: FloatingLabelBehavior.always,
                      labelStyle: TextStyle(
                          fontSize: signInPageTFLabelFontSize,
                          fontWeight: FontWeight.bold,
                          color: Color(color_deepMint)),
                    )),
              ),
              Container(width: getFulLSizePercent(context, 100, true), height: signInPageTF_BTNGab,),

              /// 회원가입 버튼
              ElevatedButton(
                onPressed: () {Get.back();},
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                      borderRadius:
                      BorderRadius.circular(100)),
                  backgroundColor: Color(color_whiteMint),
                  minimumSize:
                  Size(getFulLSizePercent(context, btnSingleWidthPercent, true), btnHeight),),
                child: Text(
                  '회원가입',
                  style: TextStyle(
                      color: Color(color_deepMint),
                      fontSize: 20, fontWeight: FontWeight.bold),
                ),
              )
            ],
          ),
        ),
  );
}
