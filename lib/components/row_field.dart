

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RowField extends StatelessWidget{

  const RowField({
    this.fieldKey,
    this.title,
  });
  final Key fieldKey;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        CircleAvatar(
          radius: 6,
          backgroundColor: Colors.white,
          child: CircleAvatar(
            radius: 5,
            backgroundColor: Color(0xff00C48C),
          ),
        ),
        SizedBox(width: 8.0),
        Opacity(
          opacity: 0.5,
          child: Text(
            title,
            style: TextStyle(fontSize: 14.0),
          ),
        ),
      ],
    );
  }
}