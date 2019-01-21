import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:toutiao/vo/Article.dart';

/// *
/// Flexible和 Expanded的区别是：
/// Flexible是一个控制Row、Column、Flex等子组件如何布局的组件。
/// Flexible组件可以使Row、Column、Flex等子组件在主轴方向有填充可用空间的能力(例如，Row在水平方向，Column在垂直方向)，但是它与Expanded组件不同，它不强制子组件填充可用空间。
/// Flexible组件必须是Row、Column、Flex等组件的后裔，并且从Flexible到它封装的Row、Column、Flex的路径必须只包括StatelessWidgets或StatefulWidgets组件(不能是其他类型的组件，像RenderObjectWidgets)。
/// Row、Column、Flex会被Expanded撑开，充满主轴可用空间
class ImageListItem extends StatelessWidget {
  Article article;

  ImageListItem(this.article);

  @override
  Widget build(BuildContext context) {
    Row row = new Row(
      children: [
        new Expanded(
          child: new Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              new Container(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: new Text(
                  article.title,
                  style: new TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              new Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  new Text(
                    article.creator,
                    style: new TextStyle(
                      color: Colors.grey[500],
                    ),
                  ),
                  new Text(
                    article.remarkNum.toString() + '评论',
                    style: new TextStyle(
                      color: Colors.grey[500],
                    ),
                  ),
                  new Text(
                    article.createDate,
                    style: new TextStyle(
                      color: Colors.grey[500],
                    ),
                  ),
                ],
              ),
            ],
          ),
        )
      ],
    );
    if (article.poster != null) {
      row.children.add(new Image.asset(
        article.poster,
        width: 100,
        height: 75,
      ));
    }
    Widget titleSection =
        new Container(padding: const EdgeInsets.all(5.0), child: row);
    //...
    return titleSection;
  }
}
