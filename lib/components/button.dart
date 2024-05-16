import 'package:flutter/material.dart';

class SignButton extends StatelessWidget {
  String name;
  SignButton({super.key, required this.name});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
          color: Color.fromARGB(255, 24, 23, 23),
          borderRadius: BorderRadius.circular(10)),
      child: Center(
        child: Text(
          name,
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
