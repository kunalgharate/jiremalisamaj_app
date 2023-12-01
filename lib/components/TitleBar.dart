import 'package:flutter/material.dart';

import 'LocalData.dart';

class TitleBar extends StatelessWidget {
  const TitleBar({Key? key, required this.label, this.onBackPress}) : super(key: key);
  final String label;
  final GestureTapCallback? onBackPress;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 15),
      child: Row(
        children: [

          GestureDetector(
            onTap: onBackPress ?? () => Navigator.pop(context),
              child: Image.asset('${iconAddress}back.png', width: 18, height: 18,)),
          SizedBox(width: 20,),
          Expanded(child: Text(label,style: TextStyle(fontWeight: FontWeight.w700,fontSize: 17),))
        ],
      ),
    );
  }
}
