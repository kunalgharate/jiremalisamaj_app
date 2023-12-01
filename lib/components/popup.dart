import 'package:flutter/material.dart';

class Popup extends StatelessWidget {
  const Popup({Key? key, required this.menuList, this.icon}) : super(key: key);
  final List<PopupMenuEntry> menuList;
  final Widget? icon;

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16)
      ),
      itemBuilder: ((context) => menuList),
    icon: icon,);
  }
}
