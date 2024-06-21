import 'package:firebase_auth/firebase_auth.dart';
import 'package:flash_chat/features/auth/presentation/views/auth_view.dart';
import 'package:flash_chat/features/home/presentation/manager/sent_messages/sent_message_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'widgets/home_view_body.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SentMessageCubit(),
      child: Scaffold(
        body: const HomeViewBody(),
        appBar: AppBar(
          title: const Text(
            'Flash Chat',
            style: TextStyle(
              color: Colors.amber,
              fontSize: 24,
            ),
          ),
          actions: [
            IconButton(
              onPressed: () {
                FirebaseAuth.instance.signOut();
                Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(
                    builder: (context) => const AuthView(),
                  ),
                  (route) => false,
                );
              },
              icon: const Icon(
                Icons.logout_rounded,
                color: Colors.red,
                size: 30,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
