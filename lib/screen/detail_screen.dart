
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:task/components/avatar_image.dart';
import 'package:task/components/column_text.dart';
import 'package:task/components/row_field.dart';
import 'package:task/model/model.dart';
import 'package:task/theme/themes.dart';

class DetailScreen extends StatefulWidget{
  final Results results;
  DetailScreen({Key key,@required this.results}) : super(key: key);

  @override
  _DetailScreen createState() => _DetailScreen();
}


class _DetailScreen extends State<DetailScreen>{


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        elevation: 0,
        centerTitle: true,
        leading: IconButton(
          iconSize: 18.0,
          icon: Icon(Icons.arrow_back_ios,color: Colors.white),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: new Text("${widget.results.name}",
            style: AppThemeStyle.buttonWhite),
      ),
      body: _mainView(widget.results),
    );
  }

  Widget _mainView(Results results){
    return Padding(
      padding: EdgeInsets.all(15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 15.0),
          Hero(
              tag: results.id,
              child: AvatarImage(imageUrl: results.image,size: 180.0)
          ),
          SizedBox(height: 15.0),
          RowField(title: "${results.status} - ${results.species}"),
          SizedBox(height: 25.0),
          ColumnText(
              headerText:  "Origin location",
              mainText: results.origin.name
          ),
          ColumnText(
              headerText:  "Gender",
              mainText: results.gender
          ),
          ColumnText(
              headerText:  "Location",
              mainText: results.location.name
          )
        ],
      ),
    );
  }



}