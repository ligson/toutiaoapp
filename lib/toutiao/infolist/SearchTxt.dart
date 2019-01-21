import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SearchTxt extends StatefulWidget {
  @override
  createState() => new SearchTxtState();
}

class SearchTxtState extends State<SearchTxt> {
  TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = new TextEditingController(text: '春晚内幕');
  }

  void _onTab() {
    //print("click........");
    Navigator.of(context).pushNamed('/searchPage');
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new FlatButton(
      padding: EdgeInsets.all(0),
      child: new TextField(
          enabled: false,
          textAlign: TextAlign.left,
          //给TextField设置装饰（形状等）
          //输入文本的样式
          style: TextStyle(fontSize: 14, color: Colors.black),
          controller: _controller,
          //最大行数
          maxLines: 1,
          autofocus: false,
          decoration: InputDecoration(
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5.0),
                borderSide: BorderSide(color: Colors.transparent)),
            contentPadding: EdgeInsets.all(2),
            fillColor: Colors.white,
            filled: true,
            // 以下属性可用来去除TextField的边框
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5.0),
                borderSide: BorderSide(color: Colors.transparent)),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5.0),
                borderSide: BorderSide(color: Colors.transparent)),
            prefixIcon: Icon(
              Icons.search,
              color: Colors.grey,
              size: 20.0,
            ),
          )),
      onPressed: _onTab,
    );
  }
}
