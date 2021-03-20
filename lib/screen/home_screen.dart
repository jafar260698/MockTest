
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:task/bloc/all_data_bloc.dart';
import 'package:task/components/avatar_image.dart';
import 'package:task/components/row_field.dart';
import 'package:task/model/model.dart';
import 'package:task/screen/detail_screen.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key key}) : super(key: key);
  @override
  _HomeScreen createState() => _HomeScreen();
}

class _HomeScreen extends State<HomeScreen> {

  @override
  void initState() {
    allDataBloc.fetchAllData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        elevation: 0,
        title: Text("Rick and Morty"),
      ),
      body: _mainView(),
    );
  }

  Widget _mainView() {
    return StreamBuilder(
      stream: allDataBloc.mapStream,
      builder: (context, AsyncSnapshot<Model> snapshot) {
        if (snapshot.hasData) {
          return getListUI(snapshot.data.results);
        } else if (snapshot.hasError) {
          return Center(child: Text(snapshot.error.toString()));
        }
        return Scaffold(body: Center(child: CupertinoActivityIndicator()));
      },
    );
  }

  Widget getListUI(List<Results> _list) {
    return ListView.builder(
      shrinkWrap: true,
      physics: BouncingScrollPhysics(),
      itemCount: _list != null ? _list.length : 0,
      scrollDirection: Axis.vertical,
      itemBuilder: (BuildContext context, int index) {
        var element = _list[index];
        return Padding(
          padding: EdgeInsets.symmetric(vertical: 4.0, horizontal: 13.0),
          child: InkWell(
            onTap: (){
              _navigateToScreen(element);
            },
            child: Card(
              elevation: 4.0,
              shadowColor: Colors.black12, // Change this
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(13.0),
              ),
              child: Padding(
                  padding: EdgeInsets.all(13),
                  child: Row(
                    children: [
                      AvatarImage(imageUrl: element.image,size: 70,),
                      SizedBox(width: 10.0),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          AutoSizeText(
                            element.name,
                            style: Theme.of(context).textTheme.subtitle1,
                          ),
                          SizedBox(height: 20.0),
                          SizedBox(
                            width: 200,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                RowField(title:  "${element.status} - ${element.species}"),
                                Opacity(
                                  opacity: 0.5,
                                  child: Text(
                                    element.gender,
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
                ),
              ),
            ),
        );
      },
    );
  }

  void _navigateToScreen(Results results) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => DetailScreen(results: results)),
    );
  }
}
