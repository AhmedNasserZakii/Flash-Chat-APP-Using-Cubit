import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit() : super(RegisterInitial());

  final _firebase = FirebaseAuth.instance;

  Future register(
      {required String? email,
      required String? password,
      required GlobalKey<FormState> formKey}) async {
    try {
      emit(RegisterLoading());

      final userCredential = await _firebase.createUserWithEmailAndPassword(
        email: email!,
        password: password!,
      );

      debugPrint('userCredential is : $userCredential');
      emit(RegisterSuccess());
    } on FirebaseAuthException catch (error) {
      emit(RegisterFailuare(error));
    }
  }
}
