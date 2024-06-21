import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'sent_message_state.dart';

class SentMessageCubit extends Cubit<SentMessageState> {
  SentMessageCubit() : super(SentMessageInitial());

  final user = FirebaseAuth.instance.currentUser!;

  Future<void> sentMessage({required String message}) async {
    try {
      emit(SentMessageLoading());

      await FirebaseFirestore.instance.collection('chat').add({
        'text': message,
        'createdAt': Timestamp.now(),
        'userId': user.uid,
        'userName': 'Test Mode',
      });
      emit(SentMessageSuccess());
      debugPrint('userid is : ${user.uid}');
    } on FirebaseException catch (error) {
      emit(
        SentMessageFailure(errorMessage: error),
      );
    }
  }
}
