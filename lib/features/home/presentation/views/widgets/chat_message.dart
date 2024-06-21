import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flash_chat/features/home/presentation/views/widgets/message_bubble.dart';
import 'package:flutter/material.dart';

class ChatMessage extends StatelessWidget {
  const ChatMessage({super.key});

  @override
  Widget build(BuildContext context) {
    final authenticatedUser = FirebaseAuth.instance.currentUser!;
    return Expanded(
      child: StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection('chat')
            .orderBy('createdAt', descending: true)
            .snapshots(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(
                color: Colors.amber,
              ),
            );
          }
          if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
            return const Center(
              child: Text('No Messages Found'),
            );
          }
          if (snapshot.hasError) {
            return const Center(
              child: Text('Error acourd ....'),
            );
          }

          final loadedMessages = snapshot.data!.docs;

          return ListView.builder(
              padding: const EdgeInsets.only(
                bottom: 40,
              ),
              reverse: true,
              itemCount: loadedMessages.length,
              itemBuilder: (context, index) {
                final chatMessage = loadedMessages[index].data();
                final nextChatMessage = index + 1 < loadedMessages.length
                    ? loadedMessages[index + 1].data()
                    : null;
                final currentMessageUserId = chatMessage['userId'];
                final nextMessageUserId =
                    nextChatMessage != null ? nextChatMessage['userId'] : null;
                final nextUserIsSame =
                    nextMessageUserId == currentMessageUserId;

                if (nextUserIsSame) {
                  return MessageBubble.next(
                    message: chatMessage['text'],
                    isMe: authenticatedUser.uid == currentMessageUserId,
                  );
                } else {
                  return MessageBubble.first(
                    message: chatMessage['text'],
                    isMe: authenticatedUser.uid == currentMessageUserId,
                    userName: chatMessage['userName'],
                    userImage:
                        'https://th.bing.com/th/id/OIP.ooMsE4-L9sZr4JKjul74JwHaE8?rs=1&pid=ImgDetMain',
                  );
                }
              });
        },
      ),
    );
  }
}
