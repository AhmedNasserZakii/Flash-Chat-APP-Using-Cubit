part of 'sent_message_cubit.dart';

@immutable
sealed class SentMessageState {}

final class SentMessageInitial extends SentMessageState {}

final class SentMessageLoading extends SentMessageState {}

final class SentMessageSuccess extends SentMessageState {}

final class SentMessageFailure extends SentMessageState {
  final FirebaseException errorMessage;

  SentMessageFailure({required this.errorMessage});
}
