import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:toutiao/tt/article/ShareDlg.dart';
import 'package:toutiao/vo/Article.dart';

class ArticlePage extends StatefulWidget {
  Article article;

  ArticlePage(this.article);

  createState() => new _ArticlePageState(article);
}

class _ArticlePageState extends State<ArticlePage> {
  Article article;

  _ArticlePageState(this.article);

  void _gotosearch() {
    Navigator.of(context).pushNamed('/searchPage');
  }

  void _showShareDlg() {
    showDialog<Null>(
        context: context, //BuildContext对象
        barrierDismissible: false,
        builder: (BuildContext context) {
          return new ShareDlg();
        });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: new AppBar(
          backgroundColor: Colors.white,
          iconTheme: IconThemeData(color: Colors.black),
          title: Text(
            "我的头条",
            style: TextStyle(
                color: Colors.black, fontWeight: FontWeight.bold, fontSize: 16),
          ),
          actions: <Widget>[
            new IconButton(icon: Icon(Icons.search), onPressed: _gotosearch),
            new IconButton(
                icon: Icon(Icons.more_horiz), onPressed: _showShareDlg)
          ]),
    );
  }
}
