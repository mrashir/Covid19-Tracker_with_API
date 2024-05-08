import 'package:flutter/material.dart';
import 'package:my_calculator/constant_color.dart';

class MyButton extends StatelessWidget {
  final String title;
  final Color color;
  final VoidCallback onpressed;
  const MyButton({
    super.key,
    required this.title,
    this.color = const Color(0xffEAEBED),
    required this.onpressed,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: InkWell(
          onTap: onpressed,
          child: Container(
            height: 80,
            decoration: BoxDecoration(
                shape: BoxShape.rectangle,
                color: color,
                borderRadius: BorderRadius.circular(15)),
            child: Center(
              child: Text(
                title,
                style: const TextStyle(
                    fontSize: 18,
                    color: Colors.black,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
