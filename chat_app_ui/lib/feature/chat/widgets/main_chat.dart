import 'package:chat_app_ui/core/colors.dart';
import 'package:chat_app_ui/feature/chat/model/chat_model.dart';
import 'package:flutter/material.dart';

class MainChat extends StatelessWidget {
  const MainChat({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: EdgeInsets.only(top: 5),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: AppColors.white,
        ),
        child: ListView.separated(
            itemBuilder: (context, index) {
              return ListTile(
                leading: Stack(
                  children: [
                    CircleAvatar(
                      radius: 30,
                      backgroundImage: NetworkImage(
                        chats[index].imageUrl ?? '',
                      ),
                    ),
                    Positioned(
                      right: 0,
                      bottom: 0,
                      child: Container(
                        width: 20,
                        height: 20,
                        decoration: BoxDecoration(
                          color: Colors.green,
                          shape: BoxShape.circle,
                          border: Border.all(color: AppColors.white, width: 2),
                        ),
                      ),
                    )
                  ],
                ),
                title: Text(
                  chats[index].name ?? '',
                  style: TextStyle(
                      color: AppColors.black,
                      fontWeight: FontWeight.w600,
                      fontSize: 14),
                ),
                subtitle: Text(
                  chats[index].lastMsg ?? '',
                  style: TextStyle(color: AppColors.black, fontSize: 14),
                ),
                trailing: Text(
                  chats[index].time ?? '',
                  style: TextStyle(color: AppColors.black, fontSize: 14),
                ),
              );
            },
            separatorBuilder: (context, index) {
              return SizedBox(height: 15);
            },
            itemCount: chats.length),
      ),
    );
  }
}
