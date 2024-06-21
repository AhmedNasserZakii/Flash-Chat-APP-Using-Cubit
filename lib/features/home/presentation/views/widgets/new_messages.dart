import 'package:flash_chat/features/home/presentation/manager/sent_messages/sent_message_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NewMessages extends StatefulWidget {
  const NewMessages({super.key});

  @override
  State<NewMessages> createState() => _NewMessagesState();
}

class _NewMessagesState extends State<NewMessages> {
  final _textController = TextEditingController();

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }

  void _sumbitMessage() {
    final enteredMessage = _textController.text;

    if (enteredMessage.trim().isEmpty) {
      return;
    }
    BlocProvider.of<SentMessageCubit>(context)
        .sentMessage(message: enteredMessage);

    FocusScope.of(context).unfocus();
    _textController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: TextField(
            controller: _textController,
            decoration: const InputDecoration(
              label: Text('Enter Message...'),
            ),
            textCapitalization: TextCapitalization.sentences,
            autocorrect: true,
            enableSuggestions: true,
          ),
        ),
        IconButton(
          onPressed: _sumbitMessage,
          icon: const Icon(
            Icons.send,
            color: Colors.amber,
          ),
        ),
      ],
    );
  }
}
