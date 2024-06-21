import 'package:flash_chat/features/home/presentation/views/widgets/chat_message.dart';
import 'package:flutter/material.dart';

import 'new_messages.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          ChatMessage(),
          NewMessages(),
        ],
      ),
    );
  }
}
