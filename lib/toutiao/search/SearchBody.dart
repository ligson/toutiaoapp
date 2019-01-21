import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:toutiao/toutiao/search/DefaultSearchBody.dart';

class SearchBody extends StatefulWidget {
  _SearchBodyState bodyState = new _SearchBodyState();

  createState() => bodyState;

  void changeBody(bool showList) {
    bodyState.changeBody(showList);
  }
}

class _SearchBodyState extends State<SearchBody> {
  bool _showList = false;

  Widget searchList() {
    return ListView.separated(
      separatorBuilder: (BuildContext context, int index) => Divider(),
      itemBuilder: (context, i) {
        return ListTile(
          leading: Icon(Icons.map),
          title: Text('Map'),
        );
      },
      itemCount: 1,
    );
  }

  void changeBody(bool showList) {
    setState(() {
      _showList = showList;
    });
  }

  @override
  void initState() {
    super.initState();
    _showList = false;
  }

  @override
  Widget build(BuildContext context) {
    if (_showList) {
      return searchList();
    } else {
      return new DefaultSearchBody();
    }
  }
}
