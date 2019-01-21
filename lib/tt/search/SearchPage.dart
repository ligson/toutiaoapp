import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:toutiao/tt/search/SearchBody.dart';
import 'package:toutiao/tt/search/SearchTitle.dart';

class SearchPage extends StatefulWidget {
  @override
  createState() => new SearchPageState();
}

class SearchPageState extends State<SearchPage> {
  SearchBody searchBody;

  void _searchClk() {}

  @override
  void initState() {
    super.initState();
    searchBody = new SearchBody();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar:
            new AppBar(title: new SearchTitle(searchBody), actions: <Widget>[
          new SizedBox(
              width: 50,
              child: new FlatButton(
                  onPressed: _searchClk,
                  padding: EdgeInsets.all(0),
                  child: new Text(
                    "搜索",
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  )))
        ]),
        body: searchBody);
  }
}
