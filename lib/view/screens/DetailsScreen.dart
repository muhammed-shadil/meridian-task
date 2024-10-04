import 'package:flutter/material.dart';

class Detailsscreen extends StatelessWidget {
  const Detailsscreen({super.key, required this.title, required this.body});
  final String title;
  final String body;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                title,
                style: const TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            Text(
              body,
              style: const TextStyle(fontSize: 17, fontWeight: FontWeight.w300),
            )
          ],
        ),
      ),
    );
  }
}
