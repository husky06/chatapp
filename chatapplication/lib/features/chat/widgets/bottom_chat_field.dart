import 'dart:io';

import 'package:chatapplication/color.dart';
import 'package:chatapplication/common/enum/message_enum.dart';
import 'package:chatapplication/common/utils/utils.dart';
import 'package:chatapplication/features/chat/controller/chat_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class BottomChatField extends ConsumerStatefulWidget {
  final String recieverUserId;
  const BottomChatField({
    required this.recieverUserId,
    super.key,
  });

  @override
  ConsumerState<BottomChatField> createState() => _BottomChatFieldState();
}

class _BottomChatFieldState extends ConsumerState<BottomChatField> {
  bool isShowSendButton = false;
  final TextEditingController _messageController = TextEditingController();

  void sendTextMessage() async{
    if(isShowSendButton){
      ref.read(chatControllerProvider).sendTextMessage(
        context, 
        _messageController.text.trim(), 
        widget.recieverUserId,
        );
      setState(() {
        _messageController.text='';
      });
    }
  }
  void sendFileMessage(
    File file,
    MessageEnum messageEnum,
  ) {
    ref.read(chatControllerProvider).sendFileMessage(
          context,
          file,
          widget.recieverUserId,
          messageEnum
          // widget.isGroupChat,
        );
  }

  void selectImage()async{
    File? image = await pickImageFromGallery(context);
    if(image != null){
      sendFileMessage(image,MessageEnum.image);
    }
  }

  void selectVideo()async{
    File? video = await pickVideoFromGallery(context);
    if(video != null){
      sendFileMessage(video,MessageEnum.video);
    }
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _messageController.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: TextFormField(
            controller: _messageController,
            onChanged: (val){
              if(val.isNotEmpty){
                setState(() {
                  isShowSendButton = true;
                });
              } else {
                setState(() {
                  isShowSendButton = false;
                });
              }
            },
            decoration: InputDecoration(
              filled: true,
              fillColor: mobileChatBoxColor,
              prefixIcon:  Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: SizedBox(
                  width: 100,
                  child: Row(
                    children: [
                      IconButton(
                        onPressed: (){},
                        icon: const Icon(
                          Icons.emoji_emotions, 
                          color: Colors.grey,
                        )),
                      IconButton(
                        onPressed: (){},
                        icon: const Icon(
                          Icons.gif, 
                          color: Colors.grey,
                        )),
                      
                    ],
                  ),
                ),
              ),
              suffixIcon: SizedBox(
                width: 100,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    IconButton(
                        onPressed: selectImage,
                        icon: const Icon(
                          Icons.camera_alt, 
                          color: Colors.grey,
                        )),
                      IconButton(
                        onPressed: selectVideo,
                        icon: const Icon(
                          Icons.attach_file, 
                          color: Colors.grey,
                        )),
                      
                    
                  ],
                ),
              ),
              // hintStyle: const TextStyle(fontSize: 14),
              hintText: 'Type a message',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide: const BorderSide(
                  width: 0,
                  style: BorderStyle.none,
                ),
              ),
              contentPadding: const EdgeInsets.all(10),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(
            bottom: 8,
            right: 2,
            left: 2,
            ),
          child: CircleAvatar(
            backgroundColor: const Color(0xFF128C7E),
            radius: 25,
            child: GestureDetector(
              child: Icon(
                isShowSendButton ? Icons.send : Icons.mic,
                color: Colors.white,
              ),
              onTap: sendTextMessage,
            ),
          ),
        ),
      ],
    );
  }
}