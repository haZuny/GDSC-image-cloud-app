import 'package:flutter/material.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'BaseFile.dart';

class MyAppBar extends StatelessWidget implements PreferredSize {
  /// 로그인 여부 체크
  final bool isLogin;

  MyAppBar(bool isLogin) : this.isLogin = isLogin;

  @override
  Size get preferredSize => Size.fromHeight(AppBar().preferredSize.height);

  @override
  // TODO: implement child
  Widget get child => throw UnimplementedError();

  @override
  Widget build(context) => AppBar(
        title: Text("사진 분류 어플"),
        centerTitle: true,
        actions: [
          // 로그인 되어 있을때만 표시
          if (isLogin)

            /// 메뉴 아이콘
            DropdownButton2(
              customButton: Padding(
                padding: EdgeInsets.all(appBarMenuPaddingSize),
                child: Icon(Icons.menu, size: appBarDropDownIconSize,),
              ),
              hint: Text('asdf'),
              items: [
                // home
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
                // Sign out
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
              onChanged: (e) {
                switch (e) {
                  case 1:
                    print('anpr');
                    break;
                  case 2:
                    print('qwer');
                    break;
                  default:
                    print('aaaaa');
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
}

class SideSheet extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Container(
        width: 100,
        color: Colors.red,
      );
}
