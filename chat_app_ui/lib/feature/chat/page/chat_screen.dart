import 'package:chat_app_ui/core/colors.dart';
import 'package:chat_app_ui/feature/chat/widgets/fav_contacts_widget.dart';
import 'package:chat_app_ui/feature/chat/widgets/main_chat.dart';
import 'package:flutter/material.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      appBar: AppBar(
        backgroundColor: AppColors.primaryColor,
        centerTitle: false,
        title: Text(
          'Chats',
          style: TextStyle(color: AppColors.white, fontWeight: FontWeight.w600),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.settings,
              color: AppColors.white,
            ),
          )
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          FavContactsWidget(),
          SizedBox(height: 20),
          MainChat(),
        ],
      ),
    );
  }
}
