import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:toutiao/toutiao/search/SearchBody.dart';

class SearchInputTxt extends StatefulWidget {
  SearchBody searchBody;

  @override
  createState() => new _SearchInputTxtState(searchBody);

  SearchInputTxt(this.searchBody);
}

class _SearchInputTxtState extends State<SearchInputTxt> {
  TextEditingController _controller;
  SearchBody searchBody;

  _SearchInputTxtState(this.searchBody);

  Widget _suffixIcon;

  @override
  void initState() {
    super.initState();
    _controller = new TextEditingController(text: '春晚内幕');
  }

  void _showDelBtn(bool show) {
    setState(() {
      if (show) {
        _suffixIcon = Transform.scale(
            scale: 0.5,
            child: new FloatingActionButton(
                highlightElevation: 2,
                backgroundColor: Colors.grey,
                child: Icon(
                  Icons.close,
                  color: Colors.white,
                  size: 20,
                ),
                onPressed: _txtDelete));
      } else {
        _suffixIcon = null;
      }
    });
  }

  void _onTab() {
    //print("click........");
    Navigator.of(context).pushNamed('/searchPage');
  }

  void _onChange(String txt) {
    print(txt);
    if (txt.length == 0) {
      _showDelBtn(false);
      searchBody.changeBody(false);
    } else {
      _showDelBtn(true);
      searchBody.changeBody(true);
    }
  }

  void _txtDelete() {
    _controller.clear();
    searchBody.changeBody(false);
    _showDelBtn(false);
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new TextField(
        enabled: true,
        textAlign: TextAlign.left,
        //给TextField设置装饰（形状等）
        //输入文本的样式
        style: TextStyle(fontSize: 14, color: Colors.black),
        controller: _controller,
        //最大行数
        maxLines: 1,
        autofocus: false,
        onChanged: _onChange,
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
            suffixIcon: _suffixIcon));
  }
}
