import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DefaultSearchBody extends StatefulWidget {
  createState() => new _DefaultSearchBody();
}

class _DefaultSearchBody extends State<DefaultSearchBody> {
  void _deleteHistoryClk() {
    print("删除历史记录");
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ListView.separated(
        itemBuilder: (context, i) {
          if (i == 0) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                new Container(
                  padding: EdgeInsets.only(left: 10, top: 5),
                  height: 30,
                  child: new Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      new Text(
                        "历史记录",
                        style: TextStyle(
                            fontSize: 14,
                            color: Colors.grey,
                            fontWeight: FontWeight.bold,
                            wordSpacing: 1.5),
                      ),
                      new IconButton(
                        icon: new Icon(Icons.delete,
                            color: Colors.grey, size: 20),
                        onPressed: _deleteHistoryClk,
                      )
                    ],
                  ),
                ),
                new Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    new Text("水电费水电费"),
                    new Text(
                      "|",
                      style: TextStyle(color: Colors.grey),
                    ),
                    new Text("水电费水电费")
                  ],
                )
              ],
            );
          } else {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                new Container(
                  padding: EdgeInsets.only(left: 10, top: 5),
                  height: 30,
                  child: new Text(
                    "热门",
                    style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey,
                        fontWeight: FontWeight.bold,
                        wordSpacing: 1.5),
                  ),
                ),
                new Column(
                  children: <Widget>[
                    new Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        new Text("水电费水电费"),
                        new Text(
                          "|",
                          style: TextStyle(color: Colors.grey),
                        ),
                        new Text("水电费水电费")
                      ],
                    ),
                    new Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        new Text("水电费水电费"),
                        new Text(
                          "|",
                          style: TextStyle(color: Colors.grey),
                        ),
                        new Text("水电费水电费")
                      ],
                    ),
                    new Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        new Text("水电费水电费"),
                        new Text(
                          "|",
                          style: TextStyle(color: Colors.grey),
                        ),
                        new Text("水电费水电费")
                      ],
                    ),
                    new Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        new Text("水电费水电费"),
                        new Text(
                          "|",
                          style: TextStyle(color: Colors.grey),
                        ),
                        new Text("水电费水电费")
                      ],
                    )
                  ],
                ),
              ],
            );
          }
        },
        separatorBuilder: (BuildContext context, int index) => Divider(),
        itemCount: 2);
  }
}
