import 'package:flutter/material.dart';

class Decor extends StatelessWidget {
  const Decor({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topRight,
      child: Image.asset(
        "assets/images/decor.png",
        fit: BoxFit.cover,
      ),
    );
  }
}
