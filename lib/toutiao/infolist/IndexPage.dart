import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:toutiao/toutiao/index/IndexTab.dart';
import 'package:toutiao/toutiao/infolist/SearchTxt.dart';

class IndexPage extends StatefulWidget {
  @override
  createState() => new IndexPageState();
}

class IndexPageState extends State<IndexPage> {
  @override
  void dispose() {
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          title: new SizedBox(height: 35, child: new SearchTxt()),
        ),
        body: new IndexTab());
  }
}
