import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:koupet/view/chatRepo/chat_page.dart';
import 'package:koupet/view/chatRepo/services/chat/chat_service.dart';
import 'components/user_tile.dart';

class DMPage extends StatelessWidget {
  final _auth = FirebaseAuth.instance;
  final ChatService _chatService = ChatService();

  DMPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        title: const Text("Mesajlarım"),
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.grey,
      ),
      body: _buildUserlist(),
    );
  }

  Widget _buildUserlist() {
    return StreamBuilder(
      stream: _chatService.getUserStream(),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return const Text("Hata");
        }
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Text("Yükleniyor");
        }
        return ListView(
          children: snapshot.data!
              .map<Widget>((userData) => _buildUserlistItem(userData, context))
              .toList(),
        );
      },
    );
  }

  Widget _buildUserlistItem(
      Map<String, dynamic> userData, BuildContext context) {
    if (userData["email"] != _auth.currentUser!.email) {
      print(_auth.currentUser?.email);
      return UserTile(
          text: userData["email"],
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ChatPage(
                    receiverEmail: userData["email"],
                    receiverID: userData["uid"],
                  ),
                ));
          });
    } else {
      return Container();
    }
  }
}
