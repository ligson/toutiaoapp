import 'package:flutter/material.dart';
import 'package:device_apps/device_apps.dart';
import 'dart:async';

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
  List<Widget> _apps = List();
  List<Application> _installedApps = List();

  Future _getApps() async {
    _installedApps = await DeviceApps.getInstalledApplications();
  }

  //@TODO 不能使用
  void _getLocalInstallApps() {
    _getApps();
    print(_installedApps.length);
    for (int i = 0; i < _installedApps.length; i++) {
      ApplicationWithIcon installApp = _installedApps[i];
      _apps.add(Tab(
        text: installApp.appName,
        child: Image.memory(installApp.icon),
      ));
    }
  }

  void _getStaticApps() {
    var icon = ImageIcon(
      AssetImage("images/wechat.jpeg"),
      size: 50,
    );
    _apps.add(icon);
    _apps.add(icon);
    _apps.add(icon);
    _apps.add(icon);
    _apps.add(icon);
    _apps.add(icon);
    _apps.add(icon);
  }

  @override
  void initState() {
    super.initState();
//images/wechat.jpeg
    setState(() {
      _getStaticApps();
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
