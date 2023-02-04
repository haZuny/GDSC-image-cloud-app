import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'BaseFile.dart';
import 'AppBar_Drawer.dart';
import 'package:dio/dio.dart';

class SignUpPage extends StatelessWidget {
  TextEditingController signUpIdController = TextEditingController();
  TextEditingController signUpPwController = TextEditingController();
  TextEditingController signUpPw2Controller = TextEditingController();

  @override
  Widget build(BuildContext context) => GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: Scaffold(
          appBar: MyAppBar(false, '사진 분류 어플'),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              /// ID TF
              Container(
                width:
                    getFulLSizePercent(context, signInPageTFWidthPercent, true),
                child: TextField(
                    controller: signUpIdController,
                    decoration: InputDecoration(
                      // 기본 테두리
                      enabledBorder: OutlineInputBorder(
                          borderRadius:
                              BorderRadius.circular(signInPageTFRound),
                          borderSide: BorderSide(
                              width: signInPageTFBorderWidth,
                              color: Color(color_deepMint))),
                      // 선택 테두리
                      focusedBorder: OutlineInputBorder(
                          borderRadius:
                              BorderRadius.circular(signInPageTFRound),
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
              Container(
                width: getFulLSizePercent(context, 100, true),
                height: signInPagePerTFGab,
              ),

              /// PW TF
              Container(
                width:
                    getFulLSizePercent(context, signInPageTFWidthPercent, true),
                child: TextField(
                    controller: signUpPwController,
                    decoration: InputDecoration(
                      // 기본 테두리
                      enabledBorder: OutlineInputBorder(
                          borderRadius:
                              BorderRadius.circular(signInPageTFRound),
                          borderSide: BorderSide(
                              width: signInPageTFBorderWidth,
                              color: Color(color_deepMint))),
                      // 선택 테두리
                      focusedBorder: OutlineInputBorder(
                          borderRadius:
                              BorderRadius.circular(signInPageTFRound),
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
              Container(
                width: getFulLSizePercent(context, 100, true),
                height: signInPagePerTFGab,
              ),

              /// PW Check TF
              Container(
                width:
                    getFulLSizePercent(context, signInPageTFWidthPercent, true),
                child: TextField(
                    controller: signUpPw2Controller,
                    decoration: InputDecoration(
                      // 기본 테두리
                      enabledBorder: OutlineInputBorder(
                          borderRadius:
                              BorderRadius.circular(signInPageTFRound),
                          borderSide: BorderSide(
                              width: signInPageTFBorderWidth,
                              color: Color(color_deepMint))),
                      // 선택 테두리
                      focusedBorder: OutlineInputBorder(
                          borderRadius:
                              BorderRadius.circular(signInPageTFRound),
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
              Container(
                width: getFulLSizePercent(context, 100, true),
                height: signInPageTF_BTNGab,
              ),

              /// 회원가입 버튼
              ElevatedButton(
                onPressed: () async {
                  String id = signUpIdController.text;
                  String pw = signUpPwController.text;
                  String pw2 = signUpPw2Controller.text;
                  // 아이디 공백
                  if (id == "") {
                    print("아이디 공백");
                    return;
                  }
                  // pw 일치 여부
                  if (pw != pw2) {
                    print('패스워드 불일치');
                    return;
                  }
                  if (await apiGetCheckID(id) == 0) {
                    if(await apiPostSignUp(id, pw) == 0){
                      Get.back();
                    }
                  }
                },
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(100)),
                  backgroundColor: Color(color_whiteMint),
                  minimumSize: Size(
                      getFulLSizePercent(context, btnSingleWidthPercent, true),
                      btnHeight),
                ),
                child: Text(
                  '회원가입',
                  style: TextStyle(
                      color: Color(color_deepMint),
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
              )
            ],
          ),
        ),
      );

  /// API
  // 아이디 중복 체크
  Future<int> apiGetCheckID(String id) async {
    String uri = hostURL + 'user/checkUid?uid=$id';
    Dio dio = Dio();
    try{
      var res = await dio.get(uri);
      print('==========\n아이디 사용 가능\n==========');
      return 0;
    }
    catch(e){
      print('==========\n아이디 중복\n==========');
      return -1;
    }
  }
  // 회원 가입
  Future<int> apiPostSignUp(String id, String pw) async {
    String uri = hostURL + 'user/signUp';
    Map body = Map();
    body['uid'] = id;
    body['password'] = pw;
    body['username'] = id;
    Dio dio = Dio();
    try{
      var res = await dio.post(uri, data: body);
      print('==========\n회원가입 성공\n==========');
      return 0;
    }
    catch(e){
      print('==========\n회원가입 실패\n==========');
      return -1;
    }
  }
}
