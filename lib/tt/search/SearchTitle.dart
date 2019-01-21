import 'package:flutter/cupertino.dart';
import 'package:toutiao/tt/search/SearchBody.dart';
import 'package:toutiao/tt/search/SearchInputTxt.dart';

class SearchTitle extends StatefulWidget {
  SearchBody searchBody;

  @override
  createState() => new _SearchTitleState(searchBody);

  SearchTitle(this.searchBody);
}

class _SearchTitleState extends State<SearchTitle> {
  SearchBody searchBody;

  _SearchTitleState(this.searchBody);

  @override
  Widget build(BuildContext context) {
    return new SizedBox(height: 35, child: new SearchInputTxt(searchBody));
  }
}
