
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:task/bloc/all_data_bloc.dart';
import 'package:task/model/model.dart';
import 'package:task/screen/detail_screen.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key key}) : super(key: key);

  @override
  _HomeScreen createState() => _HomeScreen();
}

class _HomeScreen extends State<HomeScreen> {
  List<Results> _list = [];

  @override
  void initState() {
    allDataBloc.fetchAllData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        title: Text("Rick and Morty"),
        automaticallyImplyLeading: false,
      ),
      body: _mainView(),
    );
  }

  Widget _mainView() {
    return StreamBuilder(
      stream: allDataBloc.mapStream,
      builder: (context, AsyncSnapshot<Model> snapshot) {
        if (snapshot.hasData) {
          _list = snapshot.data.results;
          return getListUI(_list);
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
              _navigateToScreen();
            },
            child: Card(
              elevation: 4.0,
              shadowColor: Colors.black12, // Change this
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(13.0),
              ),
              child: GestureDetector(
                onTap: () => {
                  _navigateToScreen(),
                },
                child: Padding(
                  padding: EdgeInsets.all(13),
                  child: Row(
                    children: [
                      Container(
                        width: 80.0,
                        height: 80.0,
                        decoration: new BoxDecoration(
                          color: const Color(0xff7c94b6),
                          image: new DecorationImage(
                            image: new NetworkImage(element.image),
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
                            element.name,
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
                                        element.status,
                                        style: TextStyle(fontSize: 14.0),
                                      ),
                                    ),
                                  ],
                                ),
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
          ),
        );
      },
    );
  }

  void _navigateToScreen() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => DetailScreen()),
    );
  }
}
