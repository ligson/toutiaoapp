import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:toutiao/toutiao/index/PageIndexView.dart';

class IndexTab extends StatefulWidget {
  @override
  createState() => new _IndexTabState();
}

class _IndexTabState extends State<IndexTab> {
  List<Tab> tabs;
  List<Widget> tabContents;
  int tabLen;

  @override
  Widget build(BuildContext context) {
    Color tabBgColor = Color.fromARGB(255, 240, 240, 240);
    // TODO: implement build
    return new DefaultTabController(
        length: tabLen,
        child: new Column(
          children: <Widget>[
            new Container(
                constraints: BoxConstraints(maxHeight: 45.0),
                color: tabBgColor,
                child: new Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    new Expanded(
                      child: new TabBar(
                        labelPadding: EdgeInsets.all(5.0),
                        labelColor: Colors.red,
                        labelStyle: TextStyle(fontSize: 16, color: Colors.red),
                        unselectedLabelColor: Colors.black,
                        indicatorColor: Colors.red,
                        isScrollable: true,
                        tabs: tabs,
                      ),
                    ),
                    new Icon(
                      Icons.list,
                      size: 30,
                    )
                  ],
                )),
            new Expanded(
              child: new TabBarView(
//controller: _tabController,
                children: tabContents,
              ),
            ),
          ],
        ));
  }

  @override
  void initState() {
    super.initState();
    tabs = [];
    tabContents = [];
    setState(() {
      tabs.add(new Tab(
        text: "推荐",
      ));

      tabs.add(new Tab(
        text: "新闻",
      ));
      tabs.add(new Tab(
        text: "历史",
      ));
      for (int i = 4; i <= 10; i++) {
        tabs.add(new Tab(
          text: "历史" + i.toString(),
        ));
      }
      for (int i = 0; i < 10; i++) {
        tabContents.add(new Center(child: new PageIndexView()));
      }
      tabLen = tabs.length;
    });
  }
}
