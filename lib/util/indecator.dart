import 'package:flutter/material.dart';
class Indecator extends StatelessWidget {
final bool isActive;
Indecator({required this.isActive});

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(duration: Duration(milliseconds: 350),
      margin: EdgeInsets.symmetric(horizontal: 4),
      width: isActive?22:8,
      height: 8,
      decoration: BoxDecoration(color: isActive?Colors.deepOrange.shade900:Colors.grey,
      borderRadius: BorderRadius.circular(8)
      ),
    );
  }
}


