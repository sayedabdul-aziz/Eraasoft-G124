import 'package:chat_app_ui/core/colors.dart';
import 'package:chat_app_ui/feature/chat/model/chat_model.dart';
import 'package:flutter/material.dart';

class FavContactsWidget extends StatelessWidget {
  const FavContactsWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 10, 10, 10),
          child: Text(
            'Favorite Contacts',
            style: TextStyle(
                color: AppColors.white,
                fontWeight: FontWeight.w600,
                fontSize: 18),
          ),
        ),
        SizedBox(
          height: 90,
          child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.only(left: index == 0 ? 16 : 0),
                  child: Column(
                    children: [
                      Stack(
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
                                  border: Border.all(
                                      color: AppColors.primaryColor, width: 2)),
                            ),
                          )
                        ],
                      ),
                      SizedBox(height: 5),
                      Text(
                        chats[index].name?.split(' ').first ?? '',
                        style: TextStyle(color: AppColors.white, fontSize: 14),
                      )
                    ],
                  ),
                );
              },
              separatorBuilder: (context, index) {
                return SizedBox(width: 8);
              },
              itemCount: chats.length),
        ),
      ],
    );
  }
}
