import 'package:flutter/material.dart';

class TitleUnderLined extends StatelessWidget {
  final String title;
  const TitleUnderLined({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          const SizedBox(
            height: 6,
          ),
          Container(
            width: 35,
            height: 2,
            color: const Color(0xff253985),
          ),
          const SizedBox(
            height: 15,
          )
        ],
      ),
    );
  }
}