
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:koupet/theme/app_color.dart';
import 'package:koupet/view/chatRepo/components/chat_buble.dart';
import 'package:koupet/view/chatRepo/components/my_textfield.dart';
import 'package:koupet/view/chatRepo/services/chat/chat_service.dart';
 

class ChatPage extends StatefulWidget {

  final String receiverEmail;
  final String receiverID;
  ChatPage({super.key, required this.receiverEmail, required this.receiverID});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  final userid = FirebaseAuth.instance.currentUser!.uid;
  final TextEditingController _messageControlller = TextEditingController();
  final ChatService _chatService = ChatService();
  FocusNode myFocusNode = FocusNode();


  final ScrollController _scrollController = ScrollController();
  void scrollDown() {
    _scrollController.animateTo(_scrollController.position.maxScrollExtent, duration: const Duration(seconds: 1), curve: Curves.fastOutSlowIn);
  }
  void sendMessage() async {

    if (_messageControlller.text.isNotEmpty) {
      await _chatService.sendMessage(widget.receiverID, _messageControlller.text);
      _messageControlller.clear();
    }
    scrollDown();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.receiverEmail),
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.grey,
        elevation: 0,
      ),
      body: Column(
        children: [
          Expanded(child: _buildMessageList()),
          _buildUserInput(),
        ],
      ),
    );
  }

  Widget _buildMessageList() {
    String senderID = userid;
    return StreamBuilder(
        stream: _chatService.getMessages(widget.receiverID, senderID),
        builder: (context, snapshot) {

          if (snapshot.hasError) {
            return const Text("Hata");
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Text("Yükleniyor..");
          }
          return ListView(
            controller: _scrollController,
            children: snapshot.data!.docs.map((doc) => _buildMessageItem(doc)).toList(),
          );
        });
  }


  Widget _buildMessageItem(DocumentSnapshot doc) {
    Map<String, dynamic> data = doc.data() as Map<String, dynamic>;


    bool isCurrentUser = data["senderID"] == userid;
   
    var alignment = isCurrentUser ? Alignment.centerRight : Alignment.centerLeft;

    return Container(
        alignment: alignment,
        child: Column(
          crossAxisAlignment: isCurrentUser ? CrossAxisAlignment.end : CrossAxisAlignment.start,
          children: [
            ChatBuble(
              message: data["message"],
              isCurrentUser: isCurrentUser,
            ),
          ],
        ));
  }
  Widget _buildUserInput() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Row(
        children: [
          Expanded(
              child: MyTextField(
            controller: _messageControlller,
            hintText: "Bir mesaj yazın",
            obscureText: false,

          )),
      

          Container(
            decoration: const BoxDecoration(color: ConstantsColor.bottomNavColor, shape: BoxShape.circle),
            margin: const EdgeInsets.only(right: 25),
            child: IconButton(
                onPressed: sendMessage,
                icon: const Icon(
                  Icons.arrow_upward,
                  color: Colors.white,
                )),
          ),
        ],
      ),
    );
  }
}
