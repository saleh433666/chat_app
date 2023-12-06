import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled1/models/message.dart';

import '../constant.dart';

class ChatBuble extends StatelessWidget {
   const ChatBuble({super.key,required this.message});
final Message message;
  @override
  Widget build(BuildContext context) {
    return  Align(
      alignment: Alignment.centerLeft,
      child: Container(
        padding: const EdgeInsets.only(left: 16,bottom: 32,top: 32,right: 32,),
        margin: const EdgeInsets.symmetric(horizontal: 16,vertical: 8),
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft:Radius.circular(32),
            topRight:Radius.circular(32),
            bottomRight: Radius.circular(32),
          ),
          color: kPrimaryColor,
        ),
        child:  Text(message.message,style: const TextStyle(color: Colors.white),),
      ),
    );
  }
}
class ChatBubleFriend extends StatelessWidget {
  const ChatBubleFriend({super.key,required this.message});
  final Message message;
  @override
  Widget build(BuildContext context) {
    return  Align(
      alignment: Alignment.centerRight,
      child: Container(
        padding: const EdgeInsets.only(left: 16,bottom: 32,top: 32,right: 32,),
        margin: const EdgeInsets.symmetric(horizontal: 16,vertical: 8),
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft:Radius.circular(32),
            topRight:Radius.circular(32),
            bottomLeft: Radius.circular(32),
          ),
          color: Colors.blue,
        ),
        child:  Text(message.message,style: const TextStyle(color: Colors.white),),
      ),
    );
  }
}
