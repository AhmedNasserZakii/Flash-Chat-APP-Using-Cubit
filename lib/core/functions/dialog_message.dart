import 'package:flutter/material.dart';

Future<dynamic> dialog(BuildContext context,
    {required String title, required Function() onPressed}) {
  return showDialog(
    context: context,
    builder: (context) {
      return Dialog(
        child: SizedBox(
          height: 200,
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 24,
                  ),
                ),
                const Spacer(),
                TextButton(
                  onPressed: onPressed,
                  child: const Text(
                    'Ok',
                    style: TextStyle(
                      fontSize: 24,
                      color: Colors.amber,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    },
  );
}
