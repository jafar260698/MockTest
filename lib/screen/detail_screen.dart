
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:task/theme/themes.dart';

class DetailScreen extends StatefulWidget{
  DetailScreen({Key key}) : super(key: key);

  @override
  _DetailScreen createState() => _DetailScreen();
}


class _DetailScreen extends State<DetailScreen>{


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        automaticallyImplyLeading: false,
        elevation: 0,
        centerTitle: true,
        title: new Text("widget.title",
            style: AppThemeStyle.appBarStyle),
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          children: [
            SizedBox(height: 10),
          ],
        ),
      ),
    );
  }

}