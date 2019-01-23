import 'package:flutter/material.dart';

class ShareDlg extends Dialog {
  @override
  Widget build(BuildContext context) {
    return new Material(
      //创建透明层
      type: MaterialType.transparency, //透明类型
      child:
          new Row(mainAxisAlignment: MainAxisAlignment.end, children: <Widget>[
        new Expanded(
            child: new Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[new _ShareToApp(), new _CancelBtn(context)],
        ))
      ]),
    );
  }
}

class _ShareToApp extends StatefulWidget {
  createState() => new _ShareToAppState();
}

class _ShareToAppState extends State<_ShareToApp> {
  List<Tab> _apps = List();

  @override
  void initState() {
    super.initState();
    setState(() {
      for (int i = 0; i < 10; i++) {
        _apps.add(Tab(
          text: "微信",
          icon: Icon(
            Icons.cake,
            size: 50,
          ),
        ));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Padding(
        padding: EdgeInsets.all(5),
        child: new Container(
          constraints:
              BoxConstraints.expand(width: double.infinity, height: 216),
          decoration: ShapeDecoration(
            color: Color(0xffffffff),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(8.0),
              ),
            ),
          ),
          child: new Column(
            children: <Widget>[
              new Container(
                  height: 100,
                  child: new CustomScrollView(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    slivers: <Widget>[
                      new SliverPadding(
                        padding: const EdgeInsets.all(2.0),
                        sliver: new SliverList(
                          delegate: new SliverChildListDelegate(_apps),
                        ),
                      ),
                    ],
                  )),
              new Divider(),
              new Container(
                  height: 100,
                  child: new CustomScrollView(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    slivers: <Widget>[
                      new SliverPadding(
                        padding: const EdgeInsets.all(2.0),
                        sliver: new SliverList(
                          delegate: new SliverChildListDelegate(_apps),
                        ),
                      ),
                    ],
                  )),
            ],
          ),
        ));
  }
}

class _CancelBtn extends StatelessWidget {
  BuildContext context;

  _CancelBtn(this.context);

  void closeDlg() {
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return new Container(
        padding: EdgeInsets.all(5),
        constraints: BoxConstraints.expand(width: double.infinity, height: 50),
        child: new RaisedButton(
          color: Colors.white,
          onPressed: closeDlg,
          child: Text("取消"),
        ));
  }
}
