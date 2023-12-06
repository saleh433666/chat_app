import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:untitled1/models/message.dart';
import '../constant.dart';
import '../widgets/chat_buble.dart';

class ChatPage extends StatefulWidget {
   const ChatPage({super.key, required this.email});
   final String email;

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  final _controller =ScrollController();
  CollectionReference messages = FirebaseFirestore.instance.collection('messages');
  TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
        stream: messages.orderBy('createdAT',descending: true).snapshots(),
        builder: (context, snapshot) {
         if(snapshot.hasData){
           List<Message> messagesList =[];
           for(int i = 0; i < snapshot.data!.docs.length; i++)
           {
             messagesList.add(Message.fromJson(snapshot.data!.docs[i]));
           }
           return  Scaffold(
             appBar: AppBar(
               automaticallyImplyLeading: false,
               title: Row(
                 mainAxisAlignment: MainAxisAlignment.center,
                 children: [
                   Image.asset('assets/images/sss.png',height: 10,),
                   const Text("Chat"),
                 ],
               ),
               backgroundColor: kPrimaryColor,
               centerTitle: true,
             ),
             body: Column(
               children: [
                 Expanded(
                   child: ListView.builder(
                     reverse: true,
                     controller: _controller,
                     itemCount: messagesList.length,
                     itemBuilder: (context, index) {
                       return messagesList[index].id == widget.email ? ChatBuble(message: messagesList[index],)
                           :ChatBubleFriend(message: messagesList[index]);
                     },
                   ),
                 ),
                 Padding(
                   padding: const EdgeInsets.all(16),
                   child: TextField(
                     controller:controller ,
                     onSubmitted: (value) {
                       messages.add({
                         'message' :value,
                         'createdAT' : DateTime.now(),
                         'id' :widget.email,
                       });
                       controller.clear();
                       _controller.animateTo(
                           0,
                           duration: const Duration(seconds: 1),
                           curve: Curves.fastOutSlowIn
                       );
                     },
                     decoration: InputDecoration(
                       hintText: 'Send Message',
                       suffixIcon: const Icon(Icons.send,color: kPrimaryColor),
                       border:  OutlineInputBorder(
                           borderRadius: BorderRadius.circular(18),
                           borderSide: const BorderSide(color:kPrimaryColor)
                       ),
                       enabledBorder:  OutlineInputBorder(
                           borderRadius: BorderRadius.circular(18),
                           borderSide: const BorderSide(color:kPrimaryColor)
                       ),
                     ),
                   ),
                 ),
               ],
             ),
           );
         }else{
           return const Text('Loading........');
         }
         
        },
    );
  }
}
