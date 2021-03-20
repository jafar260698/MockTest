

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../theme/themes.dart';

class ColumnText extends StatelessWidget{
  const ColumnText({
    this.fieldKey,
    this.headerText,
    this.mainText,
  });
  final Key fieldKey;
  final String headerText;
  final String mainText;


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 4.0, bottom: 4.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(headerText,
              style: AppThemeStyle.titleListPrimary),
          Padding(
            padding: const EdgeInsets.only(top: 4.0, bottom: 13.0),
            child: Text(
                mainText,
                style: AppThemeStyle.buttonNormal),
          ),
          Divider(height: 2),
        ],
      ),
    );
  }
}