
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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
      padding: EdgeInsets.all(13),
      child: Row(
        children: [
          Container(
            width: 150.0,
            height: 150.0,
            decoration: new BoxDecoration(
              color: const Color(0xff7c94b6),
              image: new DecorationImage(
                image: new NetworkImage(results.image),
                fit: BoxFit.cover,
              ),
              borderRadius: new BorderRadius.all(new Radius.circular(40.0)),
              border: new Border.all(
                color: Colors.white,
                width: 2.0,
              ),
            ),
          ),
          SizedBox(width: 10.0),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                results.name,
                style: Theme.of(context).textTheme.subtitle1,
              ),
              SizedBox(height: 30.0),
              SizedBox(
                width: 200,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
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
                            results.status,
                            style: TextStyle(fontSize: 14.0),
                          ),
                        ),
                      ],
                    ),
                    Opacity(
                      opacity: 0.5,
                      child: Text(
                        results.gender,
                        style: TextStyle(fontSize: 14.0),
                      ),
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