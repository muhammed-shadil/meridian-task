import 'package:flutter/material.dart';

class Maintile extends StatelessWidget {
  const Maintile({super.key, required this.description});
  final String description;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const CircleAvatar(
                backgroundImage: AssetImage(
                    'assets/Ellipse 2 (1).png'), // Add your asset image here
                radius: 20,
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Column(
                  children: [
                    Text(
                      description,
                      style: const TextStyle(
                          fontSize: 14,
                          color: Colors.black,
                          fontWeight: FontWeight.w500),
                    ),
                    const SizedBox(height: 20),
                    const Row(
                      children: [
                        Row(
                          children: [
                            Icon(Icons.thumb_up_alt_outlined,
                                color: Colors.orange, size: 20),
                            SizedBox(width: 5),
                            Text('2', style: TextStyle(fontSize: 14)),
                          ],
                        ),
                        SizedBox(width: 25),
                        Row(
                          children: [
                            Icon(Icons.comment_outlined,
                                color: Colors.grey, size: 20),
                          ],
                        ),
                        Spacer(),
                        Icon(Icons.share_outlined,
                            color: Colors.grey, size: 20),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
