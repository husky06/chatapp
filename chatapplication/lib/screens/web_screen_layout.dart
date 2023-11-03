import 'package:chatapplication/color.dart';
import 'package:chatapplication/features/chat/widgets/chat_list.dart';
import 'package:chatapplication/features/chat/widgets/contacts_list.dart';
import 'package:chatapplication/widget/web_chat_appbar.dart';
import 'package:chatapplication/widget/web_profile_bar.dart';
import 'package:chatapplication/widget/web_search_bar.dart';
import 'package:flutter/material.dart';

class WebScreenLayout extends StatelessWidget {
  const WebScreenLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
           const Expanded(
             child: SingleChildScrollView(
               child: Column(
                children:  [
                  WebProfileBar(),
                  WebSearchBar(),
                  ContactsList(),
                ],
                       ),
             ),
           ),
          //Web Screen
          Container(
               width: MediaQuery.of(context).size.width * 0.75,
              decoration: const BoxDecoration(
                image:  DecorationImage(
                  image: AssetImage('assets/backgroundImage.png'),
                  fit: BoxFit.cover,
                ),
              ),
              child: Column(
                children: [
                  WebChatAppBar(),
                  Expanded(child: ChatList(
                    recieverUserId: '',
                  ),),
                  Container(
                    height: MediaQuery.of(context).size.height*0.08,
                    padding: const EdgeInsets.all(10),
                    decoration: const BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                          color: dividerColor,
                        ),
                      ),
                      color: chatBarMessage,
                    ),
                    child: Row(
                      children: [
                        IconButton(onPressed: (){}, icon: const Icon(Icons.emoji_emotions_outlined, color: Colors.grey,),),
                        IconButton(onPressed: (){}, icon: const Icon(Icons.attach_file, color: Colors.grey,),),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(left: 10,right: 15),
                            child: TextField(
                            decoration: InputDecoration(
                              fillColor: searchBarColor,
                              hintText: 'Dien gi cho vui di',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                                borderSide: const BorderSide(
                                  width: 0,
                                  style: BorderStyle.none
                                ),
                              ),
                              contentPadding: const EdgeInsets.only(left: 20),
                            ),
                            ),
                          ),
                        ),
                        IconButton.outlined(onPressed: (){}, icon: const Icon(Icons.mic, color: Colors.grey,))
                      ],
                    ),
                  )
                ],
              ),
            ),
        ],
      ),
    );
  }
}