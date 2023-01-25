import 'package:flutter/material.dart';

class MyAppBar extends StatelessWidget implements PreferredSize{



  @override
  Size get preferredSize => Size.fromHeight(AppBar().preferredSize.height);

  @override
  Widget build(context)=>AppBar(title: Text("사진 분류 어플"));

  @override
  // TODO: implement child
  Widget get child => throw UnimplementedError();
}