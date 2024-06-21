part of 'register_cubit.dart';

@immutable
sealed class RegisterState {}

final class RegisterInitial extends RegisterState {}

final class RegisterLoading extends RegisterState {}

final class RegisterSuccess extends RegisterState {}

final class RegisterFailuare extends RegisterState {
  final FirebaseAuthException errorMessage;

  RegisterFailuare(this.errorMessage);
}
