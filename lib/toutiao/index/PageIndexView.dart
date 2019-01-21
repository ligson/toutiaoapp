import 'dart:convert' show json;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:toutiao/toutiao/infolist/ImageListItem.dart';
import 'package:toutiao/vo/Article.dart';
import 'package:fluttertoast/fluttertoast.dart';

class PageIndexView extends StatefulWidget {
  @override
  createState() => new PageIndexState();
}

class PageIndexState extends State<PageIndexView> {
  List<Article> articleList = List();
  bool read = false;
  ScrollController _scrollController;
  int _page = 1; //加载的页数
  bool isLoading = false; //是否正在加载数据
  Future<Null> _onRefresh() async {
    await Future.delayed(Duration(seconds: 1), () {
      print('refresh');
      setState(() {
        //getData();
      });
      Fluttertoast.showToast(
          msg: "没有数据了...",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIos: 1,
          backgroundColor: Colors.grey,
          textColor: Colors.white);
    });
  }

  _buildList2() {
    return ListView.separated(
      padding: const EdgeInsets.all(16.0),
      controller: _scrollController,
      separatorBuilder: (content, index) {
        return new Divider();
      },
      itemBuilder: (context, i) {
        var wid;
        if (i < articleList.length) {
          wid = new ImageListItem(articleList[i]);
          return wid;
        } else {
          wid = new ImageListItem(articleList[0]);
        }
        return new Container(
          child: new Row(
            children: <Widget>[wid, new Divider()],
          ),
        );
      },
      itemCount: articleList.length,
    );
  }

  Future _getMore() async {
    if (!isLoading) {
      setState(() {
        isLoading = true;
      });
      await Future.delayed(Duration(seconds: 1), () {
        print('加载更多');
        setState(() {
          //list.addAll(List.generate(5, (i) => '第$_page次上拉来的数据'));
          //_page++;
          isLoading = false;
        });
        Fluttertoast.showToast(
            msg: "没有数据了...",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIos: 1,
            backgroundColor: Colors.transparent,
            textColor: Colors.white);
      });
    }
  }

  Future getData() async {
    final text = await rootBundle.loadString('data/list.json');
    List articleJsonList = json.decode(text);
    print(articleJsonList);
    setState(() {
      articleList =
          articleJsonList.map((m) => new Article.fromJson(m)).toList();
    });
  }

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController(); //listview的控制器
    print("init...." + articleList.length.toString());
    if (articleList.length == 0) {}
    getData();
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        print('滑动到了最底部');
        _getMore();
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    _scrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(onRefresh: _onRefresh, child: _buildList2());
  }
}
