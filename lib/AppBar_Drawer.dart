import 'package:flutter/material.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:toy_project/MainPage.dart';
import 'package:toy_project/SignInPage.dart';
import 'BaseFile.dart';
import 'package:dio/dio.dart';

class MyAppBar extends StatelessWidget implements PreferredSize {
  /// 로그인 여부 체크
  final bool isLogin;
  /// 타이틀
  String title = '';
  MyAppBar(bool isLogin, String title) : this.isLogin = isLogin, this.title = title;

  @override
  Size get preferredSize => Size.fromHeight(AppBar().preferredSize.height);

  @override
  // TODO: implement child
  Widget get child => throw UnimplementedError();

  @override
  Widget build(context) => AppBar(
        title: Text(title),
        centerTitle: true,
        actions: [
          // 로그인 되어 있을때만 표시
          if (isLogin)

            /// 메뉴 아이콘
            DropdownButton2(
              customButton: Padding(
                padding: EdgeInsets.all(appBarMenuPaddingSize),
                child: Icon(
                  Icons.menu,
                  size: appBarDropDownIconSize,
                ),
              ),
              hint: Text('asdf'),
              items: [
                /// home
                DropdownMenuItem(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Icon(
                        Icons.home,
                        size: appBarDropDownIconSize,
                      ),
                      Container(width: appBarDropDownIconSize / 2),
                      Text('Home')
                    ],
                  ),
                  value: 1,
                ),

                /// Sign out
                DropdownMenuItem(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Icon(
                        Icons.logout,
                        size: appBarDropDownIconSize,
                      ),
                      Container(width: appBarDropDownIconSize / 2),
                      Text('Logout')
                    ],
                  ),
                  value: 2,
                ),
              ],
              onChanged: (e) async {
                switch (e) {
                  case 1:
                    Get.offAll(MainPage());
                    break;
                  case 2:
                    if (await apiPostSignOut(uid) == 0) {
                      Get.offAll(SignInPage());
                    }
                    break;
                  default:
                    break;
                }
              },
              dropdownWidth: appBarDropDownWidth,
              dropdownDecoration: BoxDecoration(
                color: Color(color_whiteMint),
              ),
            )
        ],
        backgroundColor: Color(color_mint),
      );

  /// API
  // 로그아웃
  Future<int> apiPostSignOut(String id) async {
    String uri = hostURL + 'user/signOut?userUid=$id';
    Map body = Map();
    Dio dio = Dio();
    dio.options.headers = {
      'Authorization': "bearer " + token,
      'RefreshToken': refToken
    };
    try {
      var res = await dio.post(uri);
      print('==========\n로그아웃 성공\n==========');
      return 0;
    } catch (e) {
      print('==========\n로그아웃 실패\n==========');
      return -1;
    }
  }
}

class SideSheet extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Container(
        width: 100,
        color: Colors.red,
      );
}
