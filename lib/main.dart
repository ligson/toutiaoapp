import 'package:flutter/material.dart';
import 'package:toutiao/toutiao/infolist/IndexPage.dart';
import 'package:toutiao/toutiao/search/SearchPage.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //final wordPair = new WordPair.random();

    return new MaterialApp(
      title: '今日头条',
      /*home: new Scaffold(
        appBar: new AppBar(
          title: new Text('Welcome to Flutter'),
        ),
        body: new Center(
          //child: new Text(wordPair.asPascalCase),
          child: new RandomWords(),
        ),
      ),*/
      theme: new ThemeData(
        primaryColor: Colors.red,
      ),
      //home: new RandomWords(),
      home: new IndexPage(),
      //https://www.jianshu.com/p/866619e22941 路由使用
      routes: <String, WidgetBuilder>{
        // 这里可以定义静态路由，不能传递参数
        '/searchPage': (_) => new SearchPage(),
      },
    );
  }
}
