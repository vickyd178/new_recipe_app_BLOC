import 'package:flutter/material.dart';

class ProgressBarWidget extends StatelessWidget {
  final String message;

  const ProgressBarWidget({Key? key, required this.message}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children:  [
            CircularProgressIndicator(),
            SizedBox(
              height: 10,
            ),
            Text(message),
          ],
        ),
      ),
    );
  }
}
