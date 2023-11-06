import 'package:classify_app/styles/custom_font_style.dart';
import 'package:flutter/material.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  const MyAppBar({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  Size get preferredSize => const Size.fromHeight(100);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      leadingWidth: 16,
      leading: Container(),
      title: Text(
        title,
        style: CustomTextStyle.displayLarge,
      ),
    );
  }
}
