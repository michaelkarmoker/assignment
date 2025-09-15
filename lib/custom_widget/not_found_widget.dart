import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NotFoundWidget extends StatelessWidget {
  const NotFoundWidget({super.key, required this.title});
   final String title;
  @override
  Widget build(BuildContext context) {
    return  Container(
      child: Center(child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.square_outlined,size: 30,),
          Text("${title}"),
        ],
      )),
    );
  }
}
