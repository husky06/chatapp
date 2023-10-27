import 'package:chatapplication/info.dart';
import 'package:chatapplication/widget/my_message_card.dart';
import 'package:chatapplication/widget/sender_messaage_card.dart';
import 'package:flutter/material.dart';

class ChatList extends StatelessWidget {
  const ChatList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: messages.length,
      itemBuilder: (context, index){
        if(messages[index]['isMe'] == true){
          //My messages --> card
          return MyMessageCard(
            message: messages[index]['text'].toString(), 
            date: messages[index]['time'].toString(),);
        }
        //send messages 
        return SenderMessageCard(
            message: messages[index]['text'].toString(), 
            date: messages[index]['time'].toString(),);
      }
    );
  }
}