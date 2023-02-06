import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:toy_project/MainPage.dart';
import 'package:toy_project/SignUpPage.dart';
import 'BaseFile.dart';
import 'AppBar_Drawer.dart';
import 'package:dio/dio.dart';
import 'package:toast/toast.dart';

class SignInPage extends StatelessWidget {
  TextEditingController signInIdController = TextEditingController();
  TextEditingController signInPwController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    ToastContext().init(context);
    return GestureDetector(
      onTap: (){
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: MyAppBar(false, '사진 분류 어플'),
        body: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                /// ID TF
                Container(
                  width:
                  getFulLSizePercent(context, signInPageTFWidthPercent, true),
                  child: TextField(
                      controller: signInIdController,
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
                Container(
                  width: getFulLSizePercent(context, 100, true),
                  height: signInPagePerTFGab,
                ),

                /// PW TF
                Container(
                  width:
                  getFulLSizePercent(context, signInPageTFWidthPercent, true),
                  child: TextField(
                      obscureText: true,
                      controller: signInPwController,
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
                Container(
                  width: getFulLSizePercent(context, 100, true),
                  height: signInPageTF_BTNGab,
                ),

                /// 로그인 버튼
                ElevatedButton(
                  onPressed: () async {
                    String id = signInIdController.text;
                    String pw = signInPwController.text;
                    if(await apiPostSignUp(id, pw) == 0){
                      Get.offAll(MainPage());
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
                    '로그인',
                    style: TextStyle(
                        color: Color(color_deepMint),
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Container(
                  width: getFulLSizePercent(context, 100, true),
                  height: signInPagePerBtnGab,
                ),

                /// 회원가입 버튼
                ElevatedButton(
                  onPressed: () {
                    Get.to(SignUpPage());
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
        ),
      ),
    );
  }

  /// API
  // 로그인
  Future<int> apiPostSignUp(String id, String pw) async {
    String uri = hostURL + 'user/signIn';
    Map body = Map();
    body['uid'] = id;
    body['password'] = pw;
    Dio dio = Dio();
    try{
      var res = await dio.post(uri, data: body);
      uid = id;
      token = res.headers['authorization']![0].split(' ')[1];
      refToken = res.headers['refreshToken']![0];
      print('==========\n로그인 성공\n==========');
      return 0;
    }
    catch(e){
      print('==========\n로그인 실패\n==========');
      Toast.show("로그인에 실패했습니다.");
      return -1;
    }
  }
}
